# OCL FHIR Service Knowledge Base

**Generated:** 2026-03-24
**Scope:** 59 issues related to OCL's FHIR Service capabilities
**Source:** [OpenConceptLab/ocl_issues](https://github.com/OpenConceptLab/ocl_issues) GitHub repository
**Companion data:** `fhir-raw-archive.json` (full issue bodies + comments), `fhir-issue-classification.csv` (59-row analysis)

---

## Table of Contents

1. [Executive Summary](#section-1-executive-summary)
2. [FHIR Foundation](#section-2-fhir-foundation)
3. [FHIR Operations](#section-3-fhir-operations)
4. [Content Import & Export](#section-4-content-import--export)
5. [Validation & Testing](#section-5-validation--testing)
6. [FHIR Content & Packaging](#section-6-fhir-content--packaging)
7. [Cross-cutting Concerns](#section-7-cross-cutting-concerns)
8. [Resource Library](#section-8-resource-library)
- [Appendix A: Issue Index](#appendix-a-issue-index)
- [Appendix B: Contributor Map](#appendix-b-contributor-map)

---

## Section 1: Executive Summary

### 1.1 What Is the OCL FHIR Service

The OCL FHIR Service is the HL7 FHIR-compliant interface layer of the Open Concept Lab platform. It exposes OCL's terminology content — concepts, mappings, sources, and collections — through standard FHIR resource types (CodeSystem, ValueSet, ConceptMap) and operations ($expand, $lookup, $validate-code, $translate). This enables OCL to interoperate with FHIR-native systems such as electronic health records, terminology servers, and implementation guide authoring tools.

The FHIR Service is not a standalone application but a set of endpoints built into oclapi2 (the Django REST API). Its evolution has been tightly coupled with the TermBrowser v3 initiative, sharing foundational work on canonical URL registries (#1696), typed repositories (#1695), and the $resolveReference operation (#1747). The "OCL FHIR Core 2025" epic (#2253) represents the most recent comprehensive roadmap for FHIR capabilities, encompassing 14 sub-issues covering serialization, validation, content traceability, CRMI compliance, and terminology packaging.

### 1.2 Key Stakeholders and Contributors

| Contributor | Primary Focus | Notable Involvement |
|---|---|---|
| **@paynejd** | Product owner, FHIR strategy | #444, #1695, #1696, #1837, #2045 |
| **@snyaggarwal** | API engineering, FHIR implementation | #1166, #1833, #1874, #2262 |
| **@jamlung-ri** | Requirements, QA, FHIR alignment | #591, #1837, #1898, #2045, #2046 |
| **@rkorytkowski** | Infrastructure, legacy FHIR work | #782, #828, #974, #1166, #1296 |
| **@bmamlin** | Clinical domain, FHIR standards | #1296 |

### 1.3 Timeline and Milestones

**Early FHIR work (2018-2021).** The earliest FHIR issues (#444, #472, #582, #583, #591) date from 2018-2021 and represent initial thinking about how OCL should expose content via FHIR. These were exploratory — defining how implicit value sets work, planning FHIR download formats, and scoping SVCM (Sharing Value Sets, Code Systems, and Concept Maps) support.

**Foundation phase (2022-2023).** FHIR work accelerated alongside the TermBrowser v3 initiative. The canonical URL registry (#1696), repo type system (#1695), and $resolveReference (#1747) laid the groundwork for proper FHIR resource identification and resolution. The FHIR CodeSystem and ValueSet operations received focused attention (#974, #1296, #1310).

**Build phase (2024).** The bulk of FHIR implementation work happened in 2024, with 26 issues created. Key deliverables included CodeSystem fixes (#1815), ConceptMap import handling (#1836), FHIR search parameters (#1839, #1840), and significant work on expansion matching logic (#1296). The NPM import pipeline (#1166, #1910, #1957) enabled loading of standard FHIR terminology packages.

**FHIR Core 2025 (Oct 2025 - present).** The #2253 epic ("OCL FHIR Core 2025") was created in October 2025, defining a comprehensive FHIR roadmap with 14 sub-issues: terminology packaging (#2045), automated FHIR testing (#2046), serialization library (#2047), content traceability (#2048), CRMI compliance (#2049), batch validation (#2050), model documentation (#2051, since deleted), batch translation (#2052), and automated resource validation (#2053).

### 1.4 Current State Overview

**Total issues:** 59

**Disposition breakdown:**

| Disposition | Count |
|------------|-------|
| keep | 37 |
| review | 15 |
| close-stale | 6 |
| close-outdated | 1 |

**By subcategory:**

| Subcategory | Count |
|------------|-------|
| FHIR Operations | 39 |
| Validation & Testing | 7 |
| FHIR Foundation | 5 |
| Content Import & Export | 5 |
| FHIR Content & Packaging | 3 |

**By era:**

| Era | Count |
|-----|-------|
| Build Phase (2024) | 26 |
| Legacy (pre-2022) | 12 |
| FHIR Core 2025 | 8 |
| Recent (2025+) | 7 |
| Foundation Phase (2022-2023) | 6 |

**Issues with code evidence:** 13 of 59

**Overlap with TBv3 analysis:** 9 issues appear in both FHIR and TBv3 buckets (flagged in classification CSV)

---

## Section 2: FHIR Foundation (5 issues)

### 2.1 Canonical URL Registry

**Epic:** #1696 | **Related:** #1744, #1874

#### What It Is and Why It Matters

FHIR resources are identified globally by canonical URLs (e.g., `http://hl7.org/fhir/ValueSet/languages`). OCL needs a registry that maps these canonical URLs to the internal OCL repositories (sources and collections) that contain the corresponding content. Without this, OCL cannot resolve cross-references between FHIR resources — for example, when a ValueSet compose statement references a CodeSystem by its canonical URL, OCL must know which source that URL points to.

The registry also powers the `$resolveReference` operation, which is used internally by ValueSet expansion and externally by users who need to trace where a canonical URL resolves within OCL. Getting canonical URL handling right is foundational to every other FHIR capability.

#### What Was Built

- **Canonical URL Registry UI (#1696 — OPEN).** Initial implementation delivered on QA v3 by @snyaggarwal (confirmed 2024-04-03). @paynejd outlined next steps on 2024-04-02: replace "Target Owner" with an "Owner chip," combine Repo ID and Repo Type columns into a single "Repo chip," rename "Add a URL" to "Add Canonical URL," implement full Create/Edit/Delete capabilities, and clarify that "Test a Canonical URL" uses the `$resolveReference` operation. UAT identified unexpected behavior in the test tool. Labels: `Epic`, `V3`, `v3-foundation`. Milestone: TermBrowser v3 MVP. Code activity observed in `oclweb3`.

#### What Is Pending

- **Canonical URL Registry CRUD (#1696 — OPEN).** Create, Edit, and Delete operations for registry entries are not yet confirmed as complete. The UI refinements proposed by @paynejd (owner chip, repo chip, label changes) have an unknown completion status.
- **Registry Permissions and $resolveReference Behavior (#1744 — OPEN).** Filed 2024-01-23, this issue has no body, no comments, and no assignee. It is labeled `discussion-needed`. The question of who can register canonical URLs and how permissions interact with `$resolveReference` resolution remains unaddressed.
- **Underscore Warnings in Canonical URLs (#1874 — OPEN).** @paynejd noted (2024-07-02) that OCL should ideally prohibit underscores in mnemonics and canonical URLs for new content, and warn for existing content. @jamlung-ri suggested investigating the full FHIR URI datatype specification for other unsupported characters, recommending hyphens as replacements. Assigned to @snyaggarwal but no implementation activity observed.

#### Open Design Questions

- How should permissions work for the canonical URL registry — who can register, edit, or delete entries? (#1744)
- Should OCL enforce FHIR-compliant URI characters (no underscores) at creation time, or only warn? What other characters beyond underscores should be flagged? (#1874)
- What is the expected `$resolveReference` behavior when a canonical URL resolves to multiple OCL repositories or to a repository the user lacks access to? (#1744)

---

### 2.2 Repo Types

**Epic:** #1695

#### What It Is and Why It Matters

OCL historically used two container types — sources (for authored content) and collections (for curated references). The Repo Type epic introduced coded types that determine which FHIR resources and behaviors are available for a given repository. For example, a source with type "CodeSystem" would expose CodeSystem-specific FHIR operations, while a collection typed as "ValueSet" would support expansion and compose statements. This also introduced unified `/repos/` endpoints that search across both sources and collections.

This is foundational for FHIR because FHIR distinguishes sharply between CodeSystems, ValueSets, and ConceptMaps — each with different operations and serialization formats. Repo types allow OCL to enforce the right schema and expose the right FHIR interface for each repository.

#### What Was Built

- **Repo Type Epic (#1695 — CLOSED).** Closed 2026-03-18. @jamlung-ri documented user stories (2023-11-20) covering: accessing owned projects/dictionaries/repos, following repositories, using a single workspace for concept management without separate sources/collections, and creating pre-configured repositories for specific schemas (e.g., OpenMRS Dictionary, FHIR ValueSet). Labels: `Epic`, `V3`, `v3-foundation`. Milestone: TermBrowser v3 MVP.

#### What Is Pending

- **Post-v3 user stories (#1695).** @jamlung-ri identified deferred stories: organizing repositories into a Library grouping, and exploring/reusing public-facing repositories from other organizations. These were explicitly marked "After v3."

#### Open Design Questions

- How should the Library concept (grouping multiple repos) work, and does it map to any FHIR resource? (#1695)

---

### 2.3 Implicit Value Sets

**Epic:** None | **Issue:** #444

#### What It Is and Why It Matters

FHIR defines "implicit value sets" — value sets whose canonical URL is specified as an attribute of a CodeSystem and that automatically include 100% of the codes from that code system. FHIR allows these to exist without explicit database entities, but OCL may need to create explicit entries for indexing, search, or operational reasons. This affects how OCL exposes CodeSystem-associated value sets through the FHIR API.

This is a longstanding design question filed in November 2020. It touches on whether OCL should auto-generate ValueSet resources for every CodeSystem or handle them dynamically at query time.

#### What Was Built

- Nothing has been implemented for this issue.

#### What Is Pending

- **Implicit Value Set Handling (#444 — OPEN).** @paynejd requested (2023-07-05) that @rkorytkowski include this in the FHIR Core roadmap. No further design work or implementation has been documented. Assigned to @paynejd. No labels or milestone.

#### Open Design Questions

- Should OCL create explicit ValueSet entities for every CodeSystem (for indexing and discoverability), or resolve them dynamically at query time? (#444)
- If explicit entities are created, how are they kept in sync when the CodeSystem changes? (#444)

---

## Section 4: Content Import & Export (5 issues)

### 4.1 NPM Import of FHIR Packages

**Epic:** #1166 | **Related:** #1957, #2041

#### What It Is and Why It Matters

The FHIR ecosystem distributes terminology and conformance resources as NPM packages (e.g., `hl7.fhir.r4.core#4.0.1`, `hl7.terminology.r4#6.0.2`). For OCL to serve as a FHIR-compliant terminology server, it must be able to import these packages — including CodeSystems, ValueSets, ConceptMaps, and NamingSystemscontained within them. This is how baseline FHIR content (the core spec, HL7 Terminology (THO), IPS, US Core, VSAC) gets loaded into OCL.

The original epic (#1166) was filed in December 2021 following an OCL Architecture call and has been the umbrella for FHIR service development spanning multiple years. It evolved from initial CodeSystem CRUD to encompass NPM bulk import, operations, and serialization.

#### What Was Built

- **CodeSystem CRUD via FHIR (#1166 — OPEN).** @jamlung-ri confirmed (2022-03-11) that CodeSystem CRUD was done. @rkorytkowski pushed `$validate-code` and `$lookup` operations for CodeSystems (2022-03-27). @paynejd noted that ValueSets should use the `$resolveReference` operator to resolve canonical URLs in compose statements (2022-03-28). Assigned to @rkorytkowski and @snyaggarwal. Labels: `Epic`, `V3`, `v3-foundation`.
- **CodeSystem Testing (#1166).** @jamlung-ri conducted detailed QA testing (2022-03-28) identifying: sources appearing in FHIR after adding version + canonical_url; concept pagination capping at 999 for large CodeSystems (e.g., MER); filtering not working for `language`, `status`, `experimental`; language changes not reflecting in FHIR output; inaccurate concept counts; and CIEL canonical URL mismatches (`https://research.columbia.edu/CIEL` vs. `https://research.columbia.edu/CIEL-dict`).
- **CodeSystem CREATE Testing (#1166).** @jamlung-ri found (2022-03-28) that importing a WHO SMART IG CodeSystem failed because `caseSensitive` expected a string instead of boolean, and concepts without a `property` field triggered "This field is required" errors for all 21 concepts.
- **NPM Bulk Import of hl7.fhir.r4.core (#1957 — OPEN).** @paynejd requested (2024-10-22) that @rkorytkowski import `hl7.fhir.r4.core#4.0.1` into QA using the owner `hl7-fhir-r4-core-npm`. @rkorytkowski uploaded import result logs on 2025-01-24 (three JSON files documenting the bulk import). Assigned to @rkorytkowski.

#### What Is Pending

- **Full NPM Package Import (#1166 — OPEN).** The epic remains open. @paynejd shared an OCL FHIR Core Planning Scratchpad (Nov 2023) and noted pagination needs for large CodeSystems. @rkorytkowski commented that `CodeSystem.concept` is capped at 1000 and eventually GraphQL may be needed for pagination.
- **Baseline Content Test Loading (#1957 — OPEN).** The test matrix covers six package families: hl7.fhir.r4.core, hl7.terminology.r4 (THO), IPS, C-CDA, US Core, and VSAC. Import logs exist for the core package, but testing of the remaining packages is not documented. Some packages (C-CDA, US Core, VSAC) are not available at registry.fhir.org and require alternative download paths.
- **Skip r4.core Dependency on Import (#2041 — OPEN).** Filed 2025-01-23 by @rkorytkowski. The bulk importer should assume `hl7.fhir.r4.core:4.0.1` is already loaded rather than re-importing it when listed as a dependency of another package. Code activity observed in `oclapi2`.

#### Open Design Questions

- How should pagination work for large CodeSystems with thousands of concepts? Is GraphQL the long-term solution as @rkorytkowski suggested? (#1166)
- What is the strategy for packages not available at registry.fhir.org (C-CDA, US Core, VSAC) — manual download or alternate registry support? (#1957)
- Should the "skip r4.core" logic be generalized to skip any already-loaded dependency, or only the core spec? (#2041)

---

### 4.2 FHIR Import Validation

**Issue:** #1961

#### What It Is and Why It Matters

When FHIR content is imported into OCL (whether via NPM packages or individual resource POST), the imported content may not perfectly round-trip — fields may be dropped, transformed, or defaulted differently than the source. A validation/comparison process is needed to verify that what OCL stores and re-exports faithfully represents the original FHIR content. This is critical for trust: organizations importing published FHIR IGs need assurance that OCL preserves the content accurately.

#### What Was Built

- Nothing has been implemented for this issue.

#### What Is Pending

- **FHIR Import Validation/Comparison Process (#1961 — OPEN).** Filed 2024-10-22 with no body, no comments, no assignee, and no labels. This is a placeholder for a capability that has not been designed or implemented.

#### Open Design Questions

- What should the validation process compare — the original FHIR JSON against OCL's re-serialized output? Which fields should be compared, and which are expected to differ? (#1961)
- Should validation run automatically on every import, or be an on-demand operation? (#1961)

---

### 4.3 FHIR Serialization Library

**Epic:** #2047

#### What It Is and Why It Matters

OCL stores terminology content in its own internal data model (sources, concepts, mappings, collections, references). To expose this content via FHIR APIs, OCL must serialize its internal model into valid FHIR JSON (and potentially XML) for CodeSystem, ValueSet, ConceptMap, and other resource types. The current serialization logic is embedded in the FHIR API views, but a dedicated serialization library would centralize this logic, make it testable, and enable reuse across import, export, and API layers.

This epic was filed as part of the OCL FHIR Core 2025 initiative (#2253) and represents a strategic investment in the quality and maintainability of OCL's FHIR output.

#### What Was Built

- Nothing has been implemented yet for this epic.

#### What Is Pending

- **FHIR Serialization Library (#2047 — OPEN).** Filed 2025-01-30 with no body or comments. Labeled as `Epic`. Assigned to @rkorytkowski. Part of the FHIR Core 2025 roadmap. No child issues have been created.

#### Open Design Questions

- What is the scope of the library — just JSON serialization, or also XML (see #1761)? (#2047)
- Will the library handle both serialization (OCL-to-FHIR) and deserialization (FHIR-to-OCL), replacing import parsing as well? (#2047)
- Should the library validate output against FHIR StructureDefinitions, or is validation a separate concern (#1961, #2053)? (#2047)


---

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


---

## Section 5: Validation & Testing (7 issues)

### 5.1 Repo Configuration and Content Validation

**Epic:** #1726

#### What It Is and Why It Matters

OCL repositories need configurable lookup values, including FHIR properties and filters, to ensure that terminology content conforms to expected schemas. This epic covers the ability to define and enforce repo-level configuration -- for example, specifying which FHIR CodeSystem properties and filters are valid for a given source. Without this, content authors have no guardrails when editing terminology in the TermBrowser, increasing the risk of producing FHIR-noncompliant resources.

This is closely related to the operations-layer work on exposing `source.properties` and `source.filters` through FHIR CodeSystem (#2262), but the focus here is on the validation side: ensuring that content written into a repo actually matches the declared property and filter definitions.

#### What Was Built

Nothing has been implemented yet. The epic has no body text and no comments.

#### What Is Pending

- **Repo Configuration and Content Validation (#1726 -- OPEN).** Created 2024-01-04 with no assignee. No child tickets, no body text, and no comments as of the last update on 2024-01-23. This is a placeholder epic that needs decomposition into actionable tasks.

#### Open Design Questions

- What specific FHIR properties and filters should be configurable at the repo level? (#1726)
- How does this interact with the repo type system (#1695) -- should property/filter configurations be driven by repo type templates?
- Should validation be enforced at write time, at release time, or both?

---

### 5.2 Publishing Terminology to the FHIR Ecosystem

**Epic:** #1915

#### What It Is and Why It Matters

The HL7 community publishes a set of requirements (documented at [Publishing terminology to the FHIR Ecosystem](https://confluence.hl7.org/display/FHIR/Publishing+terminology+to+the+FHIR+Ecosystem)) that go beyond the base FHIR Terminology Services specification. These requirements make terminology available for FHIR validation and IG (Implementation Guide) publishing. For OCL to serve as a credible terminology server in the broader FHIR ecosystem -- particularly for workflows like direct IG building from OCL -- it must meet these additional conformance requirements.

The body of this issue references @rkorytkowski to define actual development tasks, but no child tasks have been created yet. Related work has been validated manually: @jamlung-ri demonstrated that OCL-hosted CodeSystems can be used directly in the FHIR IG Publisher after the CodeSystem fixes in #1815 were deployed to QA (May 2024).

#### What Was Built

No direct implementation under this epic. However, the FHIR CodeSystem Fixes (#1815) resolved several issues that were blocking IG Publisher compatibility, including:
- Null fields being emitted in FHIR JSON (FHIR spec requires omission)
- Concept property `value` needing to be `valueString`
- Missing `content` field (e.g., `"content": "complete"`)
- Incorrect casing on property type (`"coding"` vs. `"Coding"`)
- Inactive code count inaccuracy

These were validated by @jamlung-ri on 2024-05-03 in QA and confirmed working with the FHIR IG Publisher.

#### What Is Pending

- **Publishing Terminology to the FHIR Ecosystem (#1915 -- OPEN).** Assigned to @rkorytkowski. Created 2024-08-09, last updated 2025-01-30. No child tasks have been defined yet.

#### Open Design Questions

- What is the full gap between OCL's current FHIR output and the HL7 publishing requirements? (#1915)
- Can OCL serve as a registered terminology server for the FHIR IG Publisher, or does it need a packaging/proxy layer?

---

### 5.3 Automated FHIR Testing Pipeline

**Epic:** #2046

#### What It Is and Why It Matters

As OCL's FHIR surface area grows -- with more resource types, operations, and integration points -- manual testing becomes unsustainable. An automated testing pipeline would continuously validate that OCL's FHIR endpoints produce spec-compliant responses, that operations like `$expand`, `$lookup`, and `$validate-code` return correct results, and that regressions are caught before deployment.

This epic is part of the OCL FHIR Core 2025 initiative (#2253) and is assigned to @rkorytkowski and @jamlung-ri. It has no body text or child tasks.

#### What Was Built

Nothing has been implemented yet.

#### What Is Pending

- **Automated FHIR Testing Pipeline (#2046 -- OPEN).** Created 2025-01-30. No body, no children, no comments. Needs decomposition into test categories (unit, integration, conformance), tooling decisions (e.g., Touchstone, custom test harness), and a phased rollout plan.

#### Open Design Questions

- What test framework should be used -- Touchstone, a custom harness, or both? (#2046)
- What is the minimum viable test coverage for launch?
- Should the pipeline run on every PR, on a schedule, or both?

---

### 5.4 CRMI Compliance

**Epic:** #2049

#### What It Is and Why It Matters

CRMI (Canonical Resource Management Infrastructure) is an HL7 FHIR IG that defines patterns for managing canonical resources (CodeSystems, ValueSets, ConceptMaps, etc.) including versioning, status management, and lifecycle operations. Compliance with CRMI would position OCL as a standards-conformant canonical resource management platform, which is important for adoption by organizations that require CRMI-compliant servers.

#### What Was Built

No implementation details are recorded. The epic was closed on 2026-03-24.

- **CRMI Compliance (#2049 -- CLOSED).** Closed 2026-03-24. No body, no comments, no child tickets. It is unclear whether CRMI compliance was achieved, deferred, or determined to be out of scope. The closure may have been part of a bulk triage on 2026-03-24 (the same date that #2050 and #2048 were also closed).

#### What Is Pending

Nothing formally pending, but the lack of any recorded work or rationale for closure suggests this may need to be revisited.

#### Open Design Questions

- Was CRMI compliance achieved, deferred, or descoped? (#2049)
- If deferred, what is the timeline and what gaps remain?

---

### 5.5 Batch Validation

**Epic:** #2050

#### What It Is and Why It Matters

Batch validation would allow users to submit multiple codes or resources for validation in a single request, rather than validating one at a time. This is particularly important for bulk content loading workflows (e.g., NPM imports) where thousands of concepts need to be checked against a CodeSystem or ValueSet. Without batch validation, post-import quality assurance requires many individual API calls.

#### What Was Built

No implementation details are recorded. The epic was closed on 2026-03-24.

- **Batch Validation (#2050 -- CLOSED).** Closed 2026-03-24. No body, no comments, no child tickets. Same bulk closure date as #2049 and #2048.

#### What Is Pending

Nothing formally pending.

#### Open Design Questions

- Was this implemented, deferred, or descoped? (#2050)
- If deferred, should it be combined with the Automated FHIR Resource Validation epic (#2053)?

---

### 5.6 Automated FHIR Resource Validation

**Epic:** #2053

#### What It Is and Why It Matters

This epic covers the automated validation of FHIR resources as they are created or imported into OCL. Rather than relying on manual review or post-hoc comparison, resources would be validated against the FHIR specification (and potentially CRMI or other profiles) at write time. This is distinct from the testing pipeline (#2046), which validates OCL's FHIR endpoints; this epic validates the content flowing through those endpoints.

The related issue #1761 (Add FHIR XML support) explored deploying the HL7 FHIR Validator as a microservice, which could serve as the validation backend for this epic.

#### What Was Built

Nothing has been implemented yet.

#### What Is Pending

- **Automated FHIR Resource Validation (#2053 -- OPEN).** Created 2025-01-30. No body, no assignee, no children, no comments.

#### Open Design Questions

- Should validation use the HL7 FHIR Validator service (as explored in #1761) or a lighter-weight approach? (#2053)
- At what points in the lifecycle should validation occur -- on import, on edit, on release, or all three?

---

### 5.7 FHIR XML Support

**Epic:** #1761

#### What It Is and Why It Matters

FHIR specifies two primary serialization formats: JSON and XML. OCL currently only supports JSON. Some FHIR clients and workflows (particularly in the European healthcare ecosystem) require XML support. Issue #1761 explores adding XML support by deploying the HL7 FHIR Validator as a microservice, which could handle both XML-to-JSON conversion and FHIR validation in one service.

@rkorytkowski evaluated two options in the issue body: (1) deploy the [FHIR Validator Wrapper](https://github.com/hapifhir/org.hl7.fhir.validator-wrapper), or (2) build a REST-only wrapper around [org.hl7.fhir.core](https://github.com/hapifhir/org.hl7.fhir.core). A third option mentioned was using the Python `fhir.resources` library or universal JSON/XML converters.

@rkorytkowski submitted a PR to the FHIR Validator Wrapper project on 2024-03-12 (https://github.com/hapifhir/org.hl7.fhir.validator-wrapper/pull/167).

#### What Was Built

- **PR submitted to upstream FHIR Validator Wrapper (#1761).** @rkorytkowski opened a PR at the hapifhir validator-wrapper repo on 2024-03-12. The current status of this PR and whether it was merged is not recorded in the OCL issue.

#### What Is Pending

- **Add FHIR XML Support (#1761 -- OPEN).** Assigned to @rkorytkowski. Created 2024-02-07, last updated 2024-03-12. The classification CSV marks this as `review` priority `low`, suggesting it is not on the critical path for the FHIR Service MVP.

#### Open Design Questions

- Which deployment option for FHIR validation was chosen -- the validator wrapper, a custom REST wrapper, or the Python library? (#1761)
- Should the FHIR Validator microservice also serve the Automated FHIR Resource Validation use case (#2053)?
- Is XML support required for the FHIR Service MVP, or can it be deferred?

---

## Section 6: FHIR Content & Packaging (3 issues)

### 6.1 FHIR Baseline Content

**Epic:** #1910

#### What It Is and Why It Matters

OCL aspires to host the "baseline" FHIR NPM packages -- the foundational terminology content that the FHIR ecosystem depends on. These include `hl7.fhir.r4.core#4.0.1`, `hl7.terminology.r4#5.3.0`, `hl7.fhir.uv.ips`, `hl7.fhir.us.ccda`, and `hl7.fhir.us.core#6.1.0`. Making this content available in OCL Online is a prerequisite for OCL to function as a full-fledged FHIR terminology server, since ValueSet expansions frequently reference codes from these baseline packages.

The MVP defined in #1910 is focused on performing a full load of baseline content into QA using the NPM Import feature, then generating a gap report comparing source content to what OCL actually loaded. This gap report would identify: (a) gaps in OCL's FHIR Core capabilities, (b) gaps in reference content needed for expansions, and (c) the maintenance workflow for fixing issues and loading new releases.

The issue body contains an extensive checklist of next steps including: load testing, import validation, versioning gap analysis, namespace ownership modeling, registry population, error message improvements, FHIR Validator integration, and `_history` endpoint support.

#### What Was Built

Baseline content loading has been partially executed. Related work includes:

- **Test Load of Baseline Content via NPM Import (#1957 -- OPEN).** @paynejd requested on 2024-10-22 that @rkorytkowski import `hl7.fhir.r4.core#4.0.1` into QA using the NPM bulk import feature under the `hl7-fhir-r4-core-npm` owner. @rkorytkowski posted import result files on 2025-01-24, indicating the import was attempted. The ticket remains open, suggesting the results have not been fully validated.
- **Skip r4.core Dependency on Subsequent Imports (#2041 -- OPEN).** Assigned to @rkorytkowski, created 2025-01-23. Since nearly all FHIR NPM packages list `hl7.fhir.r4.core` as a dependency, the bulk importer should treat it as pre-loaded rather than re-importing it with every package.
- **FHIR Import Validation/Comparison Process (#1961 -- OPEN).** Created 2024-10-22 with no body, no assignee, and no comments. This would implement the source-to-loaded comparison report described in the #1910 MVP definition.

#### What Is Pending

- **FHIR Baseline Content (#1910 -- OPEN).** Assigned to @rkorytkowski. Created 2024-07-30. The checklist in the issue body has no items checked off. Key outstanding items include: implementing validation (compare source to loaded content), testing versioning edge cases, documenting capability gaps, modeling namespace ownership for HL7 content, and implementing the `_history` endpoint.
- **FHIR Import Validation/Comparison (#1961 -- OPEN).** No assignee, no progress.
- **Skip r4.core Dependency (#2041 -- OPEN).** @rkorytkowski assigned, code activity in oclapi2.

#### Open Design Questions

- What namespace/ownership model should be used for HL7-authored baseline content in OCL Online? (#1910)
- How should OCL handle versioning when a newer package version is imported before an older one? (#1910)
- What is the maintenance workflow for loading new releases of baseline packages? (#1910)
- Should OCL validate imported content against the FHIR Validator as part of the import pipeline? (#1910)

---

### 6.2 FHIR Content Traceability

**Epic:** #2048

#### What It Is and Why It Matters

Content traceability ensures that FHIR resources served by OCL can be traced back to their origin -- whether that is an NPM package import, a manual creation via the TermBrowser, or a bulk upload. This is important for audit, debugging, and trust: consumers of OCL-hosted terminology need to know where content came from, when it was loaded, and whether it has been modified since import.

This epic is part of the OCL FHIR Core 2025 initiative (#2253) and was assigned to @rkorytkowski.

#### What Was Built

No implementation details are recorded. The epic was closed on 2026-03-24.

- **FHIR Content Traceability (#2048 -- CLOSED).** Closed 2026-03-24, same bulk closure date as #2049 and #2050. No body, no comments, no child tickets. It is unclear whether traceability was implemented, deferred, or descoped.

#### What Is Pending

Nothing formally pending, but the lack of recorded work suggests this may need revisiting.

#### Open Design Questions

- Was content traceability implemented via another mechanism (e.g., import metadata on sources)? (#2048)
- If not, what metadata should be captured -- import source, import timestamp, original package version, modification history?

---

### 6.3 Terminology Packaging Service

**Epic:** #2045

#### What It Is and Why It Matters

The Terminology Packaging Service would allow OCL to export curated terminology content as distributable packages -- likely in FHIR NPM package format. This is the complement to the NPM Import capability: where import brings external content into OCL, the packaging service would let users bundle OCL-managed content for distribution to downstream FHIR servers, IG builds, or other consumers.

This is critical for OCL's role in the FHIR ecosystem. Organizations that author and manage terminology in OCL need a way to publish that content in standard formats that other tools (e.g., the FHIR IG Publisher, HAPI FHIR, Ontoserver) can consume.

This epic is part of the OCL FHIR Core 2025 initiative (#2253) and is assigned to @paynejd and @jamlung-ri.

#### What Was Built

Nothing has been implemented yet.

#### What Is Pending

- **Terminology Packaging Service (#2045 -- OPEN).** Created 2025-01-30. No body, no comments, no child tickets. Assigned to @paynejd and @jamlung-ri. Needs requirements definition and decomposition.

#### Open Design Questions

- What package formats should be supported -- FHIR NPM only, or also other formats (e.g., CQL support packages, VSAC exports)? (#2045)
- Should packaging be a synchronous download or an asynchronous job?
- How does packaging interact with versioning -- can users package a specific source version, or only HEAD?
- What metadata should be included in the package manifest?

---

## Section 7: Cross-cutting Concerns

### 7.1 Overview

Several issues span multiple sections and touch on cross-cutting infrastructure concerns: error handling, endpoint consistency, permissions, and format support. Rather than duplicate these across sections, they are collected here.

---

### 7.2 Error Handling and API Robustness

#### What It Is and Why It Matters

Multiple issues across the codebase reveal a pattern of poor error handling in FHIR endpoints. These are not isolated bugs but symptoms of a systemic gap: OCL's FHIR layer often returns raw 500 errors, uninformative 502 Bad Gateway responses, or constraint violation messages that are not actionable for FHIR clients.

Key examples:

- **502 Bad Gateway for Large CodeSystems (#1833 -- OPEN).** CodeSystems with more than ~250 codes cause timeouts. @snyaggarwal profiled the issue in May 2024 and identified four bottlenecks (concept create, version create, double indexing, double serialization). Partial fixes were deployed to QA, but the request still timed out on QA hardware. @rkorytkowski increased the timeout to 10 minutes as a workaround. The underlying issue -- that large synchronous FHIR POSTs should be queued as async tasks -- remains unresolved.

- **CodeSystem POST Bug -- Display Required (#1599 -- OPEN).** FHIR does not require the `display` attribute on CodeSystem concepts, but OCL returns a 500 error when it is missing. @rkorytkowski confirmed on 2024-03-05 that `display` should not be required and that `code` should be used as a fallback concept name. Not yet fixed.

- **Unsupported Search Params (#1839).** @rkorytkowski added `BadRequest` responses for unsupported search params (2024-05-21), which is a positive step toward spec-compliant error handling.

- **Naked FHIR Request Response (#472 -- OPEN).** The root FHIR URL returns a 404 instead of a CapabilityStatement or informative response. Open since 2020 with no progress.

- **Baseline Content Loading Errors (#1910).** The #1910 checklist includes "Improve response of API with proper error messages and data model validation" as an explicit next step.

#### Open Design Questions

- Should OCL return FHIR OperationOutcome resources for all error responses? (#472, #1599, #1833)
- Is there a plan to audit all FHIR endpoints for spec-compliant error responses?

---

### 7.3 Endpoint Consistency

#### What It Is and Why It Matters

FHIR clients expect consistent endpoint behavior regardless of minor URL variations. Two issues highlight gaps:

- **Trailing Slash Handling (#2030 -- OPEN).** Both `POST .../CodeSystem` and `POST .../CodeSystem/` must work. Assigned to @rkorytkowski, code activity in oclapi2. Created 2024-11-27.

- **Owner+ID Scoped Operations (#583 -- OPEN).** @paynejd noted on 2021-09-14 that owner-scoped FHIR operations (e.g., `/orgs/PEPFAR/CodeSystem/MER/$validate-code`) appear to work in some cases but the ticket remains open, suggesting incomplete coverage.

These are relatively small fixes but important for interoperability -- FHIR clients should not need to know OCL-specific URL conventions.

---

### 7.4 Permissions and Multi-tenancy

#### What It Is and Why It Matters

- **Permissions for Registries and $resolveReference (#1744 -- OPEN).** Created 2024-01-23 with labels `enhancement`, `discussion-needed`, `api2`. No body, no comments, no assignee. This issue covers how permissions should work for the canonical URL registry and the `$resolveReference` operation. The design implications are significant: if a FHIR client resolves a canonical URL, should they see results from private namespaces? Should registry entries be editable by org admins only?

This intersects with the `$resolveReference` refactoring (#2261), which proposes that all FHIR operations use `$resolveReference` for canonical URL resolution. The permissions model for the registry will directly affect how multi-tenant resolution works.

---

### 7.5 XML Format Support

#### What It Is and Why It Matters

- **Add FHIR XML Support (#1761 -- OPEN).** Covered in detail in Section 5.7. From a cross-cutting perspective, XML support affects every FHIR endpoint -- not just validation. If implemented via a microservice (as proposed), it would sit in front of or alongside the existing FHIR service and need to handle content negotiation (`Accept: application/fhir+xml`) across all resource types and operations.

The classification CSV marks this as `low` priority and `review` disposition, suggesting it is unlikely to be included in the FHIR Service MVP.

---

### 7.6 FHIR ID Conventions and Character Restrictions

#### What It Is and Why It Matters

- **Underscore Warning in Canonical URLs (#1874 -- OPEN).** @paynejd noted on 2024-07-02 that OCL should not allow underscores in mnemonics and canonical URLs for new content and should warn about existing content. @jamlung-ri expanded this to suggest investigating the full set of unsupported characters from the [FHIR datatype spec](https://build.fhir.org/datatypes.html#uri), recommending hyphens as the replacement for underscores.

This is a cross-cutting concern because FHIR IDs and canonical URLs are used throughout the system -- in repo creation, import, export, registry entries, and FHIR operations. A character validation policy would need to be enforced at multiple layers.

Assigned to @snyaggarwal. No code activity recorded.

---

### 7.7 Summary of Cross-cutting Status

| Concern | Key Issue(s) | Status |
|---------|-------------|--------|
| Error handling / OperationOutcome | #472, #1599, #1833, #1910 | Partially addressed; systemic gap remains |
| Endpoint consistency (trailing slash, scoping) | #2030, #583 | In progress |
| Permissions / multi-tenancy | #1744 | No progress; needs design discussion |
| XML format support | #1761 | Deferred; PR submitted upstream |
| ID/URL character validation | #1874 | No progress |


---

## Section 8: Resource Library

### FHIR Specifications
- [HL7 FHIR R4 Specification](https://hl7.org/fhir/R4/)
- [FHIR Terminology Module](https://hl7.org/fhir/R4/terminology-module.html)
- [FHIR CodeSystem Resource](https://hl7.org/fhir/R4/codesystem.html)
- [FHIR ValueSet Resource](https://hl7.org/fhir/R4/valueset.html)
- [FHIR ConceptMap Resource](https://hl7.org/fhir/R4/conceptmap.html)
- [CRMI Implementation Guide](http://hl7.org/fhir/uv/crmi/)

### OCL Documentation
- [OCL FHIR Service Documentation](https://docs.openconceptlab.org/)
- [OCL API v2 Documentation](https://docs.openconceptlab.org/)

### Key Epics
- [#2253: OCL FHIR Core 2025](https://github.com/OpenConceptLab/ocl_issues/issues/2253) — Master FHIR roadmap epic
- [#1166: NPM Import of Baseline FHIR Content](https://github.com/OpenConceptLab/ocl_issues/issues/1166) — FHIR content loading
- [#869: FHIR/SVCM Support in OCL](https://github.com/OpenConceptLab/ocl_issues/issues/869) — Original FHIR support epic

---

## Appendix A: Issue Index

| # | Title | Status | Disposition | Section |
|---|-------|--------|-------------|---------|
| 444 | Plan how to handle "implicit value sets" in FHIR | OPEN | keep | 2 |
| 472 | Provide response for naked fhir request | OPEN | close-stale | 3 |
| 582 | Ability to filter by codesystem properties | OPEN | close-stale | 3 |
| 583 | Ability to perform FHIR operation by Owner and Id | OPEN | review | 3 |
| 591 | Download/View as FHIR | OPEN | close-stale | 3 |
| 632 | Implement features to allow configuration of case sensitivit... | OPEN | close-stale | 3 |
| 782 | Introduce attribute to control how an OCL source is exposed ... | OPEN | keep | 3 |
| 828 | Automatically generate changelog for oclweb2, oclapi2, oclfh... | OPEN | close-outdated | 3 |
| 865 | FHIR UI in TermBrowser | OPEN | close-stale | 3 |
| 869 | FHIR/SVCM Support in OCL | OPEN | review | 3 |
| 974 | FHIR $expand operation should utilize OCL's full text search... | OPEN | keep | 3 |
| 1166 | NPM Import of Baseline FHIR Content, plus Known FHIR Service... | OPEN | keep | 4 |
| 1296 | Requirements: Basic expansion matching logic for ValueSet op... | OPEN | keep | 3 |
| 1310 | Implement recursive real-time expansions | OPEN | keep | 3 |
| 1599 | CodeSystem POST Bug - Display attribute seems to be required... | OPEN | keep | 3 |
| 1610 | Use canonical URL where possible in the "system" field of a ... | OPEN | keep | 3 |
| 1695 | Repo Type | CLOSED | review | 2 |
| 1696 | Canonical URL Registry | OPEN | keep | 2 |
| 1726 | Repo Configuration and Content Validation - Configuring Look... | OPEN | keep | 5 |
| 1744 | Permissions for registries and $resolveReference behavior | OPEN | review | 2 |
| 1761 | Add FHIR xml support | OPEN | review | 5 |
| 1793 | Implement basic analytics on OCL FHIR Core utilization | OPEN | close-stale | 3 |
| 1815 | FHIR CodeSystem Fixes | OPEN | review | 3 |
| 1823 | CodeSystem $lookup Enhancement - displayLanguage Parameter | OPEN | keep | 3 |
| 1833 | 502 Bad Gateway for Large CodeSystem resources | OPEN | keep | 3 |
| 1835 | OCL rejects "duplicate" resource imports - "org_source_uniqu... | OPEN | review | 3 |
| 1836 | FHIR ConceptMap fails to import due to "null" map_type | OPEN | review | 3 |
| 1837 | Review/finalize $translate operation | OPEN | keep | 3 |
| 1839 | Add code searchParam for CodeSystem | OPEN | review | 3 |
| 1840 | CodeSystem listing should include total | OPEN | review | 3 |
| 1874 | In TB, warn users that underscore not officially supported b... | OPEN | keep | 2 |
| 1898 | Download the (or one of the) FHIR representation of a reposi... | OPEN | keep | 3 |
| 1910 | FHIR baseline content | OPEN | keep | 6 |
| 1915 | OCL support for Publishing terminology the FHIR ecosystem, i... | OPEN | keep | 5 |
| 1919 | Support ConceptMap and CodeSystem with the same ID | OPEN | keep | 3 |
| 1922 | Fix overwriting ConceptMap version | OPEN | keep | 3 |
| 1924 | Import r4.core dependency once | OPEN | keep | 3 |
| 1927 | CodeSystem Import Bug for Date property | OPEN | keep | 3 |
| 1929 | CodeSystem Import Bug: New line character removed when impor... | OPEN | keep | 3 |
| 1957 | Test load baseline content via NPM import | OPEN | keep | 4 |
| 1961 | Implement FHIR import validation/comparison process | OPEN | review | 4 |
| 2027 | Template / Repository / ValueSet | OPEN | keep | 3 |
| 2028 | Template / Repository / CodeSystem | OPEN | keep | 3 |
| 2030 | FHIR endpoints must be handled with or without trailing slas... | OPEN | keep | 3 |
| 2041 | Do not import npm hl7.fhir.r4.core 4.0.1 if listed in depend... | OPEN | keep | 4 |
| 2045 | Terminology Packaging Service | OPEN | keep | 6 |
| 2046 | Automated FHIR Testing Pipeline | OPEN | keep | 5 |
| 2047 | Implement FHIR Serialization Library | OPEN | keep | 4 |
| 2048 | FHIR Content Traceability | CLOSED | keep | 6 |
| 2049 | CRMI Compliance | CLOSED | keep | 5 |
| 2050 | Batch Validation | CLOSED | keep | 5 |
| 2052 | Batch Translation | CLOSED | keep | 3 |
| 2053 | Automated FHIR Resource Validation | OPEN | keep | 5 |
| 2093 | Export Metadata as a ConceptMap | OPEN | keep | 3 |
| 2114 | Bug: Value Set Compose Statement shows "ValueSet" in the "sy... | OPEN | keep | 3 |
| 2253 | OCL FHIR Core 2025 | OPEN | review | 3 |
| 2261 | Use $resolveReference to resolve canonical URL to OCL repo v... | OPEN | review | 3 |
| 2262 | Expose OCL source.properties & source.filters through FHIR C... | OPEN | review | 3 |
| 2281 | Proposal to support download of a concept's mappings as a va... | OPEN | review | 3 |

## Appendix B: Contributor Map

| Contributor | Issues | Primary Sections |
|---|---|---|
| @bmamlin | #1296 | Section 3 |
| @italomacedo | #2261 | Section 3 |
| @jamlung-ri | #591, #1837, #1898, #2045, #2046 | Section 3, 5, 6 |
| @paulsonder | #2027 | Section 3 |
| @paynejd | #444, #1695, #1696, #1837, #2045 | Section 2, 3, 6 |
| @rkorytkowski | #782, #828, #974, #1166, #1296, #1599, #1610, #1761 | Section 3, 4, 5, 6 |
| @snyaggarwal | #1166, #1833, #1874, #2262 | Section 2, 3, 4 |
