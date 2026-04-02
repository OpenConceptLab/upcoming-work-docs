# Section 4: Authoring Experience (Creating & Editing)

The authoring experience in TBv3 represents the transition from OCL as a read-mostly terminology browser to a full authoring environment. The system organizes authoring actions around a consistent CTA (Call-to-Action) pattern, where each user action is modeled as a discrete operation accessible from contextual menus, toolbars, and entry points throughout the UI. This section covers six authoring domains -- repositories, concepts, mappings, organizations, expansions, and references -- plus the design specifications that bind them together.

All authoring takes place within a Material Design 3 (M3) Side Sheet component (#1376), which provides a consistent editing surface that overlays the current view. Buttons in the Side Sheet are sticky, validation is inline, and dropdown fields leverage the Searchlight component for resource selection. This Side Sheet pattern is foundational: it means authoring never navigates users away from their current context, a deliberate design decision to support the "view content in list or card view in the same UX" user story (#1376).


## 4a. Repository Authoring

The Repository authoring epic (#1977) covers the full lifecycle of repository management: create, edit, version, release, copy, and type-specific templates. Repository CTAs are primarily accessible from a "More" menu in the repository header (#1977).

### Repository Creation

Repository creation (#1978) supports two entry points: from an Organization page (pre-selecting the org as owner) or from the global "Create" menu (where the user selects an owner). The workflow proceeds through a repo type selection step, then a type-specific form, then creation with navigation to the new repository. Designs for this flow are in Zeplin (#1978).

A key design decision arose around the default repo type selection. The initial designs showed "Code System" as the default selected type, but the team decided "Source" should be the default, since it is the most general OCL repo type (#1978, comment from paulsonder). Joe (jamlung-ri) approved the flow structure, noting content placeholders should be left in designs for him to populate (#1978).

Several implementation details surfaced during review:

- **Auto-ID fields**: Sunny (snyaggarwal) flagged the need for design elements around auto-ID assignment, which in v2 lived in "Advanced Settings" (#1978). Joe provided a detailed user story: terminology authors need to configure auto-ID assignment methods (None, Sequential, UUID) for concept IDs, mapping IDs, external IDs, and name/description external IDs. Sequential IDs require a starting number, and future iterations may support prefixes/suffixes (#1978).
- **Repo About details**: Initially missing from the create form, this was added back to the Zeplin designs (#1978).
- **Owner and source context**: The owning source is set based on where the user initiated creation. The entry point for creating a concept should always be inside a repo, not from global search (#1376, paynejd comment).

Repository creation is in Testing/QA status (#1978, #1615).

### Repository Editing

Repository editing (#1979) reuses the same form as creation but with a modified header state and pre-populated fields. The form is accessible from the "Edit" action in the repository header menu. The key constraint is that repo type and certain identifiers cannot be changed after creation (#1979). This is also in Testing/QA status.

### Versioning and Release

**Create version** (#1980) generates a snapshot of a repository's content and metadata at a specific moment. The user clicks "Create Version" from the repository page, completes a form, and is returned to the repository with the new version selected. Designs were reviewed and approved with only minor comments (#1980). In Testing/QA.

**Release (or un-release) a version** (#1981) allows users to mark a version as released or unreleased. The action is in the repository header menu, requires confirmation via a dialog, and results in a visual "Released" chip in the summary panel. The version menu also indicates release status for each version (#1981).

An important open question emerged around release status and FHIR alignment. Joe noted that OCL's Released/Unreleased model is similar to FHIR's `status` attribute (draft | active | retired | unknown) and asked whether the design could accommodate a future migration to FHIR's model (#1981). Jon (paynejd) pointed out that OCL already implements the FHIR status attribute in the API and suggested making it live in v3. This discussion was tagged `discussion-needed` and remains unresolved -- the team has not yet decided whether to align OCL's release status with FHIR's status model or display both (#1981). This is in Testing/QA.

### Copy (Fork) and Advanced Creation

**Make a copy** (#1982) allows users to create a new repository pre-populated with metadata and content from an existing one. The owner field is left empty and focused, prompting the user to select a namespace. Joe noted potential issues with the underlying Create Repository form fields (e.g., "Hierarchy Meaning" placement), and Paul redirected that feedback to #1978. This feature is in Backlog status.

Three newer tickets (April 2025) define a more sophisticated repo creation starting point:

- **Repo Creation Starting Point UI** (#2155): A decision screen where users select HOW they want to create a repo -- from scratch, fork an existing repo version, or load content from a file/URL. The pathway is pre-selected based on context (e.g., which CTA brought the user here) but can be changed.
- **Fork a repo version** (#2156): After selecting "Fork" from #2155, the user finds a repository and selects a version. The selected repo version provides base metadata (and possibly content) for the new repo. Repo type is inherited, so the user skips that selection step.
- **Import content from existing repo** (#2157): Following a fork or other repo creation from an existing repo, users choose whether to: (a) not bring in content, (b) clone content (create new concepts/mappings), or (c) reference content (create references to existing concepts/mappings). The reference option is only available for collection-based repos. Long-running imports are queued with a Task ID.

All three are open and assigned to the TermBrowser v3 MVP milestone.

### Repository Templates

Five repository templates define the page structure and tab configuration for each repo type:

| Template | Tabs | Status |
|----------|------|--------|
| **Source** (#2025) | Overview, Concepts (ID, Display name, Concept Class, Datatype), Mappings (grouped by Target Source) | Todo |
| **Collection** (#2026) | Overview, Composition (Filters, Intensional/Extensional), Concepts (with Expansion picker, includes Owner column), Mappings | Todo |
| **ValueSet** (#2027) | Same structure as Collection | Todo |
| **CodeSystem** (#2028) | Not yet defined (empty body) | Todo |
| **Concept Map** (#2029) | Not yet defined (empty body) | Todo |

The Collection template's high-level structure was approved by Joe (#2026). Paul asked Sunny whether there was enough detail for development; the question of what additional information developers need per template remains open (#2026).


## 4b. Concept Authoring

The Concept authoring epic (#1989) and its foundational design ticket (#1376) represent one of the most design-intensive areas of TBv3. Concept authoring is the first place TBv3 advances the "Smart Dictionaries" vision, where the tool helps users follow best practices rather than simply accepting arbitrary input.

### Design Foundation: Create and Update Concepts and Mappings

The design specification (#1376) establishes the core interaction model. Concept and mapping CRUD operations take place in the Side Sheet component. The design went through a multi-phase sprint process (documented by paulsonder in December 2022) and evolved significantly through 2024.

Key design decisions from the #1376 thread:

**Form layout for names/synonyms**: Concepts can have 100+ names, so the team considered squeezing each name (Locale, Type, Name, External ID, Preferred) into a single line or using a table-based editing component. The decision was to explore MUI's data grid component (`@mui/x-react-data-grid`) for this purpose (#1376, paynejd checklist).

**Smart defaults and best practices guidance** (#1376):
- Pre-populate language selections based on repo defaults (decided)
- Require one (and only one) Fully Specified Name per concept (decided)
- Concept templates: users select a template at the top of the form, with "Blank" as one option (decided for launch)
- ID fields should be "aware" of the repo's ID auto-assignment settings (decided)
- First concept name defaults to "Fully specified" and "preferred" (decided)
- Additional "Smart Dictionary" guardrails are planned but not yet specified

**Non-editable context fields**: Owner and source are displayed at the top of the concept form but are not editable -- they are determined by where the user initiated the create action (#1376). When editing a concept, the Concept ID is not editable (#1376, snyaggarwal).

**Concept URL display**: Sunny requested that the URL where the concept will live be displayed in the form (#1376).

The design shows three modes for the concept detail view: Read, Edit, and Create (#1376, paulsonder April 2024 designs). Joe requested a visual for inline editing of name fields (e.g., what happens when a user clicks on a name in Edit Mode) (#1376). This interaction pattern -- whether clicking text makes it editable inline vs. requiring a three-dot menu -- was raised but the resolution is not explicitly documented in the thread.

The design is dependent on the Searchlight component (#1830) for dropdown resource selection within forms (#1376).

### Concept CTA Operations

| CTA | Ticket | Status | Notes |
|-----|--------|--------|-------|
| Edit | #1991 | Testing/QA | Assigned to snyaggarwal |
| Clone to repo | #1992 | Open | No body or comments; MVP milestone |
| Add to repo | #1993 | Open | No body or comments; MVP milestone |
| Create similar | #1994 | Open | No body or comments; MVP milestone |
| Add mapping | #1995 | Todo | "Quick add mapping" from concept details; paynejd directed to follow TBv2 design pattern with the Searchlight-based approach |
| Create mapped concept | #1996 | Open | No body or comments; no milestone |
| Retire | #1997 | Testing/QA | No body; MVP milestone |
| Import code list | #1998 | Open | No body or comments; no milestone |

The "Add mapping" CTA (#1995) is notable because paynejd explicitly stated it should implement the "quick add mapping" feature for the concept details page, following TBv2's design. This is a priority feature for the OpenMRS community.

"Clone to repo," "Add to repo," and "Create similar" (#1992, #1993, #1994) are all specified at the title level only with no acceptance criteria, body content, or comments. These represent planned operations that have not yet been designed or discussed.

"Import code list" (#1998) similarly has no specification. This would allow users to import a list of codes directly into a source, bypassing the standard bulk import workflow.


## 4c. Mapping Authoring

The Mapping authoring epic (#1999) covers five operations: create, edit, create similar, retire, and delete. As of mid-2025, mapping authoring has received significant attention for both the form design and the interaction model.

### Mapping Form Design

Joe provided a detailed specification for the mapping form structure in June 2025 (#1999):

**Form sections:**
1. **Context** (already implemented): Organization and Source that will contain the mapping
2. **Header** (mostly implemented): Contains Map Type with a "Suggested" section if available
3. **From/To Concept** (user input): The core of the form
   - Default behavior borrows the Quick Add Mapping field structure from concept details (#1995)
   - Optional toggle to convert From or To section to free-text mode, which reveals additional mapping fields
   - Autofill of resolved concept name when available, with user override capability
   - Retains the "swap From/To" button from v2
4. **Resolution Line**: A dynamic preview showing what the mapping row will look like in the mappings list view, updating in real-time during editing
5. **Attributes**: External ID, Sort Weight, Custom Attributes
6. **Submit button with Update Comment**: An Update Comment field next to the submit button, with suggested autofill logic (e.g., "Updated Map Type, To Concept, External ID; Added Sort Weight, Custom Attribute(s)")

Joe provided a crude mockup via Google Drawings for this form layout (#1999).

### Critical Mapping Form Gap

Jon (paynejd) flagged the current Create/Edit mapping form as "a non-starter" in May 2025 (#2000). The from/to concept fields must be replaced with modern components that use the Searchlight component for resource search and selection. This is a blocking requirement for the mapping authoring experience.

### Mapping CTA Operations

| CTA | Ticket | Status |
|-----|--------|--------|
| Create | #2000 | Testing/QA |
| Edit | #2001 | Testing/QA |
| Create similar | #2002 | Open |
| Retire | #2003 | Testing/QA |
| Delete | #2004 | Testing/QA |

Four of the five mapping CTAs are in Testing/QA, making this one of the more advanced authoring areas. "Create similar" (#2002) remains open with no body or comments.

Note that mapping authoring deliberately excludes a "Clone" or "Copy" action at the mapping level. Mappings are authored in the context of a source, and the "Create similar" action serves as the mechanism for duplicating a mapping with modifications.

### Open Questions

- The from/to concept fields need Searchlight integration (#2000) -- the current implementation is insufficient
- Whether and how to handle mappings where from/to concepts point to resources outside OCL (i.e., external canonical URLs) (#1376, paynejd: "From Concept and To Concept do not always point to repos or concepts that OCL knows about")
- Mapping ID and External ID fields need to be "aware" of repo ID settings, similar to concepts (#1376)


## 4d. Organization Management

The Organization management epic (#2013) covers the full organizational lifecycle. Organizations are the primary namespace mechanism in OCL, and their management has distinct considerations around branding, membership, and content ownership.

### Organization Creation

Creating an organization (#2014) is accessible from the "Create" menu in the navigation bar or from the Quick Links drawer. The form designs are in Zeplin.

Key design discussions:

**Custom attributes**: Paul asked whether orgs should support custom attributes. Joe confirmed it is uncommon but useful, noting that custom attributes could be displayed in the same format as FHIR attributes in a repo overview, using a structured list component (#2014). The team agreed to support this with low emphasis.

**Avatar/identity fallbacks**: The team discussed whether avatars should be mandatory. The consensus is that avatars should be encouraged but not mandatory, with a generated fallback (like GitHub's Identicons or Jazzicons) for orgs and users that do not upload an image (#2014). Paul noted the distinction between org and user identity fallbacks -- the approach should be consistent across both entity types (#2014).

### Organization Editing and Membership

**Edit** (#2016): Uses the same form as creation but for updating an organization's metadata. Requires owner or member-with-edit-permissions access. Design docs are TBC.

**Add members** (#2015): Users search for new members and add them to the organization. Requires owner or member-with-edit-permissions access. Design docs are TBC.

**Create repository** (#2017) from an org page pre-selects the organization as the owner in the repo creation flow. This connects to the repository creation workflow described in Section 4a.

### Organization Customization

**Pin repository** (#2018): Allows prominently positioning repos on the org page. The team discussed the purpose of pins, concluding that with v3's new Dashboard and Follows features, pins serve primarily to highlight content for visitors to the org page, not for personal bookmarking (#2018). The current 4-pin limit was deemed sufficient; increasing it could defeat the highlighting purpose (#2018). Status: Backlog.

**Customize appearance** (#2019): For MVP, limited to avatar and header background image uploads. Paul scoped this deliberately to avoid the complexity of v2's white-label capabilities. Joe documented what v2 features would be lost:
- Banner settings (height, solid color, different banners per tab)
- Text color customization (title, description, other text)
- Show/hide controls (logo, signatures, controls, pins)

The team agreed these can be dropped for v3, but the new approach must still support existing branded orgs like WHO-DDCC, CIEL, and PEPFAR MSP (#2019).

**Edit canonical registry** (#2020): Allows org owners/editors to add or change entries in the organization's canonical URL registry. This connects to the broader Canonical URL Registry infrastructure (covered separately).

### Organization Deletion and Sharing

**Delete** (#2021): Requires confirmation by typing the organization's name, carrying over the v2 pattern. The destructive nature justified keeping this safety measure for v3 (#2021). Status: Testing/QA.

**Share** (#2022): The MVP is "Copy URL to Clipboard." The team discussed richer sharing (email, social media, OpenGraph previews) but agreed to start simple and iterate post-beta (#2022).


## 4e. Expansion Management

The Expansion management epic (#1983) covers five operations for managing expansions within collections. Expansions are the materialized "snapshots" of a collection's references -- they resolve references into concrete lists of concepts and mappings.

### CTA Operations

| CTA | Ticket | Status | Milestone |
|-----|--------|--------|-----------|
| Create ($expand) | #1984 | Open | TBv3 MVP |
| Set as default | #1985 | Open | TBv3 MVP |
| Delete | #1986 | Open | TBv3 MVP |
| Update metadata | #1987 | Open | None |
| Rebuild expansion | #1988 | Open | TBv3 MVP |

All five expansion CTAs have empty bodies and no comments. This is the least specified of the authoring areas -- the CTA titles define the intended operations, but no acceptance criteria, workflows, or designs have been documented. The epic itself (#1983) has no body.

Despite this sparse specification, the operations are conceptually straightforward:
- **Create** triggers the `$expand` operation to materialize a collection's references into a concrete expansion
- **Set as default** designates which expansion is used when consumers access the collection without specifying one
- **Delete** removes an expansion
- **Update metadata** modifies an expansion's descriptive attributes without rebuilding it
- **Rebuild** re-evaluates all references in the expansion against current source content

The expansion API surface is more developed than the UI specification. The Collection Expansions API (#2272) added a cross-version endpoint (`GET /:ownerType/:owner/collections/expansions/`) that returns all expansions within a collection across all versions, with pagination support. This was deployed to QA/Staging in December 2025.

Related work on the TBv2 Collection Versions/Expansions Tab (#2288) provides insight into the expected functionality. Joe's testing feedback identified several issues including missing hyperlink formatting, missing "Released" icon indicators, incomplete "Create Similar Expansion" parameters, and discrepancies in resolved repo versions between rebuild and new expansion operations (#2288). The feedback also suggested consolidating status buttons into a single "Status: Processing/Ready" indicator.


## 4f. Reference Management

Reference management is one of the most complex authoring areas in TBv3, spanning two distinct interaction patterns: authoring references within a collection context and adding references from outside a collection. This area is actively under development as part of the "[CIEL Implementers] Collection & Reference Creation E2E Workflow" milestone.

### Add References Within Collection

The primary reference authoring interface (#2005) provides the full-featured reference building workflow when a user is already inside a collection. The specification is comprehensive:

**Reference definition options:**
- Select individual concepts or groups from available sources
- **Cascade rules**: Include children, include descendants, specify depth levels for fine-grained control over concept hierarchy inclusion
- **Mapping options**: Include/exclude mappings with filters and advanced configuration
- **Version control**: Lock references to specific concept versions, freeze options to prevent updates

**Preview before finalizing**: A comprehensive preview shows validation and grouping, a consolidated summary table (sortable and searchable), and visual indicators for versioning, cascading, and inclusion/exclusion status.

**UI/UX design requirements** documented in #2005:
- Use small icons/indicators rather than verbose text for options (versioned, cascaded, include/exclude)
- Vertical-friendly layout to display many references at once
- Reference field should have expanded/prominent space
- Support for up to 8 properties (class or extra attributes)
- Reduce cognitive load around cascade options

As of June 2025, Joe confirmed readiness to begin development, referencing mockups and "Puzzle Pieces" components in a Miro board (#2005).

### Add Reference to Collection (Quick Add)

A separate "Quick Add" pathway (#2006) supports adding references from outside the collection context -- from search results, another repository, or concept discovery views. Entry points include searching across organizations/collections and viewing concepts from other collections.

The Quick Add workflow:
1. Select concept(s) individually or select all in a repository
2. Select target collection
3. Quick Add Reference (streamlined, minimal configuration)
4. Optionally configure cascade, transform, and version locking
5. Preview results
6. Submit

This distinction between full authoring (#2005) and quick add (#2006) is a deliberate design decision to support both power users building complex collections and casual users who just need to add a few concepts.

### Reference CTAs

| CTA | Ticket | Status |
|-----|--------|--------|
| Preview | #2007 | Open |
| Delete | #2008 | Open |
| Create expansion ($expand) | #2009 | Open |
| Delete (duplicate) | #2011 | Open |
| Update metadata | #2012 | Open |

Note: #2011 was a duplicate of #2008 and has been closed. #2008 now has a full spec (requirements written April 2026) and implementation underway in oclweb3. See `02_capabilities/manage-references.md` for details.

### Collection References Tab

The Collection References tab implementation (#2273) adds listing, search, and filtering capabilities for references within a collection. This is one of the more technically detailed implementations:

**Filter syntax** (deployed to QA/Staging, January 2026):
- `?versioning=` (all, unversioned, repository, resource)
- `?repo_version=` (specific version)
- `?cascade=` (boolean or specific cascade definition)
- `?definition_type=` (all, intensional, extensional)
- `?inclusion_type=` (all, include, exclude)

The filter design went through a refinement cycle. Sunny's initial implementation used separate `resource_versioned` and `repo_versioned` boolean parameters. Jon consolidated these into a single `versioning` facet and renamed "Transform" to "Definition Type" with clearer labels ("Extensional / Enumerated" and "Intensional / Rule-based") (#2273). Jon also noted that `transform = extensional/intensional` is semantically inaccurate and ideally should be changed in the database.

Sorting was deferred because it would require adding References to Elasticsearch, which is a separate effort (#2273).

### Versioned Reference Deprecation

A significant infrastructure change (#2268) removes all pathways for creating new "resource versioned references" -- the deprecated format that embeds a resource version in the URL (e.g., `/concepts/123/123156/`). This work encompasses:

- Blocking the API from creating new resource-versioned references
- Updating the "transform references to extensional" workflow to follow the input reference model
- Removing UI links that direct users to resource-versioned URLs in both TBv2 and TBv3

The API continues to support evaluation of existing resource-versioned references until full migration. The TermBrowser helps users convert resource-versioned references into valid ones so they never reach the API. Communications include a deprecated response header and a planned email announcing the 90-day retirement timeline (#2268). Deployed to QA/Staging in December 2025; TB redirect handling remains pending. Status: Testing/QA.

### Collection Reference Cleanup

**Clean Up Collection References** (#2282) adds a UI workflow to modernize a collection's HEAD references by removing version specifications and applying cascade parameters. This addresses the common problem of collections accumulating versioned references that block automatic updates.

The workflow:
1. User accesses "Clean Up Collection References" from the Collection HEAD Actions dropdown
2. Configures target (versioned-only or all concept references), cascade preset, and preview/backup options
3. Reviews a detailed preview showing total references, concept/mapping breakdowns, and example transformations
4. System auto-saves current HEAD as a new version, processes references, creates a new expansion
5. User investigates results and commits or discards changes

Safety features include automatic backup, comparison/validation tools, and error handling for large operations (>10,000 references). Related CLI work exists in the `oclcli` tool (`ocl tool recreate_collection_with_versionless_references`), noted by Filipe Lopez (#2282).

### Collection Revert

**Restore/Revert Collection HEAD** (#2284) would allow users to restore a collection's HEAD to match a previous version's state. The specification documents two approaches:
- **Option A**: HEAD changes to match the selected version; all newer versions remain in history
- **Option B**: A new version is created that copies the selected version's state

The expansion handling question is also unresolved: should the restore re-evaluate references against current concept states (fresh expansion) or copy the exact previous expansion (historical fidelity)?

As of March 2026, Jon questioned whether this ticket is still relevant, indicating it may be deprioritized (#2284).


## 4g. Design Specifications

Several design-focused tickets define the visual and interaction patterns that underpin the authoring experience.

### Concept Detail View Header

The concept detail view header (#1620) establishes what information is visible when a user opens a concept: the publishing organization, repository (including version), concept code, concept class, and datatype. A key requirement is showing both the original source of the concept and the repo the user pulled it from (e.g., a collection), enabling dependency tracing (#1620).

**External ID handling** went through extensive design iteration. The team explored:
- A chip-style indicator with tooltip (#1620, paulsonder)
- Click-to-copy with tooltip confirmation ("External ID copied to clipboard")
- Placement options: header area, actions menu, or bottom of detail view

The agreed approach: show a truncated External ID in the header, full ID in tooltip on hover, click to copy to clipboard (#1620). This was approved by all three team members.

Design to-dos still open: incorporate External IDs and Created/Updated Date into the header (#1620).

Status: Backlog.

### Concept Detail View Associations Card

The Associations card (#1621) displays hierarchy and mapping associations from the same source. A first draft (view-only) was deployed to QA in September 2024.

Key features and discussions:

**Retired concept/mapping differentiation** (#1621, #1620): A retired mapping means "this target concept is no longer mapped to my concept," while a retired concept means "this target concept has been retired but may still be a valid mapping." The design must distinguish these states clearly.

**Inverse mappings**: Joe requested support for displaying inverse (backward) mappings -- cases where the current concept is the target of a mapping from another concept (e.g., Q-AND-A inverse maps in CIEL). This is important for seeing the full context of answer concepts and concept set membership (#1621).

**Navigation from associations**: The team decided to support "open in same context" for navigating from an association to its from/to concept, keeping the current view intact and potentially using a breadcrumb or persisted header for navigation back to the original concept (#1621). This was confirmed as ready to proceed in March 2025.

**Testing feedback** from Joe (September 2024) included:
- Three-dot menu on each mapping row with "Open From Concept," "Open To Concept," "Compare Concepts" options
- Sticky map type headers during scrolling within long lists (fixed)
- Table column spacing adjustments (fixed)
- Tooltip explanations for defined-in-OCL vs. not-defined indicators (fixed)

Status: Testing/QA.

### Detail View: Compare

The compare tool (#1623) applies to both concepts and mappings. Requirements include:
- From concept/mapping details: open the compare tool pre-populated with the current resource
- From concept/mapping history: compare two versions of the same resource
- From search results or repo browsing: compare two selected resources
- (Optional) Allow changing which resource is on the left or right side, especially important for multi-server capabilities

Status: Open, no comments. Assigned to paulsonder with TermBrowser v3 MVP milestone.

### Detail View: Change Request

The change request mechanism (#1622) has an empty body and no comments. It is assigned to paulsonder with no milestone. This suggests it is a placeholder for a future collaborative editing workflow, but no design or requirements work has been initiated.

### Form Designs

Three form design tickets track the UI specifications:

- **Create repo form** (#1615): Empty body, no comments. Testing/QA status (per hierarchy document). Assigned to paulsonder.
- **Create org form** (#1616): Designs updated and shared in Zeplin. Joe asked about switching between avatar vs. background image editing; Paul clarified it depends on whether the user clicks the background or the avatar area -- no switching needed (#1616). Testing/QA status.
- **Add references form** (#1618): Empty body, no comments. Assigned to paulsonder with TermBrowser v3 MVP milestone.


## Cross-Cutting Patterns and Observations

### The CTA Model

TBv3's authoring experience is organized around a systematic CTA (Call-to-Action) model. Each discrete user action (Create, Edit, Retire, Delete, etc.) is tracked as a separate ticket, with consistent naming: `CTA / {Object Type} / {Action}`. This model serves several purposes:
- Each action can be independently designed, implemented, and tested
- Status tracking is granular (some CTAs for a given object may be in Testing/QA while others remain unspecified)
- Entry points for each action are explicitly documented

### Implementation Status Summary

| Area | Testing/QA | Open/Todo | Backlog |
|------|-----------|-----------|---------|
| Repository | Create, Edit, Version, Release (#1978-#1981) | Templates, Fork, Import (#2025-#2029, #2155-#2157) | Copy (#1982) |
| Concept | Edit, Retire (#1991, #1997) | Clone, Add, Create similar, Add mapping, Create mapped, Import (#1992-#1996, #1998) | -- |
| Mapping | Create, Edit, Retire, Delete (#2000-#2001, #2003-#2004) | Create similar (#2002) | -- |
| Organization | Delete (#2021) | All others (#2014-#2020, #2022) | Pin repo (#2018) |
| Expansion | -- | All (#1984-#1988) | -- |
| Reference | Versioned ref deprecation (#2268), References tab (#2273) | All CTAs (#2007-#2012), Cleanup (#2282) | Revert (#2284, relevance questioned) |

### Specification Gaps

Many CTA tickets (particularly for concepts, mappings, and expansions) have empty bodies with no acceptance criteria, user stories, or design documentation. These represent "title-level" specifications where the intended operation is clear but the detailed design work has not been done. The most significant gaps:

- All five expansion CTAs (#1984-#1988): no specification at all
- Concept clone/add/create similar (#1992-#1994): no specification
- Reference CTAs (#2007-#2012): no specification
- Several org CTAs (#2015-#2017, #2020): acceptance criteria exist but design docs are "TBC"

### Key Unresolved Decisions

1. **FHIR status alignment**: Should v3 replace Released/Unreleased with FHIR's draft/active/retired/unknown model? (#1981)
2. **Mapping from/to concepts for external resources**: How to handle mappings where concepts are not in OCL (#1376)
3. **Collection revert approach**: Option A (HEAD changes, versions preserved) vs. Option B (new version created) (#2284) -- and whether to pursue this at all
4. **Expansion rebuild discrepancies**: Different resolved repo versions between rebuild and new expansion operations (#2288)
5. **Inline editing interaction model**: Whether clicking text in Edit Mode makes it directly editable or requires a menu action (#1376)
