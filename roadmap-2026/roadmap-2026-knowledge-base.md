# OCL 2026 Roadmap Priority Knowledge Base

**Generated:** 2026-03-31
**Scope:** 31 issues prioritized for the 2026 OCL Roadmap
**Source:** [OpenConceptLab/ocl_issues](https://github.com/OpenConceptLab/ocl_issues) GitHub repository
**Companion data:** `roadmap-2026-raw-archive.json` (full issue bodies + comments), `roadmap-2026-issue-classification.csv` (31-row analysis)

---

## Table of Contents

1. [Executive Summary](#section-1-executive-summary)
2. [Data Model & Standards](#section-2-data-model--standards)
3. [FHIR & Interoperability](#section-3-fhir--interoperability)
4. [Export & Download](#section-4-export--download)
5. [Cascade & References](#section-5-cascade--references)
6. [Repository Management](#section-6-repository-management)
7. [Access Control & Permissions](#section-7-access-control--permissions)
8. [TermBrowser UX](#section-8-termbrowser-ux)
9. [Data Integrity & Checksums](#section-9-data-integrity--checksums)
10. [OCL Mapper](#section-10-ocl-mapper)
11. [Search & Discovery](#section-11-search--discovery)
- [Appendix A: Issue Index](#appendix-a-issue-index)
- [Appendix B: Contributor Map](#appendix-b-contributor-map)

---

## Section 1: Executive Summary

### 1.1 What This Bucket Represents

This knowledge base captures 31 issues from the OCL backlog (`ocl_issues`) that are not yet active but have been identified as priorities for the 2026 Roadmap. These issues span the full history of OCL's issue tracker — from 2021 through early 2026 — but share the common trait of representing well-defined, strategically important work that the team intends to pursue.

Unlike other cleanup buckets (TBv3, FHIR, api2, etc.) where issues were triaged for closure or retention, every issue in this bucket carries the `keep-roadmap` disposition. They are being incorporated into the knowledge base to preserve their context, design discussions, and stakeholder input before the original tickets are closed.

### 1.2 Key Stakeholders and Contributors

| Contributor | Primary Focus | Notable Involvement |
|---|---|---|
| **@paynejd** | Product owner, architecture, strategy | #757, #878, #1194, #1357, #1868, #1911, #2159, #2266 |
| **@snyaggarwal** | API engineering, implementation | #757, #878, #1143, #1740, #1867, #1868, #1970, #2057, #2159, #2294 |
| **@jamlung-ri** | Requirements, QA, stakeholder alignment | #790, #1194, #1396, #1610, #1666, #1697, #1763, #1891, #2057 |
| **@bmamlin** | Clinical domain, CIEL, standards | #757, #878, #1666, #1867 |
| **@paulsonder** | Design, UX | #1763, #1971 |
| **@michaelbontyes** | OCL Mapper, user testing | #2128 |
| **@delcroip** | FHIR integration, clinical workflows | #2281 |
| **@chamiw2008** | Community user, CSV export needs | #1911 |

### 1.3 Timeline and Eras

| Era | Count | Description |
|-----|-------|-------------|
| Legacy (pre-2022) | 4 | Long-standing feature requests from OCL's early maturity (#757, #790, #878, #1143) |
| Foundation Phase (2022-2023) | 7 | Issues filed during the TermBrowser v3 foundation work (#1194, #1357, #1396, #1610, #1666, #1697, #1706) |
| Build Phase (2024) | 9 | Issues from the peak v3 development year (#1740, #1763, #1867, #1868, #1891, #1911, #1925, #1970, #1971) |
| Recent (2025+) | 11 | Issues from the FHIR Core 2025 era and beyond (#2057, #2093, #2128, #2159, #2175, #2176, #2231, #2266, #2281, #2294) |

### 1.4 Thematic Breakdown

| Theme | Count | Priority Mix |
|-------|-------|-------------|
| Data Model & Standards | 5 | 2 high, 3 medium |
| FHIR & Interoperability | 6 | 2 high, 3 medium, 1 low |
| Export & Download | 3 | 3 high |
| Cascade & References | 2 | 1 high, 1 medium |
| Repository Management | 5 | 0 high, 5 medium |
| Access Control & Permissions | 3 | 1 high, 2 medium |
| TermBrowser UX | 3 | 1 high, 2 medium |
| Data Integrity & Checksums | 1 | 1 high |
| OCL Mapper | 2 | 1 high, 1 low |
| Search & Discovery | 1 | 1 low |

---

## Section 2: Data Model & Standards

This section covers foundational issues related to OCL's data model — how concepts, names, mappings, and locales are structured and standardized across the platform.

### 2.1 Name Type Standardization

**Issues:** #878, #1666 | **Related:** #1697

#### What It Is and Why It Matters

OCL's `name_type` attribute has long suffered from inconsistency. The same logical type appears in multiple formats: `"Fully Specified"`, `"FULLY_SPECIFIED"`, and `"Fully-Specified"` — across different environments and imports. This creates confusion for users, breaks faceted search, and complicates data interchange with OpenMRS and FHIR systems.

A deeper problem is the `None` name type. Since name type is optional, the semantic difference between `None` (an explicit type value) and `null` (no type specified) is undefined. As @paynejd noted in #1666: *"an alternate name for a concept implies the very definition of synonym, so it's natural to assume any name where name type is not specified is a synonym."*

#### What Was Built

- @snyaggarwal implemented backend standardization logic (branch created Aug 2021) to normalize name_type display across environments (#878). The code standardizes from whatever input format is given, affecting both existing and new concepts.
- Discussion on the OCL Architecture call (2021-08-13) established that the approach should be: standardize import code first, then enforce via custom validation schema.

#### What Is Pending

- **Purge `None` name type** (#1666): Remove the [None entry](https://app.openconceptlab.org/#/orgs/OCL/sources/NameTypes/concepts/None/) from OCL's NameTypes source. Convert existing `None` data to `null`.
- **Add `Synonym` name type** (#1666): Treat `null` and `Synonym` equivalently. Optionally make name type required in a later phase, converting all `null` entries to `Synonym`.
- **TermBrowser impact assessment** (#1666 — @jamlung-ri): Import validation, Create/Edit Concept forms, Names & Synonyms display, Summary tab, faceted search, checksums, and OpenMRS validation schema all need review.
- **Filter panel display** (#878 — @paynejd): Name types are displayed differently in the filter panel than stored (e.g. `FULLY SPECIFIED` vs `FULLY_SPECIFIED`), causing user confusion.
- **Description types**: @jamlung-ri raised whether the `None` cleanup should extend to description types as well (#1666).

#### Open Design Questions

- Should `None` cleanup also apply to description types, or just name types? (#1666)
- What is the migration path for existing content using `None`? Bulk data update vs. lazy migration?
- How does this interact with checksums — will changing `name_type` from `None` to `null` change checksums? (#878, #1867)

### 2.2 Locale & Country Code Support

**Issue:** #757

#### What It Is and Why It Matters

OCL's locale system does not fully support country-qualified locale codes (e.g. `en_GB`, `fr_CA`). This surfaced when importing the PIH dictionary (#732), where valid Java locales were rejected by OCL.

#### What Was Built

- @bmamlin conducted extensive research mapping Java locales to Unicode CLDR data and BCP 47 / RFC 5646 standards. Java uses underscores (`en_GB`) while the standard uses hyphens (`en-GB`).
- @snyaggarwal added specific missing locales (`en_GB`, `ind`) to QA, Demo, and Staging environments.
- @bmamlin identified that the Indonesian locale needed both the standard `ind` code and the legacy `in` code (as "ISO 639-1 Non-preferred" name type) for OpenMRS Custom Validation compatibility.

#### What Is Pending

- **Systematic locale support** (#757): Rather than adding locales one by one, implement proper BCP 47 / CLDR-based locale handling. The current approach of manually adding locales to OCL's Locales source doesn't scale.
- **Related tickets**: @paynejd referenced #1312 and #1364 as connected work.

#### Open Design Questions

- Should OCL adopt BCP 47 (hyphenated) as the canonical format and map Java-style underscored locales on import? (#757)
- How should OCL handle the full Unicode CLDR locale set vs. a curated subset? (#757)

### 2.3 Lookup Field Standardization

**Issue:** #1697

#### What It Is and Why It Matters

This epic covers the broader effort to clean up and standardize "lookup" fields across OCL — fields like name types, map types, locales, concept classes, and datatypes that serve as controlled vocabularies within the platform. The goal is consistency across the API, TermBrowser, and imports.

#### What Is Pending

- @jamlung-ri noted (2024-01-04) that the *"high level journey and brainstorming for this is happening here"* — pointing to a [Miro board](https://miro.com/app/board/uXjVNeppQ4Y=/) with collaborative design work.
- This is an umbrella epic; specific sub-tasks (like #878 and #1666 for name types) break out the actionable items.

### 2.4 Auto Self-Mapping

**Issue:** #1925

#### What It Is and Why It Matters

When a user creates a concept in their source, some workflows expect every concept to have a mapping to itself (a "self-map"). This is the case for CIEL going forward and for Ellen's source. The proposal is to make this a configurable source-level setting, similar to "Auto-assign ID."

#### What Is Pending

- **Source-level setting for auto self-mapping** (#1925): Automatically create a self-mapping when a concept is created, if the source has this feature enabled.
- @paynejd raised the question: *"Or.... should it be a feature of the OpenMRS OCL module?"* — suggesting the behavior might belong in the client rather than the API.

#### Open Design Questions

- Should auto self-mapping be an API/source-level feature or an OpenMRS module feature? (#1925)
- What map type should the self-map use? (SAME-AS is implied but not explicitly decided)

---

## Section 3: FHIR & Interoperability

This section covers issues related to OCL's FHIR compliance, including canonical URLs, source properties, ConceptMap exports, and ValueSet downloads.

### 3.1 Canonical URL in ValueSet System Field

**Issue:** #1610

#### What It Is and Why It Matters

When OCL generates FHIR ValueSet resources, the `system` field uses OCL's internal relative URL (e.g. `/orgs/CIEL/ValueSet/CIEL/`) instead of the content's canonical URL (e.g. `https://cielterminology.org/`). This violates FHIR expectations and breaks interoperability with external systems.

#### What Is Pending

- Implement canonical URL resolution for the ValueSet `system` field (#1610). @jamlung-ri noted: *"In the long run, we probably want to use canonical URLs by default, but that's a decision we need to make."*
- This depends on the broader canonical URL registry work (#1696, covered in the TBv3/FHIR KBs).

### 3.2 Source Properties and Filters

**Issues:** #2159, #2175, #2176

#### What It Is and Why It Matters

Source properties and filters are a core FHIR capability that OCL is missing. In FHIR, a CodeSystem can define properties (e.g., `concept-class`, `datatype`) and filters (e.g., `is-a` for subsumption) that enable structured search and validation. This is required for a fully functional FHIR terminology service and provides value even without a HAPI FHIR Plain Server integration.

The work was scoped across multiple rounds:
- **Round 1** (MVP, #2159): Define property/filter schemas on sources; expose via native OCL API and FHIR CodeSystem
- **Round 3** (#2175): Enforce properties as schema for concept extras; admin controls for strictness
- **Round 4** (#2176): Profile generation, FHIR predefined Concept Properties support, storage of external property/filter definitions

#### What Was Built

Detailed technical design was developed in #2159 comments:
- @snyaggarwal proposed using new `source.properties` and `source.filters` ArrayFields with a defined JSON schema, noting *"ES provides better search support on a fixed schema."*
- @paynejd specified that actual concept property data (in round 2) would be stored in `concept.extras`, with source-level definitions serving as the schema.
- A tabular display format was proposed for properties and filters in both TBv2 and TBv3.

#### What Is Pending

- **MVP Round 1** (#2159): CRUD for property and filter definitions on sources; expose via CodeSystem endpoint; display in TermBrowser.
- **MVP Round 3** (#2175): Enforce properties as validation schema for concept extras. @paynejd noted (2026-03-24): *"deferred to future work."*
- **MVP Round 4** (#2176): Generate FHIR Profiles from source schemas; support predefined FHIR Concept Properties; store external property/filter definitions (e.g. `http://loinc.org/property/COMPONENT`).
- **`is_a` filter**: @paynejd told @snyaggarwal *"OCL does not currently have this capability, though `$cascade` is the basis for supporting it. Let's leave `is_a` for round 2."*

#### Open Design Questions

- How should `is_a` (subsumption) filters work with $cascade? (#2159)
- Should strictness of property enforcement be configurable per-source? (#2175)
- How to handle LOINC-style external property definitions that use URIs? (#2176)

### 3.3 ConceptMap Export from Mapper

**Issue:** #2093

#### What It Is and Why It Matters

Users of the OCL Mapper should be able to export the results of a mapping project as a FHIR ConceptMap, either saved to OCL or downloaded. This bridges the gap between OCL's mapping workflow and FHIR-native systems.

#### What Is Pending

- Implement ConceptMap export (on OCL and/or as download) from mapping project metadata (#2093). No development has started; acceptance criteria defined but no design discussion yet.

### 3.4 Mapping ValueSet Download

**Issue:** #2281

#### What It Is and Why It Matters

A user looking at a concept with many mappings (e.g. CIEL:116128 with dozens of SAME-AS mappings) wants to download those mappings as a FHIR ValueSet, optionally filtered by map type. This was suggested by @delcroip.

#### What Is Pending

- **New OCL API endpoint** (#2281): Expose a concept's mappings as a downloadable FHIR ValueSet with filtering by map type.
- @delcroip provided feedback on URL design: *"I'm unsure about including parameters in the canonical URL, as FHIR generally discourages them. I'd prefer a clean pattern like `/orgs/CIEL/sources/CIEL/concepts/116128/ValueSetMaps/SAME-AS`."*

#### Open Design Questions

- URL pattern: query parameters vs. path-based filtering for map type? (#2281)
- Should the result be a proper FHIR ValueSet with canonical URL, or a lighter-weight download format? (#2281)

---

## Section 4: Export & Download

This section covers issues related to OCL's export capabilities — CSV downloads, collection import/export, and new export formats.

### 4.1 CSV Export Improvements

**Issues:** #1911, #2266

#### What It Is and Why It Matters

OCL's CSV export has two fundamental problems: (1) it is truncated at 1,000 rows by design, making it useless for large sources like CIEL (55,066+ codes), and (2) the format doesn't include concept names or combine concepts with their mappings.

These were not just internal complaints — community user @chamiw2008 reported #1911 while trying to generate code sets for an OPD setup, noting they needed *"the display name (Name/FSN)... Then when sharing with FHIR the code and code system is needed."* They needed to filter SNOMED-GPS, CIEL, and ICPC-2 by concept class (e.g. diagnosis codes only).

#### What Was Built

- @paynejd acknowledged the 1k limit was intentional but limiting: *"CSV downloads are generated on-the-fly and the same method is used for downloading content from a repo as from a search result... so we needed to set some arbitrary limit."*
- For #2266, a Python notebook was developed ([Google Colab link in ticket](https://colab.research.google.com)) that transforms OCL's export JSON into a concept-anchored CSV (one row per concept, with mappings in the same row).
- @jamlung-ri proposed a comma-separated syntax for mappings that is *"backwards compatible with the format used in the concept prevalence study, extensible to more metadata, parseable with a single regular expression, and still human readable."*

#### Inline Mapping Syntax (proposed, #2266)

The concept-anchored CSV format uses a compact inline syntax to encode one or more mappings in a single CSV cell. Each mapping is a space-separated token string; multiple mappings are comma-separated.

**Generic form:**

```
[[map-type] ]<SOURCE>:<code>[ "<name>[ [locale]]"]
```

The `[map-type]` bracket token is optional. When omitted, the mapping is treated as a direct (SAME-AS) relationship. When present, it appears in square brackets before the source reference. An inverse map type can appear at the end instead, indicating the directionality is reversed.

**Examples:**

| Syntax | Meaning |
|---|---|
| `SNOMED-CT:1292929349` | SAME-AS mapping to SNOMED-CT code (no name) |
| `CIEL:1234 "Malaria"` | SAME-AS mapping to CIEL:1234 with display name |
| `CIEL:1234 "Malaria [en]"` | Same, with explicit locale |
| `[NARROWER-THAN] ICD-10:A01.1` | NARROWER-THAN mapping to ICD-10 code |
| `[NARROWER-THAN] ICD-10:A01.1 "Typhoid fever [en]"` | Same, with name and locale |

**Multiple mappings in one cell (comma-separated):**

```
[NARROWER-THAN] ICD-10:A01.1, [SAME-AS] ICD-11-WHO:NE02&XA99N3, [SAME-AS] IMO-ProblemIT:22793
```

**Source reference format:** The `<SOURCE>` token can be a short code (e.g., `CIEL`, `SNOMED-CT`), a relative OCL URL, or a canonical URL. A version can be included using parentheses: `CIEL(v2024-01-01):1234`.

#### What Is Pending

- **Remove 1k CSV limit** (#1911): Implement a proper CSV download that supports the full repository, not just the first 1,000 resources.
- **Concept-anchored CSV format** (#2266): Formalize the new format that combines concepts and mappings into a single row. The inline mapping syntax is documented above. Remaining open questions: how are special characters escaped? Are single quotes valid? Does mapping order matter?
- **Column/format agreement** (#1911): @paynejd asked @chamiw2008 to contribute requirements; the response emphasized needing code, display name, and code system — with class-based filtering.

#### Open Design Questions

- How to handle special characters (brackets, commas, quotes) in the mapping syntax? (#2266)
- Should the concept-anchored CSV be a new endpoint or replace the existing CSV download? (#1911, #2266)
- Performance: how to generate CSV for sources with 50k+ concepts without timeout? (#1911)

### 4.2 Collection Import/Export via Version Files

**Issue:** #2057

#### What It Is and Why It Matters

Sources can be transported between OCL servers using export JSON files, but collection versions cannot. The import fails with `"collection": "Version Head not found."` This blocks users who depend on server-to-server collection portability.

#### What Is Pending

- **MVP** (#2057): Create the collection (if needed) and import references from the collection version JSON. Collection version files include references but NOT expansions; MVP would do an auto-expand after import.
- @jamlung-ri bumped this (2025-02-26) noting *"we have a user who is depending on it."*
- **Future stage**: Respond to the concepts and mappings in the collection version JSON (beyond just references).

---

## Section 5: Cascade & References

This section covers issues related to OCL's cascade system — the mechanism for automatically pulling in related content when adding resources to collections.

### 5.1 Cascade Equivalence in Dynamic References

**Issue:** #2231

#### What It Is and Why It Matters

When adding a concept to a source with cascade, OCL checks for equivalence (SAME-AS mappings). If concept X is being cascaded and the target source already has a concept mapped SAME-AS to X, the cascade doesn't add X but instead adjusts mappings to point to the existing equivalent.

The problem: when dynamic references use the same cascade logic to add content to a collection, the custom validation rules run against the merged result without accounting for equivalence. This produces false validation errors — the validation sees apparent duplicates that the cascade would actually resolve via equivalence.

#### What Is Pending

- Extend equivalence-aware cascade logic to dynamic reference validation (#2231). The full technical specification is in the ticket body with detailed examples of the failure mode.

### 5.2 Cascade Filtering for Retired Concepts

**Issue:** #1396

#### What It Is and Why It Matters

When a user adds a concept to a collection with cascade (e.g. importing a CIEL concept with all its mapped concepts), mappings to retired concepts are auto-imported but the retired concepts themselves are not. This mismatch creates dangling references.

@jamlung-ri connected this to the broader $cascade work: *"This seems like another level of control that the user should have when using $cascade. Users should get to choose whether or not retired target concepts are cascaded and/or returned. Let's include this as part of the work in #1378."*

#### What Is Pending

- Add a cascade option to exclude mappings to retired target concepts (#1396). This should be either the default behavior or a configurable option in the cascade parameters.

---

## Section 6: Repository Management

This section covers issues related to managing OCL repositories — ownership, identifiers, deletion, and version history.

### 6.1 Ownership Transfer

**Issue:** #1143

#### What It Is and Why It Matters

There is no process for transferring ownership of a source or collection from one org/user to another. This is required in both the API and TermBrowser.

@snyaggarwal raised key implementation questions: *(1) Transfer means moving from one org/user to another? (2) How to handle uniqueness if the new owner already has a repo with the same mnemonic? (3) What other checks? (4) What about permissions?*

#### What Is Pending

- Implement ownership transfer API and TermBrowser UI (#1143). Design questions remain open.

### 6.2 Resource ID Renaming

**Issue:** #1194

#### What It Is and Why It Matters

There is no way to change an ID for an org, source, collection, or other OCL resource. Example: the IHTSDO org ID is outdated and should be SNOMED-International, but there's no rename mechanism. The current workaround (create new org, reload content) impacts all users of that content.

@jamlung-ri noted (2022-02-14): *"Need to discuss this on a Dev or Arch call."*

#### What Is Pending

- Design and implement a resource renaming mechanism that handles redirects, dependent references, and user communication (#1194).

### 6.3 Hard Delete for Standard Users

**Issue:** #1357

#### What It Is and Why It Matters

Hard delete of concepts/mappings was implemented for admins only (#564). The API supports `?hardDelete=true` for concepts and mappings, but it needs to be exposed to standard users with appropriate guardrails. Whether hard delete also works for concept/mapping versions is an open question.

#### What Is Pending

- Expose hard delete to non-admin users with appropriate safeguards (#1357). Determine if version-level hard delete is also needed.

### 6.4 Version History Editing

**Issue:** #1868

#### What It Is and Why It Matters

OCL's version model relies on `created_at` (a system-generated datetime) to determine version ordering. This means you cannot create or import a resource into an older repo version — everything is always appended as the newest version.

The proposed solution introduces:
- `previous_version_uri` — a linked list of versions
- `version_order` — an integer for quick sorting (0 for initial version, higher = newer)

#### What Is Pending

- Implement linked-list version model with `previous_version_uri` and `version_order` (#1868). Open question: does `previous_version_uri` affect standard checksums?

### 6.5 Deletion UX — Freezing Resources

**Issue:** #1891

#### What It Is and Why It Matters

When a user deletes a large repo or org, the operation runs asynchronously but there is no "Processing" flag, no content freeze, and no indication to the user that deletion is underway. Users can continue interacting with content that is being deleted.

Proposed approach:
- Implement a "Frozen" flag — frozen content can only be viewed
- Show clear deletion-in-progress indicators to users
- Consider an "Are you sure?" confirmation with impact summary

@jamlung-ri noted (2024-07-17): *"Currently, I imagine that it's not super common to do large deletes right now, so I could imagine this development waiting for the v3 CodeSystem Author persona work."*

#### What Is Pending

- Implement frozen flag and deletion UX (#1891). Low urgency but important for the v3 authoring experience.

---

## Section 7: Access Control & Permissions

This section covers issues related to how OCL controls access to content — export permissions, version visibility, and content curation.

### 7.1 Export Access Control

**Issue:** #790

#### What It Is and Why It Matters

OCL currently treats a repository as either public or private, applying the same access control to all operations. Standards development organizations need to separate **reference access** (searching, browsing, viewing details) from **distribution access** (downloading full exports). A source could be publicly browsable but require authorization to download.

#### What Is Pending

- Implement granular access control that separates reference access from distribution access (#790). Also need to determine how to limit mappings and references in the reference-only mode.

### 7.2 Version Visibility Control

**Issue:** #638

#### What It Is and Why It Matters

Source/collection version visibility is tied to `released` and `retired` flags, especially when resolving the `latest` keyword or version-less references. Administrators need independent control over version visibility and resolution behavior, separate from lifecycle flags. Additionally, OCL should support all FHIR `status` field values: `draft | active | retired | unknown`.

#### What Is Pending

- Decouple version visibility from released/retired flags (#638). Implement FHIR-aligned publication status values.

### 7.3 Walled Garden and Trusted Sources

**Issue:** #1706 (Epic)

#### What It Is and Why It Matters

The goal is to expose users primarily to content most relevant to them — prioritizing Reference Content (CIEL, LOINC) over the broad ocean of community-contributed content. This is about content curation and trust signaling, not just access control.

Design documentation exists in a [Google Doc](https://docs.google.com/document/d/1zrQOQBC868uRdrZA-mhzvNzsepVYFhHrMDuJU7mKRjY/) (linked in ticket). Related to the canonical URLs work.

#### What Is Pending

- Define and implement "trusted source" designation and walled garden behavior (#1706). Scope for v3 is unclear — may be partially implemented or deferred.

---

## Section 8: TermBrowser UX

This section covers issues related to the TermBrowser v3 user experience — mobile readiness, design updates, and concept provenance display.

### 8.1 Mobile Responsiveness

**Issues:** #1970, #1971

#### What It Is and Why It Matters

OCLv3 is not mobile-ready, but many users will access it first on their phones. This was flagged as an OHIE24 priority. The target screens for mobile optimization: anonymous dashboard, Searchlight, search results, and concept details.

@paulsonder noted that M3 components (navigation, drawers) have mobile references built in, but *"Some custom components do not have mobile designs yet as these were not prioritised in requirements."* He suggested putting together a reference for how Searchlight, results, details, and comparison should work on mobile.

@snyaggarwal flagged: *"search results with tables are not mobile friendly."*

#### What Was Built

- @paulsonder created mobile design mockups for the dashboard (#1971), with screenshots showing the iPhone 16 layout for the dashboard and repo views.

#### What Is Pending

- Implement mobile-responsive layouts for priority screens (#1970): dashboard, Searchlight, search results, concept details.
- Apply @paulsonder's design specifications (#1971) across the full set of mobile screens.
- Address table-based search results on mobile — needs a non-table layout or responsive table approach.

### 8.2 Concept Modification Indicators

**Issue:** #1763

#### What It Is and Why It Matters

When viewing a concept in a collection, users need to know whether it is "original" (matches the source concept) or "modified" (its details, mappings, etc. differ from the source). In TBv2, this was visible only when mappings differed, but the complexity grows with v3's richer data model.

@jamlung-ri documented the current API behavior in detail: when adding a modified concept to a collection, the API's "Add to Collection" interface references the original source concept, not the collection's modified version. This means the cascaded content may not match what the user sees in the collection.

#### What Is Pending

- Display modification indicators on concepts in collections (#1763). Handle the complexity of what "modified" means across names, descriptions, mappings, extras, and other attributes.
- Fix the "Add to Collection" reference behavior to use the collection-context version when applicable.

---

## Section 9: Data Integrity & Checksums

### 9.1 Independent Checksum Script

**Issue:** #1867 | **Related:** #1691

#### What It Is and Why It Matters

OCL generates standard and smart checksums for concepts and mappings, but the checksum logic was embedded in the API codebase. An independent script (in Python and JavaScript) was needed so that external parties — particularly @bmamlin for CIEL validation — could generate matching checksums outside of OCL.

This issue has the richest comment history in this bucket (41 comments), documenting a months-long collaborative debugging process between @bmamlin and @snyaggarwal to achieve checksum parity between CIEL's import pipeline and OCL's API.

#### What Was Built

Substantial progress was made through iterative collaboration:

- **Python script** (`checksum.py` in ocldev): @snyaggarwal created the initial script. @bmamlin tested against CIEL concepts and mappings, discovering multiple edge cases.
- **Key discoveries and fixes:**
  - `locale_preferred: false` on descriptions needed special handling — either clients add it or the script ignores it (#1867, 2024-07-19)
  - `name_type: ""` vs `name_type: null` on synonyms: @snyaggarwal updated the script to *"ignore name_type, description_type, and locale_preferred when they are empty/false"* (2024-07-22)
  - `from_concept_url` expansion: Mapping checksums required expanding `from_concept_url` to also include `from_source_url` and `from_concept_code` — because OCL accommodates mappings to concepts that don't exist in OCL (2024-08-05)
  - URL-encoded characters (`%09`, `%26`, `%2B`, `%2C`, `%40`): ~200 CIEL mappings had encoded characters in `to_concept_code`. @snyaggarwal added decoding logic before checksum generation (2024-11-04/05)
  - `sort_weight` duplication: The field appeared both as `extras.sort_weight` and as a direct field; @bmamlin cleaned up `extras.sort_weight` on Staging & Production (2024-11-01)
- **Milestone** (2024-11-05): @bmamlin reported *"All checksums for CIEL concepts & mappings now match (comparing the v2024-10-18 import to HEAD with the legacy extras removed)!"*
- **API optimization**: @snyaggarwal added `?brief=true&checksums=true&limit=20000` endpoint that returns up to 20k checksums in seconds, addressing the performance problem where fetching mapping checksums took ~2 hours via paginated API calls (2024-12-02).

#### What Is Pending

- **Publish as NPM package** (#1867 — @snyaggarwal task list): The JavaScript version needs to be converted to an NPM package and published.
- **Reuse in API** (#1867): Create the Python script in ocldev and reuse it in the API for checksum generation (replacing inline logic).
- **Mapping checksum export performance**: Even with the new `brief=true&checksums=true` endpoint (20k limit), sources with >200k mappings require multiple requests.

#### Open Design Questions

- Should `from_concept_url` always be expanded to `from_source_url` + `from_concept_code`, or only when the latter aren't provided? (#1867)
- How to handle future `extras` fields that duplicate direct fields (like `sort_weight`)? Policy needed. (#1867)

---

## Section 10: OCL Mapper

### 10.1 Keyboard Navigation

**Issue:** #2128

#### What It Is and Why It Matters

End-user testing revealed that keyboard navigation would greatly improve the OCL Mapper workflow. The proposed key bindings: Up/Down arrows for navigating terms, Right/Left for opening/closing the side panel, Enter to approve a match, Esc to reject.

@snyaggarwal confirmed: *"this makes sense."*

#### What Is Pending

- Implement arrow key navigation in the OCL Mapper UI (#2128). Low priority but validated by user testing.

### 10.2 $match API Performance

**Issue:** #2294

#### What It Is and Why It Matters

The `$match` API with reranker takes 15-20 seconds per request in production. The performance breakdown:
- ES Search: ~0.4s
- **Cross encoder: ~7.1s (50% of total time)**
- ES hits to Objects: ~4.0s
- Serialization: ~2.4s
- Sorting: <0.001s

#### What Is Pending

Options being considered (#2294):
1. Reduce candidate batch size from 30 to 10-15
2. Use GPUs (currently CPU only)
3. Switch to a lighter encoder model

---

## Section 11: Search & Discovery

### 11.1 Facet Casing Preservation

**Issue:** #1740

#### What It Is and Why It Matters

OCL changes casing during Elasticsearch indexing, which means facets in the filter panel don't display in their original casing. This also affects the Repo Summary and potentially other areas.

@snyaggarwal was to document which fields have casing changes during indexing.

#### What Is Pending

- Preserve original casing for facets in filter panel and repo summary (#1740). Requires Elasticsearch indexing changes.

---

## Appendix A: Issue Index

| # | Title | Theme | Priority | Era |
|---|-------|-------|----------|-----|
| 638 | Allow source/collection admins to control visibility of repo versions separate from tags | Access Control | medium | Foundation |
| 757 | Implement optional country code support for locales | Data Model | medium | Legacy |
| 790 | Implement access control for exports | Access Control | medium | Legacy |
| 878 | Name_type Standardization | Data Model | high | Legacy |
| 1143 | Ability to transfer ownership of a source or collection | Repo Mgmt | medium | Legacy |
| 1194 | Changing an ID for an org, source, collection, etc. | Repo Mgmt | medium | Foundation |
| 1357 | Expose hard DELETE of concept/mapping for standard users | Repo Mgmt | medium | Foundation |
| 1396 | User should have option not to auto-import Mappings to retired concepts | Cascade | medium | Foundation |
| 1610 | Use canonical URL where possible in the system field of a ValueSet | FHIR | high | Foundation |
| 1666 | Introduce Synonym name type and remove None name type | Data Model | high | Foundation |
| 1697 | Standardizing Lookup Fields | Data Model | medium | Foundation |
| 1706 | Walled Garden and Trusted Sources | Access Control | high | Foundation |
| 1740 | Maintain original casing for facets in filter panel | Search | low | Build |
| 1763 | Concept tracing information - Modification indicators | TB UX | medium | Build |
| 1867 | Independent checksum script for concepts and mappings | Checksums | high | Build |
| 1868 | Enable creating/importing/editing resource in an older repo version | Repo Mgmt | medium | Build |
| 1891 | Freeze large resources upon deletion request | Repo Mgmt | medium | Build |
| 1911 | OCL CSV exports truncated at 1000 | Export | high | Build |
| 1925 | Request: Automatically add self-map | Data Model | medium | Build |
| 1970 | Mobile-ready screens for V3 | TB UX | high | Build |
| 1971 | Mobile updates | TB UX | medium | Build |
| 2057 | Collection Importing via Version Export | Export | high | Recent |
| 2093 | Export Metadata as a ConceptMap | FHIR | low | Recent |
| 2128 | Navigate terms using arrow keys | Mapper | low | Recent |
| 2159 | Source properties and filters | FHIR | high | Recent |
| 2175 | Enforce source properties as schema | FHIR | medium | Recent |
| 2176 | Source properties and filters (part 4) | FHIR | medium | Recent |
| 2231 | Dynamic reference cascade should account for equivalence | Cascade | high | Recent |
| 2266 | Simplified CSV output that combines concepts and mappings | Export | high | Recent |
| 2281 | Proposal to support download of concept mappings as ValueSet | FHIR | medium | Recent |
| 2294 | $match API performance optimization | Mapper | high | Recent |

## Appendix B: Contributor Map

| Contributor | Issues | Primary Areas |
|---|---|---|
| **@paynejd** | #757, #878, #1194, #1357, #1868, #1911, #1925, #2159, #2266 | Product strategy, architecture, API design |
| **@snyaggarwal** | #757, #878, #1143, #1740, #1867, #1868, #1970, #2057, #2128, #2159, #2294 | API implementation, Elasticsearch, performance |
| **@jamlung-ri** | #790, #1194, #1396, #1610, #1666, #1697, #1763, #1891, #2057 | Requirements, QA, TermBrowser impact, stakeholder communication |
| **@bmamlin** | #757, #878, #1666, #1867 | Clinical domain (CIEL), standards compliance, checksum validation |
| **@paulsonder** | #1763, #1971 | UX/UI design, mobile layouts |
| **@michaelbontyes** | #2128 | OCL Mapper user testing and feedback |
| **@delcroip** | #2281 | FHIR integration, clinical workflow requirements |
| **@chamiw2008** | #1911 | Community user, CSV export requirements |
| **@lnball** | #878 | Community user, name type inconsistency reporting |
| **@rkorytkowski** | #1610 | Legacy FHIR infrastructure |
