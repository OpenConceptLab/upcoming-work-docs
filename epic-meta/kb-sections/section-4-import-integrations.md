# Section 4: Import/Export & External Integrations

This section covers epics related to bulk data import/export, external system integrations (PEPFAR, PIH), OpenMRS interoperability, and terminology source management. Most are stale 2021-era placeholders with empty bodies, but a few -- particularly around import performance and content exports -- remain relevant to active work.

## 4.1 Bulk Import/Export

### What It Is
Epics tracking gaps, performance, and feature enhancements in OCL's bulk import and export pipelines. This was a significant area of work in 2021 when the CSV and JSON import systems were being hardened. Six epics exist: three warrant review, one is clearly stale, and two should be kept.

### Issues

- **CSV Bulk Import Gaps (#855 -- review).** Created Jul 2021, last updated Jul 2021. Has a detailed body listing specific feature gaps in CSV imports compared to JSON imports: nested extra attributes, hierarchy attributes, collection references, FHIR attributes (canonical_url, identifier, publisher, etc.), and other OCL attributes (meta, text, hierarchy_meaning). References external Google Docs for bulk import documentation and a CSV example file. The checklist items are all unchecked. Some of these gaps may have been addressed incrementally without updating this issue. Recommend reviewing against current CSV import capabilities -- if most gaps are resolved, close with a summary; if gaps remain, consolidate into a fresh ticket scoped to current needs.

- **JSON Bulk Import Gaps (#856 -- review).** Created Jul 2021, never updated after creation. Companion to #855. Lists three JSON import gaps: mappings within a concept resource line, hierarchy root for a source (hierarchy_root_url), and miscellaneous OCL attributes (text, logo_url). References the same Google Docs bulk import documentation as #855. Same recommendation: review against current capabilities and either close as resolved or consolidate remaining gaps into a fresh ticket.

- **Bulk Import API (#867 -- close-stale).** Empty body, no comments. Created Aug 2021, never updated. Title alone provides no actionable scope. Any bulk import API work has been tracked in more specific issues (#855, #856, #904, #1847). Close as stale placeholder.

- **Content Exports (#887 -- keep).** Empty body but labeled "api2" and last updated Jun 2024, indicating some continued relevance. Created Aug 2021. Export functionality is an ongoing need -- particularly as FHIR publishing workflows and terminology packaging (#2045) mature. The export pipeline remains an area where improvements are periodically needed. Keep open as a tracking epic, though it would benefit from a body describing current scope and outstanding work.

- **Diff Imports, as opposed to full imports (#904 -- review).** Empty body, no comments. Created Aug 2021, never updated. The concept of differential/incremental imports (importing only changes rather than full datasets) is architecturally significant for large terminology sources. This would reduce import times and server load. However, the empty body and five years of inactivity suggest this was an idea capture rather than a planned initiative. Recommend reviewing whether diff import capability is still desired -- if so, create a fresh ticket with requirements; if not, close as stale.

- **Import Performance (#1847 -- keep).** Empty body but created Jun 2024, assigned to rkorytkowski and snyaggarwal, and labeled with "api2", "bulk-import", and "performance". This is the most recent and best-scoped import epic. Import performance remains a critical operational concern for large terminology loads (SNOMED, LOINC, CIEL). The assignment to core API developers signals active intent. Keep open.

## 4.2 External Integrations

### What It Is
Epics tracking OCL's integration with external programs and partner organizations, primarily PEPFAR and PIH. All three are stale 2021-era placeholders with empty bodies that served as category headers rather than actionable work items.

### Issues

- **PEPFAR-related Projects (#868 -- close-stale).** Empty body, no comments. Created Aug 2021, last updated Aug 2021. Labeled "Project-level Epic" -- intended as a top-level grouping for all PEPFAR work. PEPFAR-specific OCL work (DATIM, MER indicators, MSP) has evolved substantially since 2021 and is tracked through other mechanisms. This empty umbrella provides no value. Close as stale.

- **PEPFAR DASH (#885 -- close-stale).** Empty body, no comments. Created Aug 2021, never updated. PEPFAR DASH (Data Alignment for Sustainable HIV) was a specific PEPFAR initiative. No requirements, linked issues, or evidence of any work tracked under this epic. If DASH-related OCL work resurfaces, it should be scoped in a fresh ticket with current context. Close as stale.

- **PIH Dictionary (#893 -- close-stale).** Empty body, no comments. Created Aug 2021, last updated May 2022. Labeled "openmrs". Partners in Health (PIH) maintains their own OpenMRS dictionary, and this epic presumably tracked OCL support for that use case. No requirements or linked work were ever captured. PIH dictionary support, if still relevant, would fall under broader OpenMRS integration or content curation efforts. Close as stale.

## 4.3 OpenMRS Integration

### What It Is
Epics covering OCL's role as a terminology backend for OpenMRS implementations. OCL historically served as the dictionary management tool for OpenMRS, but this relationship has evolved as OCL has broadened its scope and OpenMRS tooling has changed.

### Issues

- **OpenMRS Dictionary Manager Support (#892 -- review).** Empty body, no comments. Created Aug 2021, last updated May 2022. Labeled "openmrs" and "Project-level Epic." The OCL Dictionary Manager was a key integration point where OpenMRS implementers could browse, customize, and download concept dictionaries. The tool's status and OCL's ongoing role in supporting it is unclear. Recommend reviewing whether OCL still actively supports the OpenMRS Dictionary Manager workflow -- if so, this needs a fresh scoping with current requirements; if not, close with a note explaining the current state of the relationship.

- **OpenMRS Burning Needs V2 (#1692 -- close-outdated).** Created Nov 2023, closed Mar 2026. Body: "Anything that OpenMRS users (including partners like PIH) require immediately to make use of OCL while V3 is under development." Labeled "web2" and "api2." Already closed by paynejd with the comment: "Closing as part of OCL issues cleanup -- web2 is deprecated in favor of TBv3/web3. If still relevant, reopen with updated context." The framing as a V2-era stopgap makes this obsolete now that V3/TBv3 development is underway. No action needed -- already resolved.

## 4.4 Source Management

### What It Is
Epics related to preparing, loading, and maintaining specific terminology sources within OCL. These are content-operations epics rather than platform features -- they track the work of getting specific vocabularies imported and kept current.

### Issues

- **Content Preparation, Import, and Publication (#458 -- close-stale).** Body: "Multiple sources, types, etc. of content are required to be loaded into OCL as proof of concept and to be published for use. Any epics or tickets related to importing content should be placed under this epic." Created Nov 2020, last updated Aug 2021. Labeled "Project-level Epic." This was a broad umbrella for all content loading work during the OCL platform buildout phase. Content loading is now an ongoing operational activity tracked through source-specific epics (SNOMED #879, LOINC #880, RxNorm #883, ICD-10-CM #884) rather than a single catch-all. Close as stale -- the umbrella structure is no longer useful.

- **WHO-ATC Content Publication and Maintenance (#1190 -- close-stale).** Body contains a link to the WHO ATC/DDD toolkit and the note: "this has been de-prioritized for the time being." Created Jan 2022, last updated Apr 2022. WHO-ATC (Anatomical Therapeutic Chemical classification) is a drug classification system. The explicit de-prioritization note and four years of inactivity confirm this is not active work. If ATC loading becomes a priority again, a fresh ticket with current requirements and FHIR considerations would be appropriate. Close as stale.

- **SNOMED GPS (#1138 -- review).** Empty body, no comments. Created Dec 2021, last updated Dec 2023. Assigned to jamlung-ri. SNOMED GPS (Global Patient Set) is a curated subset of SNOMED CT designed for use in low-resource settings -- directly relevant to OCL's health informatics mission. The Dec 2023 update suggests some continued attention. The broader SNOMED import epic (#879) is being kept, and GPS could be tracked as a sub-effort there. Recommend reviewing whether SNOMED GPS import/maintenance is active or planned -- if so, either keep as a standalone epic with a proper body or fold into #879; if not currently planned, close with a note to revisit when GPS becomes a priority.
