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
