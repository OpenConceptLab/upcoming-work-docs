# Capability: Search and Filter

## Scope

This capability covers all search entry points: global search (full-page results), Searchlite (inline autocomplete), and in-repository content filtering. All three share common interaction patterns and differ primarily in scope and display.

---

## Global Search

### Entry Point
- Search bar is persistent in the application header, always accessible
- Clicking or typing activates Searchlite inline autocomplete
- Pressing Enter or clicking "See all results" navigates to the full global search results page

### Searchlite (Inline Autocomplete)
- Appears as a dropdown below the search bar as the user types (debounce: 200ms)
- Shows top results grouped by resource type: Concepts, Repositories, Organizations, Users
- Each result row: Object Chip + display name + source (for concepts)
- Bottom of dropdown: "Enter to see all [resource type] results for '[query]'" — label must say this precisely (not "full search")
- Searchlite context: when user is on a tab-specific results page (e.g., Organizations tab), Searchlite should default to searching within that resource type first, while still offering cross-type options
- Clicking a result navigates directly to that resource's detail page
- Pressing Escape dismisses Searchlite and returns focus to the search bar

### Global Search Results Page
- URL: `/search/?q=[query]&type=[resource_type]`
- Page title reflects the search term: `Search: "[query]" - OCL`
- Tabs: Concepts | Mappings | Repositories | Organizations | Users
- Tab counts shown in the tab label; tabs with zero results shown in a disabled/muted state
- Default tab: Concepts (or the tab with the most results if Concepts has zero)

**Results Table (Concepts):**

| Column | Notes |
|---|---|
| Concept Name | Bold; search term highlighted (match only — not other words that happen to contain the letters); only the actually-matching characters within a word are highlighted, not the whole word (e.g., if "arburg" matches, only "arburg" is bolded in "Warburg", not the full word) — see ocl_issues#1937 |
| Concept Class | |
| Datatype | Hide from main view if N/A in >50% of results; available as filter-in option |
| Repository | Chip linking to the source; never wraps to second line |

- Row click: opens Split View (concept detail panel on the right)
- Split view open: list columns may condense; Repository column must not wrap
- Max one detail panel open at a time; switching resource type tabs closes any open detail panel
- Active/selected row: background highlight only (no checkbox)

**Results Table (Repositories, Organizations, Users):**
- Card view available in addition to table view
- No split view for these resource types (clicking navigates to their page)

**Filters Panel (left side):**
- Toggle with a Filter button in the toolbar; button shows an Enabled state when panel is open
- Concept filters: Concept Class, Repository, Datatype, Language/Locale, Map Type, Retired (default: exclude)
- Repository filters: Repository Type (hierarchical: Source > [subtype], Collection > [subtype])
- Filters are ANDed together
- Facet counts shown next to each filter option
- Scroll within the filter panel; scrollbar must not overlap facet counts
- "Repository Type" and "Source Type/Collection Type" merged into a single hierarchical filter

**Sort:**
- Sort dropdown or column header click (consistent, not both)
- Default: Score (when query is present); ID ascending (when no query / browsing)
- Sort options: Score, Name, ID, Updated Date, Concept Class
- Currently applied sort must be visually highlighted
- Sort direction (Asc/Desc) is a single toggle on the selected sort, not a separate dropdown

---

## In-Repository Search and Filter

### Entry Point
- Search input at the top of concept/mapping list within a repository or collection
- Operates within the context of the current repository version

### Behavior
- Debounced input: 200ms
- Results update in-place; no page navigation
- All current filters remain active while typing
- Empty search string = browse mode (show all concepts sorted by default sort)

### Filter Panel (in-repo)
- Available filters: Concept Class, Datatype, Locale, Map Type, Retired status
- Filters persist across search terms within the same session

### Sort
- Default when browsing (no query): sort configured by repo owner, or ID ascending as system default
- Default when searching (query present): Score descending
- Available sorts: ID, Name, Concept Class, Datatype, Updated Date

---

## Advanced / Field-Specific Search

These features allow users to scope or restrict their search beyond keyword matching.

### Field-Specific Search

Users can restrict a search query to a single field rather than matching across all fields:

- **Name only** — match only concept names (not descriptions or IDs)
- **Description only** — match only concept descriptions
- **ID only** — match only concept IDs/mnemonics

UI: An optional field selector (e.g., a dropdown or toggle adjacent to the search input) that defaults to "All fields". When a field is selected, results only match within that field.

### Custom Attribute (Extra) Search

Users can search within a concept's custom Extra attributes:

- **Within a repository:** The list of searchable Extra attribute keys is dynamically populated from the keys present in that repository's concepts
- **Global search:** Searching within Extras is scoped to a selected repository context (global Extra search is not indexed across all repositories)

UI: An "Extras" section in the filter panel, listing known keys for the current repo. User selects a key and enters a value to match against.

### Locale-Restricted Matching

Users can restrict search matching to names or descriptions in a specific locale:

- Useful for localization workflows — e.g., an English-speaking user searching only French terms to identify what needs translation
- Differs from the Locale filter (which filters concepts that *have* a locale) — this restricts which locale's names are *matched against* the query

UI: A "Search in locale" option in the filter panel or adjacent to the search field. Defaults to the user's language preference; can be overridden per search.

### Post-v3: Mapping Constraint Search

_Deferred post-v3._ Allow users to filter concepts by mapping constraints — e.g., "show concepts that have no SAME-AS mapping to CIEL" or "show concepts mapped to a retired concept in source X." This requires cross-concept mapping index support and is not in scope for v3 launch.

---

## Empty States

| Situation | Message |
|---|---|
| No results for a query | "[query]" returned no results. Try different keywords or adjust your filters. |
| No results with filters active | No results match your current filters. [Clear all filters] |
| Empty repository | This [source/collection] has no concepts yet. [Add Concept] if authorized |

---

## Validation / Error States

- Invalid or unreachable search endpoint: Show inline error ("Search unavailable. Try again.") without breaking the page
- Partial results due to index lag: Silent (do not surface to user)

---

## Accessibility and Performance

- Search results must be keyboard-navigable (arrow keys through rows, Enter to open detail)
- Searchlite must be dismissible with Escape
- Search is paginated server-side; default page size: 25
- Pagination component: show total count (comma-formatted), current page, page size selector
- The pager component must not be clipped at reduced horizontal resolution
- Total count limit of 10,000 must be eliminated; full count must be available in repository browsing
