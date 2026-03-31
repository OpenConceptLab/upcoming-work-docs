# Section 4: Open Feature Requests

This section covers the 20 open issues in the V3 (unreviewed) bucket that represent active feature requests, enhancements, and design work that has not yet been completed. These are organized by era and theme.

---

## 4.1 Legacy UI Improvements (2023)

These issues were tagged for V3 during mid-2023 but have seen little to no activity since. They represent small, concrete improvements that were relevant during v2-to-v3 transition planning.

### #1494 -- Update UI/UX of Source Summary Tab
- **What:** Redesign the source summary tab to improve clarity. User feedback (Andy Kanter) noted that the summary statistics are confusing -- e.g., language counts represent "concepts with at least one name in that language," not the number of names, but this is not labeled.
- **Why it matters:** The summary tab is a primary entry point for understanding a source's content. Misleading labels undermine trust.
- **Status:** Open since Feb 2023. Last activity Jul 2023 (paynejd tagged it for v3). Assigned to paulsonder. No design work or implementation has been done.
- **Disposition:** **Close-stale.** The v3 repository design (#1935, closed) and data tables (#1875) have since addressed summary presentation at a higher level. If summary improvements are still needed, a fresh ticket scoped to the current v3 design should be created.

### #1531 -- Add Sign Up Option on Community Site
- **What:** Add a "sign up" link on the OCL community site home page so users do not have to navigate to the TermBrowser first to create an account.
- **Why it matters:** Reduces friction for new users discovering OCL through the community site.
- **Status:** Open since Mar 2023. No comments. Last activity Jul 2023. Assigned to paulsonder.
- **Disposition:** **Close-stale.** The community website has since been redesigned (#1797, #1890, both closed). The sign-up flow was addressed as part of the Keycloak SSO integration (#1702) and community site build. If still missing, re-file against the current community site.

### #1539 -- Change Icon Color for Unresolvable Associations
- **What:** In the concept details page, associations that cannot be resolved in OCL use an orange icon that looks like an error/warning. Proposal to change the icon style (e.g., outlined instead of filled) to distinguish "not resolvable" from "error."
- **Why it matters:** Visual clarity for users browsing concept mappings.
- **Status:** Open since Apr 2023. Last activity Jul 2023 (paynejd flagged for v3 design). Assigned to paulsonder.
- **Disposition:** **Close-stale.** The data tables (#1875) and association panel redesign (comments on #1875 from paulsonder, Jul 2024) have since addressed association iconography with a new system distinguishing OCL-internal concepts, external concepts, retired variants, and retired mappings. This specific concern has been subsumed.

### #1555 -- Draft Operations Panel Documentation
- **What:** Document the operations panel feature: server types supported (OCL, OCL FHIR, SVCM, ICD11 FHIR), operations per server type ($resolveReference, $cascade, $checksum, $lookup, $translate, $validate-code), and authentication behavior.
- **Why it matters:** The operations panel is a distinctive OCL feature with no documentation. Without docs, users cannot discover or use it effectively.
- **Status:** Open since Apr 2023. Last activity Jul 2024 (paynejd flagged as important for v3). Assigned to paynejd, snyaggarwal, jamlung-ri.
- **Disposition:** **Keep.** This is a documentation gap that persists. The operations panel exists and works but remains undocumented. Should be scoped as a docs task for v3 launch readiness.

### #1641 -- Add Map Source to Match Explanation Tooltip
- **What:** When searching concepts and a map code is matched (e.g., searching for "B50"), ElasticSearch returns the map code and map type but not the map source. The tooltip should also show the source and display name.
- **Why it matters:** Without the map source, users cannot determine which terminology system the matched code belongs to.
- **Status:** Open since Aug 2023. No comments. Assigned to snyaggarwal. Last activity Mar 2024.
- **Disposition:** **Keep.** This is a concrete, well-defined API enhancement that improves search result quality. Still relevant for v3.

### #1655 -- Promote OCL Demo Site
- **What:** Promote the OCL demo site (which resets weekly) on the OCL community site to drive more usage beyond hands-on workshops.
- **Why it matters:** The demo site is underutilized despite being a safe sandbox for exploration.
- **Status:** Open since Aug 2023. paulsonder commented "Working on this now" in Aug 2023. No further activity.
- **Disposition:** **Close-stale.** The community website was redesigned in 2024 (#1797, #1890). If the demo site still needs promotion, this should be a fresh content task against the current Webflow-based community site.

---

## 4.2 Foundation & Data Quality (2023)

### #1691 -- Checksums: Addressing the Details
- **What:** Discussion ticket exploring how checksums are used in practice: differentiating concepts in the comparison tool, interaction with mappings, and reproducibility outside OCL. Burke Mamlin (bmamlin) provided a detailed example of difficulty reproducing checksums externally and requested a standalone Python script.
- **Why it matters:** Checksums are a v3-foundation feature (#1690 parent epic). External reproducibility is critical for interoperability with systems like CIEL that need to verify content independently.
- **Status:** Open since Nov 2023. Active discussion through Apr 2024 (bmamlin's detailed request for a checksum calculation script). Labeled `discussion-needed`. Assigned to bmamlin, paynejd, snyaggarwal.
- **Disposition:** **Keep.** The checksum reproducibility question remains unresolved and is important for CIEL and other external consumers. This should be addressed as part of the broader checksums epic (#1690).

### #1697 -- Standardizing Lookup Fields (Epic)
- **What:** Epic for cleaning up and standardizing lookup fields (e.g., concept classes, datatypes, map types, locales) across OCL. Brainstorming captured in a Miro board.
- **Why it matters:** Inconsistent lookup values create data quality issues, complicate search, and make FHIR compliance harder. This is labeled `v3-foundation` and `reviewed/keep`.
- **Status:** Open since Nov 2023. Last activity Mar 2027 (auto-update). No assignees. The Miro board has the brainstorming but no sub-issues have been created.
- **Disposition:** **Keep.** This is a recognized foundational need. Should be scoped into actionable sub-issues when resources are available.

---

## 4.3 User Experience Enhancements (2024)

### #1801 -- User Profile Summary API
- **What:** Define what summary information should appear on user profiles and make profiles more publicly accessible. Current summary API returns counts of sources, collections, org memberships, owned orgs, and bookmarks.
- **Why it matters:** User profiles are a key social feature for v3. The current API is minimal and profiles may not be viewable by others.
- **Status:** Open since Mar 2024. No comments since creation. Assigned to paynejd, paulsonder.
- **Disposition:** **Keep.** User profiles are part of the v3 consumer experience. This needs requirements definition and API enhancement.

### #1875 -- Data Tables
- **What:** Comprehensive ticket describing data table layouts for v3, including hierarchy views (grouped by parent/child), mappings views (grouped by source), collection views (grouped by references), and association panels. Includes designs for filter placement, iconography for OCL-internal vs. external concepts, and handling of retired items.
- **Why it matters:** Data tables are the primary way users interact with content in OCL. The designs define how concepts, mappings, and references are presented across all repository types.
- **Status:** Open since Jul 2024. Active design iteration through Sep 2024 with designs in Zeplin. Assigned to jamlung-ri, paulsonder. Several table configurations are checked off (hierarchy, mappings, associations) but collection views remain.
- **Disposition:** **Keep.** Active design work with concrete deliverables. Core to v3 UI.

### #1891 -- Freeze Large Resources Upon Deletion
- **What:** When deleting a large repo or org, there is no "processing" flag and content is not frozen. Users can continue interacting with content being asynchronously deleted. Proposal: implement a "frozen" flag that makes content read-only during deletion (and potentially during other long operations like loading or versioning).
- **Why it matters:** Prevents confusing user experience and potential data corruption during async operations.
- **Status:** Open since Jul 2024. jamlung-ri commented it is valuable for v3 but could wait for CodeSystem Author persona work. No assignees.
- **Disposition:** **Keep.** Well-defined platform enhancement. The "frozen" concept has broader applicability beyond deletion. Priority is medium -- not blocking launch but important for production readiness.

### #1904 -- Modals
- **What:** Brief note that modals in Material Design 3 (M3) do not include a close icon button in the top right. This is a design system alignment issue.
- **Why it matters:** Consistency with M3 design guidelines across the v3 UI.
- **Status:** Open since Jul 2024. No comments. Assigned to paulsonder.
- **Disposition:** **Close-stale.** This is a one-line design note, not a actionable feature request. If modal behavior needs updating, it should be captured as part of a broader design system ticket or addressed inline during implementation.

### #1905 -- Avatars
- **What:** Document and implement avatar handling: default avatars for orgs/users without uploads, upload and cropping workflow, specs and dimensions, and potentially a library of pre-made avatars for users to choose from.
- **Why it matters:** Avatars improve the visual identity of the platform and help users quickly identify orgs and users.
- **Status:** Open since Jul 2024. Active discussion through Nov 2024 with paulsonder sharing avatar concepts and jamlung-ri expressing support. Labeled as post-MVP work. Assigned to paulsonder.
- **Disposition:** **Keep.** Active design work with team consensus. Correctly scoped as post-MVP. Low priority but good polish item.

### #1970 -- Mobile-Ready Screens (OHIE Must-Haves)
- **What:** Make v3 screens mobile-ready. Priority screens: anonymous dashboard, searchlight, search results, and concept details. Identified as a must-have for OHIE24 (Nov 2024).
- **Why it matters:** Many users will first access v3 on mobile devices. Search result tables are not mobile-friendly.
- **Status:** Open since Nov 2024. paulsonder noted M3 components are mobile-ready but custom components (searchlight, data tables, repo headers, detail views) need mobile designs. snyaggarwal confirmed search results with tables are not mobile-friendly. Assigned to snyaggarwal.
- **Disposition:** **Keep.** Mobile readiness is important for broad adoption. Partial work has been done (M3 components) but custom components still need attention.

---

## 4.4 Collection Management Features (2026)

These five issues were created in February 2026 as part of the CIEL Implementers workflow planning. They are well-scoped feature requests with detailed acceptance criteria, milestones, and dependency tracking.

### #2339 -- Reference Transformation Actions
- **What:** Enable users to transform references between versioning strategies (unversioned, resource-versioned, repo-versioned) directly in the TBv3 References tab. Includes transform dialog with preview, batch operations, error handling, and rollback.
- **Why it matters:** Collection managers frequently need to lock or unlock references for different use cases (development vs. production). Currently this requires manual recreation.
- **Status:** Open since Feb 2026. No comments. No assignees. Depends on #2273 (Collection References tab). Milestone: CIEL Implementers Collection & Reference Creation E2E Workflow.
- **Disposition:** **Keep.** Well-defined, milestone-tracked feature. Part of the CIEL Implementers workflow.

### #2346 -- Real-Time Schema Validation for References
- **What:** Implement real-time validation warnings when references violate schema constraints (required properties, allowed concept classes, datatype restrictions, mapping constraints). Warnings displayed inline, in preview, and in the References tab with severity levels (error/warning/info).
- **Why it matters:** Currently, schema validation errors are only discovered during expansion or version creation -- too late. Real-time validation catches issues immediately.
- **Status:** Open since Feb 2026. No comments. No assignees. Milestone: CIEL Implementers Collection & Reference Creation E2E Workflow. Q2 2026 target.
- **Disposition:** **Keep.** Important quality-of-life feature for collection managers. Ambitious scope -- may need phasing.

### #2347 -- Linked Source Workflow
- **What:** Allow collections to link to a specific source version for reference resolution, providing an intermediate state between "always HEAD" and "fully locked versioned references." Includes test-new-version workflow, lock-to-version conversion, and warnings for outdated linked versions.
- **Why it matters:** Provides safe, controlled update path for production collections that depend on evolving terminologies like CIEL.
- **Status:** Open since Feb 2026. No comments. No assignees. Milestone: CIEL Implementers Collection Maintenance E2E Workflow. Q2 2026 target.
- **Disposition:** **Keep.** Addresses a real pain point in collection lifecycle management. Well-designed workflow.

### #2348 -- Collection Dependency Notifications
- **What:** Notify collection owners when dependencies (source versions, nested collections) are updated, deprecated, or deleted. Includes dependency tracking, notification triggers, in-app and email channels, preference configuration, and a dependency health dashboard.
- **Why it matters:** Collection owners are often unaware when their dependencies change, leading to outdated or broken collections.
- **Status:** Open since Feb 2026. No comments. No assignees. Milestone: CIEL Implementers Collection Maintenance E2E Workflow. Q2 2026 target.
- **Disposition:** **Keep.** Important for production collection management. Large scope -- should be phased. Foundation for #2349.

### #2349 -- Collection Dependency Update Workflow
- **What:** Safe workflow for reviewing and accepting dependency updates: before/after comparison, impact assessment, test expansions, apply/rollback, scheduled updates, and batch operations. Builds on #2348 (notifications).
- **Why it matters:** Updating collection dependencies is currently risky with no preview, testing, or rollback capability.
- **Status:** Open since Feb 2026. No comments. No assignees. Milestone: CIEL Implementers Collection Maintenance E2E Workflow. Q2 2026 target. Depends on #2348.
- **Disposition:** **Keep.** Logical extension of #2348. Very ambitious scope -- likely a multi-sprint effort.

### #2353 -- Concept Proposals in Mapper and TBv3
- **What:** Enable users to propose new concepts or changes to existing concepts from within OCL Mapper and TBv3. Includes proposal form, review workflow for repository maintainers (approve/reject/request changes), discussion threads, tracking dashboard, and analytics.
- **Why it matters:** Currently there is no formal way to request new concepts. Users work around by creating local concepts, and maintainers do not know what is needed.
- **Status:** Open since Feb 2026. No comments. No assignees. Milestone: CIEL Implementers Concept Proposals E2E Workflow. Q2 2026 target.
- **Disposition:** **Keep.** Significant new capability that bridges the gap between terminology consumers and maintainers. Large scope requiring API, Mapper, and TBv3 work.

---

## 4.5 Summary of Dispositions

| Disposition | Count | Issues |
|---|---|---|
| **Keep** | 14 | #1555, #1641, #1691, #1697, #1801, #1875, #1891, #1905, #1970, #2339, #2346, #2347, #2348, #2349, #2353 |
| **Close-stale** | 5 | #1494, #1531, #1539, #1655, #1904 |
| **Review** | 0 | -- |

The open feature requests split into two clear groups: (1) older 2023 issues that have been superseded by subsequent design work and should be closed, and (2) active 2024-2026 issues that represent genuine planned work. The 2026 CIEL Implementer issues (#2339, #2346, #2347, #2348, #2349, #2353) are particularly well-scoped and milestone-tracked, representing the next major phase of collection management capability.
