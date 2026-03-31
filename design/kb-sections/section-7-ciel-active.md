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
| 132 | Create smarter import results response | OPEN | close-stale | 6 |
| 346 | Malawi Mockup for Metadata Browser | OPEN | close-outdated | 4 |
| 1318 | Highlight concept attributes/associations modified in collection | OPEN | keep (tbv3) | 2 |
| 1376 | Create and Update Concepts and Mappings | OPEN | keep (tbv3) | 2 |
| 1379 | TermBrowser page templates redesign and navigation | OPEN | close-stale | 5 |
| 1380 | OCL online (website) redesign | OPEN | close-stale | 5 |
| 1381 | Design system | OPEN | close-stale | 3 |
| 1398 | Table empty states | OPEN | close-stale | 3 |
| 1442 | Design for a retired concept vs. retired mapping | OPEN | close-duplicate | 4 |
| 1478 | Repository version summary | OPEN | keep (tbv3) | 2 |
| 1522 | Deep linking | OPEN | keep (tbv3) | 2 |
| 1607 | Advanced search MVP | OPEN | keep (tbv3) | 2 |
| 1614 | Change requests and management | OPEN | keep (tbv3) | 2 |
| 1615 | Form / Create repo | OPEN | keep (tbv3) | 2 |
| 1616 | Form / Create org | OPEN | keep (tbv3) | 2 |
| 1618 | Form / Repo / Add references | OPEN | keep (tbv3) | 2 |
| 1619 | Form / Create Version | OPEN | close-superseded | 4 |
| 1620 | Concept detail view / Header | OPEN | keep (tbv3) | 2 |
| 1621 | Concept Detail view / Associations card | OPEN | keep (tbv3) | 2 |
| 1622 | Detail view / Change request | OPEN | keep (tbv3) | 2 |
| 1623 | Detail view / Compare | OPEN | keep (tbv3) | 2 |
| 1624 | Operations panel | OPEN | keep (tbv3) | 2 |
| 1625 | Consumer: Repository | OPEN | keep (tbv3) | 2 |
| 1626 | Profile / Org | OPEN | keep (tbv3) | 2 |
| 1628 | Notifications | OPEN | close-stale | 4 |
| 1629 | Comments | OPEN | close-stale | 4 |
| 1630 | My account menu | OPEN | close-superseded | 4 |
| 1631 | List view / Mappings | OPEN | review | 4 |
| 1632 | Community website | OPEN | close-stale | 4 |
| 1640 | Design for retired mappings vs. concepts | OPEN | keep | 4 |
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
| close-stale | 8 | Close — no meaningful activity or empty placeholder |
| close-superseded | 2 | Close — implemented in oclweb3 |
| close-outdated | 1 | Close — pre-V3 requirements no longer relevant |
| close-duplicate | 1 | Close — duplicated by #1640 |
| keep | 5 | Retain as active design work |
| review | 1 | Needs human review (#1631) |
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
