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
