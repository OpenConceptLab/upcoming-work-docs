# Surface: Repository Page

## Scope

Layout and navigation specification for the **Repository Detail Page** — the primary page for viewing and managing a single repository (Source or Collection). This page is the container for all repository-level tabs and the persistent header.

---

## Page Entry Points

- Search results → repository chip or row
- Global navigation → Org page → repository card
- Direct URL: `/{org}/{repo-type}/{repo-id}/`
- Notification link → specific tab within the repo
- Comparison drawer link share → repo + tab + resource pre-selected

---

## URL Structure

```
/{org}/{repo-type}/{repo-id}/                          → Concepts tab (default)
/{org}/{repo-type}/{repo-id}/concepts/                 → Concepts tab
/{org}/{repo-type}/{repo-id}/mappings/                 → Mappings tab
/{org}/{repo-type}/{repo-id}/references/               → References tab (Collections only)
/{org}/{repo-type}/{repo-id}/versions/                 → Versions + Expansions tab
/{org}/{repo-type}/{repo-id}/about/                    → About tab
/{org}/{repo-type}/{repo-id}/proposals/                → Proposals tab (if feature enabled)
/{org}/{repo-type}/{repo-id}/settings/                 → Settings (owners only)
```

Where `{repo-type}` is `sources` or `collections`.

Version context is applied via query parameter or path segment:

```
/{org}/{repo-type}/{repo-id}/concepts/?version=v2024-11-01
/{org}/{repo-type}/{repo-id}/concepts/?version=HEAD
```

Default: most recently released version if one exists; HEAD otherwise.

---

## Page Structure

```
┌──────────────────────────────────────────────────────────────────────┐
│  GLOBAL SHELL BAR                                                    │
│  [☰]  [OCL logo]          [Search OCL...]          [🔔]  [+]  [👤]  │
├──────────────────────────────────────────────────────────────────────┤
│  REPO CONTEXT BAR                                                    │
│  [owner chip]  [repo name · Type chip]  [Version: HEAD ▾]  [👁]    │
│                                               [Manage Repository ▾]  │
├──────────────────────────────────────────────────────────────────────┤
│  PAGE TITLE                                                          │
│  Repository Name  (H1)                                               │
│  [Dependency notification banner — conditional]                      │
├──────────────────────────────────────────────────────────────────────┤
│  TAB BAR                                                             │
│  Concepts  Mappings  [References]  Versions+Expansions  About        │
│  [Proposals]  [Settings ⚙]                                           │
├──────────────────────────────────────────────────────────────────────┤
│  TAB CONTENT AREA                                                    │
│  (fills remaining viewport; scrollable; split view occupies right    │
│   half when open)                                                    │
├──────────────────────────────────────────────────────────────────────┤
│  COMPARISON DRAWER (bottom, conditional — see design-system.md)      │
└──────────────────────────────────────────────────────────────────────┘
```

---

## Repository Header

### Global Shell Bar (implemented)

The top-most bar is always present across all pages:

| Element                | Notes                                  |
| ---------------------- | -------------------------------------- |
| Hamburger menu (☰)    | Opens/closes the left navigation panel |
| OCL logo               | Links to home                          |
| Search OCL             | Global search bar, center-aligned      |
| Notification bell (🔔) | User notifications                     |
| + button               | Quick create action                    |
| User avatar            | Account menu                           |

### Repo Context Bar (implemented)

Directly below the shell bar, scoped to the current repository:

| Element                          | Notes                                                                                                      |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| **Owner chip**             | Owner username/org; links to owner page                                                                    |
| **Repo name · Type chip** | Repository name with type label (e.g., "cascade-04nov25 · Collection"); links to repo                     |
| **Version selector**       | "Version: HEAD ▾" dropdown; changes version context across all tabs; shows HEAD and all released versions |
| **Eye icon (👁)**          | Watch / visibility toggle                                                                                  |
| **Manage Repository ▾**   | Dropdown menu for repo management actions (see below)                                                      |

### Manage Repository Dropdown (implemented)

Available to owners and editors:

| Action                   | Icon         | Notes                                                  |
| ------------------------ | ------------ | ------------------------------------------------------ |
| **Edit**           | ✏️         | Edit repository metadata (name, description, settings) |
| **Add Concept**    | ➕           | Open the Add Concept form                              |
| **Add Mapping**    | ➕           | Open the Add Mapping form                              |
| **Create Version** | version icon | Open the Create Version dialog                         |
| **Delete Repo**    | 🗑️ (red)   | Permanently delete the repository; destructive action  |

### Page Title (implemented)

Below the repo context bar, the repository name is rendered as an H1 page title.

### Planned Header Elements (not yet implemented)

| Element           | Notes                       |
| ----------------- | --------------------------- |
| Short description | Single line below repo name |
| Canonical URL     | Copyable chip if set        |
| Star / Follow     | For authenticated users     |

### Conditional Elements (not yet implemented)

**Dependency notification banner** (yellow, dismissible)

- Shown when: collection has an unreviewed dependency update from an upstream source release
- Content: "⚠ [Source Name] released [versionID]. [N] references may be affected. [Review updates →]"
- Dismiss: hides for the session; reappears on next visit until update workflow is completed
- See `02_capabilities/manage-versions-and-expansions.md` for full notification logic

**Validation error banner** (red, persistent) — post-M42

- Shown when: collection has one or more Error-level validation violations
- Content: "❌ This collection has [N] validation errors. [View errors →]"
- Not dismissible until errors are resolved or suppressed

---

## Tab Bar

### Tab Definitions

| Tab                             | Available For                           | Default? | Notes                                                       |
| ------------------------------- | --------------------------------------- | -------- | ----------------------------------------------------------- |
| **Concepts**              | Source, Collection                      | ✅ Yes   | Lists concepts in current version context                   |
| **Mappings**              | Source, Collection                      | No       | Lists mappings in current version context                   |
| **References**            | Collection only                         | No       | Lists references; primary authoring surface for collections |
| **Versions + Expansions** | Source (Versions only), Collection      | No       | Full spec:`04_surfaces/versions-expansions-tab.md`        |
| **About**                 | Source, Collection                      | No       | Metadata, description, linked resources, FHIR metadata      |
| **Proposals**             | Source, Collection (if feature enabled) | No       | Concept proposal queue; admin and proposer views            |
| **Settings ⚙**           | Source, Collection                      | No       | Owner/editor only; gear icon; not shown to read-only users  |

### Tab Visibility Rules

- **References** tab: only shown for Collections (never Sources)
- **Proposals** tab: shown when the Concept Proposals feature is enabled for the org; visibility to non-owners is controlled by org settings
- **Settings** tab: only shown to users with owner or editor permission on the repo

### Active Tab Indicator

- Underline on active tab label
- Active tab label is bold
- URL updates to reflect the active tab (see URL structure above)

---

## Concepts Tab

### Layout

```
[filter icon]  [N concepts]                         [Sort ▾]  [Display ▾]
──────────────────────────────────────────────────────────────────────────
□  ID ↑   Display Name                    Concept Class      Datatype
□  1      Malaria                         Diagnosis          N/A
□  100    newest                          Aggregate-Measurement
□  1065   Yes                             Misc               N/A
...
──────────────────────────────────────────────────────────────────────────
Rows per page: 25 ▾       1–12 of 12      |◀  ◀  ▶  ▶|
```

### Toolbar

- **Count label**: "N concepts" displayed in the toolbar (updates with active filters)
- **Filter icon**: opens filter controls
- **Sort ▾**: sort dropdown (field + direction); default appears to be ID ascending (ID ↑)
- **Display ▾**: display mode toggle (list view options)

### Columns (implemented)

| Column        | Notes                                                       |
| ------------- | ----------------------------------------------------------- |
| Checkbox      | Enables bulk selection                                      |
| ID ↑         | Concept ID; sortable; currently sorted ascending by default |
| Display Name  | Preferred display name in context locale                    |
| Concept Class | e.g., Diagnosis, Drug, Misc, Question, Procedure, Test      |
| Datatype      | e.g., Coded, Numeric, N/A                                   |

### Concept Row

- Clicking a row opens the Concept Detail panel in split view (right half of content area) — see `04_surfaces/concept-detail.md`
- Selected row is highlighted (blue background)
- Retired concepts: greyed out text

### Concept Detail Split View (Details tab)

When a concept row is clicked, the right panel opens showing:

**Header**

- Concept ID (numbered chip, e.g., `● 1`)
- Concept display name (H2)
- Close (×) button
- **Details** | **History** tabs

**Details tab — Properties section**

- Concept Class
- Datatype

**Details tab — Name and synonyms section**

- Count badge (e.g., "7")
- Each name row: locale code (EN, FR, ES…) | name text | name type badge (FULLY_SPECIFIED) | flag icon | External ID | copy button

**Details tab — Descriptions section**

- Count badge
- Each description: locale code | description text

### Pagination

- "Rows per page: N ▾" selector at bottom left
- "1–N of N" count
- First / Previous / Next / Last page navigation arrows

### Empty State

```
No concepts found.
[Add first concept]  [Adjust filters]
```

---

## Mappings Tab

### Layout

Same pattern as Concepts tab.

### Columns

- From Concept | Map Type | To Concept / To Source Code | Sort Weight | Status | Actions

### Filter Bar

- Map Type filter (multi-select)
- From Concept search
- To Concept / Code search
- Status filter (Active / Retired)

### Mapping Row

- Clicking a row opens a mapping detail side panel (lighter than concept detail; no full split view)
- Row actions: View, Edit, Add to Comparison

---

## References Tab (Collections Only)

### Layout

```
┌──────────────────────────────────────────────────────────────────────┐
│  [Search/filter bar]   [Expansion: Name ▾]  [Display: Expression ▾] │
│  [+ Add References]    [Transform ▾]  [Remove]  (active on selection)│
├────┬───┬──────────────────────────────────┬──────────────┬───────────┤
│ □  │ ▶ │ Expression                       │ Type         │ Filters   │
├────┼───┼──────────────────────────────────┼──────────────┼───────────┤
│ □  │ ▶ │ /orgs/CIEL/sources/CIEL/conc...  │ Concepts     │ —         │
│ □  │ ▶ │ /orgs/PIH/sources/test/          │ Concepts     │ Class+Test│
│    │   │   └─ 5484  Nutritional support   │              │           │
│    │   │   └─ 1380  Nutrition counselling │              │           │
│    │   │       └─ [mapping] SAME-AS ...   │              │           │
│ □  │ ▶ │ http://url.org/12345             │ Concepts     │ —         │
│ □  │ ▶ │ http://url.org/v1/1212           │ Mapping      │ —         │
└────┴───┴──────────────────────────────────┴──────────────┴───────────┘
```

---

### Toolbar

| Control                       | Notes                                                                                                                                                                                                                                      |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Search/filter bar             | Omni-search scoped to references in this collection                                                                                                                                                                                        |
| **Expansion selector**  | Dropdown selecting which expansion's resolved data to display; defaults to the collection's default expansion. Switching updates resolved counts and repository chips in Results mode. If no expansion exists, resolved columns show "—". |
| **Display mode toggle** | Switches between Expression and Results views (see below)                                                                                                                                                                                  |
| Density/view toggle           | Standard list density control                                                                                                                                                                                                              |
| **+ Add References**    | Opens the Add References dialog; visible to owners/editors only                                                                                                                                                                            |
| **Transform ▾**        | Bulk transform dropdown; activates when one or more reference rows are selected                                                                                                                                                            |
| **Remove**              | Bulk remove; activates when one or more reference rows are selected                                                                                                                                                                        |

---

### Display Modes

The tab supports two modes toggled via the **Display** dropdown in the toolbar.

**Expression mode** (default)

Columns: Expression | Type | Filters

- **Expression**: the raw reference URL, truncated to fit the column (full URL visible on hover and row expansion)
- **Type**: resource type the reference targets (Concepts / Mapping)
- **Filters**: any intensional filter criteria applied to this reference (e.g., `Class+Test`); "—" for extensional references

**Results mode**

Columns: Definition | Type | Filters | Resolved Repository | Results

- **Definition**: same as Expression; the raw reference URL
- **Resolved Repository**: chip showing the source + version this reference resolves to in the selected expansion. Must display the resolved repository — not just the canonical URL — because Canonical URL Registry configuration can route identical canonical URLs to different repositories depending on configuration
- **Results**: for single-concept references, shows the concept's display name; for multi-concept references, shows a count summary (e.g., "3 concepts, 10 mappings"); "—" if no expansion selected

---

### Reference Rows

#### Checkboxes

Only reference rows have checkboxes. Resolved concept and mapping sub-rows do not have checkboxes. Selecting one or more reference rows activates the **Transform** and **Remove** toolbar actions.

#### Row Expansion (▶ toggle)

Clicking ▶ expands a reference row inline to show the concepts and mappings it resolves to in the selected expansion:

- **Concept sub-rows**: Code | Display name | mapping count chip
- **Mapping sub-rows**: nested directly beneath their parent concept — shows map type and target concept/code
- **Orphaned mappings**: mappings resolved by this reference that are not associated with any concept in the results; shown as a separate group below the concept list
- Concept and mapping chips support hover tooltips

#### Row Action Menu (⋮)

Available per reference row:

| Action    | Notes                                                                        |
| --------- | ---------------------------------------------------------------------------- |
| Preview   | Evaluate this reference on-the-fly without saving; shows what it resolves to |
| Transform | Change the version pinning strategy for this single reference                |
| Remove    | Remove this reference from the collection HEAD                               |

---

### Filtering

The search bar scopes to references within this collection. Additional filter options in the filter bar:

- **Reference type**: resource-versioned | repo-versioned | unversioned
- **Expression type**: extensional | intensional
- **Cascade**: cascaded references only
- **Direction**: include references only | exclude references only

Sort is hidden initially (requires API support).

---

### Bulk Actions

With one or more reference rows selected:

**Transform ▾** dropdown options:

- Transform to unversioned
- Transform to repo-versioned
- Lock to repo version

Only options valid for the selected references are enabled; invalid ones are skipped with a report shown after the operation.

**Remove** opens a confirmation dialog showing the count of references and an estimate of how many concepts/mappings will be removed from the expansion.

---

### Add References Entry Points

- **"+ Add References" button**: opens the Add References dialog — search and select concepts/mappings from outside the collection, configure cascade, preview before adding. See `02_capabilities/manage-references.md`.
- **"New Reference"** (in ⋮ More menu): opens the New Reference dialog — manual expression entry, supports intensional (filter-based) references. See `02_capabilities/manage-references.md`.

---

### Empty State

```
No references yet.
References define what content belongs in this collection.
[Add References]
```

---

### HEAD vs. Released Version Behavior

- All write actions (Add, Transform, Remove, checkboxes) are only available when viewing **HEAD**
- When viewing a released version: checkboxes hidden, toolbar shows only search/filter and Display controls, row action menus show View and Preview only
- A "Viewing [version ID] — switch to HEAD to edit" indicator is shown in the toolbar when not on HEAD

---

### Post-M42: Validation Summary Bar

> **Not in scope for M42.** Real-time schema validation (#2346) is deferred.

When implemented, a validation summary bar will appear between the toolbar and the list showing error/warning counts, linking to the Validation Report Panel (`02_capabilities/validate-content.md`).

---

## About Tab

### Sections

- **Description**: full markdown description (rendered); edit inline for owners
- **Details**: Created, Updated, Canonical URL, Supported Locales, Default Locale, Custom Validation Schema, FHIR resource type (if applicable)
- **External Links**: up to 5 linked resources with labels
- **Statistics**: Concept count, Mapping count, Reference count (collections), Version count, Subscriber count

---

## Proposals Tab

Full spec in `02_capabilities/manage-concept-proposals.md`.

### Proposer View (authenticated, non-admin)

- List of proposals they have submitted, with status
- "+ New Proposal" button

### Admin View (repo owner/admin)

- Full queue of all proposals with pending count
- Filter by status (Pending / Under Review / Approved / Rejected)
- Bulk actions: Assign reviewer, Reject selected

---

## Settings Tab (Owners Only)

Not fully specced in this document. Key sections:

| Section     | Content                                                                           |
| ----------- | --------------------------------------------------------------------------------- |
| General     | Name, description, canonical URL, external ID, default locale, supported locales  |
| Access      | Visibility (public/private), member access list, permission levels                |
| Validation  | Schema rules, validation templates — see `02_capabilities/validate-content.md` |
| Versions    | Default version behavior, auto-release settings                                   |
| Danger Zone | Archive, transfer ownership, delete                                               |

---

## Split View Behavior

When a concept or mapping is selected (clicked) anywhere on this page:

- Right half of the tab content area becomes the split-view panel
- Left half shows the list (narrowed)
- Split view panel shows the Concept Detail surface (`04_surfaces/concept-detail.md`)
- Closing the split view (X button or Esc) returns to full-width list
- Split view state is reflected in the URL (concept ID appended as query param)

---

## Responsive Behavior

| Viewport    | Behavior                                                                                        |
| ----------- | ----------------------------------------------------------------------------------------------- |
| ≥ 1200px   | Two-column split view available; full tab bar                                                   |
| 900–1199px | Split view stacks (concept detail below list); tab bar scrolls horizontally if needed           |
| < 900px     | No split view; concept detail navigates to a new full-page view; tabs collapse to dropdown menu |

---

## Relationship to Other Files

- `04_surfaces/concept-detail.md` — split-view panel content for concepts
- `04_surfaces/versions-expansions-tab.md` — full spec for the Versions + Expansions tab
- `04_surfaces/design-system.md` — shell layout, comparison drawer, chips, action menus, forms
- `02_capabilities/manage-references.md` — add/edit/transform references (References tab)
- `02_capabilities/manage-versions-and-expansions.md` — create/release versions, expansions, dependency notifications
- `02_capabilities/validate-content.md` — validation badges, validation report panel (References tab)
- `02_capabilities/manage-concept-proposals.md` — Proposals tab content
- `02_capabilities/configure-repository.md` — Settings tab content
