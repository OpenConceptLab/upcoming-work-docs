## Section 3: FHIR Operations (39 issues)

This section covers the FHIR API operations that OCL exposes -- CodeSystem, ValueSet, and ConceptMap operations including `$expand`, `$lookup`, `$validate-code`, `$translate`, and related functionality. Issues span from early 2020 through 2026 and reflect the evolution from a standalone Java-based FHIR service (`oclfhir`) to Python-based FHIR endpoints built into `oclapi2`, and now to the next-generation `oclfhir3` service.

---

### 3.1 ValueSet Operations ($expand, $validate-code, Expansion Matching)

**Epic:** #869 (FHIR/SVCM Support in OCL) | **Children:** #974, #1296, #1310, #1610, #2114, #2281

#### What It Is and Why It Matters

ValueSet operations are the most heavily used FHIR terminology operations. `$expand` returns the full list of codes in a value set, while `$validate-code` checks whether a given code is a member. For OCL, these operations are critical because many downstream systems (e.g., SMART Guidelines, IPS implementations) rely on ValueSet expansions to populate dropdowns, validate clinical data, and drive decision support logic.

A key architectural challenge is expansion matching -- determining whether a cached expansion can satisfy a new request or whether a fresh expansion must be generated. Since expansions are requested by parameters (not by ID), OCL must match request parameters against existing expansions and evaluate whether underlying content has changed. This is expensive and has been deferred repeatedly.

#### What Was Built

- **Basic $expand support (pre-2022 -- DEPLOYED).** The original `oclfhir` Java service implemented `$expand` for ValueSets, supporting offset/count pagination and `includeDesignations`/`includeDefinition`/`activeOnly` parameters. @paynejd confirmed in Sep 2021 (#583) that owner-scoped expansions were already working (e.g., `/orgs/PEPFAR-Test10b/ValueSet/HC-R-FACILITY-USG/$expand`).

- **ConceptMap $translate via `equivalence` field fix (#1836 -- DEPLOYED to QA).** @rkorytkowski identified in May 2024 that he had mistakenly introduced the FHIR R5 field name `relationship` instead of the R4 field name `equivalence` for ConceptMap map types. @jamlung-ri tested the fix on 2024-05-16 and confirmed it was working. The fix involved OCL recognizing the R4 `equivalence` field for map type assignment.

#### What Is Pending

- **$expand full-text search (#974 -- OPEN, high priority).** Filed Sep 2021 by @mcabello-cens: the `filter` parameter in `$expand` only searches against concept IDs, not OCL's Elasticsearch full-text index. @paynejd acknowledged the bug and invited a pull request. @jamlung-ri noted in Oct 2021 that developer Sunny might take it on "in a couple of sprints." @jamlung-ri flagged it again to @rkorytkowski in Feb 2022 for the FHIR Core rewrite. @paynejd asked @rkorytkowski in Feb 2023 whether the ticket was still relevant. No resolution recorded.

- **Expansion parameter matching logic (#1296 -- OPEN, high priority).** Filed May 2022 by the team, assigned to @bmamlin and @rkorytkowski. Describes the need to compare expansion parameters and content state to determine if a cached expansion can be reused. Currently FHIR Core generates a new expansion for every `$validate-code` or `$expand` request. The MVP plan is to implement parameter matching only (not content-state matching) and document it as beta.

- **Recursive real-time expansions (#1310 -- OPEN, high priority).** Filed May 2022. When a ValueSet references other ValueSets, all nested value sets should be evaluated in real-time using the same parameters (e.g., `system-version`). Only returns a persisted expansion if results would be identical.

- **Canonical URL in ValueSet "system" field (#1610 -- OPEN, medium priority).** Filed Jul 2023 by @jamlung-ri. The `system` field in ValueSet compose/expansion uses OCL's relative URL (e.g., `/orgs/CIEL/ValueSet/CIEL/`) instead of the canonical URL (e.g., `https://cielterminology.org/`). @jamlung-ri noted in Aug 2023: "In the long run, we probably want to use canonical URLs by default, but that's a decision we need to make."

- **ValueSet compose "system" field bug (#2114 -- OPEN, medium priority).** Filed Feb 2025. The `system` field in a ValueSet compose statement incorrectly shows "ValueSet" instead of the CodeSystem canonical URL or relative URL. The display should show the canonical URL of the source version if available, falling back to the OCL relative URL.

- **Download concept mappings as a ValueSet (#2281 -- OPEN, medium priority, NOT READY FOR DEV).** Filed Dec 2025 by @paynejd, inspired by @delcroip. Proposes a new endpoint to export a concept's mappings (with optional map-type filtering) as a FHIR ValueSet. MVP would use a custom OCL API format; long-term would use a compliant FHIR `$expand` with a novel compose statement. @delcroip suggested a cleaner URL pattern without query parameters in the canonical (e.g., `/concepts/116128/ValueSetMaps/SAME-AS`).

#### Open Design Questions

- Should OCL use canonical URLs by default in the ValueSet `system` field, or continue with relative URLs? (#1610) This is a fundamental decision that affects FHIR compliance and interoperability.
- How aggressively should expansion matching reuse cached results vs. regenerate? The MVP avoids content-state comparison, but this creates a risk of stale expansions (#1296).
- How should recursive expansions handle circular references or deeply nested ValueSet chains? (#1310)

---

### 3.2 CodeSystem Operations ($lookup, Search, Listing)

**Epic:** #869 (FHIR/SVCM Support in OCL) | **Children:** #582, #632, #1599, #1815, #1823, #1833, #1839, #1840, #1927, #1929, #2262

#### What It Is and Why It Matters

CodeSystem operations allow clients to look up individual codes (`$lookup`), search for CodeSystems by various parameters, and retrieve full CodeSystem resources. OCL's FHIR service must accurately serialize OCL Sources as FHIR CodeSystem resources, including concept properties, filters, designations, and metadata. Getting this right is essential for interoperability with the FHIR IG Publisher, FHIR validators, and downstream terminology consumers.

This subtopic has seen the most active bug-fixing work, particularly in 2024 when the team prepared for HL7 FHIR Connectathons and WHO SMART Guidelines testing.

#### What Was Built

- **FHIR CodeSystem serialization fixes (#1815 -- DEPLOYED to QA, May 2024).** @jamlung-ri filed in Mar 2024 after the FHIR IG Publisher rejected OCL-generated CodeSystems. Five fixes were implemented by @rkorytkowski and deployed via build OCL-OCLAPI2-1991:
  - `count` field now counts all codes (active + inactive), not just active
  - Null fields excluded from JSON output (FHIR spec requires omission, not `null`)
  - Concept property `value` renamed to `valueString` per FHIR spec
  - Added `content: "complete"` field
  - Fixed `type: "coding"` to `type: "Coding"` (case-sensitive per spec)
  @jamlung-ri tested in QA on 2024-05-03 and confirmed the IG Publisher accepted the output without manual alterations, producing a valid CodeSystem page at `jamlung-ri.github.io/smart-catopia-measles`.

- **Large CodeSystem import optimization (#1833 -- PARTIALLY RESOLVED).** @snyaggarwal profiled the v3-ActCode import (1,299 concepts) in May 2024. Found four bottlenecks: concept creation, version creation, double resource indexing, and doubled serialization calls. Refactored async indexing and removed redundant sync indexing. Reduced import time to ~135 seconds locally. However, QA still timed out due to lower-powered infrastructure. @rkorytkowski increased the timeout to 10 minutes as a workaround. @jamlung-ri noted the underlying problem may be addressed by NPM import work.

- **Code searchParam and unsupported param handling (#1839 -- DEPLOYED to QA).** @rkorytkowski added support for the `code` search parameter on CodeSystem resources in May 2024, and also added `BadRequest` responses for unsupported search parameters.

- **CodeSystem listing total (#1840 -- DEPLOYED to QA).** @rkorytkowski added the `total` field to CodeSystem listing Bundle resources in May 2024.

- **ConceptMap `equivalence` field fix (#1836 -- DEPLOYED to QA).** Fixed the R4/R5 field name mismatch for ConceptMap map types. See Section 3.1 for details.

#### What Is Pending

- **CodeSystem $lookup displayLanguage parameter (#1823 -- OPEN, medium priority).** Filed Apr 2024 by @jamlung-ri after HL7 Brazil colleagues requested it for their IPS Viewer. The `$lookup` operation does not currently support `displayLanguage`, which would allow requesting concept displays in a specific locale (e.g., Portuguese). @italomacedo seconded the request. Includes detailed acceptance criteria with a test case using a multilingual concept.

- **CodeSystem property filter support (#582 -- OPEN, low priority, close-stale candidate).** Filed Feb 2021. Requested filtering by `conceptclass`, `datatype`, and `inactive` properties. No comments or progress recorded.

- **Case sensitivity configuration (#632 -- OPEN, low priority, close-stale candidate).** Filed Mar 2021. FHIR CodeSystems support case sensitivity configuration that impacts searching, comparisons, and lookups. References a separate ticket for case-sensitive mnemonic handling. No progress recorded.

- **CodeSystem POST display attribute bug (#1599 -- OPEN, medium priority).** Filed Jun 2023. POSTing a CodeSystem without a `display` attribute on concepts returns a 500 error, though FHIR does not require `display`. @jamlung-ri suggested in Aug 2023 that auto-populating display is not best practice but the 500 error should be fixed. @rkorytkowski confirmed in Mar 2024: "If the display is missing, code should be used as a concept name."

- **CodeSystem import Date property bug (#1927 -- OPEN, medium priority).** Filed Sep 2024 by @jamlung-ri. The `date` attribute is stripped during CodeSystem import. Verified against HL7 Connectathon CodeSystems (e.g., `request-intent`, `v3-ActCode`) where the date property exists in the source JSON but is missing from OCL's FHIR response.

- **CodeSystem import newline character bug (#1929 -- OPEN, medium priority).** Filed Sep 2024. Newline characters (`\n`) are stripped during import. @jamlung-ri noted in Sep 2024: "Let's preserve all text that we're getting since new line `\n` might not be the only character issue."

- **Expose source properties and filters via FHIR CodeSystem (#2262 -- OPEN, medium priority, MVP milestone).** Filed Nov 2025, assigned to @snyaggarwal, milestone "OCL FHIR Service MVP Launch." Comprehensive ticket to map `source.properties` to `CodeSystem.property[]`, `source.filters` to `CodeSystem.filter[]`, and concept-level property values to `CodeSystem.concept[].property[]`. Uses LOINC 2.81 as the primary test case. Excludes core source attributes (e.g., `external_id`, `source_type`). Post-MVP: support filtering operations in ValueSet expansions using exposed filters.

#### Open Design Questions

- Should OCL auto-populate the `display` field from `code` when not provided, or simply stop requiring it? (#1599) @rkorytkowski favors using the code as concept name, but this has not been implemented.
- How should large CodeSystem imports be handled long-term -- async task queue, NPM import, or both? (#1833) The timeout workaround is not sustainable.
- What is the mapping between OCL property types and FHIR property types (string, Coding, boolean, dateTime, etc.)? (#2262) This needs validation against the FHIR spec.

---

### 3.3 ConceptMap Operations ($translate, Import, Identity)

**Epic:** #869 (FHIR/SVCM Support in OCL) | **Children:** #1836, #1837, #1835, #1919, #1922, #2052, #2093

#### What It Is and Why It Matters

ConceptMap resources represent mappings between code systems -- the core function that distinguishes OCL from simpler terminology servers. The `$translate` operation allows clients to look up how a code in one system maps to codes in another. Getting ConceptMap support right is critical for OCL's value proposition in cross-system interoperability, particularly for use cases like ICD-to-SNOMED mapping, LOINC-to-local-code translation, and the WHO SMART Guidelines.

OCL's data model stores both concepts and mappings in "Sources," which creates a unique challenge: a single OCL Source may need to be exposed as both a FHIR CodeSystem and a FHIR ConceptMap, potentially with the same ID.

#### What Was Built

- **ConceptMap `equivalence` field fix (#1836 -- DEPLOYED to QA).** Fixed in May 2024 by @rkorytkowski. The FHIR R4 field for map type is `equivalence`, but OCL was using the R5 field name `relationship`. @jamlung-ri confirmed the fix was working on 2024-05-16 after testing.

- **Batch Translation epic (#2052 -- CLOSED).** Filed Jan 2025 as part of the OCL FHIR Core 2025 roadmap (#2253). Closed on 2026-03-24. No body or comments recorded, suggesting it may have been consolidated into other work or deferred.

#### What Is Pending

- **$translate operation review (#1837 -- OPEN, medium priority).** Filed May 2024, assigned to @rkorytkowski, @paynejd, and @jamlung-ri. The current `$translate` implementation returns responses but may not be correct. Three parameters need attention: `url` (canonical URL of the ConceptMap, should use `$resolveReference`), `system` (should be the `fromSource`), and `code` (working correctly). Marked "MORE RESEARCH NEEDED."

- **Duplicate resource import -- org_source_unique violation (#1835 -- OPEN, medium priority).** Filed May 2024. Two distinct problems: (1) importing two versions of the same resource type (e.g., CodeSystem v4.0.1 and v5.0.0) should create separate versions, not error; (2) importing a CodeSystem and ConceptMap with the same ID fails because OCL stores both as Sources with unique mnemonic constraints. @rkorytkowski replicated the error only on duplicate creation. @jamlung-ri identified in May 2024 that the second case may require separate CodeSystem and ConceptMap repo types.

- **Support ConceptMap and CodeSystem with same ID (#1919 -- OPEN, high priority).** Filed Sep 2024 by @rkorytkowski. Deep architectural discussion of the problem where baseline FHIR content has ConceptMaps and CodeSystems sharing IDs. Three approaches proposed: (1) prefix ConceptMap IDs (e.g., `ConceptMap-...`) -- a workaround; (2) extend the unique constraint to include `source_type` so `(source_type, mnemonic, version, owner)` is unique; (3) support combined CodeSystem+ConceptMap views with optional separation. @rkorytkowski noted in Sep 2024 that the immediate baseline content issue may have been a version-overwrite bug (#1922), not the ID collision itself.

- **Fix overwriting ConceptMap version (#1922 -- OPEN, medium priority).** Filed Sep 2024 by @rkorytkowski. When importing a ConceptMap version that already exists, OCL throws an `IntegrityError` (`duplicate key value violates unique constraint "user_source_unique"`) instead of updating the existing version. The traceback shows the issue is in `Source.persist_new_version` trying to insert rather than update.

- **Export mapping metadata as ConceptMap (#2093 -- OPEN, low priority).** Filed Feb 2025. Allow users to save the results of an OCL Mapper mapping project as a FHIR ConceptMap, either stored on OCL or as a download.

#### Open Design Questions

- How should OCL handle ConceptMap and CodeSystem resources that share the same ID? (#1919) This is a fundamental data model question. The three approaches (ID prefixing, extended unique constraint, or combined views) each have significant trade-offs for URL structure, backward compatibility, and user experience.
- Should `$translate` use `$resolveReference` for canonical URL resolution? (#1837) The answer is likely yes per #2261, but this needs to be coordinated.
- How should ConceptMap version updates work -- upsert semantics or explicit version management? (#1922)

---

### 3.4 FHIR Endpoint Infrastructure and General Improvements

**Epic:** #869 (FHIR/SVCM Support in OCL) | **Children:** #472, #583, #782, #2030, #2261, #1793, #828

#### What It Is and Why It Matters

Beyond specific FHIR operations, OCL's FHIR service requires foundational infrastructure: URL routing, trailing slash handling, owner-scoped endpoints, canonical URL resolution, and analytics. These issues affect every FHIR interaction and determine whether OCL behaves as a well-formed FHIR server that clients can integrate with reliably.

The most significant current initiative is refactoring all FHIR operations to use OCL's `$resolveReference` operation for canonical URL resolution, which will centralize multi-tenant resolution logic and eliminate scattered custom resolution code.

#### What Was Built

- **Owner-scoped FHIR operations (#583 -- PARTIALLY WORKING).** @paynejd confirmed in Sep 2021 that owner+ID scoped operations were already functioning, e.g., `/orgs/PEPFAR-Test10b/CodeSystem/MER/$validate-code?code=TX_PVLS` and `/orgs/PEPFAR-Test10b/ValueSet/HC-R-FACILITY-USG/$expand`. The ticket remains open for review to confirm all operation types support this pattern.

#### What Is Pending

- **$resolveReference integration (#2261 -- OPEN, medium priority, MVP milestone).** Filed Nov 2025, assigned to @italomacedo, milestone "OCL FHIR Service MVP Launch." The most comprehensive infrastructure ticket: refactor all FHIR CRUD requests, operations (`$lookup`, `$validate-code`, `$translate`, etc.), and other endpoints to use OCL's `$resolveReference` operation for resolving canonical URLs and relative references to specific repository versions. MVP requirements: replace inline resolution logic, handle version resolution (no version = latest), support implicit namespace context. Post-MVP: support explicit namespace context and OCL relative URLs. Detailed acceptance criteria include multi-tenant canonical URL resolution scenarios.

- **Control how a Source is exposed via FHIR (#782 -- OPEN, high priority).** Filed Jun 2021. Currently every OCL Source is exposed as both a CodeSystem and ConceptMap regardless of whether that makes sense. Proposes a source-level attribute listing available representations, e.g., `["fhir.CodeSystem", "fhir.ConceptMap"]`. Important for authoritative vocabularies like LOINC and SNOMED that need full control over FHIR exposure. @jamlung-ri noted in Jul 2021 that "some discussion has started, but more work is needed." Closely related to #1919 (same-ID problem).

- **Trailing slash handling (#2030 -- OPEN, medium priority).** Filed Nov 2024 by @rkorytkowski. Both `/orgs/test/CodeSystem` and `/orgs/test/CodeSystem/` must work. Has code activity in `oclapi2`.

- **Naked FHIR request response (#472 -- OPEN, low priority, close-stale candidate).** Filed Nov 2020. The root URL (`https://fhir.qa2.aws.openconceptlab.org/`) returns 404 while the `/fhir/` path returns a base response. No decision made on what the root response should be.

- **FHIR analytics (#1793 -- OPEN, low priority, close-stale candidate).** Filed Mar 2024. "Requirements tbd." No comments or progress.

- **Automated changelog generation (#828 -- OPEN, low priority, close-outdated candidate).** Filed Jul 2021. @jamlung-ri asked @rkorytkowski for updates in Oct 2021. No resolution. Spans oclweb2, oclapi2, and oclfhir.

#### Open Design Questions

- What should the response be for a naked FHIR request (root URL without `/fhir/`)? (#472) Options include redirect, CapabilityStatement, or a human-readable landing page.
- Should the FHIR exposure attribute (#782) use `source_type` or a separate field? How does this interact with the same-ID problem (#1919) and the repo type epic (#1695)?

---

### 3.5 FHIR Content Import and Resource Fidelity

**Epic:** #1166 (NPM Import of Baseline FHIR Content) | **Children:** #1835, #1924, #1927, #1929, #1833, #1599

#### What It Is and Why It Matters

OCL must be able to import FHIR resources (CodeSystems, ValueSets, ConceptMaps) and faithfully round-trip them -- importing content via FHIR JSON and re-exporting it with no data loss or corruption. This became a critical focus in 2024 when the team began loading HL7 baseline terminology content (THO) and WHO SMART Guidelines content for FHIR Connectathons. Multiple bugs were discovered where OCL's import pipeline silently dropped or corrupted data.

#### What Was Built

- **Performance optimization for large imports (#1833 -- PARTIALLY RESOLVED).** See Section 3.2 for details. @snyaggarwal's refactoring reduced import time significantly, and @rkorytkowski increased the timeout to 10 minutes as a workaround.

- **ConceptMap equivalence/relationship field fix (#1836 -- DEPLOYED to QA).** See Section 3.3 for details.

#### What Is Pending

- **Import r4.core dependency once (#1924 -- OPEN, medium priority).** Filed Sep 2024 by @rkorytkowski. Most FHIR NPM packages list `hl7.fhir.r4.core` as a dependency. Rather than importing it into every namespace, OCL should host it centrally. No comments or further discussion.

- **Date property stripped during import (#1927 -- OPEN, medium priority).** See Section 3.2 for details.

- **Newline characters stripped during import (#1929 -- OPEN, medium priority).** See Section 3.2 for details.

- **Display attribute required for CodeSystem POST (#1599 -- OPEN, medium priority).** See Section 3.2 for details.

- **Duplicate resource import errors (#1835 -- OPEN, medium priority).** See Section 3.3 for details.

#### Open Design Questions

- What is the full set of data fidelity issues? The date and newline bugs (#1927, #1929) suggest there may be other silent data loss during import that has not been identified yet.
- Should OCL treat FHIR resource import as an upsert (update-or-create) operation? The duplicate resource errors (#1835) and version overwrite bugs (#1922) suggest the import semantics need to be clearly defined.

---

### 3.6 TermBrowser FHIR Integration and UI Templates

**Epic:** #865 (FHIR UI in TermBrowser) | **Children:** #591, #865, #1898, #2027, #2028

#### What It Is and Why It Matters

The TermBrowser is OCL's primary web UI. As OCL adopts FHIR-native resource types (CodeSystem, ValueSet, ConceptMap), the TermBrowser must present these in a way that is meaningful to FHIR-literate users while remaining accessible to non-FHIR users. This includes FHIR-specific repository templates, download-as-FHIR functionality, and FHIR-aware navigation.

#### What Was Built

No completed work is recorded in these tickets. The TermBrowser v3 effort is underway with templates in the MVP milestone.

#### What Is Pending

- **ValueSet repository template (#2027 -- OPEN, high priority, v3 MVP milestone).** Filed Nov 2024, assigned to @paulsonder. Defines the page structure for ValueSet repositories: Overview, Composition (filters/intensional-extensional), Concepts (with expansion picker), and Mappings tabs. Table columns specified for concepts (ID, Display name, Concept Class, Datatype, Owner) and mappings (grouped by Target Source).

- **CodeSystem repository template (#2028 -- OPEN, high priority, v3 MVP milestone).** Filed Nov 2024, milestone "TermBrowser v3 MVP." No body content -- template structure presumably follows a similar pattern to #2027.

- **Download FHIR representation of a repository (#1898 -- OPEN, medium priority).** Filed Jul 2024, assigned to @jamlung-ri. No body or comments. Related to the earlier #591 (Download/View as FHIR).

- **Download/View as FHIR (#591 -- OPEN, low priority, close-stale candidate).** Filed Feb 2021 as an Epic, assigned to @jamlung-ri. @jamlung-ri noted in Mar 2021 that further work would continue in #659 and epic #222.

- **FHIR UI in TermBrowser epic (#865 -- OPEN, low priority, close-stale candidate).** Filed Aug 2021. Empty body, no comments. Serves as a placeholder epic.

#### Open Design Questions

- How should the TermBrowser present ValueSet expansion vs. composition? The #2027 template separates "Composition" and "Concepts (with expansion picker)" as distinct tabs -- is this the right UX for users who don't understand the FHIR expansion model?
- Should FHIR download (#1898) produce a single resource JSON, a Bundle, or an NPM package?

---

### 3.7 OCL FHIR Core 2025 Roadmap and Cross-Cutting Epics

**Epic:** #2253 (OCL FHIR Core 2025) | **Children:** #2052, #869, #782

#### What It Is and Why It Matters

The OCL FHIR Core 2025 initiative (#2253) is the overarching roadmap for OCL's FHIR service capabilities. It was auto-created from Zenhub during a migration in Oct 2025 (original entity opened Jan 2025). Several epics from this section feed into the 2025 roadmap, including Batch Translation (#2052), Terminology Packaging (#2045), Automated FHIR Testing (#2046), FHIR Serialization Library (#2047), Content Traceability (#2048), CRMI Compliance (#2049), Batch Validation (#2050), and Automated FHIR Resource Validation (#2053). Most of these epics are covered in other sections of the knowledge base (Content & Packaging, Validation & Testing).

The operations-specific epics under this umbrella are:

#### What Was Built

- **Batch Translation (#2052 -- CLOSED, 2026-03-24).** No body or comments recorded. Closed recently, possibly consolidated or deprioritized.

#### What Is Pending

- **OCL FHIR Core 2025 epic (#2253 -- OPEN, high priority).** The master epic. Auto-migrated from Zenhub. No substantive body content beyond the migration note.

- **FHIR/SVCM Support in OCL (#869 -- OPEN, medium priority).** Filed Aug 2021 as a Project-level Epic. Empty body. Serves as the long-running umbrella for all FHIR operation work. Predates #2253 and may need to be reconciled.

- **Source FHIR exposure control (#782 -- OPEN, high priority).** See Section 3.4 for details. This is a foundational capability that affects the entire FHIR operations surface.

#### Open Design Questions

- How do the two umbrella epics (#869, #2253) relate? Should #869 be closed in favor of #2253, or do they serve different scoping purposes?
- Which 2025 roadmap items are actively being worked vs. aspirational? The epics (#2045-#2053) were all filed on 2025-01-30 in a batch, suggesting a planning exercise rather than committed work.
