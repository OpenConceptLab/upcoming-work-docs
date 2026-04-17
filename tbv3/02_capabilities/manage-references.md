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

- Before submission, detect whether the concept version that a user intends to add to a collection based on the user's context (let's call this the **intended concept version**) would be different than the **resolved concept version** based on the collection HEAD's auto-expansion's locked source version for that source
- If a mismatch is detected, show a warning in the dialog before the user confirms
- If no mismatch (or the collection has no locked source version yet), proceed silently with no warning

**Happy path (best practice):**
- **Add unversioned reference and rebuild the expansion** — the expansion re-evaluates all unversioned references against the latest locked source version, so the new reference will resolve correctly
- The warning dialog should include a "Go to collection to rebuild" CTA that takes the user to the collection's Versions + Expansions tab; the rebuild itself is triggered there, not inline in this dialog

**Less happy paths (presented as secondary options):**
- **Add unversioned reference without rebuilding** — the reference is added but will resolve to the old locked version v[Y] until the expansion is rebuilt
- **Add version-pinned reference** — not recommended unless the user explicitly wants to pin to a specific version; shown with a caution label

> **M42 scope boundary:** The warning UI is M42. The guided rebuild workflow (diff-then-confirm, alongside expansion) is **post-M42** — users are directed to the Versions + Expansions tab to trigger the rebuild manually.

> **Technical constraint — CIEL and concept versioning:** CIEL's current import process creates a new concept version and mapping version for every resource on every import, even when content has not meaningfully changed. A naive version-number comparison will therefore always show all concepts as "changed." The version mismatch check must use **smart checksums** (not raw concept version comparison) to distinguish real clinical changes from no-op version bumps. This is a two-pass check: (1) identify if a newer concept version exists → (2) compare smart checksums to determine if there is a meaningful difference. See `01_objects/version.md` and ADR-003 for checksum details.

---

## Add References (Within Collection)

> **Ticket:** ocl_issues#2431 — CTA / Reference / Add (within Collection)

Used when the user is already in the collection context and wants to define what content to include. The primary tools are a direct expression input field and an optional source/collection seed that builds the base path automatically.

### M42 Scope

| Feature | M42? |
|---|---|
| Expression input field | ✅ M42 |
| Source / Collection quick-search seed | ✅ M42 |
| Version selector (with locked-version warning) | ✅ M42 |
| Reference Type selector (Concepts / Mappings) | ✅ M42 |
| Bulk Add (comma-separated concept IDs) | ✅ M42 |
| Include / Exclude toggle | ✅ M42 |
| Cascade selector | ✅ M42 |
| Preview panel (`ReferencePreviewPanel` — #2007) | ✅ M42 |
| Intensional filter builder (Property / Operator / Value) | ⬜ Post-M42 |
| Search-and-select individual concepts from a source | ⬜ Post-M42 |

### Entry Point

Collection → References tab → `+ Add References` button

- Visible to users with edit access only
- Disabled (with tooltip) when viewing a released version; HEAD only
- Not shown to read-only users

### Component

`src/components/collections/AddReferencesDialog.jsx`

---

### Dialog Sections

#### 1. Source / Collection (seed field)

Searchable autocomplete of all sources and collections in OCL — not scoped to the current user's ownership. Typing searches by name, ID, short code, and owner.

- **Optional** — the user can type an expression directly without using the seed at all
- On selection: Version selector and Reference Type selector appear; the Expression field is populated with the base path
- **If the user has already typed a non-empty expression** before selecting a source/collection, show a warning inline: *"This will replace the current expression."* — selection only proceeds if the user confirms (or the field is empty)

#### 2. Version Selector

Appears after a source/collection is selected. Shows **Latest** at the top, followed by all released versions in descending order. HEAD is not a selectable option.

The dropdown options are ordered as follows:

1. **Locked (Currently {locked_version_id})** — only shown when the collection's expansion has already locked this source/collection to a specific version. Selecting this option produces the same unversioned expression path as Latest. Shown as the top and pre-selected option when applicable.
2. **Latest (Currently {latest_released_version_id})** — always shown. A dynamic pseudo-option, not a pinned version. Produces an **unversioned expression path** (e.g., `/orgs/CIEL/sources/CIEL/`) so the reference resolves against whatever version the expansion is configured to use. The "(Currently vXXX)" label is informational context only.
3. **Released version IDs** — listed below Latest in descending order. Selecting one produces a version-pinned expression path (e.g., `/orgs/CIEL/sources/CIEL/v2024-08-01/`).

**When the collection has a locked version:** "Locked..." is pre-selected. If the user selects any other option (Latest or a specific version ID), show a warning:
> ⚠️ *Your collection is pinned to {locked_version_id}. This reference will differ from the locked version.*

**When the collection has no locked version:** "Locked..." is not shown; "Latest..." is pre-selected; no warning on any selection.

#### 3. Reference Type Selector

Appears after a source/collection is selected. Dropdown with two options:

| Option | Appended to expression |
|---|---|
| **Concepts** (default) | `concepts/` |
| **Mappings** | `mappings/` |

Changing this updates the seeded expression path. If the user has manually edited the expression past the base path, changing the type shows the same overwrite warning as above.

#### 4. Expression Field

Always visible and always editable regardless of whether the seed fields are used.

The seeded base path format depends on whether a source or collection was selected:

| Seed type | Seeded format (Latest / unversioned) | Seeded format (specific version) |
|---|---|---|
| **Source** | `/{ownerType}/{owner}/sources/{source}/concepts/` | `/{ownerType}/{owner}/sources/{source}/{version}/concepts/` |
| **Collection** | `/{ownerType}/{owner}/collections/{collection}/concepts/` | `/{ownerType}/{owner}/collections/{collection}/{version}/concepts/` |

- Placeholder when empty: `e.g. /orgs/CIEL/sources/CIEL/concepts/1234/`
- User may append anything after the base path: a concept or mapping ID, query params (`?conceptClass=Test&locale=en`), etc.
- Submitting only the base path (e.g., `/orgs/CIEL/sources/CIEL/concepts/`) without further qualification is valid — it creates a reference that resolves to all concepts in that repo at the given version

#### 5. Bulk Add

Collapsed by default; toggled open via `[+ Bulk Add by ID ▼]`.

- **Requires** a source or collection to be seeded (IDs must be expanded into full URLs; not available without a repo context)
- Textarea accepting comma-separated concept IDs: `1234, 5678, 9012`
- When Bulk Add IDs are present **and** the expression field contains a value beyond the seeded base path, show a warning:
  > ⚠️ *These IDs will be submitted instead of the expression above.*
- On submit, each ID is expanded into a separate extensional expression using the seeded repo path:
  - From a source: `/{ownerType}/{owner}/sources/{source}/{version}/concepts/{id}/`
  - From a collection: `/{ownerType}/{owner}/collections/{collection}/{version}/concepts/{id}/`
- Submitted as N expressions in a single batch API call; Preview also batches all N

**Bulk Add and Expression are mutually exclusive on submit:** if Bulk Add IDs are present, those N expressions are submitted and the expression field value is ignored.

#### 6. Include / Exclude

Dropdown, defaults to **Include**.

Applies to all expressions in the submission — you cannot mix include and exclude references in a single dialog open.

| Option | Behaviour |
|---|---|
| **Include** | Standard inclusion reference (`include: true`) |
| **Exclude** | Exclusion reference (`include: false`); shown with Exclude chip in the References list |

#### 7. Cascade Selector

Same `CascadeSelector` component used in `AddToCollectionDialog`. Applies to all expressions in the submission.

#### 8. Preview Panel

`ReferencePreviewPanel` (#2007), collapsed by default, toggled open via `[Preview ▼]`.

- In expression mode: fires on the single expression value
- In Bulk Add mode: fires on all N expanded expressions as a batch
- Version mismatch and zero-result warnings are surfaced here (see `§ Reference Preview`)
- Preview re-fires automatically when the expression, version, or cascade params change while the panel is open (debounce: 500ms)

---

### Interaction Flow

1. User clicks `+ Add References` from the References tab toolbar
2. Dialog opens; expression field is empty with placeholder
3. *(Optional)* User types in the Source / Collection seed field and selects a source
4. Version selector appears — user confirms or changes the version; locked-version warning shown if applicable
5. Reference Type selector appears — user selects Concepts or Mappings (default: Concepts)
6. Expression field is populated with the seeded base path; user edits as needed (adds ID, query params, etc.)
   — *or* —
   User expands Bulk Add and pastes comma-separated concept IDs
7. User sets Include/Exclude and cascade options
8. *(Optional)* User opens Preview panel to evaluate before committing
9. User clicks **Add Reference(s)**
10. `PUT /:ownerType/:owner/collections/:collection/references/` with `{ data: { expressions: [...] } }` + cascade query params
11. Results displayed inline: successes in light blue rows; failures in a Reference / Error table (same pattern as `AddToCollectionDialog`)
12. Form locks on completion; user closes

---

### Submit Behaviour

| Mode | `expressions` array |
|---|---|
| Expression only | `[expressionFieldValue]` |
| Bulk Add only | `[/{source}/{version}/concepts/{id1}/, ..., /{source}/{version}/concepts/{idN}/]` |
| Both filled | Bulk Add takes precedence; expression field value is **not** submitted (warning shown before submit) |

Include/Exclude is sent as `include: false` on the reference body for exclude references. Cascade params appended as query params per `CascadeSelector` output.

---

### Validation

- **Add button disabled** when: expression field is empty and no Bulk Add IDs are present
- **Bulk Add requires a source seed**: the Bulk Add textarea is disabled with tooltip *"Select a source above to use Bulk Add"* until a source is seeded
- **Version mismatch**: surfaced non-destructively in the Preview panel; the three action choices (add unversioned + rebuild / add without rebuilding / pin to this version) are presented in the dialog's submit area if a mismatch is detected (same pattern as `AddToCollectionDialog` — see `§ Version Consistency Warning`)

---

### Post-M42: Intensional Filter Builder

The Intensional reference pattern (`/orgs/:org/sources/:source/concepts/?q=...`) can be authored via the Expression field today using raw query params. A structured filter builder UI (Property | Operator | Value rows) that generates the query string automatically is deferred. See `tbv3-deferred-features.md`.

---

### Visual Mockup

*Default state (no seed selected):*
```
┌──────────────────────────────────────────────────────────┐
│ Add References                                      [X]  │
├──────────────────────────────────────────────────────────┤
│ Source / Collection                                      │
│ [🔍 Search sources and collections...           ]       │
│                                                          │
│ Expression                                               │
│ [e.g. /orgs/CIEL/sources/CIEL/concepts/1234/    ]       │
│                                                          │
│ [+ Bulk Add ▼]                                          │
│                                                          │
│ Include / Exclude        Cascade                         │
│ [Include            ▼]  [None               ▼]         │
│                                                          │
│ [Preview ▼]                                             │
├──────────────────────────────────────────────────────────┤
│                          [Cancel]  [Add Reference(s)]   │
└──────────────────────────────────────────────────────────┘
```

*After source selected (collection has a locked version):*
```
┌──────────────────────────────────────────────────────────┐
│ Add References                                      [X]  │
├──────────────────────────────────────────────────────────┤
│ Source / Collection                                      │
│ [CIEL (CIEL)                                    ]       │
│                                                          │
│ Version                                  Reference Type   │
│ [Locked (Currently v2024-08-01)    ▼]   [Concepts ▼]   │
│                                                          │
│                                                          │
│ Expression                                               │
│ [/orgs/CIEL/sources/CIEL/v2024-08-01/concepts/  ]       │
│                                                          │
│ [+ Bulk Add ▼]                                          │
│                                                          │
│ Include / Exclude        Cascade                         │
│ [Include            ▼]  [Source Mappings    ▼]         │
│                                                          │
│ [Preview ▼]                                             │
├──────────────────────────────────────────────────────────┤
│                          [Cancel]  [Add Reference(s)]   │
└──────────────────────────────────────────────────────────┘
```

*User changed away from locked version (selected Latest or a different version ID):*
```
│ Version                                                  │
│ [Latest (Currently v2024-08-01)             ▼]         │
│ ⚠ Your collection is pinned to CIEL v2024-08-01.        │
│   This reference will differ from the locked version.   │
```

*(Dropdown open — collection has locked version):*
```
│ ┌─────────────────────────────────────────────────────┐ │
│ │ ✓ Locked (Currently v2024-08-01)                    │ │
│ │   Latest (Currently v2024-08-01)                    │ │
│ │   v2023-10-01                                       │ │
│ │   v2022-06-15                                       │ │
│ └─────────────────────────────────────────────────────┘ │
```

*(Dropdown open — no locked version):*
```
│ ┌─────────────────────────────────────────────────────┐ │
│ │ ✓ Latest (Currently v2024-08-01)                    │ │
│ │   v2023-10-01                                       │ │
│ │   v2022-06-15                                       │ │
│ └─────────────────────────────────────────────────────┘ │
```

*Bulk Add expanded:*
```
│ [+ Bulk Add ▲]                                          │
│ Concept IDs (comma-separated):                          │
│ [1234, 5678, 9012, 3456                         ]       │
│ ⚠ These IDs will be submitted instead of the           │
│   expression above.                                     │
```

---

## Reference Preview (Without Persisting)

> **Ticket:** ocl_issues#2007 — CTA / Reference / Preview

Users can evaluate what a reference expression would resolve to before committing it. This is non-destructive: nothing is added to or removed from the collection.

### M42 Scope

| Entry Point | M42? |
|---|---|
| Preview panel within the Add to Collection dialog (`AddToCollectionDialog.jsx`) | ✅ M42 |
| Preview panel within the New Reference dialog (`AddReferencesDialog.jsx`) | ✅ M42 (built as part of #2431) |
| Preview action on an existing reference row in the References list | ✅ M42 |

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
> 3. Populate `version_status` by comparing the resolved source version against the auto-expansion's locked source version (see [Version Consistency](#version-consistency-warning) above)
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

In `AddReferencesDialog.jsx` (to be built as part of #2431):

- "Preview results" toggle below the expression/cascade fields; collapsed by default
- When open, `ReferencePreviewPanel` is mounted with the current expressions array and cascade params
- Preview re-fires when expressions or cascade change (debounce: 500ms after last change)
- Multiple expressions (from search-and-select mode) are passed as a single batch; results are merged in the panel

---

## Reference Presentation in the References Tab

> **Milestone note:** The flat list view and detail split view are part of the current milestone. Bulk Transform and Remove remain in MVP scope but land in a later MVP milestone. Inline row expansion in the list itself and Group by Source are also later-milestone enhancements — see `04_surfaces/references-tab.md` and the pending tickets in `tbv3-ticket-execution-log.md` Section 6. The concept → mapping tree is already used inside the detail split view's Expansion tab for MVP.

### List View
- Table columns: Expression | Type (Extensional/Intensional/Cascade/Exclude) | Resolved Count | Version Pinned? | Status
- Resolved Count: number of concepts/mappings this reference evaluates to in the current expansion
- Version Pinned: badge shown if the reference is locked to a specific source version; warning badge if that version differs from the auto-expansion's locked source version
- Status: Active | Warning | Error

### Reference Detail (Row Click → Split View)
- Full expression (not truncated)
- Reference type and cascade settings
- Uses the same split-view interaction model as Concept Detail
- Header-level `Actions ▾` menu includes reference utilities such as download and share
- Footer shows the last-resolved timestamp plus quick download/share actions
- Expansion tab shows the resolved resources as an expandable concept → mapping tree, including an orphaned mappings group when applicable
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
   - Use when: the user wants to freeze the reference to the auto-expansion's current locked source version

### UI Interaction
- In the current milestone, the reference row action menu contains Preview only
- Transform actions are available via bulk selection in a later MVP milestone
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

> **Milestone note:** Bulk Remove is part of MVP scope and is planned for a later MVP milestone rather than the current one.

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
