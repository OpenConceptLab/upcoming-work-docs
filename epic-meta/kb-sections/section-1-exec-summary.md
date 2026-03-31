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
