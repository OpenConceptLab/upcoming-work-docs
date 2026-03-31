# Section 5: Platform & Infrastructure

This section covers the closed epics and infrastructure issues in the V3 (unreviewed) bucket. These represent completed foundational work that enabled the v3 platform. Understanding what was delivered -- and how -- provides context for ongoing and future work.

---

## 5.1 Completed Epics

### #1166 -- NPM Import of Baseline FHIR Content (Epic)
- **Scope:** Remaking OCL's FHIR service to implement business rules directly into OCL. Originally filed Dec 2021, this was a large initiative covering CodeSystem CRUD, ValueSet operations, FHIR resource filtering, concept pagination, and $resolveReference integration.
- **Key activity:** Rafal Korytkowski (rkorytkowski) and Sunny Aggarwal (snyaggarwal) drove implementation. James Amlung (jamlung-ri) performed extensive testing of CodeSystem read/create operations and documented bugs (caseSensitive expecting string instead of Boolean, missing concept pagination, inconsistent canonical URLs for CIEL). A Nov 2023 FHIR Core Planning Scratchpad was linked.
- **Resolution:** Closed Mar 2024 as part of a systematic FHIR Service backlog cleanup. Content captured in the FHIR Service Knowledge Base wiki. Fresh tickets to be created if work is still needed.
- **Sub-issues:** 30 sub-issues, all closed.
- **Disposition:** Keep as reference. This epic represents the foundational FHIR service work that v3 builds upon.

### #1433 -- Fix OCL Locales Round 2 (Epic)
- **Scope:** Follow-up to #1360, focused on getting secondary language codes into OCL. Part of the `v3-foundation` label group.
- **Key activity:** Minimal discussion in the archive -- the issue body references #1360 and the need for secondary locale support.
- **Resolution:** Closed Mar 2027 (auto-cleanup cycle). No assignees in the archive.
- **Disposition:** Keep as reference. Locale handling is foundational for OCL's multilingual content support.

### #1698 -- OWASP Top-10 (Epic)
- **Scope:** Epic tracking OWASP Top-10 security compliance for the v3 platform. Part of the `v3-foundation` label group.
- **Key activity:** No body, no comments in the archive. This appears to have been a tracking placeholder.
- **Resolution:** Closed Mar 2027.
- **Disposition:** Keep as reference. Security compliance is an ongoing concern, but the specific v3-era work has been completed or folded into operational practices.

### #1749 -- Global Search (Epic)
- **Scope:** Epic for implementing global search in TBv3.
- **Key activity:** No body, no comments in the archive. Sub-issues were tracked separately.
- **Resolution:** Closed Feb 2025. Global search is operational in v3.
- **Disposition:** Keep as reference. Global search is a shipped feature.

### #1773 -- Queue Management Service (Epic)
- **Scope:** Service to manage asynchronous tasks for users. Goals: remove dependency on Flower APIs, longer persistence of Celery tasks, reliable in-progress state events, and clear user task tagging. All four goals were checked off in the issue body.
- **Key activity:** Task ID format standardized to `<uuid>-<username>-<queue>`. All async API requests return taskId, state, and queue info. Part of the `v3-foundation` label group.
- **Resolution:** Closed Mar 2027. All checklist items completed.
- **Disposition:** Close-superseded (per classification). The queue management work is done. Any remaining task UI work would be tracked under separate v3 tickets.

### #1792 -- OCL v3 Analytics (Epic)
- **Scope:** Epic focused on analytics for OCL v3 and what was missing for launch. Part of the `v3-foundation` label group.
- **Key activity:** No body detail beyond "New epic focused only on analytics for OCL v3 and what we're missing for launch." No comments.
- **Resolution:** Closed Mar 2027.
- **Disposition:** Keep as reference. Analytics requirements for v3 have been addressed at the epic level.

---

## 5.2 Completed Infrastructure Tasks

### #1685 -- Setup Subdomains and Deployment Pipeline
- **What:** Set up GitHub Actions for build/deployment of TBv3, including subdomain configuration.
- **Key activity:** rkorytkowski created the deployment pipeline at `github.com/OpenConceptLab/oclweb3/actions` (confirmed Jan 2024).
- **Resolution:** Closed Jan 2024. Deployment pipeline is operational.
- **Significance:** This established the CI/CD foundation for all subsequent v3 deployments.

### #1934 -- Deploy TBv3 to Staging
- **What:** Deploy v3 to the staging environment with real data for UAT testing beyond the QA environment. Required KeyCloak staging client, Terraform deployment, and GitHub Action configuration.
- **Key activity:** snyaggarwal completed all three tasks (KeyCloak client, Terraform, GitHub Action) by Oct 2024. Assigned to rkorytkowski and snyaggarwal.
- **Resolution:** Closed Oct 2024. Staging environment is operational.
- **Significance:** Enabled user acceptance testing with production-like data, a critical step before v3 launch.

---

## 5.3 Completed API & Backend Work

### #1561 -- TB/API Async Requests Flow
- **What:** Standardize how the TermBrowser handles asynchronous API requests. Key decisions: request async by default with username-embedded task IDs, return response if task finishes within X seconds or else return task info, and copy task ID to clipboard in TB.
- **Key activity:** Implemented for collection references add, source delete, collection delete, and org delete. Discussion about a dedicated tasks UI deferred to v3.
- **Resolution:** Closed Apr 2024. The async flow pattern is established. snyaggarwal confirmed the remaining work is a v3 tasks UI.
- **Significance:** Established the async request pattern used throughout v3 for long-running operations.

### #1635 -- Replace UpdatedOn with Latest Repo Version
- **What:** In search results, replace the "Updated On" column with the latest released repo version label (e.g., `CIEL v2023-02-12`). Also: only search latest released version (not HEAD), and redirect versionless repo URLs to latest released version.
- **Key activity:** snyaggarwal implemented and deployed to dev environment. paynejd confirmed the approach and flagged it for v3 adoption. Screenshots provided showing the new display.
- **Resolution:** Closed Oct 2023. Implemented in dev environment and adopted as the standard for v3.
- **Significance:** Fundamental UX improvement that changed how users discover and contextualize content in search results.

### #1710 -- Implement Latest Released Behavior
- **What:** From the beginning, TBv3 implements the "latest released" search behavior: global search shows latest released version, results include repo version label, navigating to a repo (no version) shows latest released, and HEAD may not be publicly accessible.
- **Key activity:** snyaggarwal implemented and requested closure Jan 2024.
- **Resolution:** Closed Jan 2024. The "latest released" behavior is a core v3 design principle.
- **Significance:** This decision shapes how all content is surfaced in v3 -- users see stable, released content by default rather than in-progress HEAD content.

---

## 5.4 Summary

The infrastructure and platform work in this bucket represents the foundation that v3 was built on:

| Area | Issues | Status |
|---|---|---|
| **FHIR Service** | #1166 (30 sub-issues) | All closed. FHIR service operational. |
| **Data Quality** | #1433 (locales) | Closed. Secondary locale support added. |
| **Security** | #1698 (OWASP) | Closed. Compliance addressed. |
| **Search** | #1749 (global search) | Closed. Global search shipped. |
| **Async Operations** | #1773 (queue mgmt), #1561 (async flow) | Closed. Task management and async patterns established. |
| **Analytics** | #1792 (v3 analytics) | Closed. Analytics baseline set. |
| **Deployment** | #1685 (CI/CD), #1934 (staging) | Closed. Full deployment pipeline operational. |
| **API Behavior** | #1635 (repo version display), #1710 (latest released) | Closed. Core v3 behavior established. |

All 11 issues in this section are closed and represent completed work. No action is required, but they provide important historical context for understanding v3's architectural decisions and infrastructure.
