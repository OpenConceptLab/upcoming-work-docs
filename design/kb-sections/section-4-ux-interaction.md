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
| #1442 | **Close as duplicate** | Superseded by #1640, which has more detail |
| #1640 | **Keep** | Primary ticket for retired concept vs. mapping visual distinction |
| #1619 | **Close as superseded** | Version creation form exists in oclweb3 |
| #1628 | **Close as stale** | Empty placeholder for notifications — no design spec |
| #1629 | **Close as stale** | Empty placeholder for comments — no design spec |
| #1630 | **Close as superseded** | Fully implemented in `UserMenu.jsx` |
| #1631 | **Review** | Basic implementation exists but ConceptMap view discussion unresolved |
| #1958 | **Keep** | Active design work with real requirements |
| #346 | **Close as outdated** | Pre-V3 Malawi mockup; superseded by TBv3 |

### Open Design Questions

- **Retired status indicators (#1640):** What visual treatment distinguishes "this mapping is retired" from "the target concept is retired"? What about when both are retired?
- **Expansion picker placement (#1958):** Where should the picker live relative to content tabs? Per-tab or single picker?
- **Mapping list scope (#1631):** Is a ConceptMap-style columnar view a real requirement?

---
