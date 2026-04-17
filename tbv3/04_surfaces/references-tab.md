# Surface: References Tab

## Scope

Layout and interaction specification for the **References** tab on a Collection repository page. This file covers the full tab surface — including M42 deliverables and post-M42 enhancements.

For the underlying business rules (adding, transforming, removing references), see `02_capabilities/manage-references.md`.

For the visual mockup, see `04_surfaces/mockups/repository-page-references-mockup.html`.

---

## MVP Deliverables

> **Milestone note:** This section describes the MVP end state for the References tab across milestones. In the current milestone, the row action menu includes **Preview** only. Bulk **Transform** and **Remove** remain part of MVP scope, but are scheduled for a later MVP milestone rather than the current one.

### Flat List View

**Toolbar (HEAD):**
- Count label: `N references`
- Search/filter input
- Expansion selector (controls which expansion's resolved counts are shown)
- Display mode toggle: Expression | Results
- `+ Add References` (owners/editors; opens Add References dialog — spec in `manage-references.md`)
- `Transform` (enabled when ≥1 reference selected; bulk transform)
- `Remove` (enabled when ≥1 reference selected; bulk remove)

**Toolbar (released version):**
- Same controls, but `+ Add References`, `Transform`, and `Remove` are disabled
- Version state bar below toolbar: "Viewing v[X]. Switch to HEAD to modify references."

**Table columns:** Checkbox | Expander | Expression | Ref Type | Resolved Repo | Results | ⋮

| Column | Notes |
|---|---|
| Checkbox | Enables bulk selection; header checkbox selects/deselects all visible |
| Expander | ▶/▼ toggle; see **Inline Expansion** (post-M42 below) |
| Expression | Full URL or query string; truncated with ellipsis; full value on hover |
| Ref Type | Chip: Intensional (blue) · Extensional (blue) · Cascade (green) · Exclude (red) |
| Resolved Repo | Source chip showing resolved source + version (e.g., CIEL v2024-08-01) |
| Results | Resolved concept/mapping count (e.g., "5,484 concepts" or "1 concept, 2 mappings") |
| ⋮ | Row action menu |

**Row states:**
- Selected: `background: #f7f5ff`, left-border accent
- Exclusion reference: red Exclude chip in Ref Type column

**Row action menu (⋮):**
- Preview — opens Reference Detail split view

**Reference Detail split view** (opens on row click or Preview action):

- Uses the same right-side split view pattern as Concept Detail; the references list remains interactive behind it
- On smaller breakpoints where split view is not available, navigate to the same reference detail surface as a full page
- Header includes:
  - Reference icon + ID
  - Full expression / canonical URL
  - `Actions ▾` menu for reference-level utilities
- Footer includes:
  - "Last resolved [timestamp]" status text
  - Download action
  - Share action

Two-tab panel:

*Tab 1 — Details:*
- Type (chip)
- Expression (monospace block)
- Source version (chip + canonical/pinned indicator)
- Cascade method
- Include flag
- Filters (if intensional)
- If present, show cascade map types, cascade levels, and return map types as additional metadata rows

*Tab 2 — Expansion:*
- Resolved concept + mapping counts
- Source note (which expansion these counts reflect)
- Expandable concept → mapping tree using the same pattern described in **Expandable row layout (concept sub-rows)** below
- Concept rows show code, display name, mapping count, and repository chip
- Expanding a concept row reveals its mapping rows inline beneath it
- Orphaned mappings appear as a separate expandable group below the concept rows
- If the result set is truncated, show a muted "...and N more" footer below the tree

---

## Later Milestones

### Surface / References Tab / Inline Expansion

**Ticket:** TBD (see `tbv3-ticket-execution-log.md` Section 6)

**What it is:** Each reference row can be expanded (▼) to show the individual concepts and mappings it resolves to, inline within the table — without opening the detail split view. This is distinct from the detail split view's Expansion tab in that it keeps the user in the list context and supports row-by-row inspection.

**Expandable row layout (concept sub-rows):**

```
▼  /orgs/CIEL/sources/CIEL/concepts/?conceptClass=Test   Intensional   CIEL v2024-08-01   5,484 concepts   ⋮
      ▼  [1380 · Nutrition counselling | CIEL]                                              1 concept, 2 mappings
            [SAME-AS]  [QA701 | WHO / ICD-11]                                              Resolved
            [NARROWER-THAN]  [182006 | SNOMED CT]                                          Resolved
      ▶  [5484 · Nutritional support | CIEL]                                               1 concept, 1 mapping
      ▶  [3221 · Body weight measurement | CIEL]                                           1 concept, 3 mappings
      …
```

**Rules:**
- Concept sub-rows show a concept chip (`CODE · Name | SOURCE`) and a resolved count
- Concept sub-rows are themselves expandable (▶/▼) to show their mapping sub-rows
- Mapping sub-rows show map type label + target concept chip
- Concepts and their mappings are grouped together; mappings not associated with any concept in this reference appear as a separate **Orphaned Mappings** group
- The Orphaned Mappings group row shows a ▶ expander, a count ("Orphaned mappings (N)"), and an "Included" count

**Orphaned Mappings group row:**

```
▶  Orphaned mappings (2)                                 Mapping                            Included
   Not attached to any resolved concept in this reference
```

Expanding the orphaned group shows the individual orphaned mapping sub-rows in the same format as regular mapping sub-rows.

**Out of scope for this ticket:** pagination within an expanded reference (first N concepts shown with a "load more" affordance is acceptable MVP behavior).

---

### Surface / References Tab / Group by Source

**Ticket:** TBD (see `tbv3-ticket-execution-log.md` Section 6)

**What it is:** A view mode toggle in the toolbar that collapses the flat reference list into source-grouped sections. Designed for collections with many extensional references to the same source that differ only by concept ID and cascade setting.

**Toolbar change:** "Group by: Source ▾" control; highlighted (active state) when enabled.

**Count label changes to:** `N references · M sources`

**Group header row:**

```
▼  [CIEL v2024-08-01]  8 references  cascade: Source to Mappings   [Transform all]  [Remove all]  ⋮
```

| Element | Notes |
|---|---|
| ▼/▶ | Expands/collapses the group |
| Source chip | Color-coded per source (consistent across the tab); shows source + resolved version |
| Count badge | Number of references in this group |
| Cascade | Shared cascade setting for the group; if references within the group have mixed cascade settings, show "Mixed" |
| Transform all | Applies a selected transform to all references in the group where valid |
| Remove all | Removes all references in the group (confirmation dialog) |
| ⋮ | Group-level action menu |

**Concept rows within a group:**
- Simpler column layout: Checkbox | Expander | Concept chip (CODE · Name) | Results | ⋮
- No Expression or Resolved Repo columns — source context is in the group header
- Exclusion references within a group show a red Exclude chip before the concept chip
- Expandable (▼) to show mapping sub-rows (requires Inline Expansion ticket)

**Group source chip colors:**
- Use a consistent per-source color drawn from the design system palette (blue, teal, green, etc.)
- Color is stable within a session (same source always same color)

**Interaction notes:**
- Checkbox on a group header selects all references in the group
- Groups with mixed cascade settings display "Mixed" as the cascade label and disable "Transform all"
- The Group by Source toggle is a display-only change; it does not modify the underlying references
