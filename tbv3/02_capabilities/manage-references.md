# Capability: Manage References


## Scope

This capability covers all ways a user can define what content belongs in a collection: adding references from outside the collection context (e.g., from search results or concept detail), creating references from inside the collection, previewing reference results without saving, tracing a concept back to the reference that brought it in, transforming existing references, and removing references.

---

## Adding References from Outside the Collection (Add to Collection)

This is the most common path for Terminology Implementers building a dictionary. The user encounters a concept elsewhere in TBv3 and wants to add it to a collection they own.

### Entry Points
- Concept Detail (split view or full page) → "Add to Collection" CTA ✅ implemented
- Concept row in Search Results → action button or right-click menu ⬜ not yet wired
- Concept row while browsing a repository → action button or right-click menu ⬜ not yet wired
- Hierarchy view node → "Add to Collection" action ⬜ not yet wired

### Interaction Flow
1. User clicks "Add to Collection"
2. A dialog opens (`src/components/common/AddToCollectionDialog.jsx`):
   - **Collection selector**: searchable autocomplete of all collections the user has edit access to (personal + org), grouped by owner; live-filtered by collection name, ID, short code, or owner — no debounce. Each option shows the collection name on the left and a `RepoChip` on the right; the chip tooltip activates after a 1-second hover. Only HEAD collections are shown (you can only add references to HEAD).
   - **Cascade selector** (rendered via `src/components/common/CascadeSelector.jsx`):
     - **None** — add the concept only; no mappings or target concepts
     - **Source Mappings** — add the concept plus all its mappings within the same source (`method=sourcemappings`)
     - **OpenMRS** — traverse Q-AND-A and CONCEPT-SET mappings recursively, returning all reachable concepts and mappings (`method=sourcetoconcepts&mapTypes=Q-AND-A,CONCEPT-SET&cascadeLevels=*&returnMapTypes=*`)
     - **Custom** — expands an inline form (left-bordered) to specify `method`, `mapTypes`, `excludeMapTypes`, `cascadeLevels`, and `returnMapTypes` manually
   - **Transform** checkbox (default: unchecked) — applies the OpenMRS transform (`transformReferences=openmrs_concept_reference`) on top of the selected cascade. Only relevant for OpenMRS or custom `sourcetoconcepts` cascades. Shown with a `?` help icon tooltip explaining its purpose.
   - **Preview API call** (default collapsed): toggled by a chip button; shows the full `PUT /:owner/collections/:collection/references/` request with query string and request body, updating live as collection and cascade options change
3. User confirms → `PUT /[owner]/collections/[collection]/references/` with `data.expressions` containing the concept URL (version stripped) and `cascade` set to the selected method; cascade query params appended as needed
4. Results displayed inline: successful additions shown in light blue rows (concept ID + message); failures shown in a two-column table (Reference | Error) with human-readable error descriptions unwrapped from the API's expression-keyed envelope, including conflicting reference IDs and conflicting concept names
5. On completion the form locks; user can close

### Version Consistency Warning
> **M42 MVP deliverable — not yet implemented.** This is the primary version locking UX for the M42 showcase.

- Before submission, detect whether the concept version that a user intends to add to a collection based on the user's context (let's call this the **intended concept version**) would be different than the **resolved concept version** based on an auto-expanded collection's locked source versions
- If a mismatch is detected, show a warning in the dialog before the user confirms
- If no mismatch (or the collection has no locked source version yet), proceed silently with no warning

**Happy path (best practice):**
- **Add unversioned reference and rebuild the expansion** — the expansion re-evaluates all unversioned references against the latest locked source version, so the new reference will resolve correctly

**Less happy paths (presented as secondary options):**
- **Add unversioned reference without rebuilding** — the reference is added but will resolve to the old locked version v[Y] until the expansion is rebuilt
- **Add version-pinned reference** — not recommended unless the user explicitly wants to pin to a specific version; shown with a caution label

---

## Creating References from Inside the Collection (New Reference)

Used when the user is in the collection context and wants to define a reference explicitly, including intensional (query-based) references.

### Entry Point
- Collection → References tab → "New Reference" button (owners/admins only)

### Interaction Flow
1. "New Reference" dialog/drawer opens
2. **Reference Type** selector: Extensional | Intensional
3. For **Extensional**:
   - **Expression input**: text field pre-populated with `/:owner/sources/` prefix
   - **Search and select** toggle: instead of typing, the user can search OCL for concepts and the expression is built automatically
   - **Include/Exclude** toggle (default: Include)
   - **Cascade option** dropdown
4. For **Intensional**:
   - **Source selector**: pick the source to query
   - **Filter builder**: add filter rows (Property | Operator | Value)
   - **Preview** button: evaluate the query and show results before saving
5. **Preview** always available before saving (see Preview section below)
6. User saves → reference is added to HEAD version; auto-expansion is queued for update

### Validation
- If the expression does not resolve to any resources: show a warning ("This reference resolves to 0 results. Are you sure you want to save it?")
- If resources already exist in the collection: show a warning ("X concepts from this reference are already in this collection.")
- Errors (e.g., bad URL format, source not found): shown inline, must be resolved before saving

---

## Reference Preview (Without Persisting)

> **Ticket:** ocl_issues#2007 — CTA / Reference / Preview

Users can evaluate what a reference expression would resolve to before committing it. This is non-destructive: nothing is added to or removed from the collection.

### M42 Scope

| Entry Point | M42? |
|---|---|
| Preview panel within the Add to Collection dialog (`AddToCollectionDialog.jsx`) | ✅ M42 |
| Preview panel within the New Reference dialog (`NewReferenceDialog.jsx`) | ✅ M42 (built as part of #2431) |
| Preview action on an existing reference row in the References list | ⬜ Post-M42 (row action menus are post-M42 per `references-tab.md`) |

---

### API

**Endpoint:** `POST /:ownerType/:owner/collections/:collection/references/preview/`

The endpoint accepts multiple expressions in a single call and returns one result object per expression. This is important for batch operations (e.g., previewing a search-result selection before adding them all at once via the New Reference dialog).

**Request body:**
```json
{
  "data": {
    "expressions": [
      "/orgs/CIEL/sources/CIEL/concepts/1234/",
      "/orgs/CIEL/sources/CIEL/concepts/5678/"
    ]
  },
  "cascade": "sourcemappings"
}
```

**Query params (appended as needed):**
- `cascade` — cascade method string (e.g., `sourcemappings`, `sourcetoconcepts`)
- `transformReferences` — optional transform (e.g., `openmrs_concept_reference`)
- Additional cascade params as needed (`mapTypes`, `cascadeLevels`, `returnMapTypes`)

**Response:** Array of preview result objects, one entry per input expression:
```json
[
  {
    "reference": "/orgs/CIEL/sources/CIEL/concepts/1234/",
    "new": {
      "concepts": [ /* ConceptListSerializer[] — first 25 */ ],
      "mappings": [ /* MappingListSerializer[] — first 25 */ ],
      "concepts_count": 1,
      "mappings_count": 3
    },
    "existing": {
      "concepts": [ /* ConceptListSerializer[] — first 25 */ ],
      "mappings": [ /* MappingListSerializer[] — first 25 */ ],
      "concepts_count": 0,
      "mappings_count": 0
    },
    "version_status": {
      "consistent": true,
      "canonical_source_version": "CIEL v2024-08-01",
      "resolved_source_version": "CIEL v2024-08-01"
    },
    "errors": [],
    "exclude": false
  },
  {
    "reference": "/orgs/CIEL/sources/CIEL/concepts/5678/",
    "new": { "concepts": [], "mappings": [], "concepts_count": 0, "mappings_count": 0 },
    "existing": { "concepts": [], "mappings": [], "concepts_count": 0, "mappings_count": 0 },
    "version_status": null,
    "errors": [
      { "type": "source_not_found", "message": "Source CIEL not found or not accessible." }
    ],
    "exclude": false
  }
]
```

> **API enhancement required:** The current `CollectionReferencesPreview` view returns a flat `concepts` / `mappings` array with no collection-membership awareness, version checking, or error taxonomy. The endpoint needs to be updated to:
> 1. Accept multiple expressions and return one result object per expression
> 2. Split resolved resources into `new` vs. `existing` groups by checking each against the collection's current expansion
> 3. Populate `version_status` by comparing the resolved source version against the collection's canonical source version (see [Version Consistency](#version-consistency-warning) above)
> 4. Populate `errors` with typed error objects for any expression that cannot be evaluated
>
> The `concepts` / `mappings` arrays within each group are capped at 25 items each; use the `*_count` fields for display totals.

---

### Warnings and Errors

The preview response surfaces two distinct concern types per expression. These are displayed in the panel above the result rows, one alert per affected expression.

#### Version Inconsistency (Warning)

Shown when one or more result objects have `version_status.consistent === false`. This is the same condition described in [Version Consistency Warning](#version-consistency-warning) above — surfaced here so the user sees the conflict before deciding to submit.

The warning is a single collapsible alert regardless of how many expressions are affected. It does not repeat per-expression.

**Collapsed (default):**
> ⚠️ **{N} reference(s) will resolve to a different source version than your collection is pinned to.** ▼

**Expanded (user clicks ▼):**

A table drops down listing each affected expression:

| Reference | Resolves to | Collection pinned to |
|---|---|---|
| `CIEL/concepts/1234/` | CIEL v2023-10-01 | CIEL v2024-08-01 |
| `CIEL/concepts/5678/` | CIEL v2023-10-01 | CIEL v2024-08-01 |

- Expression column shows the concept ID portion of the URL (not the full path) for readability
- Resolved version and collection version are shown as source+version chips
- If all affected references resolve to the same mismatched version, the table makes this obvious at a glance

The alert is informational only within the preview panel. The action choices (Add unversioned + rebuild / Add unversioned without rebuilding / Pin to this version) are presented in the parent dialog's submit area, not inline in the panel.

If `version_status` is `null` for all results (collection has no locked source version yet), no version warning is shown.

> **Unresolvable Reference (Error) is post-M42** — see `tbv3-deferred-features.md § Reference Preview: Unresolvable Reference Error Taxonomy`. For M42, expressions that fail to resolve are shown as empty results; no per-type error messaging is displayed.

#### Zero-result reference (not an error, a warning)

When `errors` is empty but `new.concepts_count + new.mappings_count + existing.concepts_count + existing.mappings_count === 0`, show a soft warning rather than an error:

> ⚠️ This reference resolves to 0 resources. It will be saved as an empty reference.

This is a valid state (intensional references may legitimately return zero results today but resolve in the future), so saving is not blocked — the user just needs to acknowledge.

---

### Component: `ReferencePreviewPanel`

**File:** `src/components/common/ReferencePreviewPanel.jsx`

**Props:**

| Prop | Type | Description |
|---|---|---|
| `collectionUrl` | `string` | Full collection URL; used to build the preview API path |
| `expressions` | `string[]` | One or more reference expressions to preview in a single call |
| `cascadeParams` | `object` | Cascade options object from `CascadeSelector` |

> When called from a single-expression context (e.g., Add to Collection dialog), pass a one-element array.

**States:**

| State | UI |
|---|---|
| Idle (not yet triggered) | Nothing rendered; parent controls when to mount/show |
| Loading | `CircularProgress` spinner + "Evaluating reference…" caption |
| Success — results | Warning/error alerts (if any) + summary bar + grouped result rows |
| Error (request failure) | `Alert severity="error"` with the API error message |

**State mockups:**

*Loading:*
```
┌─────────────────────────────────────────────────────┐
│  ⟳  Evaluating reference…                           │
└─────────────────────────────────────────────────────┘
```

*Results — version mismatch warning, collapsed (default):*
```
┌─────────────────────────────────────────────────────┐
│  ⚠  4 references will resolve to a different source │
│     version than your collection is pinned to.  ▼  │
├─────────────────────────────────────────────────────┤
│  12 new  ·  3 already in collection                 │
├─────────────────────────────────────────────────────┤
│  ✅ New (12)                                         │
│  ...                                                │
└─────────────────────────────────────────────────────┘
```

*Results — version mismatch warning, expanded:*
```
┌─────────────────────────────────────────────────────┐
│  ⚠  4 references will resolve to a different source │
│     version than your collection is pinned to.  ▲  │
│                                                     │
│  Reference            Resolves to    Pinned to      │
│  ─────────────────────────────────────────────────  │
│  CIEL/concepts/1234/  [CIEL v2023]   [CIEL v2024]   │
│  CIEL/concepts/5678/  [CIEL v2023]   [CIEL v2024]   │
│  CIEL/concepts/9012/  [CIEL v2023]   [CIEL v2024]   │
│  CIEL/concepts/3456/  [CIEL v2023]   [CIEL v2024]   │
├─────────────────────────────────────────────────────┤
│  12 new  ·  3 already in collection                 │
├─────────────────────────────────────────────────────┤
│  ✅ New (12)                                         │
│  ─────────────────────────────────────────────────  │
│  [CIEL]  1234 · Malaria, unspecified   [2 mappings] │
│      [SAME-AS]  ICD-10-WHO: A09                     │
│      [NARROWER-THAN]  SNOMED: 61462000              │
│  ─────────────────────────────────────────────────  │
│  [CIEL]  1380 · Nutrition counselling               │
│  ─────────────────────────────────────────────────  │
│  [CIEL]  5089 · Weight                 [1 mapping]  │
│      [SAME-AS]  LOINC: 3141-9                       │
│  … and 9 more concepts                              │
├─────────────────────────────────────────────────────┤
│  ⚠  Already in collection (3)                       │
│  ─────────────────────────────────────────────────  │
│  [CIEL]  1855 · Amount of substance                 │
│  [CIEL]  2006 · Diagnosis                           │
│  [CIEL]  3031 · Body weight                         │
└─────────────────────────────────────────────────────┘
```

*Results — zero-result warning (empty intensional reference):*
```
┌─────────────────────────────────────────────────────┐
│  ⚠  This reference resolves to 0 resources. It will │
│     be saved as an empty reference.                 │
└─────────────────────────────────────────────────────┘
```

---

### Result Grouping

Results arrive pre-grouped from the API. Each expression's result object contains `new` and `existing` sub-objects; resources with `errors` have empty `new` and `existing` objects.

| Group | Icon | Source in response |
|---|---|---|
| **New** | ✅ green | `result.new` — resources not yet in the collection's current expansion |
| **Already in collection** | ⚠️ yellow | `result.existing` — resources already in the collection's current expansion |
| **Unresolvable** | ❌ red | `result.errors` is non-empty |

When previewing multiple expressions, results for all expressions are merged into these groups (New, Already in Collection, Unresolvable). Version inconsistency and zero-result warnings are shown per-expression above the merged result list.

---

### Summary Bar

Shown above the result rows (below any per-expression warning/error alerts):

> `X new · Y already in collection · Z unresolvable`

Zero-count segments are omitted. When multiple expressions are previewed, counts are aggregated across all expressions.

---

### Result Row Display

Each row shows one concept or mapping. No selection controls — rows are read-only.

**Concept row:**
```
[CIEL] 1234 · Malaria, unspecified          [1 mapping]
```
- Source chip (abbreviated source name)
- Concept ID · Display name
- Mapping count badge if mappings > 0

**Mapping row (shown below its parent concept, indented):**
```
    [SAME-AS]  ICD-10-WHO: A09
```
- Map type chip
- Target code · Target source (external) or concept chip (internal)

**Pagination / overflow:**
- If the total across all groups exceeds 100 rows: show first 100, then a muted footer: `"…and N more resources. Add the reference to see the full list."`
- Within a group, if the `concepts` or `mappings` array is capped at 25 but the `*_count` is higher, show an inline "…and N more [concepts/mappings]" note within that group

---

### Integration: Add to Collection Dialog

In `AddToCollectionDialog.jsx`:

- Add a collapsible "Preview" section below the `CascadeSelector` and above the Submit button
- Collapsed by default; toggled open by a `Preview` chip-button
- When open, `ReferencePreviewPanel` is mounted with `expressions={[conceptUrl]}`, `cascadeParams`, and `collectionUrl`
- Preview updates live when cascade params change (re-fires on each cascade change while panel is open)
- **Version consistency:** If the preview returns `version_status.consistent === false`, the version mismatch alert is shown in the panel. The Submit area below should also reflect the three action choices described in [Version Consistency Warning](#version-consistency-warning) (Add unversioned + rebuild / Add unversioned without rebuilding / Pin to version)

---

### Integration: New Reference Dialog

In `NewReferenceDialog.jsx` (to be built as part of #2431):

- "Preview results" toggle below the expression/cascade fields; collapsed by default
- When open, `ReferencePreviewPanel` is mounted with the current expressions array and cascade params
- Preview re-fires when expressions or cascade change (debounce: 500ms after last change)
- Multiple expressions (from search-and-select mode) are passed as a single batch; results are merged in the panel

---

## Reference Presentation in the References Tab

> **M42 scope note:** The flat list view (columns, row selection, toolbar actions, detail sidebar) is M42. Inline row expansion (concept sub-rows, mapping sub-rows, orphaned mapping groups) and Group by Source are **post-M42** — see `04_surfaces/references-tab.md` and the pending tickets in `tbv3-ticket-execution-log.md` Section 6.

### List View
- Table columns: Expression | Type (Extensional/Intensional/Cascade/Exclude) | Resolved Count | Version Pinned? | Status
- Resolved Count: number of concepts/mappings this reference evaluates to in the current expansion
- Version Pinned: badge shown if the reference is locked to a specific source version; warning badge if that version differs from the canonical source version
- Status: Active | Warning | Error

### Reference Detail (Row Click → Drawer or Split View)
- Full expression (not truncated)
- Reference type and cascade settings
- Full list of resolved resources (paginated)
- "Trace back": any concept in the expansion can link to the reference(s) that brought it in

---

## Reference Transforms (HEAD Only)

Transforms change a reference's expression type without changing the content it resolves to. Only available on the HEAD version. Note that this is distinct from Cascade's Transform option.

### Available Transforms (per SOW)

> **Post-v3:** A transform that lets a user update the pinned version of a repo-versioned reference (e.g., from `v2023` to `v2024`) without changing the reference pattern is deferred to post-v3. See `tbv3-deferred-features.md`.
1. **Transform to Unversioned** — Changes a resource-versioned reference to an unversioned reference
   - `/:owner/sources/:source/concepts/:id/:resourceVersion/` → `/:owner/sources/:source/concepts/:id/`
   - Use when: cleaning up deprecated resource-versioned references
2. **Transform to Repo-Versioned** — Changes a resource-versioned reference to a repo-versioned reference
   - `/:owner/sources/:source/concepts/:id/:resourceVersion/` → `/:owner/sources/:source/:repoVersion/concepts/:id/`
   - Use when: the user wants to pin to a source version but use the modern pattern
3. **Lock to Repo Version** — Changes an unversioned reference to a repo-versioned reference
   - `/:owner/sources/:source/concepts/:id/` → `/:owner/sources/:source/:repoVersion/concepts/:id/`
   - Use when: the user wants to freeze the reference to the current canonical source version

### UI Interaction
- Transform actions available from the reference row action menu (⋮) in the References tab
- Transform 1 and 2 only available on references that are currently resource-versioned (deprecated pattern)
- Transform 3 only available on unversioned references
- Before applying: show preview of the new expression and what it will resolve to, alongside the old expression (before/after comparison in the preview dialog) and what it resolved to
- After applying: confirmation toast; reference row updates immediately; re-expansion queued

### Bulk Transform
- Checkbox selection in References list
- "Transform selected" dropdown with the same options
- Bulk operations only apply to references where the transform is valid; invalid ones are skipped with a report

---

## Removing References

**Entry point:** Collection → References tab → checkbox selection → "Remove selected" (bulk action only; no row action menu)

**Confirmation dialog** (shown before deletion):
> "Remove [X] reference(s)?"
> "This will remove [Y] concepts and [Z] mappings from the collection expansion."

- Only possible on **HEAD** version (released versions are immutable)
- Successful removal queues a re-expansion of HEAD
- Dialog has Cancel and Remove (destructive) buttons — no type-to-confirm required

**API:** `DELETE /:ownerType/:owner/collections/:collection/references/` with body `{ "ids": [id1, id2, ...] }`

**Implementation (oclweb3):**
- `DeleteReferencesDialog` component: `src/components/collections/DeleteReferencesDialog.jsx`
- Delete button rendered as `toolbarControl` in `Search.jsx` when `resource === 'references'` and items are selected
- HEAD-only: button is disabled with tooltip "Not available in saved versions. Switch to HEAD to edit." when not on HEAD; derived from `props.url?.includes('/HEAD/')`
- Reference IDs sourced from selected result objects matched by `r.id`; concept/mapping counts summed from `reference.concepts` and `reference.mappings` fields

---

## Linked Source: Resolve to HEAD During Updates

> **Open question:** Whether HEAD-resolution during updates applies only to sources the user owns, or also to sources they do not own (e.g., CIEL), is still unresolved and requires a dedicated design decision. This is one of multiple workflow design areas that deserve dedicated time in the near term.

When a collection is being updated (typically after a new CIEL version is released):
- Unversioned references that previously resolved to a released version now need to be evaluated against HEAD of the source (to pick up new content) and then locked again when a new collection version is created
- This is part of the Update Collection to Latest Source Version workflow (see `03_workflows/`)
- The UI presents this as a guided flow, not a raw reference management task (see workflow doc for details)

---

## Permissions

| Action | Required Permission |
|---|---|
| Preview a reference | Read access to collection and source |
| Add reference (Add to Collection) | Edit access to the collection |
| Create new reference (References tab) | Edit access to the collection |
| Transform reference | Edit access to the collection |
| Remove reference | Edit access to the collection |
