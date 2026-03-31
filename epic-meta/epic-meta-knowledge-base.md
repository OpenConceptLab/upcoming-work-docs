# Epic/Meta Knowledge Base

**Generated:** 2026-03-26
**Scope:** 64 issues from OpenConceptLab/ocl_issues backlog (Epic label filter)
**Source:** [OpenConceptLab/ocl_issues](https://github.com/OpenConceptLab/ocl_issues)
**Companion data:** `epic-meta-raw-archive.json` (full issue bodies + comments), `epic-meta-issue-classification.csv` (64-row analysis)

---

## Table of Contents

1. [Executive Summary](#section-1-executive-summary)
2. [Active Platform Epics](#section-2-active-platform-epics)
3. [Infrastructure & Operations](#section-3-infrastructure--operations)
4. [Import/Export & Integrations](#section-4-importexport--integrations)
5. [Community & Miscellaneous](#section-5-community--miscellaneous)
- [Appendix A: Issue Index](#appendix-a-issue-index)
- [Appendix B: Contributor Map](#appendix-b-contributor-map)

---

# Section 1: Executive Summary

## 1.1 What Are Epic/Meta Issues

OCL's issue tracker (OpenConceptLab/ocl_issues) uses "Epic" labeled issues as umbrella tracking containers that group related work across the platform. These epics span API development, FHIR compliance, content curation, infrastructure, and community initiatives. They were never formal GitHub project epics with automated roll-up; instead, they are conventional issues tagged with the "Epic" label and sometimes "Project-level Epic," with sub-issues linked via GitHub's task list syntax or cross-references.

The majority of these epics are "zombie" issues -- organizational containers created during a 2021 sprint to impose structure on the backlog, then never maintained. Many have empty bodies, no assignees, no comments, and no linked code activity. They remain open in the tracker despite the work they were meant to organize having been completed, abandoned, or reorganized under newer initiatives. This analysis covers all 64 epic/meta issues to determine which still carry value and which should be closed.

## 1.2 Key Stakeholders and Contributors

Of the 64 epic/meta issues, only 15 have assignees. The remaining 49 are unassigned.

| Contributor | Primary Focus | Notable Involvement |
|---|---|---|
| jamlung-ri | Content curation, source management, CI/CD | 8 issues -- SNOMED, LOINC, RxNorm, ICD-10-CM maintenance; SNOMED GPS; FHIR testing pipeline; Terminology Packaging Service |
| rkorytkowski | FHIR integration, API development | 7 issues -- FHIR serialization, baseline content, content traceability, NPM imports, testing pipeline; Import Performance |
| snyaggarwal | Core API, FHIR, bulk import | 3 issues -- Events and Feeds Framework; NPM Import of Baseline FHIR Content; Import Performance |
| paulsonder | Design | 1 issue -- Design system (#1381) |
| michaelbontyes | Mapping tool | 1 issue -- Review Mapping Candidates (#2096) |
| paynejd | API, terminology packaging | 1 issue -- Terminology Packaging Service (#2045) |

## 1.3 Timeline and Milestones

The 64 epic/meta issues span five years of OCL development across four distinct eras:

**2020-2022 Era (40 issues).** The bulk of legacy epics. In August 2021, a concentrated effort created approximately 30 epics in a single week (Aug 2-10), establishing category headers for API, infrastructure, content, and community work. Most were placeholder issues with minimal body content. This era also includes the foundational FHIR epic (#1166, Dec 2021) and the Design System epic (#1381, Oct 2022). Earlier issues from Sep-Nov 2020 cover administrative, community site, and content preparation topics from OCL's v2-to-v3 transition.

**V3 Era -- 2023 (3 issues).** A quiet period for epic creation. The three issues cover OpenMRS burning needs (#1692, later closed as outdated), standardizing lookup fields (#1697), and OWASP Top-10 security (#1698). All were scoped under V3/v3-foundation labels.

**TBv3 Era -- 2024 (9 issues).** Epics became more focused and actionable. This era includes Import Performance (#1847), Events and Feeds Framework (#1885), FHIR baseline content (#1910), FHIR publishing support (#1915), and the OCL Mapping Tool MVP (#2034). Several of these have assignees and structured task breakdowns.

**Active -- 2025+ (12 issues).** The most recent wave, dominated by two clusters: FHIR workstream epics created Jan 30, 2025 (#2045-2053, seven issues covering packaging, serialization, validation, traceability, CRMI compliance, batch operations) and OCL Mapper MVP sub-epics created Feb 2025 (#2082, #2089, #2096). The FHIR cluster was systematically closed in March 2026 with context preserved in the FHIR Service Knowledge Base. The mapper epics remain active.

## 1.4 Current State Overview

**Disposition breakdown:**

| Disposition | Count | Percentage | Description |
|---|---|---|---|
| keep | 29 | 45% | Active or relevant epics worth preserving |
| close-stale | 21 | 33% | Dormant zombie epics with no recent activity |
| review | 12 | 19% | Need human decision on whether to keep or close |
| close-outdated | 1 | 2% | Overtaken by events (OpenMRS Burning Needs V2) |
| close-superseded | 1 | 2% | Replaced by newer approach (Queue Management Service) |

**Sub-issue analysis:** 11 of the 64 epics have formal sub-issues, totaling 137 sub-issues (23 open, 114 closed). The largest trees are #2096 Review Mapping Candidates (22 sub-issues), #1166 NPM Import of Baseline FHIR Content (29 sub-issues), #344 OCL Administrative (37 sub-issues), and #349 OCL Community Site (15 sub-issues). The remaining 53 epics are standalone tracking issues with no linked sub-issues.

**Cross-analysis overlap:** 11 issues overlap with the FHIR analysis (all in the FHIR Integration subcategory), 2 issues overlap with the Design analysis (#1381 Design System, #1792 Analytics), and 0 issues overlap with TBv3-specific analysis. This confirms that the epic/meta analysis is largely complementary to the domain-specific analyses, with FHIR being the primary intersection point.

## 1.5 Bucket Structure

The 64 epic/meta issues are organized into 21 subcategories, grouped across the four KB sections that follow this summary:

**Section 2: Active Platform Epics (28 issues)**
Core development work that drives OCL's product roadmap.

| Subcategory | Count |
|---|---|
| FHIR Integration | 9 |
| Core API Features | 7 |
| Content Curation | 6 |
| Data Model & Versioning | 4 |
| Mapping Workflows | 2 |

**Section 3: Infrastructure & Operations (16 issues)**
Build pipelines, import/export, performance, and deployment.

| Subcategory | Count |
|---|---|
| Bulk Import/Export | 6 |
| CI/CD & Tooling | 4 |
| Infrastructure & Operations | 3 |
| Search & Performance | 2 |
| Deployment & Environments | 1 |

**Section 4: Content & Source Management (10 issues)**
Terminology source pipelines, external integrations, and data quality.

| Subcategory | Count |
|---|---|
| Source Management | 3 |
| External Integrations | 3 |
| OpenMRS Integration | 2 |
| Data Issues | 2 |

**Section 5: Community, Documentation & Miscellaneous (10 issues)**
Community outreach, developer experience, design, and cross-cutting concerns.

| Subcategory | Count |
|---|---|
| Community Site & Outreach | 2 |
| CLI & Tooling | 2 |
| Authentication & Authorization | 2 |
| Design System | 1 |
| Analytics & Tracking | 1 |
| Documentation | 1 |
| Team Collaboration | 1 |

---

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

---

# Section 3: Infrastructure & Operations

This section covers infrastructure, CI/CD, deployment, and performance-related epics. Most are stale placeholders from the 2021 epic-creation sprint that never accumulated actionable detail.

## 3.1 CI/CD & Tooling

### What It Is
Epics related to build pipelines, testing infrastructure, administrative tooling, and operational processes. Three of the four are empty-body placeholders from 2020-2021 that were never developed. The fourth is an active 2025 epic that has already been closed with context preserved.

### Issues

- **OCL Administrative (#344 -- close-stale).** Empty body, no comments. Created Sep 2020, last updated Aug 2021. Labeled "Project-level Epic" but never populated with sub-issues or requirements. No indication of what "administrative" scope was intended to cover. Close as abandoned placeholder.

- **Infrastructure (#858 -- close-stale).** Body is a single sentence: "Ticket to capture infrastructure enhancements." Created Jul 2021, last updated Aug 2021. Labeled "Project-level Epic" but served only as a category header with no actionable content. Close as stale.

- **Performance Testing on Production (#952 -- close-stale).** Empty body, no comments. Created Aug 2021, never updated. No test plans, tooling decisions, or linked work. If production perf testing becomes a priority, a fresh ticket with specific scope would be needed. Close as stale.

- **Automated FHIR Testing Pipeline (#2046 -- keep).** Created Jan 2025, assigned to rkorytkowski and jamlung-ri. Already closed Mar 2026 as part of the FHIR backlog cleanup. Closing comment notes the idea "remains important for the future" and context is preserved in the FHIR Service Knowledge Base. No action needed -- already resolved.

## 3.2 Infrastructure & Operations

### What It Is
Epics covering API maintenance, operational reporting, and queue/task management. All three are closeable -- two are stale from 2020-2021 and one is functionally complete.

### Issues

- **oclapi2 Maintenance (#311 -- close-stale).** Body: "Miscellaneous bug fixes that do not fall into other Epics." Created Sep 2020, last updated Aug 2021. This was a catch-all bucket rather than a scoped epic. Any ongoing maintenance work should be tracked as individual tickets, not under a vague umbrella. Close as stale.

- **API-level Reporting (#905 -- close-stale).** Empty body, no comments. Created Aug 2021, never updated. No requirements, no linked issues. If API reporting/observability becomes a priority, it should be scoped fresh. Close as stale.

- **Queue Management Service (#1773 -- close-superseded).** Body lists four goals (remove Flower dependency, longer task persistence, reliable in-progress events, clear user task tagging) -- all four are checked off as complete. Created Feb 2024, last updated Mar 2024. Tagged V3/v3-foundation. The work described here has been done; the issue was never formally closed. Close as superseded by completed implementation.

## 3.3 Deployment & Environments

### What It Is
A single epic covering the OCL demo environment, with concrete requirements that remain relevant.

### Issues

- **Demo environment (#1846 -- keep).** Created Jun 2024. Has a substantive body outlining three requirement areas: (1) account management -- SSO vs standalone auth for demo, onboarding considerations; (2) starter content -- CIEL, ICD10, LOINC, SNOMED GPS preloaded, locked admin features; (3) auto-reset -- weekly reset schedule with user-facing countdown messaging. This is a well-scoped operational need that has not been addressed. Keep open.

## 3.4 Search & Performance

### What It Is
Epics related to API search behavior and performance optimization. Both are from Aug 2021 with empty bodies.

### Issues

- **API Performance Improvement (#876 -- review).** Empty body, no comments. Created Aug 2021, never updated. Performance work has since been scoped more concretely in other tickets (e.g., Import Performance #1847). This could serve as a broad umbrella if desired, but has no actionable content of its own. Recommend closing as stale unless there is intent to use it as a tracking epic for non-import performance work.

- **API Search Results (#886 -- close-stale).** Empty body, no comments. Created Aug 2021, never updated. Search functionality has evolved significantly since 2021 without reference to this epic. Close as stale.

---

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

---

# Section 5: Community, Documentation, and Miscellaneous Epics

## Overview

This section covers epics that fall outside the core API, FHIR, CIEL, infrastructure, and mapping themes. It includes community site/outreach, documentation, design system, analytics, team collaboration, authentication, CLI/tooling, and legacy data issues.

**12 issues total** | 2 keep | 4 review | 2 close-stale (community) | 2 close-stale (data) | 2 keep (active)

---

## 5.1 Community Site & Outreach

**Disposition: close-stale (both)**

| # | Title | State | Created | Updated | Disposition |
|---|-------|-------|---------|---------|-------------|
| 349 | OCL Community Site | OPEN | 2020-09 | 2021-07 | close-stale |
| 390 | OCL User Support - Design and Launch | OPEN | 2020-09 | 2020-09 | close-stale |

**Context:** #349 tracked ongoing updates to the OCL community website after initial launch. #390 covered designing a user support approach. Both are from 2020, have no body detail beyond one-liners, no assignees, no code activity, and no updates since 2021 at the latest.

**Recommendation:** Close both as stale. If community site or user support work is needed, create fresh tickets with current requirements.

---

## 5.2 Documentation

**Disposition: keep**

| # | Title | State | Created | Updated | Milestone | Disposition |
|---|-------|-------|---------|---------|-----------|-------------|
| 2082 | Documentation | OPEN | 2025-02 | 2025-02 | OCL Mapper MVP | keep |

**Context:** Epic for OCL Mapper documentation tasks. Part of the active Mapper MVP milestone. Has 4 sub-issues (3 open). No assignee but actively scoped.

**Recommendation:** Keep. This is part of the active Mapper MVP workstream. Documentation sub-issues should be tracked as Mapper MVP progresses.

---

## 5.3 Design System

**Disposition: keep**

| # | Title | State | Created | Updated | Labels | Assignee | Disposition |
|---|-------|-------|---------|---------|--------|----------|-------------|
| 1381 | Design system | CLOSED | 2022-10 | 2026-03 | Epic, Design, DS, V3 | paulsonder | keep |

**Context:** The OCL design system epic, tagged V3 and assigned to paulsonder. Recently closed (2026-03-26). This was a long-running effort spanning from 2022 through the V3 era. No body content but the labels and assignment indicate active ownership.

**Recommendation:** Keep as closed. The design system is a foundational V3 deliverable. Retain for historical reference. Any new design system work should be tracked in fresh tickets.

---

## 5.4 Analytics & Tracking

**Disposition: keep**

| # | Title | State | Created | Updated | Labels | Disposition |
|---|-------|-------|---------|---------|--------|-------------|
| 1792 | OCL v3 Analytics | OPEN | 2024-03 | 2024-03 | Epic, V3, v3-foundation | keep |

**Context:** Focused on analytics gaps for OCL v3 launch. Body: "New epic focused only on analytics for OCL v3 and what we're missing for launch." Tagged v3-foundation.

**Recommendation:** Keep. Analytics is a recognized gap for v3. No sub-issues visible, so this may need scoping before it becomes actionable.

---

## 5.5 Team Collaboration

**Disposition: keep**

| # | Title | State | Created | Updated | Milestone | Assignee | Disposition |
|---|-------|-------|---------|---------|-----------|----------|-------------|
| 2096 | Review Mapping Candidates | OPEN | 2025-02 | 2025-03 | OCL Mapper MVP | michaelbontyes | keep |

**Context:** Features for making and reviewing mapping decisions in the OCL Mapper tool. Part of the active Mapper MVP milestone with an active assignee. Classified under Team Collaboration because mapping review is inherently a multi-user workflow.

**Recommendation:** Keep. Active Mapper MVP work with clear ownership.

---

## 5.6 Authentication & Authorization

**Disposition: 1 review, 1 keep**

| # | Title | State | Created | Updated | Labels | Disposition |
|---|-------|-------|---------|---------|--------|-------------|
| 889 | Content Distribution License | OPEN | 2021-08 | 2021-08 | Epic | review |
| 1698 | OWASP Top-10 | OPEN | 2023-11 | 2023-11 | Epic, V3, v3-foundation | keep |

**#889 - Content Distribution License (review):** Empty body, no assignee, no updates since creation in 2021. The concept of managing content distribution licenses is potentially relevant (controlling how terminology content is shared), but this epic has no detail or momentum.

**#1698 - OWASP Top-10 (keep):** Tagged V3 and v3-foundation. Security hardening against OWASP Top-10 vulnerabilities is a standard requirement for production systems. Empty body but the intent is clear and the work remains relevant.

**Recommendation:** Review #889 to determine if content licensing is still a priority; if so, re-scope with requirements. Keep #1698 as a standing security objective for v3.

---

## 5.7 CLI & Tooling

**Disposition: review (both)**

| # | Title | State | Created | Updated | Disposition |
|---|-------|-------|---------|---------|-------------|
| 874 | Automated code changelog | OPEN | 2021-08 | 2024-03 | review |
| 928 | Automated Content Validation Tooling for OCL | OPEN | 2021-08 | 2021-08 | review |

**#874 - Automated code changelog (review):** Empty body, no assignee. Updated as recently as 2024-03, suggesting some interest. Automated changelogs are a developer experience improvement but not a core priority.

**#928 - Automated Content Validation Tooling (review):** Has meaningful requirements: verify concepts/mappings are present between import and export files, compare attributes, verify hierarchy placement. References tooling Burke developed. No updates since creation in 2021.

**Recommendation:** Review both. #928 has clearer requirements and may overlap with newer import/export validation work. #874 could be closed if no one is actively pursuing changelog automation. Both should be evaluated against current DevEx priorities.

---

## 5.8 Data Issues

**Disposition: close-stale (both)**

| # | Title | State | Created | Updated | Assignee | Disposition |
|---|-------|-------|---------|---------|----------|-------------|
| 875 | Data Management | OPEN | 2021-08 | 2021-08 | — | close-stale |
| 890 | Content Load Pipeline from Apelon | OPEN | 2021-08 | 2021-08 | jamlung-ri | close-stale |

**#875 - Data Management:** Empty body, no assignee, no updates since 2021. Too vague to be actionable.

**#890 - Content Load Pipeline from Apelon:** Empty body, assigned to jamlung-ri but no updates since 2021. Apelon-specific content loading may no longer be relevant.

**Recommendation:** Close both as stale. If data management or Apelon pipelines are still needed, create fresh tickets with current context.

---

## Summary Table

| Subcategory | Issues | Keep | Review | Close |
|-------------|--------|------|--------|-------|
| Community Site & Outreach | 2 | 0 | 0 | 2 (stale) |
| Documentation | 1 | 1 | 0 | 0 |
| Design System | 1 | 1 | 0 | 0 |
| Analytics & Tracking | 1 | 1 | 0 | 0 |
| Team Collaboration | 1 | 1 | 0 | 0 |
| Authentication & Authorization | 2 | 1 | 1 | 0 |
| CLI & Tooling | 2 | 0 | 2 | 0 |
| Data Issues | 2 | 0 | 0 | 2 (stale) |
| **Total** | **12** | **5** | **3** | **4** |

## Key Themes

1. **Active work is concentrated in Mapper MVP** (#2082, #2096) and V3 foundations (#1381, #1698, #1792).
2. **2021-era epics with empty bodies** (#349, #390, #875, #890) are clear close-stale candidates -- they were placeholder epics that never gained traction.
3. **CLI/tooling epics** (#874, #928) sit in a gray zone: potentially useful but no active ownership. #928 has the most substance and could be revived if content validation becomes a priority.
4. **Security** (#1698) is the most universally important item in this section and should eventually be scoped with specific OWASP categories relevant to OCL's architecture.

---

## Appendix A: Issue Index

| # | Title | State | Disposition | Section |
|---|-------|-------|-------------|---------|
| 311 | oclapi2 Maintenance | OPEN | close-stale | 3.2 |
| 344 | OCL Administrative | OPEN | close-stale | 3.1 |
| 349 | OCL Community Site | OPEN | close-stale | 5.1 |
| 390 | OCL User Support - Design and Launch | OPEN | close-stale | 5.1 |
| 458 | Content Preparation, Import, and Publication | OPEN | close-stale | 4.4 |
| 855 | CSV Bulk Import Gaps | OPEN | review | 4.1 |
| 856 | JSON Bulk Import Gaps | OPEN | review | 4.1 |
| 858 | Infrastructure | OPEN | close-stale | 3.1 |
| 866 | Core OCL/API | OPEN | close-stale | 2.2 |
| 867 | Bulk Import API | OPEN | close-stale | 4.1 |
| 868 | PEPFAR-related Projects | OPEN | close-stale | 4.2 |
| 869 | FHIR/SVCM Support in OCL | CLOSED | review | 2.1 |
| 873 | API Parameters, Properties, and Filters | OPEN | close-stale | 2.2 |
| 874 | Automated code changelog | OPEN | review | 5.7 |
| 875 | Data Management | OPEN | close-stale | 5.8 |
| 876 | API Performance Improvement | OPEN | review | 3.4 |
| 879 | SNOMED Import and Maintenance | OPEN | keep | 2.4 |
| 880 | LOINC Import and Maintenance | OPEN | keep | 2.4 |
| 881 | Hierarchy Support in API | OPEN | review | 2.2 |
| 883 | RxNorm Import and Maintenance | OPEN | keep | 2.4 |
| 884 | ICD-10-CM Import and Maintenance | OPEN | keep | 2.4 |
| 885 | PEPFAR DASH | OPEN | close-stale | 4.2 |
| 886 | API Search Results | OPEN | close-stale | 3.4 |
| 887 | Content Exports | OPEN | keep | 4.1 |
| 889 | Content Distribution License | OPEN | review | 5.6 |
| 890 | Content Load Pipeline from Apelon | OPEN | close-stale | 5.8 |
| 892 | OpenMRS Dictionary Manager Support | OPEN | review | 4.3 |
| 893 | PIH Dictionary | OPEN | close-stale | 4.2 |
| 901 | Lookup Tables | OPEN | close-stale | 2.3 |
| 903 | Content Cleaning and Validation | OPEN | close-stale | 2.4 |
| 904 | Diff Imports, as opposed to full imports | OPEN | review | 4.1 |
| 905 | API-level Reporting | OPEN | close-stale | 3.2 |
| 928 | Automated Content Validation Tooling for OCL | OPEN | review | 5.7 |
| 952 | Performance Testing on Production | OPEN | close-stale | 3.1 |
| 1138 | SNOMED GPS | OPEN | review | 4.4 |
| 1158 | Content Management Features | OPEN | close-stale | 2.4 |
| 1166 | NPM Import of Baseline FHIR Content | CLOSED | keep | 2.1 |
| 1190 | WHO-ATC Content Publication and Maintenance | OPEN | close-stale | 4.4 |
| 1381 | Design system | CLOSED | keep | 5.3 |
| 1433 | Fix OCL Locales - Round 2 | OPEN | keep | 2.3 |
| 1692 | OpenMRS Burning Needs (V2) | CLOSED | close-outdated | 4.3 |
| 1697 | Standardizing Lookup Fields | OPEN | keep | 2.3 |
| 1698 | OWASP Top-10 | OPEN | keep | 5.6 |
| 1726 | Repo Configuration and Content Validation | CLOSED | keep | 2.3 |
| 1773 | Queue Management Service | OPEN | close-superseded | 3.2 |
| 1792 | OCL v3 Analytics | OPEN | keep | 5.4 |
| 1846 | Demo environment | OPEN | keep | 3.3 |
| 1847 | Import Performance | OPEN | keep | 4.1 |
| 1885 | Events and Feeds Framework | OPEN | keep | 2.2 |
| 1910 | FHIR baseline content | CLOSED | keep | 2.1 |
| 1915 | OCL support for Publishing terminology the FHIR ecosystem | CLOSED | keep | 2.1 |
| 2034 | OCL Mapping Tool MVP | OPEN | keep | 2.5 |
| 2045 | Terminology Packaging Service | CLOSED | keep | 2.2 |
| 2046 | Automated FHIR Testing Pipeline | CLOSED | keep | 3.1 |
| 2047 | Implement FHIR Serialization Library | CLOSED | keep | 2.1 |
| 2048 | FHIR Content Traceability | CLOSED | keep | 2.1 |
| 2049 | CRMI Compliance | CLOSED | keep | 2.1 |
| 2050 | Batch Validation | CLOSED | keep | 2.2 |
| 2052 | Batch Translation | CLOSED | keep | 2.2 |
| 2053 | Automated FHIR Resource Validation | CLOSED | keep | 2.1 |
| 2082 | Documentation | OPEN | keep | 5.2 |
| 2089 | Save and Export Mapping Progress | OPEN | keep | 2.5 |
| 2096 | Review Mapping Candidates | OPEN | keep | 5.5 |
| 2253 | OCL FHIR Core 2025 | CLOSED | review | 2.1 |

---

## Appendix B: Contributor Map

| Contributor | Issues | Primary Sections |
|---|---|---|
| @jamlung-ri | #879, #880, #883, #884, #890, #1138, #2045, #2046 | Section 2 (Content Curation), Section 3 (CI/CD), Section 4 (Source Management) |
| @rkorytkowski | #1166, #1847, #1910, #1915, #2046, #2047, #2048 | Section 2 (FHIR Integration, Core API), Section 3 (CI/CD), Section 4 (Bulk Import) |
| @snyaggarwal | #1166, #1847, #1885 | Section 2 (FHIR Integration, Core API), Section 4 (Bulk Import) |
| @paynejd | #2045 | Section 2 (Core API) |
| @paulsonder | #1381 | Section 5 (Design System) |
| @michaelbontyes | #2096 | Section 5 (Team Collaboration) |

**Notes:**
- 49 of 64 epic/meta issues have no assignee.
- @jamlung-ri and @rkorytkowski account for the majority of assigned work, with 8 and 7 issues respectively.
- @rkorytkowski and @snyaggarwal share assignments on #1166 and #1847; @rkorytkowski and @jamlung-ri share #2046; @paynejd and @jamlung-ri share #2045.
