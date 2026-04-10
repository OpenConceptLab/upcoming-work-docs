# Surface: Mapping Detail

## Scope

The mapping detail panel — displayed when a user clicks a mapping row in the Mappings tab. Covers the split-view panel layout, the filter sidebar for the mappings list, and the mappings list itself.

---

## Mappings Tab Layout

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│  FILTER SIDEBAR (collapsible)  │  MAPPING LIST              │  DETAIL PANEL     │
│                                │                            │  (split view)     │
│  Filters  ▲                    │  94 mappings  [▼ filter]   │                   │
│  ─────────────────────────     │  [Source ▾] [Concept ▾]   │  ● 10483      ×   │
│  From and target Source        │  Sort by ▾                 │  Details  History │
│  Map Type                      │  ─────────────────────     │  ───────────────  │
│  Map Type Source               │  □ From   MapType  To      │  From             │
│  Concept Class (Source)        │  □ /...   SAME-AS  /...    │  [source chip]    │
│  Concept Owner (Source)        │  □ /...   SAME-AS  /...    │  code: 8  [⊞]    │
│  Concept Class (Target)        │  ...                       │                   │
│  Concept Owner (Target)        │  25 ▾  1-25 of 94  < >    │  Target           │
│                                │                            │  [source chip]    │
│                                │                            │  1424             │
│                                │                            │                   │
│                                │                            │  Properties       │
│                                │                            │  Map Type  ...    │
│                                │                            │  External ID ...  │
│                                │                            │  Source  [link]   │
│                                │                            │  Created  ...     │
│                                │                            │  Updated  ...     │
└─────────────────────────────────────────────────────────────────────────────────┘
```

---

## Filter Sidebar

The filter sidebar is collapsible (▲/▼ toggle). When open it provides faceted filtering for the mapping list.

| Filter | Notes |
|---|---|
| **From and target Source** | Filter by the source repository of the From concept, the To concept, or both |
| **Map Type** | Checkbox list of map types present in the current repo (e.g., SAME-AS, NARROWER-THAN, BROADER-THAN) |
| **Map Type Source** | Filter by the source that defines the map type |
| **Concept Class (Source)** | Filter From concepts by their concept class |
| **Concept Owner (Source)** | Filter From concepts by their owning org/user |
| **Concept Class (Target)** | Filter To concepts by their concept class |
| **Concept Owner (Target)** | Filter To concepts by their owning org/user |

Active filters from the sidebar are reflected as chips in the search/filter bar (see `04_surfaces/global-shell.md`).

---

## Mapping List

### Toolbar

| Control | Notes |
|---|---|
| **Count label** | "N mappings" — updates as filters change |
| **Filter icon** | Toggles the filter sidebar |
| **From and target Source ▾** | Quick-filter dropdown for source scoping |
| **From concept / To concept ▾** | Quick-filter or display toggle for concept direction |
| **Sort by ▾** | Sort the list (field + direction) |

### Columns

| Column | Notes |
|---|---|
| Checkbox | Enables bulk selection |
| From concept | Expression URL of the source concept; truncated, full URL on hover |
| Map Type | e.g., SAME-AS, NARROWER-THAN |
| To concept | Expression URL or code of the target concept |
| Repository chip | Resolved source repository for the To concept |
| Row actions | Edit, view, etc. |

### Pagination

- "Rows per page: N ▾" selector
- "1–N of N" count
- First / Previous / Next / Last navigation

---

## Mapping Detail Panel (Split View)

Opened when a mapping row is clicked. The right half of the content area becomes the detail panel; the list narrows to the left half.

### Panel Header

- **Mapping ID chip** (e.g., `● 10483`) — the internal mapping ID
- **Close (×)** button — collapses the split view
- **Details** | **History** tabs

---

### Details Tab

#### From

| Field | Notes |
|---|---|
| Source chip | Repository chip for the From concept's source (e.g., `orgs/CIEL/sources/CIEL/`) |
| Concept code | The concept ID / code in that source |
| Open icon (⊞) | Links to the full concept detail view |

#### Target

| Field | Notes |
|---|---|
| Source chip | Repository chip for the To concept's source |
| Concept code | The concept ID / code in that source |

#### Properties

| Field | Notes |
|---|---|
| Map Type | e.g., SAME-AS |
| External ID | System-assigned external identifier |
| Source | Link to the mapping's parent source |
| Created | Timestamp + creator |
| Updated | Timestamp + last editor |

---

### History Tab

Audit trail of changes to this mapping. Full spec follows the same pattern as the concept History tab (see `04_surfaces/concept-detail.md`).

---

## Relationship to Other Files

- `04_surfaces/global-shell.md` — search / filter bar used in the Mappings tab toolbar
- `04_surfaces/repository-page.md` — parent page containing the Mappings tab
- `04_surfaces/concept-detail.md` — parallel surface spec for concept detail; History tab follows the same pattern
- `01_objects/mapping.md` — mapping schema and business rules
