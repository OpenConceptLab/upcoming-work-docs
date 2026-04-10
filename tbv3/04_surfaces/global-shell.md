# Surface: Global Shell

## Scope

Persistent UI chrome present on every page in TBv3: the top navigation bar and the search / filter bar that appears within tab content areas.

---

## Global Shell Bar

The top-most bar is always visible across all pages.

```
┌──────────────────────────────────────────────────────────────────────┐
│  [☰]  [OCL logo]          [Search OCL...]          [🔔]  [+]  [👤]  │
└──────────────────────────────────────────────────────────────────────┘
```

| Element | Notes |
|---|---|
| Hamburger menu (☰) | Opens/closes the left navigation panel |
| OCL logo | Links to home |
| Search OCL | Global search bar — searches across all of OCL (see Search / Filter Bar below) |
| Notification bell (🔔) | User notifications |
| + button | Quick create action |
| User avatar (👤) | Account menu |

---

## Search / Filter Bar

The search / filter bar appears at the top of each content tab (Concepts, Mappings, References). It is scoped to the current repository and tab by default, but can also be used for global search via the shell bar.

### Scope

- **Within repository** (default in tab context): searches concepts, mappings, or references in the current repository and version context
- **Global** (shell bar): searches across all of OCL; returns results grouped by resource type

### Filter Selection

Pressing the bracket shortcut key (`⌘` on Mac) while the bar is focused opens a filter type selector showing chips for the most common filter dimensions. Keyboard hints are displayed at the bottom of the selector:

- **Navigate** — arrow keys move between filter options
- **Select** — Enter or Space selects the highlighted filter

**Universal filter chips** (available across tabs):

| Chip | Filters by |
|---|---|
| Organization | Owner org |
| Repository | Specific source or collection |
| Class | Concept class |
| User | Creator / owner |

**Tab-specific filters:**

| Tab | Additional filters |
|---|---|
| Concepts | Concept Class, Datatype, Status (Active / Retired), Locale |
| Mappings | Map Type, From/Target Source, Concept Class (Source/Target), Concept Owner (Source/Target) |
| References | Reference type (resource-versioned / repo-versioned / unversioned), Expression type (extensional / intensional), Cascade, Include/Exclude direction |

### Behavior

- Results update live as the user types (no submit required)
- Active filters appear as removable chips inside the bar; each chip has an ✕ to clear
- Placeholder text when focused and empty: "Select a filter with [⌘] keys"
- Clearing all filters restores the full unfiltered list

---

## Relationship to Other Files

- `04_surfaces/repository-page.md` — the repo context bar and Manage Repository dropdown that appear below the global shell on repository pages
- `04_surfaces/concept-detail.md` — the concept detail split view opened from the Concepts tab
- `04_surfaces/mapping-detail.md` — the mapping detail split view opened from the Mappings tab
