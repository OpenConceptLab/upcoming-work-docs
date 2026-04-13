# TBv3 Implementation Status

> **Snapshot date:** 2026-04-13 (partial update: #2007 spec noted)
> **oclweb3 version:** 3.0.0-alpha (223 component files, React 18, MUI v5, React Router v5)
> **Methodology:** Each KB capability/surface was compared against the relevant oclweb3 components by an Explore agent reading both spec and source files in full. See [`tbv3-folder-structure.md`](tbv3-folder-structure.md) for spec library layout.

---

## Overall Status

| Capability / Surface | Status | Implementation % | Primary Gap |
|---|---|---|---|
| **Manage References** | ❌ | ~5% | All write operations missing; read-only filter view only |
| **Validate Content** | ❌ | ~5% | Basic form field validation only; no schema engine, no report panel |
| **Manage Concept Proposals** | ❌ | 0% | Complete greenfield; zero infrastructure |
| **Manage Versions + Expansions** | ⚠️ | ~45% | Entire expansions domain missing; no dedicated tab |
| **Configure Repository** | ⚠️ | ~45% | Repo creation solid; Settings tab + dropdown config entirely missing |
| **Search and Filter** | ⚠️ | ~65% | Searchlite shows search options, not results; no active-filter chips |
| **Author Concept** | ⚠️ | ~65% | Form fields mostly present; no templates, no configure-dropdowns, no inline warnings |
| **Browse Repository** | ⚠️ | ~65% | Core tabs work; hierarchy view and Versions+Expansions tab missing |
| **Concept Detail (Surface)** | ⚠️ | ~55% | Core layout solid; no Add-to-Collection CTA; limited action menu; no inline mapping actions |
| **Repository Page (Surface)** | ⚠️ | ~55% | Core header/tabs solid; About/Settings/Proposals/Versions+Expansions tabs missing |
| **Compare Resources** | ⚠️ | ~50% | Comparison pages exist but architectural pattern diverges (full-page vs. drawer+queue) |

---

## Notable Items in oclweb3 Not in the KB

These features are implemented but not spec'd — the KB should document them.

| Feature | Location | Notes |
|---|---|---|
| Semantic match operation (LLM-based) | `Matching.jsx`, `SearchInputDrawer.jsx` | Full "Match Concepts" workflow; not mentioned in search spec |
| OCL Mapper "propose" tab | `Matching.jsx` | Propose concept attributes to target source; distinct from Concept Proposals |
| Owner/namespace mapping scope toggle | `Associations.jsx` | Toggle between source / namespace / all mappings in concept detail |
| Inverse mapping notation | `Associations.jsx` | `-1` for inverse, `∞` for self-mappings |
| Hierarchy relationships via cascade | `Associations.jsx` | "Has child" / "Has parent" from cascade; not standard `map_type` |
| Attribute customization drawer | `Comparison.jsx` | Show/hide + drag-reorder attributes in comparison view |
| Multi-metric version comparison | `CompareVersions.jsx` | Stats / meta / content / mappings / JSON tabs |
| Auto-assign mapping ID/external ID | `MappingForm.jsx` | Based on `autoid_mapping_mnemonic`, `autoid_mapping_external_id` source config |
| `parent_concept_urls` field | `ConceptForm.jsx` | Parent concept URL field in concept creation form |
| Per-repository saved filter defaults | `SearchFilters.jsx` | Users can save/reset favorite filters per repo |
| Property filters for custom attributes | `SearchFilters.jsx`, `TableResults.jsx` | Dynamic property-based filtering using concept extras |
| Reference filtering UI | `ReferenceFilters.jsx` | Dedicated filter panel for references; separate from main SearchFilters |

---

## Capability Sections

---

### Manage References

**Overall status: ❌ Not implemented (~5%)**

> All write operations and interactive reference management are completely absent.

#### Implemented and matches spec
- References tab visible for Collections in `RepoHome.jsx` (conditional on `isCollection`)
- References searchable/filterable via `ReferenceFilters.jsx` (type, cascade, versioning, include/exclude)
- Reference rows show expression, resolved concept count, mapping count
- `ReferenceChip.jsx` with copy-to-clipboard for expressions

#### Implemented but diverges from spec
- Reference display columns — only Expression + counts; missing Type, Version Pinned, Status columns

#### Spec'd but not implemented
- **Add to Collection from outside** — No "Add to Collection" CTA on concept detail, search results, hierarchy view, or any entry point
- **Version consistency warning** — No warning dialog when concept source version ≠ collection canonical version
- **Cascade option in Add to Collection dialog** — None/Source Mappings/custom options
- **Create Reference from inside collection** — No "New Reference" button; no Extensional/Intensional form
- **Reference Preview (non-destructive)** — No preview before saving; spec complete in `manage-references.md § Reference Preview` (#2007)
- **Reference Detail drawer** — Clicking reference rows does nothing (`SearchResults.jsx` explicitly returns early for references)
- **Reference Transforms** — No Transform to Unversioned / Repo-Versioned / Lock to Repo Version
- **Remove reference** — No row action menu
- **Version Pinned badge** — No indicator for version-locked references
- **Status badges (Active/Warning/Error)** on reference rows

---

### Validate Content

**Overall status: ❌ Not implemented (~5%)**

> A `CustomValidationSchemaField` exists as a dropdown selector in repo creation but wires to no validation logic.

#### Implemented and matches spec
- Field-level error outlines and messages on form submit (ConceptForm, MappingForm via `FormComponent.setAllFieldsErrors()`)
- Save blocked when required-field errors present

#### Implemented but diverges from spec
- Validation fires on form submission only, not on blur as spec requires
- No Error/Warning/Info severity distinction — only boolean error/no-error

#### Spec'd but not implemented
- **Three-level severity model** (Error / Warning / Info with distinct visual treatments)
- **Error blocking expansion/version creation** (separate from blocking Save)
- **"Ignore" with reason + audit trail** — No mechanism to suppress errors
- **OpenMRS schema check inline** in concept/mapping editor
- **Validation in the Add References dialog** — dialog doesn't exist yet
- **Validation Report Panel** — filter bar, violations table, Fix/Ignore/View Rule actions, bulk actions, CSV export
- **Background scan** of existing references in collection
- **Severity badge on reference rows** in References tab
- **Built-in rule engine** (Required Properties, Allowed Classes, Allowed Datatypes, Mapping Constraints, Cardinality, Reference Structure)
- **Schema rule management UI** (rule list, toggles, severity selectors, Apply Template, Preview Impact)
- **Rule versioning**

---

### Manage Concept Proposals

**Overall status: ❌ Not implemented (0%)**

> Complete greenfield. No components, no routes, no API calls, no translation strings.

#### Spec'd but not implemented
- "Propose New Concept" button on source detail page
- "Propose Edit" / "Propose Retirement" actions on concept detail
- New / Edit / Retire proposal forms
- "My Proposals" page (`/user/concept-proposals/`)
- Proposal detail (status tracker, comment thread, withdraw)
- Source → Concept Proposals tab (admin view)
- Proposals list (ID, Type, Submitter, Status, Origin)
- Admin review actions: Mark In Review, Approve, Reject
- Notification system for proposal events

#### In oclweb3 but not in KB
- `Matching.jsx` has a mapper "propose" tab for suggesting concept attributes to a target source — related but distinct from the Concept Proposals capability

---

### Manage Versions and Expansions

**Overall status: ⚠️ Partial (~45%)**

> Version CRUD is solid. The entire expansions domain is absent.

#### Implemented and matches spec
- Create version dialog with ID, description, external_id (`VersionForm.jsx`)
- Release / unrelease toggle with confirmation dialog (`ReleaseVersion.jsx`)
- Version immutability: released versions lock the autoexpand field; DELETE is draft-only
- Version rows showing ID, release status + date, concept/mapping counts, access badge (`VersionsTable.jsx`)
- Version comparison: side-by-side diff with stats/meta/content/mappings/JSON tabs (`CompareVersions.jsx`)
- Async 202 handling for long-running version operations

#### Implemented but diverges from spec
- **"Copy vs. Re-evaluate" expansion choice** — Only a simple autoexpand checkbox; no radio button choice between "Copy current HEAD expansion as-is" and "Re-evaluate all references now"
- **Version rows** — Missing expansion metadata (default expansion indicator, resolved repo versions, Needs Refresh indicator)
- **Versions + Expansions tab** — No dedicated tab; versions only accessible via the version selector dropdown in `RepoHeader`; tab key 'versions' exists in routing but never rendered in RepoHome TABS array

#### Spec'd but not implemented
- **Dedicated Versions + Expansions tab** (two-panel layout: versions left, expansions right)
- **Expansion creation form** (expansion ID, active_only, repo_versions table, date picker, include_drafts, Set as Default)
- **Expansion rows** (expansion ID, parameters, status, concept/mapping count, last built, Needs Refresh indicator)
- **Needs Refresh indicator** (yellow dot + "Needs Refresh" badge when source has new version post-expansion; "Rebuild" trigger)
- **Set default expansion** as an action menu item (only available via expansion_url edit on VersionForm)
- **Create Similar Expansion** (pre-fill with existing parameters)
- **Rebuild Expansion** action
- **Expansion comparison**
- **Version locking UI** ("Lock to Current Version" action, canonical source version indicator)
- **Processing state indicator** on version rows during async creation

---

### Configure Repository

**Overall status: ⚠️ Partial (~45%)**

> Repository creation is well-built. The repository settings/configuration layer is entirely missing.

#### Implemented and matches spec
- Multi-step creation wizard: Name/Description → Languages → Publisher → Additional Metadata
- Name, Full Name, Description, Canonical URL, Owner (`RepoCreateNameDescription.jsx`)
- Default Locale + Supported Locales (`RepoCreateLanguages.jsx`)
- Publisher, Jurisdiction, Purpose, Copyright, Contact, Experimental, Case Sensitive (`RepoCreatePublisher.jsx`)
- Source Type / Collection Type dropdown, Custom Attributes (extras), About/rich text (`RepoCreateAdditionalMetadata.jsx`)
- Visibility/Access Level (Public read-only / read-write / Private) (`VisibilityField.jsx`)
- Canonical URL Registry (`URLRegistry.jsx`, `CanonicalResolve.jsx`)

#### Implemented but diverges from spec
- **Validation Schema selector** — Only None + OpenMRS; missing FHIR CodeSystem; no retroactive-validation warning when changing schema
- **Visibility field terminology** — Implementation uses "Public (read only) / Public (read/write) / Private"; spec uses "Public (View) / Private / Public Edit"
- **Repository subtypes** — Implemented as disabled tabs (Code System, Value Set, Concept Map) in RepoCreate; spec shows them as a separate optional field

#### Spec'd but not implemented
- **Hierarchy Meaning field** — Source-specific field for CodeSystem hierarchy type; not in creation form
- **Auto-ID Assignment** — None/Sequential/UUID configuration not in creation form (values appear in RepoSummary but cannot be set via UI)
- **FHIR CodeSystem validation schema option**
- **Settings tab** — No dedicated Settings tab in the repository page; edit only accessible via "Manage" dropdown
- **Settings form** — No consolidated edit form in a Settings tab
- **Validation schema change warning** ("Changing the schema does not retroactively validate existing concepts")
- **"Preview Impact" button** for schema changes
- **Dropdown Configuration UI** — No interface to manage per-field dropdown values (Concept Class, Datatype, Name Type, Map Type, Locale) with add/edit/delete/reorder; dropdowns are currently hardcoded from OCL global sources
- **Concept Templates** — No template selector in concept creation form
- **Advanced section** — Retire/archive repo, hard delete with confirmation

---

### Search and Filter

**Overall status: ⚠️ Partial (~65%)**

#### Implemented and matches spec
- App header search bar (always visible, activates Searchlite on click) (`Header.jsx`)
- Full search results page at `/search/` with tabs: Concepts | Mappings | Repositories | Organizations | Users
- Tab counts displayed; default tab: Concepts
- Concept results table with search-term highlighting, pagination (10/25/50/100)
- Sort dropdown with Asc/Desc toggle; defaults: Score (with query) / ID ascending (no query)
- Filters panel with toggle; filters ANDed; facet counts shown
- Card + table view toggle for repositories/orgs/users
- No split view for non-concept results (click navigates to full page)
- Concept row click opens Split View
- Escape dismisses Searchlite; Enter navigates to full results page

#### Implemented but diverges from spec
- **Searchlite shows search options, not results** — Dropdown presents scope selectors (search this repo, global, match) rather than live result preview grouped by resource type with Object Chips
- **No "Enter to see all [type] results for '[query]'" label** per group in Searchlite
- **Searchlite context** — Shows repo-specific option when nested, but does not prioritize results by current page's resource type
- **Active filters chips** — Not shown above results; only visible inside the filter panel
- **Datatype column** — Always shown; does not auto-hide when N/A in >50% of results
- **Default tab** — Always Concepts; does not switch to highest-count tab when Concepts = 0
- **Zero-result tabs** — Not explicitly disabled/muted
- **Repository chip** — Rendered as `RepoVersionButton`; "never wraps" guarantee not enforced

#### Spec'd but not implemented
- **Searchlite results dropdown** grouped by resource type with Object Chip + display name + source
- **200ms debounce** for Searchlite results fetch
- **Char-level match highlighting** (only matching characters within a word, not full word)
- **"Active filters" chips** above results with individual-clear buttons
- **Hierarchical filter UI** for Source/Collection subtypes

#### In oclweb3 but not in KB
- Semantic match operation (LLM-based concept matching via `Matching.jsx`)
- Per-repository saved filter defaults
- Property filters for custom concept attributes
- Reference filtering via dedicated `ReferenceFilters` component

---

### Author Concept

**Overall status: ⚠️ Partial (~65%)**

#### Implemented and matches spec
- Concept Class dropdown, Datatype dropdown, Names repeating group with Locale/Name Type/Preferred, Descriptions, External ID, Custom Attributes (extras) (`ConceptForm.jsx`)
- "Add another name" button
- Edit form pre-filled; Concept ID immutable after creation
- Retire / Un-retire concept with confirmation dialog (`RetireConfirmDialog`)
- After-save navigation to concept detail
- Mapping form with Map Type, To Concept (URL + code), To Source (`MappingForm.jsx`)
- OpenMRS schema detection (freeSolo on dropdowns based on `custom_validation_schema`)
- Comment field on concept edit

#### Implemented but diverges from spec
- **Dropdowns** — Hardcoded from OCL global sources (`OCL/Classes`, `OCL/Datatypes`, etc.); not from repository-specific `dropdown_config`; no Configure Dropdowns UI
- **Mapping form internal/external toggle** — Uses raw text fields for `to_concept_url` and `to_concept_code`; neither the current search-then-fallback model nor the v3 explicit toggle is fully implemented
- **Inline validation** — Fires on form submission only, not on blur; no debounced unique ID check
- **After-save** — Navigates to concept detail but no prominent "Add Mapping" CTA

#### Spec'd but not implemented
- **Debounced unique ID check** inline ("ID already exists in this source")
- **Multiple Preferred names in same locale warning**
- **No Fully Specified name warning** (OpenMRS sources)
- **Concept templates** — Template selector pre-filling Class/Datatype/locale
- **Explicit OCL concept vs. External code toggle** in mapping form (v3 intent)
- **Retire mapping in-place** with optional reason text field and focus preservation (context menu on mapping row)
- **Un-retire mapping** from context menu
- **Drag-and-drop sort weight** for Q-AND-A / CONCEPT-SET answers (currently `sort_weight` is a manual text field in MappingForm)
- **Configure Dropdowns** — Repository Settings UI for managing per-field dropdown values

#### In oclweb3 but not in KB
- Auto-assign mapping mnemonic / external ID toggle (`MappingForm.jsx`)
- `parent_concept_urls` field in concept form

---

### Browse Repository

**Overall status: ⚠️ Partial (~65%)**

#### Implemented and matches spec
- Concepts tab with search/filter/sort; concept row click → split view (`RepoHome.jsx` + `Search.jsx`)
- Mappings tab with same pattern
- References tab for Collections only (conditional on `isCollection`)
- Split view for concept and mapping detail panels
- Version selector in repo header; URL updated on version switch
- Default version: latest released (redirected on load)

#### Implemented but diverges from spec
- **Hierarchy view** — Hierarchy referenced in `Associations.jsx` via cascade but no user-facing List/Hierarchy toggle in the browse toolbar
- **References tab** — Shows reference data via Search; exact behavior (definitions vs. expansion content) not fully verified

#### Spec'd but not implemented
- **Hierarchy view toggle** — No List / Hierarchy view switch for sources with `hierarchy_meaning`
- **Hierarchy node "Add to Collection" action**
- **Lazy-loading hierarchy children** (expand-on-click)
- **Versions + Expansions tab** for browsing a specific expansion

---

### Concept Detail (Surface)

**Overall status: ⚠️ Partial (~55%)**

#### Implemented and matches spec
- Single component renders in Split View (right panel) and Full Page contexts
- Breadcrumbs (org / source / version / concept ID), display name, concept class, datatype
- External ID with copy-to-clipboard
- Custom attributes (extras) displayed
- Names grouped by locale with preferred indicator and name type badges
- Descriptions section (conditionally rendered)
- History tab with version timeline
- Associations (mappings) grouped by map type with sticky-ish headers
- Retired badge in properties; Retire / Un-retire via action menu
- Close button (X) in split view

#### Implemented but diverges from spec
- **Header layout** — Shows breadcrumbs + display name but no standalone ID chip or source chip; doesn't match the compact header spec layout
- **Action menu** — Only Edit + Retire (2 of 6+ actions); no Propose Edit, Propose Retirement, Copy URL, Compare, Open in Full Page
- **Edit button** — Inside action menu dropdown, not a standalone primary button
- **Associations panel** — `maxHeight: 400px` with overflow scroll; spec requires no max-height constraint
- **Mapping scope** — Repo / Namespace / All scope toggle exists (not in KB)

#### Spec'd but not implemented
- **"Add to Collection" CTA** — Primary authenticated-user action; completely absent
- **"Add to Comparison" CTA**
- **Propose Edit / Propose Retirement / Copy URL / Compare / Open in Full Page** in action menu
- **Version selector chip** (to view different concept versions from within the detail view)
- **Mapping row context menu (three-dot)** — Open From/To Concept, Compare Concepts, Retire Mapping
- **Retire mapping in-place** (with optional reason, inline Retired badge, focus preservation)
- **"Add Mapping" button** in Associations panel
- **Drag-and-drop reordering** of Q-AND-A / CONCEPT-SET answers by sort_weight
- **Dedicated Q-AND-A / CONCEPT-SET section** (distinct from standard mappings)
- **Muted styling** for retired concepts in header
- **Escape key** to close split view
- **Split view closes** when switching to Mappings tab

#### In oclweb3 but not in KB
- Owner/namespace mapping scope toggle
- Inverse mapping notation (`-1` for inverse, `∞` for self)
- Hierarchy relationships (Has child / Has parent) from cascade
- Standard and smart checksums displayed
- "Last Updated" date + user attribution

---

### Repository Page (Surface)

**Overall status: ⚠️ Partial (~55%)**

#### Implemented and matches spec
- Repo name, owner chip (links to owner page), type badge, canonical URL in header (`RepoHeader.jsx`)
- Version selector dropdown (HEAD prominently separated; released versions listed) (`RepoVersionChip.jsx`)
- Follow/Star button with toggle (`FollowActionButton.jsx`)
- Edit via "Manage" dropdown menu (owners/editors only)
- Concepts, Mappings tabs; References tab for Collections
- Active tab indicator (MUI underline + bold)
- Summary sidebar: concept count, mapping count, version count, last updated, access badge, collapsible
- Split view for concept/mapping detail panels

#### Implemented but diverges from spec
- **Action buttons** — Create Version and Edit are inside "Manage" dropdown, not dedicated header buttons
- **Summary panel** hidden when split view is active
- **Empty state** — Graphic shown but no "Add first concept" CTA button

#### Spec'd but not implemented
- **About tab** — `RepoOverview.jsx` exists but is not wired to the TABS array
- **Versions + Expansions tab** — Not in TABS; only accessible via version selector dropdown
- **Proposals tab** — Not implemented
- **Settings tab** — Not implemented
- **Short description** in header with expand/collapse
- **HEAD editing indicator** ("Viewing HEAD — changes here affect the next version")
- **Dependency notification banner** (yellow, dismissible)
- **Validation error banner** (red, persistent)
- **Tab-level search bar** (search within current tab's content)
- **Canonical URL** in summary panel (currently only in header)
- **Reference tab validation UI** (error/warning counts, Validate button, Transform dropdown)

---

### Compare Resources

**Overall status: ⚠️ Partial (~50%)**

> Core comparison logic exists but the fundamental UI pattern diverges: the spec calls for a persistent bottom drawer + queue system; oclweb3 uses dedicated full-page routes.

#### Implemented and matches spec
- Concept comparison page: side-by-side layout; names, descriptions, mappings, extras, class, datatype (`ConceptsComparison.jsx`)
- Mapping comparison page: map_type, external_id, from/to concept details (`MappingsComparison.jsx`)
- Version comparison: stats, meta, content, mappings, JSON tabs (`CompareVersions.jsx`)
- Attribute highlighting via `isDiff` logic and ReactDiffViewer (`Comparison.jsx`)
- URL routes `/concepts/compare` and `/mappings/compare` with `lhs`/`rhs` query params
- Version selector in CompareVersions toolbar to change versions being compared

#### Implemented but diverges from spec
- **Full-page routes instead of persistent drawer** — Spec specifies a bottom drawer (~50% screen) that persists while user browses; oclweb3 navigates to dedicated comparison pages, losing context
- **No "Add to Comparison" entry points** — No buttons in concept detail, search results, or repo version rows; navigation directly to `/concepts/compare?lhs=...&rhs=...` URLs unclear
- **No queue system** — No max-2-item queue with compatibility checks and replacement rules
- **No comparison bar** (minimized state showing queued items with Compare/Clear buttons)

#### Spec'd but not implemented
- **Persistent Comparison Drawer** (bottom overlay, resizable, persists on navigation)
- **Comparison Bar** (minimized strip with queued items)
- **Queue system** with max 2 items, compatibility check, add/replace rules
- **"Add to Comparison" buttons** at all entry points (concept/mapping detail, search rows, repo version rows)
- **Integrated actions within drawer** (Add to Collection, Propose Edit without closing drawer)
- **Escape minimizes / X closes** drawer behavior

#### In oclweb3 but not in KB
- Attribute customization drawer — show/hide + drag-reorder attributes in comparison (`Comparison.jsx`)
- Multi-metric version comparison tabs (stats / meta / content / mappings / JSON)

---

## Architecture Decisions That Differ From Spec

Several areas show oclweb3 making deliberate architectural choices that differ from the KB spec. These are not "gaps" to be fixed blindly — they need a design decision:

| Area | Spec assumption | oclweb3 reality | Decision needed |
|---|---|---|---|
| Compare Resources | Persistent bottom drawer + queue | Full-page routes | Keep full-page or implement drawer? |
| Dropdown config | Repository-specific `dropdown_config` field | Hardcoded from OCL global sources | Wire to source config or keep global? |
| Concept Detail tabs | Named tabs (Names, Descriptions, Associations, Properties) | Collapsed sections within single metadata tab | Match spec or keep current? |
| Validation schema | Triggers a real-time validation engine | Only a selector field with no wiring | Build engine or descope? |
| Hierarchy view | Toggle in browse toolbar | Only referenced in cascade Associations | Build hierarchy browse or defer? |
| Searchlite | Live results dropdown | Scope selector options only | Build live preview or accept current pattern? |

---

## Recommended Next Steps

### Greenfield (must be built from scratch)
1. **Manage References** — Add-to-Collection dialog, New Reference form, preview, transforms, remove (blocks dictionary-building workflow)
2. **Expansions domain** — ExpansionForm, ExpansionList, Needs Refresh indicator, rebuild; foundational for Versions+Expansions tab
3. **Missing repository tabs** — About tab (wire `RepoOverview.jsx`), Versions+Expansions tab, Settings tab
4. **"Add to Collection" CTA** on concept detail — core user action for Terminology Implementers

### Spec alignment (needs targeted completion)
5. **Searchlite** — Build live-results dropdown with Object Chips and resource-type grouping
6. **Concept Detail action menu** — Add Copy URL, Compare; unblock Propose Edit/Retirement once Proposals built
7. **Inline mapping actions** — Three-dot row menu, retire-in-place, drag-and-drop reorder
8. **Configure Repository settings tab** — Settings tab with general/validation/advanced settings (dropdown configuration UI is post-v3)
11. **Concept Proposals** — **In scope for v3** (ADR-006; SOW Tracker 27). Greenfield build required — see `02_capabilities/manage-concept-proposals.md` and `03_workflows/manage-concept-proposals-workflow.md`.

### Decided — post-v3 (no action needed for v3 launch)
9. **Compare Resources drawer+queue** — v3 launches with full-page routes (already implemented per ADR-002); drawer is planned next evolution. Spec preserved in `compare-resources.md`.
10. **Validation engine** — Content validation engine (schema rules, report panel, background scan) is post-v3. Field-level form validation already in oclweb3 is v3 scope. Full spec preserved in `validate-content.md`.
12. **Dropdown Configuration UI + Concept Templates** — In v3, dropdowns populated from OCL global sources. Per-repository configuration and templates are post-v3. See `tbv3-deferred-features.md`.

---

_Last updated: 2026-03-27_
