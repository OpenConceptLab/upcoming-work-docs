# Design Bucket Knowledge Base

**Generated:** 2026-03-26
**Scope:** 46 issues from OpenConceptLab/ocl_issues with the "Design" label
**Source:** [OpenConceptLab/ocl_issues](https://github.com/OpenConceptLab/ocl_issues)
**Companion data:** `design-raw-archive.json` (full issue bodies + comments), `design-issue-classification.csv` (46-row analysis)

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [TBv3 Overlap Issues](#2-tbv3-overlap-issues)
3. [Design System](#3-design-system)
4. [UX & Interaction Design](#4-ux--interaction-design)
5. [Navigation & Layout](#5-navigation--layout)
6. [Pre-V3 Legacy & API](#6-pre-v3-legacy--api)
7. [CIEL Active Work](#7-ciel-active-work)
- [Appendix A: Issue Index](#appendix-a-issue-index)
- [Appendix B: Contributor Map](#appendix-b-contributor-map)

---

# 1. Executive Summary

## 1.1 What Is the Design Bucket

The Design label in ocl_issues tracks UX design specifications, mockups, and design system work for the OCL platform. Overwhelmingly tied to the TermBrowser v3 (TBv3) initiative, these issues bridge the gap between UX design (primarily done in Zeplin and Figma by @paulsonder) and implementation (primarily by @snyaggarwal in oclweb3). The bucket spans from 2019 to 2026 but is dominated by a July 2023 design sprint that created 20+ issues.

Of the 46 open Design issues, 28 (61%) overlap with the TBv3 bucket and have already been analyzed there. The remaining 18 are "Design-only" issues covering the design system, standalone UX specs, and legacy pre-V3 work. Many of the Design-only issues have empty bodies — they were placeholder tickets for work tracked in external design tools — and a significant portion are now stale.

## 1.2 Key Stakeholders and Contributors

| Contributor | Primary Focus | Notable Involvement |
|---|---|---|
| **@paulsonder** | UX designer, design system lead | Created majority of Design issues, assigned to 30+ of 46. Owns Zeplin/Figma assets |
| **@jamlung-ri** | Product management, requirements | Co-assigned on several issues, active in comments on #1640, #1958, #1960. Discussion driver |
| **@snyaggarwal** | Lead developer (oclweb3) | Implementer. Comments on #1640 about retired concept UX. Assigned to #1630 |
| **@paynejd** | Project lead | Assigned to #1607 (Advanced Search), comment on #132 (import results) |
| **@rkorytkowski** | Historical contributor | No direct Design assignments |

## 1.3 Timeline and Milestones

- **2019–2020 (Pre-V3 Legacy):** 2 issues (#132, #346) — API import design and Malawi mockup. V2-era work.
- **2022-10 (Design System Launch):** @paulsonder creates initial design system tickets (#1379–#1398). DS label introduced.
- **2023-07 (V3 Design Sprint):** Massive batch of 20+ issues created July 18, 2023. Covers all major TBv3 screens: concept detail, forms, search, navigation, profiles. Most have empty bodies — specs live in Zeplin.
- **2024-06 to 2024-11 (V3 Expansion):** Detailed design tickets for repo views (#1948–#1971), OHIE requirements, mobile.
- **2026-02 (CIEL Milestones):** #2350 created for collection versions/expansions UI.

## 1.4 Current State Overview

| Category | Count | % |
|---|---|---|
| Already in TBv3 bucket | 28 | 61% |
| Closed (stale/outdated/superseded/duplicate) | 14 | 30% |
| Reviewed/keep (active design work) | 4 | 9% |
| **Total** | **46** | |

14 Design-only issues were closed during this review. 4 remain open as active design work (#1958, #1960, #1971, #2350). The 28 TBv3-overlap issues have already been analyzed in `reports/tbv3-analysis/` and their dispositions determined there.

---

# 2. TBv3 Overlap Issues

The 28 issues listed below carry the Design label AND appear in the TBv3 bucket. They have been fully analyzed in `reports/tbv3-analysis/tbv3-knowledge-base.md`. Their dispositions, priority, and implementation status are documented there — this section serves only as a cross-reference.

No disposition changes are proposed here. If a TBv3-overlap issue needs re-evaluation, that should happen in the TBv3 bucket analysis, not in this document.

| # | Title | TBv3 Disposition | Milestone |
|---|---|---|---|
| #1318 | Highlight concept attributes/associations modified in collection | keep | — |
| #1376 | Create and Update Concepts and Mappings | keep (implemented) | TBv3 MVP |
| #1478 | Repository version summary | keep | — (sub-issue of #1625) |
| #1522 | Deep linking | keep | — |
| #1607 | Advanced search MVP | keep | — |
| #1614 | Change requests and management | keep | — |
| #1615 | Form / Create repo | keep (implemented) | TBv3 MVP |
| #1616 | Form / Create org | keep (implemented) | TBv3 MVP |
| #1618 | Form / Repo / Add references | keep (implemented) | TBv3 MVP |
| #1620 | Concept detail view / Header | keep (implemented) | TBv3 MVP |
| #1621 | Concept Detail view / Associations card | keep (implemented) | TBv3 MVP |
| #1622 | Detail view / Change request | keep | — |
| #1623 | Detail view / Compare | keep (implemented) | TBv3 MVP |
| #1624 | Operations panel | keep | — |
| #1625 | Consumer: Repository | keep | TBv3 MVP |
| #1626 | Profile / Org | keep (implemented) | TBv3 MVP |
| #1700 | Hierarchy/Cascade Component | keep | — |
| #1738 | Concept detail view / Collection membership | keep | — |
| #1739 | Concept detail view / History | keep (implemented) | TBv3 MVP |
| #1763 | Concept tracing / Modification indicators | keep | — |
| #1776 | Objects (Chip view) | keep (implemented) | TBv3 MVP |
| #1798 | User settings page | keep (implemented) | TBv3 MVP |
| #1864 | Global Search / Org | keep (implemented) | TBv3 MVP |
| #1902 | Concept / Membership | keep | — |
| #1948 | Repo - Mappings list | keep | — (OHIE Must-Haves) |
| #1949 | Repo - References list | keep | CIEL Implementers |
| #1951 | Repo - Overview | keep (implemented) | — |
| #1953 | Detail view: References | keep | CIEL Implementers |

---

# 3. Design System

Three Design-only issues relate to the OCL design system — the shared visual language and reusable component patterns underlying the oclweb3 interface. The design system was never formalized into a standalone library; instead, design tokens and patterns from Zeplin/Figma were implemented directly as React components in oclweb3.

---

### #1381 — Design system (Epic)

- **Created:** 2022-10-11 by @paulsonder
- **Labels:** Design, DS, V3
- **Body:** Empty
- **Assignees:** @paulsonder

This was a placeholder epic for the broader design system initiative. No sub-issues are formally linked in GitHub, though several DS-labeled issues (#1379–#1398) were created in the same batch and are thematically related. In practice, design system work was done in Zeplin/Figma and implemented piecemeal into oclweb3 components.

The oclweb3 codebase now has reusable components (`EntityChip`, `EmptyOverview`, shared form patterns, etc.) but no formal design system library or documentation site.

**Disposition: close-stale** — The epic served its purpose as a tracking placeholder. If a formal design system library is desired in the future, a new ticket with current scope should be created.

---

### #1398 — Table empty states

- **Created:** 2022-10-27 by @paulsonder
- **Labels:** Design, DS
- **Body:** Empty
- **Assignees:** @paulsonder

oclweb3 has `EmptyOverview.jsx` and `RepoEmptyOverview.jsx` components that handle these cases. Empty states have been implemented as needed across the application.

**Disposition: close-stale** — Empty states have been implemented. The ticket body was empty, the work is done at a practical level.

---

### #1960 — Object preview

- **Created:** 2024-10-22 by @jamlung-ri
- **Labels:** Design, V3
- **Assignees:** @paulsonder, @jamlung-ri
- **Body:** Contains detailed mockups

Active design issue with substantive content. Mockups show preview popups appearing on hover over concept, organization, user, and repository objects. Active discussion between @paulsonder and @jamlung-ri covers content requirements, interaction behavior, and additional scope (mapping preview, repo type display, loading state).

NOT yet implemented in oclweb3 — no preview/popover component exists.

**Disposition: keep** — Active design work with clear requirements and mockups. Medium priority future enhancement.

---

# 4. UX & Interaction Design

This section covers the core Design-only issues about specific UX patterns and interactions — how users interact with features and how the interface communicates state.

### What Was Built

- **Retired visual treatment (#1442, #1640):** `Retired.jsx` component exists in oclweb3 and applies strikethrough styling to retired mappings. However, the component does not distinguish between a retired mapping and a mapping that points to a retired concept.
- **Version creation form (#1619):** `VersionForm.jsx` exists with `autoexpand` and `expansion_url` fields.
- **My account menu (#1630):** `UserMenu.jsx` implements all 9 items from the original requirements list.
- **Mapping list views (#1631):** `MappingManagementList.jsx` and search-based mapping views exist.
- **Expansion URL field (#1958):** `VersionForm.jsx` includes an `expansion_url` field, but not the proposed dedicated expansion picker UI.

### What Is Pending

- **Retired concept vs. retired mapping distinction (#1640):** The Associations section needs to indicate when a target concept is retired, separately from when the mapping itself is retired. Has concrete examples and @snyaggarwal's agreement that both states should be shown.
- **Expansion picker redesign (#1958):** Active design with 7 comments and Zeplin mockup. Proposes moving picker closer to affected content. Directly related to #2350.
- **ConceptMap-like mapping views (#1631):** @jamlung-ri raised unresolved questions about ConceptMap-style views. May overlap with #1758.

### Recommended Dispositions

| Issue | Action | Rationale |
|---|---|---|
| #1442 | **Closed** (duplicate) | Superseded by #1640 |
| #1640 | **Closed** | Retired concept vs. mapping distinction — closed during review |
| #1619 | **Closed** (superseded) | Version creation form exists in oclweb3 |
| #1628 | **Closed** (stale) | Empty placeholder for notifications — no design spec |
| #1629 | **Closed** (stale) | Empty placeholder for comments — no design spec |
| #1630 | **Closed** (superseded) | Fully implemented in `UserMenu.jsx` |
| #1631 | **Closed** | Mappings list view — closed during review |
| #1958 | **Keep** | Active design work with real requirements |
| #346 | **Closed** (outdated) | Pre-V3 Malawi mockup; superseded by TBv3 |

### Open Design Questions

- **Retired status indicators (#1640):** What visual treatment distinguishes "this mapping is retired" from "the target concept is retired"? What about when both are retired?
- **Expansion picker placement (#1958):** Where should the picker live relative to content tabs? Per-tab or single picker?
- **Mapping list scope (#1631):** Is a ConceptMap-style columnar view a real requirement?

---

# 5. Navigation & Layout

### What Was Built

- **Page templates (#1379):** V3 has its own page template system, superseding this ticket.
- **Responsive basics (#1971):** oclweb3 uses Material-UI with baseline responsive behavior, but no explicitly mobile-optimized views.

### What Is Pending

- **Mobile-optimized views (#1971):** @paulsonder created a mockup showing a mobile dashboard view on iPhone 16. The issue body is incomplete but the intent is clear: field users increasingly access OCL on mobile.

### Recommended Dispositions

| Issue | Action | Rationale |
|---|---|---|
| #1379 | **Close as stale** | Superseded by V3 implementation |
| #1380 | **Close as stale** | Marketing website redesign — no work done, separate concern |
| #1971 | **Keep** | Active design work with mockup, low-medium priority |

### Open Design Questions

- **Mobile scope (#1971):** Minimum viable mobile experience — read-only browsing or editing too?
- **Mobile navigation pattern:** Current left-sidebar doesn't work on small screens. Bottom tabs, hamburger, or something else?

---

# 6. Pre-V3 Legacy & API

### #132 — Create smarter (& smaller) import results response designed for processing

- **Created:** 2019-06-28 — the oldest Design issue at 7 years old.
- Proposes simplified import results format (URL + status code only) for programmatic processing.
- @paynejd commented (2020-09-09): "Let's include this as part of the ocldev2 approach."
- oclweb3 has `ImportHome.jsx` with basic import task management. Import infrastructure has evolved substantially since 2019.

**Disposition: close-stale** — 7 years old, original context (ocldev2) is obsolete. If still needed, create a fresh ticket scoped to current API.

---

# 7. CIEL Active Work

### #2350 — Implement TBv3 collection versions and expansions controls

- **Created:** 2026-02-13. Milestoned to [CIEL Implementers] Collection & Reference Creation E2E Workflow.
- Detailed acceptance criteria for: versions tab, version selector, expansions management.
- Backend support is complete — this is purely a UI/UX implementation ticket.
- Related to #1958 (Expansion picker) — #2350 is the implementation ticket, #1958 is the UX design.

**Disposition: keep** — Active, milestoned, detailed. Current work.

Note: #1949 (Repo - References list) and #1953 (Detail view: References) are also CIEL-milestoned Design issues but they overlap with the TBv3 bucket — covered in Section 2.

### Open Design Questions

- **Relationship to #1958:** Should the expansion picker design be finalized before #2350 implementation, or can they proceed in parallel?
- **Version selector complexity:** How should it handle collections with many versions (e.g., CIEL quarterly releases)?

---

## Appendix A: Issue Index

| # | Title | Status | Disposition | Section |
|---|---|---|---|---|
| 132 | Create smarter import results response | CLOSED | closed-stale | 6 |
| 346 | Malawi Mockup for Metadata Browser | CLOSED | closed-outdated | 4 |
| 1318 | Highlight concept attributes/associations modified in collection | OPEN | keep (tbv3) | 2 |
| 1376 | Create and Update Concepts and Mappings | OPEN | keep (tbv3) | 2 |
| 1379 | TermBrowser page templates redesign and navigation | CLOSED | closed-stale | 5 |
| 1380 | OCL online (website) redesign | CLOSED | closed-stale | 5 |
| 1381 | Design system | CLOSED | closed-stale | 3 |
| 1398 | Table empty states | CLOSED | closed-stale | 3 |
| 1442 | Design for a retired concept vs. retired mapping | CLOSED | closed-duplicate | 4 |
| 1478 | Repository version summary | OPEN | keep (tbv3) | 2 |
| 1522 | Deep linking | OPEN | keep (tbv3) | 2 |
| 1607 | Advanced search MVP | OPEN | keep (tbv3) | 2 |
| 1614 | Change requests and management | OPEN | keep (tbv3) | 2 |
| 1615 | Form / Create repo | OPEN | keep (tbv3) | 2 |
| 1616 | Form / Create org | OPEN | keep (tbv3) | 2 |
| 1618 | Form / Repo / Add references | OPEN | keep (tbv3) | 2 |
| 1619 | Form / Create Version | CLOSED | closed-superseded | 4 |
| 1620 | Concept detail view / Header | OPEN | keep (tbv3) | 2 |
| 1621 | Concept Detail view / Associations card | OPEN | keep (tbv3) | 2 |
| 1622 | Detail view / Change request | OPEN | keep (tbv3) | 2 |
| 1623 | Detail view / Compare | OPEN | keep (tbv3) | 2 |
| 1624 | Operations panel | OPEN | keep (tbv3) | 2 |
| 1625 | Consumer: Repository | OPEN | keep (tbv3) | 2 |
| 1626 | Profile / Org | OPEN | keep (tbv3) | 2 |
| 1628 | Notifications | CLOSED | closed-stale | 4 |
| 1629 | Comments | CLOSED | closed-stale | 4 |
| 1630 | My account menu | CLOSED | closed-superseded | 4 |
| 1631 | List view / Mappings | CLOSED | closed | 4 |
| 1632 | Community website | CLOSED | closed-stale | 4 |
| 1640 | Design for retired mappings vs. concepts | CLOSED | closed | 4 |
| 1700 | Hierarchy/Cascade Component | OPEN | keep (tbv3) | 2 |
| 1738 | Concept detail view / Collection membership | OPEN | keep (tbv3) | 2 |
| 1739 | Concept detail view / History | OPEN | keep (tbv3) | 2 |
| 1763 | Concept tracing / Modification indicators | OPEN | keep (tbv3) | 2 |
| 1776 | Objects (Chip view) | OPEN | keep (tbv3) | 2 |
| 1798 | User settings page | OPEN | keep (tbv3) | 2 |
| 1864 | Global Search / Org | OPEN | keep (tbv3) | 2 |
| 1902 | Concept / Membership | OPEN | keep (tbv3) | 2 |
| 1948 | Repo - Mappings list | OPEN | keep (tbv3) | 2 |
| 1949 | Repo - References list | OPEN | keep (tbv3) | 2 |
| 1951 | Repo - Overview | OPEN | keep (tbv3) | 2 |
| 1953 | Detail view: References | OPEN | keep (tbv3) | 2 |
| 1958 | Expansion picker | OPEN | keep | 4 |
| 1960 | Object preview | OPEN | keep | 3 |
| 1971 | Mobile updates | OPEN | keep | 5 |
| 2350 | Collection versions and expansions controls | OPEN | keep | 7 |

**Summary by disposition (Design-only, excluding 28 TBv3 overlap):**

| Disposition | Count | Action |
|---|---|---|
| closed-stale | 8 | Closed — no meaningful activity or empty placeholder |
| closed-superseded | 2 | Closed — implemented in oclweb3 |
| closed-outdated | 1 | Closed — pre-V3 requirements no longer relevant |
| closed-duplicate | 1 | Closed — duplicated by #1640 |
| closed (review) | 2 | Closed during review (#1631, #1640) |
| keep | 4 | Retained as active design work (#1958, #1960, #1971, #2350) |
| **Total Design-only** | **18** | |

---

## Appendix B: Contributor Map

| Contributor | Issues | Primary Sections |
|---|---|---|
| @paulsonder | #1379, #1380, #1381, #1398, #1619, #1628, #1629, #1630, #1631, #1632, #1640, #1958, #1960, #1971 + most TBv3 overlap | 2, 3, 4, 5 |
| @jamlung-ri | #346, #1640, #1958, #1960 + TBv3 overlap | 2, 4 |
| @snyaggarwal | #1630, #1640 (comments) + TBv3 overlap | 2, 4 |
| @paynejd | #132 (comment), #1607 + TBv3 overlap | 2, 6 |

**Notes:**
- @paulsonder is the primary design contributor, authoring the majority of TBv3 design specs and the design system foundation. Any bulk closure actions should be coordinated with Paul.
- @jamlung-ri has been active in recent design reviews, particularly around concept detail views and expansion controls.
