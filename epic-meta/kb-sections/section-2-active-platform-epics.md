# Section 2: Active Platform Epics

This section covers the epics that represent ongoing, high-value platform work across FHIR integration, core API capabilities, data model improvements, content curation, and mapping workflows. These are the epics recommended to keep open or that were recently closed as part of structured backlog cleanup but still represent important future work.

---

## 2.1 FHIR Integration

### What It Is and Why It Matters

OCL's FHIR integration is the largest and most strategically important epic cluster. It encompasses making OCL a compliant FHIR Terminology Service, loading baseline HL7 content, supporting IG publishing, and ensuring content traceability and validation. Most of this work was scoped in 2024-2025 and organized under the umbrella epic #2253 (OCL FHIR Core 2025). All FHIR epics were closed in March 2026 as part of a systematic backlog cleanup, with context captured in the FHIR Service Knowledge Base wiki. These closures were administrative -- the work remains relevant and should be re-scoped in fresh tickets as needed.

### Active Epics (keep)

- **NPM Import of Baseline FHIR Content (#1166 -- CLOSED).** The foundational FHIR epic, originally scoped in Dec 2021. Tracked rewriting OCL's FHIR service to implement CodeSystem, ValueSet, and ConceptMap CRUD and operations directly in the API. Had 29 sub-issues, all closed. Included work on NPM package imports, FHIR Capability Statement, graphQL pagination for concepts, and deploying the new FHIR service to staging/production. Significant comment history documents testing of CodeSystem filtering, CRUD error handling, and canonical URL resolution. Assigned to @rkorytkowski and @snyaggarwal. Contains 22 commits in oclapi2 (latest April 2022). Tagged V3/v3-foundation.

- **FHIR Baseline Content (#1910 -- CLOSED).** Defined the goal of making baseline FHIR NPM packages (hl7.fhir.r4.core, hl7.terminology.r4, hl7.fhir.uv.ips, hl7.fhir.us.ccda, hl7.fhir.us.core) available in OCL Online. The body contains a detailed MVP and next-steps checklist covering: loading baseline content into test environments, implementing validation reports comparing source to loaded content, documenting gaps in FHIR capabilities, modeling namespace ownership for HL7 content, and implementing FHIR Validator integration. Assigned to @rkorytkowski.

- **Publishing Terminology to the FHIR Ecosystem (#1915 -- CLOSED).** Tracks requirements beyond the FHIR Terminology Services spec that make terminology available for FHIR validation and IG publishing. References the HL7 Confluence page on publishing terminology. Assigned to @rkorytkowski. Task breakdown was deferred to Rafal.

- **Implement FHIR Serialization Library (#2047 -- CLOSED).** A focused epic for building a dedicated FHIR serialization layer. Assigned to @rkorytkowski. No body or sub-issues -- the scope was defined externally.

- **FHIR Content Traceability (#2048 -- CLOSED).** Tracks the ability to trace FHIR content through OCL's import, transformation, and publication pipeline. Assigned to @rkorytkowski. No body or sub-issues.

- **CRMI Compliance (#2049 -- CLOSED).** Compliance with the Canonical Resource Management Infrastructure (CRMI) IG, which defines patterns for managing canonical FHIR resources. No assignees or body.

- **Automated FHIR Resource Validation (#2053 -- CLOSED).** Automated validation of FHIR resources against the FHIR Validator. Closing comment noted this "remains important for the future." No body or sub-issues.

### Issues Needing Review

- **OCL FHIR Core 2025 (#2253 -- CLOSED, review).** The top-level umbrella epic for all 2025 FHIR work, auto-created during Zenhub migration. Had 13 direct sub-issues (including #1166 as a nested epic with 29 of its own sub-issues). Closed during March 2026 cleanup. Needs human decision on whether to re-create a successor umbrella for ongoing FHIR work or manage FHIR epics independently.

- **FHIR/SVCM Support in OCL (#869 -- CLOSED, review).** The original high-level FHIR epic from Aug 2021, labeled as a "Project-level Epic." Empty body, no sub-issues. Was superseded by more specific epics (#1166, #1910, #2253) but may still be useful as a long-term tracking container. Needs decision on whether the concept of a persistent FHIR umbrella is useful.

### Closeable Issues

None -- all FHIR integration epics are classified as keep or review.

---

## 2.2 Core API Features

### What It Is and Why It Matters

These epics cover fundamental API capabilities that cut across the platform: event frameworks, terminology packaging, batch operations, and API parameter handling. They represent the building blocks that other features (FHIR, mapping, content management) depend on.

### Active Epics (keep)

- **Events and Feeds Framework (#1885 -- OPEN).** Establishes an events framework for OCL that records events displayed in feeds for users, organizations, and dashboards. Primarily an API effort exposed in the UI via other tickets (#1780, #1861, #1862). Initial design documented in a Google Sheet. Assigned to @snyaggarwal. Created July 2024.

- **Terminology Packaging Service (#2045 -- CLOSED).** A forward-looking concept for packaging terminology for distribution. Closing comment explicitly noted "this idea remains important for the future." Assigned to @paynejd and @jamlung-ri. Created Jan 2025, closed March 2026 during FHIR cleanup.

- **Batch Validation (#2050 -- CLOSED).** API-level batch validation of terminology content. Created Jan 2025, closed March 2026. No body or sub-issues -- scope was defined in the OCL FHIR Core 2025 project context. Had one dummy sub-issue.

- **Batch Translation (#2052 -- CLOSED).** API-level batch translation capabilities. Created Jan 2025, closed March 2026. Had one dummy sub-issue (#2054).

### Issues Needing Review

- **Hierarchy Support in API (#881 -- OPEN, review).** Tracks API support for concept hierarchies (parent/child relationships, tree traversal). Empty body, no sub-issues, no activity since Aug 2021. The underlying need is real (hierarchies are critical for SNOMED, ICD, etc.), but the epic needs scoping and likely fresh tickets.

### Closeable Issues

- **Core OCL/API (#866 -- OPEN, close-stale).** A "Project-level Epic" from Aug 2021 with an empty body and no sub-issues. Served as a ZenHub grouping container. No activity since Aug 2021. Can be closed as an organizational artifact.

- **API Parameters, Properties, and Filters (#873 -- OPEN, close-stale).** Empty body, no sub-issues, no activity since Aug 2021. Too vague to be actionable. Specific parameter/filter needs should be filed as individual tickets.

---

## 2.3 Data Model & Versioning

### What It Is and Why It Matters

OCL's data model (how concepts, sources, collections, and their metadata are structured) and versioning behavior are foundational. These epics address data quality issues -- locale standardization, lookup field cleanup, and repo configuration -- that affect every user and every integration.

### Active Epics (keep)

- **Fix OCL Locales - Round 2 (#1433 -- OPEN).** Follows up on #1360 to get secondary language codes into OCL. This is a V3 foundation item. Locale handling affects concept names, descriptions, and FHIR serialization. Tagged V3/v3-foundation. Created Nov 2022, last updated March 2024.

- **Standardizing Lookup Fields (#1697 -- OPEN).** Approaches for cleaning up inconsistent data in OCL's lookup fields. A Miro board captures the high-level brainstorming (linked in comments by @jamlung-ri). Tagged V3/v3-foundation. Created Nov 2023.

- **Repo Configuration and Content Validation (#1726 -- CLOSED).** Configuring lookup values for a repo, including FHIR properties and filters. A sub-issue of #2253 (OCL FHIR Core 2025). Closed March 2026 during FHIR cleanup. The intersection of repo configuration and FHIR compliance makes this relevant to both the data model and FHIR integration streams.

### Issues Needing Review

None in this subcategory.

### Closeable Issues

- **Lookup Tables (#901 -- OPEN, close-stale).** "Includes configurable lookup values." No sub-issues, no activity since Aug 2021. Superseded by the more specific #1697 (Standardizing Lookup Fields) and #1726 (Repo Configuration and Content Validation).

---

## 2.4 Content Curation

### What It Is and Why It Matters

OCL hosts and distributes major reference terminologies (SNOMED, LOINC, RxNorm, ICD-10-CM). Each requires periodic imports, version updates, and quality checks. These epics track the ongoing maintenance lifecycle for each terminology source. All four keep-rated epics are assigned to @jamlung-ri, reflecting his role as the content steward.

### Active Epics (keep)

- **SNOMED Import and Maintenance (#879 -- OPEN).** Tracks ongoing SNOMED CT import and maintenance processes. Empty body, no sub-issues. Assigned to @jamlung-ri. Created Aug 2021. SNOMED is one of OCL's most important content sources, used heavily in FHIR and clinical settings.

- **LOINC Import and Maintenance (#880 -- OPEN).** Tracks LOINC import and maintenance. Empty body, no sub-issues. Assigned to @jamlung-ri. Created Aug 2021. LOINC is essential for lab and clinical observations.

- **RxNorm Import and Maintenance (#883 -- OPEN).** Tracks RxNorm import and maintenance. Empty body, no sub-issues. Assigned to @jamlung-ri. Created Aug 2021. RxNorm is the standard for medications in the US.

- **ICD-10-CM Import and Maintenance (#884 -- OPEN).** Tracks ICD-10-CM import and maintenance. Empty body, no sub-issues. Assigned to @jamlung-ri. Created Aug 2021. ICD-10-CM is the standard for diagnosis coding.

### Issues Needing Review

None in this subcategory.

### Closeable Issues

- **Content Cleaning and Validation (#903 -- OPEN, close-stale).** Empty body, no sub-issues, no activity since Aug 2021. The concept overlaps with #928 (Automated Content Validation Tooling) and the FHIR validation work.

- **Content Management Features (#1158 -- OPEN, close-stale).** Empty body, no sub-issues, no activity since Dec 2021. Too vague to be actionable.

---

## 2.5 Mapping Workflows

### What It Is and Why It Matters

The OCL Mapping Tool (OCL Mapper) is a newer product line focused on AI-assisted terminology mapping. It launched its MVP in early 2025, targeting the OpenMRS Concept Prevalence study. The mapping epics are the most actively developed in the entire backlog, with substantial sub-issue trees and recent activity. Both are tied to the "OCL Mapper MVP" milestone.

### Active Epics (keep)

- **OCL Mapping Tool MVP (#2034 -- OPEN).** The top-level epic for the mapping tool. Goal is to support the OpenMRS Concept Prevalence study and projects normalizing concept dictionaries across OpenMRS implementations. Created Dec 2024. No sub-issues directly, but serves as the umbrella for the mapper milestone.

- **Save and Export Mapping Progress (#2089 -- OPEN).** Features for saving and exporting mapping projects. Has 9 sub-issues (7 closed, 2 open). Closed sub-issues cover: saving mapping projects, exporting metadata, exporting as collections, listing mapping projects, adding collaborators, spreadsheet format review, and the new mapping project UI. Open sub-issues: exporting as a FHIR ConceptMap (#2093) and enabling auto-save (#2188). Milestone: OCL Mapper MVP.

### Issues Needing Review

None in this subcategory.

### Closeable Issues

None -- both mapping workflow epics are active and well-structured.

---

*Note: The "Review Mapping Candidates" epic (#2096) is classified under "Team Collaboration" and covered in a different section, though it is closely related to the mapping workflow epics above. It has 22 sub-issues (15 closed, 7 open) and is assigned to @michaelbontyes.*
