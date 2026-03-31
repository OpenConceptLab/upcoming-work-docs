# V3 Unreviewed Issues: Knowledge Base

**Generated:** 2026-03-26
**Scope:** 70 issues from OpenConceptLab/ocl_issues with the V3 label that were NOT included in the main TBv3 project board analysis
**Source:** [OpenConceptLab/ocl_issues](https://github.com/OpenConceptLab/ocl_issues) GitHub repository
**Companion data:** `v3unrev-raw-archive.json` (full issue bodies + comments), `v3unrev-issue-classification.csv` (70-row analysis)

---

## Section 1: Executive Summary

### 1.1 What This Bucket Is

The "V3 (unreviewed)" bucket contains 70 issues that carry the `V3` label on `ocl_issues` but were never added to the main TermBrowser v3 project board. These issues fell through the cracks for several reasons:

- **Design specs filed outside the project board.** A large cluster of Design-labeled issues (#1619, #1628--#1632, #1693, #1707, #1718, #1719, #1725, #1775, #1797) were created by @paulsonder as part of the design system effort (#1381) but tracked separately from the project board's epic structure.
- **v2-era issues tagged for v3 consideration.** Issues like #1494 (source summary UI), #1531 (sign up on community site), #1539 (icon color for associations), and #1655 (promote demo site) were originally v2 tickets that @paynejd tagged with V3 in July 2023 as "relevant for v3 -- not planning to do a redesign for v2." They were never formally triaged onto the board.
- **Foundation epics managed outside the board.** Several `v3-foundation` epics (#1166 FHIR, #1433 Locales, #1697 Lookup Fields, #1698 OWASP, #1773 Queue Management, #1792 Analytics) lived at the architectural level and were tracked through architecture calls rather than the project board.
- **Late-filed feature requests.** The February 2026 batch of CIEL Implementer tickets (#2339, #2346--#2350, #2353) were filed with milestone tags but not yet added to the board.
- **Bug fixes resolved quickly.** Several bugs (#1765, #1851, #1899, #1900, #1965, #1973) were reported and fixed within days, bypassing the board workflow entirely.

### 1.2 Key Stakeholders

| Contributor | Role in This Bucket | Issue Count |
|---|---|---|
| **@paulsonder** (Paul Sonder) | UI/UX designer; created the bulk of design spec issues and component tickets | ~25 issues assigned |
| **@snyaggarwal** (Sunny Aggarwal) | Primary implementer; resolved most bugs, built infrastructure, implemented designs | ~25 issues assigned |
| **@jamlung-ri** (James Amlung) | QA, user stories, design review; active commenter and closer on many tickets | ~10 issues assigned |
| **@paynejd** (Jonathan Payne) | Product owner; tagged v2 issues for v3, defined requirements, architectural decisions | ~5 issues assigned |
| **@rkorytkowski** (Rafal Korytkowski) | Infrastructure; set up deployment pipelines and subdomains | ~3 issues assigned |
| **@bmamlin** (Burke Mamlin) | Domain expert; active on checksums discussion (#1691) | 1 issue assigned |
| **@kaalcumm** | Community engagement; worked on community website content (#1797) | 1 issue assigned |

### 1.3 Timeline

**Pre-V3 Legacy (pre-2022).** One issue in this bucket (#1166, FHIR NPM import) predates the v3 initiative, created December 2021. It was tagged `v3-foundation` retroactively and closed during the March 2026 FHIR backlog cleanup.

**V3 Early Development (Oct 2022 -- Jun 2023).** The design system epic (#1381) was created October 2022, alongside the advanced references panel (#1378) and hierarchy settings (#1391). The locales epic (#1433) was filed in November 2022. In early 2023, @paulsonder delivered sign-in/sign-up page designs (#1479). By mid-2023, @paynejd began systematically tagging v2 issues for v3 consideration (#1494, #1531, #1539, #1555, #1604, #1655).

**V3 Active Development (Jul 2023 -- Dec 2023).** July 2023 saw a burst of design spec creation: #1619 (form/create version), #1628 (notifications), #1629 (comments), #1630 (my account menu), #1631 (mappings list view), #1632 (community website). The async requests flow (#1561) was implemented. The search enhancements (#1604, #1635) were completed. Foundation epics were filed: #1697 (lookup fields), #1698 (OWASP), and infrastructure work began on TBv3 subdomains (#1685). By December, favicons (#1707, #1718), RTL exploration (#1719), error pages (#1693), and the repo home view (#1722) were all delivered.

**V3 Maturation (Jan 2024 -- Dec 2024).** This was the most productive period. Repo version display in search results (#1725) shipped in January. The navigation drawer (#1775) went from design to deployment in under a month (February--March 2024). The community website design (#1797) involved multi-stakeholder content review with @kaalcumm through April. The KeyCloak branding (#1774) and environment indicators (#1863) were completed. The data tables design (#1875) iterated through July--September with detailed iconography for retired concepts/mappings. TBv3 was deployed to staging (#1934) in October. The repository design (#1935) was finalized with comprehensive specs for headers, summaries, tabs, and version selectors. The expansion picker (#1958) and object preview (#1960) designs were created. Critical OHIE-prep bugs were fixed (#1965 concept details crash, #1968 quick changes, #1969 repo summary labels, #1973 blank source type). Mobile readiness was flagged (#1970, #1971).

**Current (2025--2026).** Several foundation epics were closed during cleanup: #1166 (FHIR, March 2026), #1381 (design system, March 2026), #1433 (locales, March 2026), #1698 (OWASP, March 2026), #1773 (queue management, March 2026), #1792 (analytics, March 2026), #1890 (community website build, March 2026). In February 2026, a new batch of CIEL Implementer feature requests was filed: #2339 (reference transformations), #2346 (schema validation), #2347 (linked source workflow), #2348 (dependency notifications), #2349 (dependency update workflow), #2350 (collection versions/expansions UI), #2353 (concept proposals).

### 1.4 Disposition Breakdown

Of the 70 issues:

**CLOSED: 46 issues**
- **close-done (28):** Completed work including design specs, bug fixes, infrastructure setup, and feature implementations
- **close-stale (8, among closed):** Design specs with no implementation activity (#1628 notifications, #1629 comments, #1632 community website) closed during March 2026 cleanup
- **close-superseded (1):** Queue Management Service (#1773) superseded by newer task management approach
- **keep (9, among closed):** Foundation epics and significant completed work worth preserving as reference (#1166, #1381, #1433, #1698, #1749, #1792)
- **review (3, among closed):** Issues needing further assessment (#1619, #1630, #1631, #1890)

**OPEN: 24 issues**
- **keep (16):** Active or relevant issues including:
  - Foundation epics: #1697 (lookup fields standardization), #1691 (checksums details)
  - Active feature work: #1801 (user profile summary API), #1875 (data tables), #1905 (avatars), #1970 (mobile-ready screens)
  - Design specs with `reviewed/keep`: #1958 (expansion picker), #1960 (object preview), #1971 (mobile updates), #2350 (collection versions/expansions)
  - New CIEL Implementer features: #2339, #2346, #2347, #2348, #2349, #2353
  - Other: #1555 (operations panel docs), #1641 (match explanation tooltip), #1891 (freeze on delete)
- **close-stale (8):** Issues with no activity since 2023 or early 2024, recommended for closure:
  - #1494 (source summary UI, last activity Jul 2023)
  - #1531 (sign up on community site, last activity Jul 2023)
  - #1539 (icon color for associations, last activity Jul 2023)
  - #1655 (promote demo site, last activity Aug 2023)
  - #1904 (modals M3 compliance, last activity Jul 2024)

### 1.5 Relationship to Main TBv3 Knowledge Base

This bucket is complementary to the main TBv3 knowledge base (262 issues). Key overlaps and distinctions:

- **Design system work** in this bucket (#1381 and children) underpins the UI components documented in the main KB but was tracked separately.
- **Foundation epics** here (#1166 FHIR, #1433 Locales, #1697 Lookup Fields, #1698 OWASP) overlap with the `v3-foundation` label but were not on the project board.
- **Bug fixes** here were resolved independently of the board workflow and represent the "quick-turn" operational side of v3 development.
- **CIEL Implementer features** (#2339--#2353) represent a new workstream that emerged in 2026 and is not yet covered in the main KB.
