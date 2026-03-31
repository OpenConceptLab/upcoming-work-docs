## Section 3: Consumer Experience (Viewing & Browsing)

The consumer experience in TBv3 represents the most substantial redesign effort in the project. It encompasses everything a user sees when they arrive at OCL -- from the landing page dashboard, through global search, into repository and concept detail views, and across user and organization profiles. The design philosophy, articulated across dozens of tickets and comment threads, centers on three principles: (1) align the UI with FHIR terminology conventions so that health informatics users feel at home, (2) adopt GitHub-like patterns for familiarity in profile pages, activity feeds, and repository organization, and (3) build a modular component system (chips, tooltips, search templates) that can be reused consistently throughout the application.

This section synthesizes the requirements, design decisions, implementation status, and open questions across approximately 80 issues that define the consumer persona's experience.

---

### 3a. Dashboard & Navigation

#### The Dashboard Vision

The TBv3 dashboard is the first thing a user sees and serves fundamentally different purposes depending on authentication state. The dashboard epic (#1688) -- now closed -- organized work across registration, sign-in flows, and the dashboard itself. The foundational ticket (#1612, closed) established that the dashboard acts as the home screen with two modes: signed-in and signed-out, with the signed-in version adapting content based on user behavior such as recently viewed repos, recently edited content, and recently updated repositories.

Early design work (August 2023) produced initial mockups shared via Zeplin, with skeleton layouts developed to allow parallel design and development. By December 2023, the dashboard was "feeling good" on the v3 QA environment, though still relatively basic (#1612). Design feedback from paulsonder included removing the search field border, adding placeholder text, and setting a max-width of 1024px on the content area to prevent text from sprawling across wide monitors.

#### Anonymous User Dashboard

The anonymous dashboard (#1861, closed December 2024) serves as a landing page that prompts exploration, content discovery, account creation, and learning about OCL. Its acceptance criteria include: access to global search, a feed of content highlights (not personalized), an OCL blog feed, sign-in/registration prompts, a tour option, and a nav menu. Importantly, it must be "prepared for non-OCL Online implementation" -- meaning local OCL deployments need sensible defaults.

The highlights feed for anonymous users is generated from events by superusers (specifically, the `ocladmin` user's followed entities), filtered to `CREATED`, `RELEASED`, or `FOLLOWED` event types (#1861). Blog posts from the OCL website are pulled into the dashboard feed, with dates displayed in a written-out format (e.g., "Oct 23, 2024") per a decision made during implementation (#1861). A design for unauthenticated users attempting to access restricted content was also provided (#1861).

The "Take a tour" feature remains outstanding and is tracked separately.

#### Authenticated User Dashboard

The authenticated dashboard (#1862, closed December 2024) extends the anonymous version with a personalized feed and user navigation menu. Separate designs exist for OCL Online and for other instances (local deployments). The feeds and events specification is maintained in an external spreadsheet that defines what events appear and under what conditions.

Implementation was deployed to QA in September 2024, prompting iterative feedback. Key design decisions that emerged:

- **"Your Recent Activity"** appears as a sidebar feed. Initial feedback requested more spacing between the profile picture and the feed title, and questioned whether the profile picture was duplicative (#1862).
- **Activity feed behavior:** Events from followed repositories appear in the "All" and "Following" tabs. Org-level events (e.g., a member creating a source version) do not automatically appear unless the user follows the specific entity. This was an intentional architectural decision, though it surprised testers (#1862).
- **Dashboard width:** Initially constrained by design, it was expanded to 1440px after feedback that the layout was too narrow (#1862).
- **"What's New" label:** The "Recent Activity" heading was renamed to "What's New" to match the design spec (#1941, closed).
- **Empty state bug:** A bug where the signed-in empty state showed nothing on staging was fixed (#1967, closed). The corrected empty state shows highlights and OCL branding artwork.

All resources in the activity feed are hyperlinked for navigation (#1862). The feed supports tabs for "All", "Following", and "Organizations" event streams.

#### Dashboard Feed Design

The initial proof-of-concept feed (#1708, closed) was scoped as "recently updated repositories" belonging to the user's orgs or owned repos, sorted by last updated. This was later subsumed into the authenticated dashboard work (#1862).

A separate feed for "Updated Reference Content" (#1771, closed) was planned to show the latest updates to reference terminology content (e.g., standard code systems). This raised questions about how content is marked as "reference" (potentially via the global canonical URL registry), whether change summaries are auto-generated, and what triggers feed entries (likely released versions). The specification was folded into #1861.

#### Registration and Sign-in

Registration was enhanced to include Company and Location fields (#1663, closed January 2024), requiring a custom KeyCloak theme for the registration form. The sign-in/sign-out flows using KeyCloak theming were completed (#1702, closed).

Custom email templates for account verification and password reset (#1858, closed July 2024) were designed by paulsonder and implemented. These include OCL branding, environment-specific subject lines (e.g., "OCL-QA"), and styled HTML bodies. A limitation was discovered: KeyCloak does not support variables in email subject lines (keycloak/keycloak#11883), so environment-specific subjects could not be fully automated. The logo also could not be embedded as originally designed due to a KeyCloak limitation with image embedding in emails (#1858).

#### Community Website Link

A simple but useful feature (#1724, closed January 2024): a link in the Account menu that opens the community website (openconceptlab.org) in a new tab, with an icon per the design spec.

#### Search UI and the Searchlight Component

Search is arguably the most cross-cutting consumer feature, touching global search, in-repo search, and resource selection throughout the application. The search epic (#1694, open) organizes work across multiple child tickets.

**Searchlight** (#1704, closed February 2024) is the unified search component in the header bar. Its core user story: a user can search inside a repository or across all of OCL from one search bar, selecting their preferred scope via arrow-down navigation. The design was implemented and deployed quickly, with refinements including: showing the "Search OCL for..." option only after typing begins, and removing the loading screen when clearing a previous search.

User stories for the broader search experience (#1694) were documented in November 2023 and include: limiting results by free text or filters, specifying which field to search within, exact match support (using quotation marks -- noted as not currently working), navigating concepts without losing search context (via independent left- and right-side panels), selecting multiple results for batch actions (compare, clone, add to repo, download), changing sort order, and getting brief insights about repos/users/owners.

paynejd provided a comprehensive taxonomy of search-like behaviors throughout the app (#1694), identifying: regular search results (global, org-level, user profile, repo-level), less-regular results (clone/add-to-collection workflows, concept details associations, collection reference addition, concept diff), and search-like selection behaviors (concept/mapping create/edit forms, dropdown lists populated by OCL sources). This mapping underscores the need for standardized, reusable search components.

**Search Results Templates** (#1703, closed February 2024) established the template patterns: side filters (always open for global search, closed by default for in-repo views), table and card layouts, and split view. A "Clear N filters" button was implemented. Templates were built for concepts, repositories, orgs, and users. ConceptMap/Mapping search templates were noted as still TBD.

**Searchlight Enhancements** (#1754, open) track additional improvements: the ability to search a user's repos from their profile, and search variations that route to specific tabs in global search (e.g., typing "CIEL" and being routed directly to organization search results). The design is modular, allowing "in-page" search to be handled separately (#1754). Development was approved in July 2024 but status is Todo.

**Search a Repository** (#1877, open) addresses in-page search functionality with requirements for: searching results including hierarchical displays, skipping through results, highlighting matches, clearing search, and viewing paginated results. An early design video demonstrated distinguishing between searching a repo via global search vs. searching while remaining on the page. Known v3 gaps include: results limited to 10,000, owner chips missing avatars, missing latest released version ID column, and Searchlight lacking repository-specific search.

**Loading Performance** (#1741, open) notes that the bouncy ball loading icon appears with every search, potentially making performance feel slower than it is. The proposal defines three levels: instant results, briefly loading, and taking longer than expected, with the loading icon appearing only for the latter two.

**Sort Order Issues** (#1975, open) documents problems discussed at OHIE: duplicate sort values (up and down for each attribute), a confusing default sort by ID, separate sorts for ID and Numerical ID, and multiple sorting mechanisms (Sort By menu and table headers). paulsonder is assigned to simplify this.

**Mapped Concept Icons** (#1974, open) would bring back a v2 feature: an info icon explaining why a concept appears in search results when the match is via a mapping relationship rather than direct text match.

---

### 3b. Repository Views

#### Repository Consumer Epic

The repository consumer epic (#1625, open) is the largest design unit in the consumer experience. jamlung-ri provided an exhaustive catalog of repository information needs in December 2023, organized into tiers:

**Basic required info:** short name plus ID, OCL type (dictionary, source, collection, CodeSystem, ValueSet, ConceptMap, etc.), owner (org or user), latest released version number.

**Secondary optional info:** full repo name with description snippet, content summary (concept count, version count), date of last released version, canonical URL, permission level (public/private), default and supported locales, and a future "trusted"/"verified" indicator (e.g., the real CIEL vs. someone's CIEL subset).

**GitHub-like attributes (aspirational):** activity sparklines, favorite/subscribe counts, most common topics (top 3-5 concept classes).

**Source-specific info:** all basic and secondary info plus content summary (concept/mapping counts, version counts, most common concept classes, locales ordered by frequency).

**Collection-specific info:** same as source except using reference counts instead of version counts, and most commonly referenced sources instead of locales.

A comprehensive table of repository CTAs was documented (#1625): View, Search, Compare, Export, Bookmark/Star, Operations, and Share -- each with user stories and requirements.

**FHIR Acceptance Criteria** were added in August 2024 (#1625): view repo identity (ID, canonical URL, version, name, title), view metadata (publication status, experimental, date, publisher, contact, description, useContext, jurisdiction, purpose, copyright, caseSensitive, hierarchyMeaning, compositional, content, supplements, count), view narrative text for human-readable rendering, view extensions for non-FHIR attributes, and view core content (CodeSystem filters/properties/concepts, ValueSet compose/expansion, ConceptMap groups).

#### Repo Type System

Repo type (#1727, open; #1699, open; #1752, open) is foundational to the consumer experience. The design decision that "Repo IDs should always be shown with Types" (#1776) reflects the reality that in FHIR, ValueSets and CodeSystems can share the same ID. OCL distinguishes between: Source, Collection, ValueSet, Code System, Concept Map, and Dictionary.

A key behavioral decision flagged as "discussion-needed" (#1752): when clicking a repo in global search, the user should navigate to the latest release instead of HEAD. This also affects what the "Latest Release" column shows for repos with no release. This ticket is related to the broader #1699 epic about defaulting to the latest released repo version and hiding individual resource versions.

#### Repository Header

The repo header (#1871, open, Todo status) specifies key attributes: full name, identifier, description, primary and supported locales, website, access permissions, created/updated dates, picture/icon, selected version, and ability to "View all attributes." This remains in the design backlog.

#### Repository Version Selector

The version selector (#1872, open, Todo) replaces the v2 versions tab. The design decision (#1955, closed, Done) was to deprecate a separate versions tab in favor of positioning the version picker in the page hierarchy so that content below inherits the selected version. The picker includes more information than v2 to function as both a list and a menu. Designs include states for: no version selected (with current version highlighted), and multiple versions selected (enabling comparison).

Implementation feedback (#1955) identified issues: private versions showing no way to navigate back without the browser back button, and empty icons appearing when no default expansion exists for a collection version (suggesting "N/A" placeholder text with a tooltip).

The version metadata was moved from a separate area to the header and expansions table (#2275, closed, Done).

#### Repository Summary

The repo summary panel (#1950, closed December 2024; originally from #1478) sits on the right side of the repo template. It shows counts of concepts, mappings, concept classes, datatypes, map types, languages, and name types. For a selected repo version, it shows active/retired breakdowns.

**Design evolution:** The original v2 implementation (#1478) was acknowledged as "scrappy." paulsonder suggested bringing the summary into the repo right bar, but performance concerns emerged -- CIEL's summary took about 20 seconds to load (#1478). The summary also needed to account for expanding details (originally in tooltip hovers) and for collection-specific content showing which source versions are being pulled from (#1478).

**UI decisions from v2:** Skeleton loading was preferred over spinner loaders -- "Skeleton all the way" (paulsonder, #1478). Retired concepts indicator bars should show Active out of Total rather than leading with retired/red (#1478). Mapped-to/from controls should sit inside accordions for obvious interactivity (#1478).

**Implementation in v3:** Each summary statistic line is intended to be clickable, filtering the concept/mapping list accordingly (#1950). Icons were updated to match designs. A "re-run summary" link was added for cases where summary calculations fail (#1950), addressing two failure modes: HEAD version not updating counts, and version calculation jobs failing (the 95%+ case per snyaggarwal).

**Open question:** How the canonical registry should be represented in the summary panel remains under discussion (#1950).

#### Repository Overview / About

The overview tab (#1951, open) houses "About" information in structured lists aligned with FHIR spec organization. The intent is to "visually and mentally start aligning our users towards a more consistent presentation" of content metadata (#1951). An extensive list of fields was compiled, including both OCL-native attributes (created on/by, custom attributes, locales, website, external ID, processing status, auto-ID settings) and FHIR attributes (content_type, revision_date, case_sensitive, collection_reference, compositional, meta, hierarchy_meaning) (#1951).

A separate "About" page (#1892, open, Todo) handles verbose descriptions, license information, and repository activity feeds. It mirrors the approach used for User and Org pages with defined empty states.

An empty state design was created for repos with no About content (#1951).

#### Repository Comparison

Version comparison (#1853, open, Testing/QA status) allows consumers to see differences between two repository versions. User stories define three levels: summary of differences (stat counts), list of specific changes (new/retired concepts), and expansion-level comparison (comparing expansions from potentially the same version).

Out-of-scope-for-now user stories include: seeing changes relevant to content the implementer uses, comparing FHIR resources, and comparing $lookup responses.

Design was delivered in September 2024 with videos demonstrating loading states and version selection UX. Implementation is in QA as of May 2025, with last steps including grouping the concept list by change type, adding icons for concept comparison view, and adding concept detail previews (#1853).

A follow-up ticket (#2181, open) tracks MVP gaps: mappings and JSON diff in the comparison view. The JSON diff approach draws cues from jsondiff.com (#1853).

#### Objects Chip System

The chip/object view (#1776, open, Backlog) is a cross-cutting design system component that represents repositories, concepts, users, and organizations as compact, recognizable visual elements. This went through extensive design iteration from March through October 2024.

**Core design problem:** OCL is multi-tenant, so the same code system ID and canonical URL can be defined multiple times. A chip must convey: repo ID (always required), repo type (always required), owner (usually), and version (usually). Without all four, you often cannot identify which repo is being discussed (#1776).

**Key design decisions:**

- Repo ID and repo type are the most important and should be emphasized visually, even though the owner comes first in the tree hierarchy (#1776).
- Chips should not wrap text per Material guidelines; truncation with tooltips handles overflow (#1776).
- A "no version" state simply omits the version content rather than displaying "no version" text (#1776).
- Version-less references need distinct handling: "latest" is a special keyword always pointing to the latest release, "latest (v2.77)" is a resolved reference, and bare "latest" is unresolved (#1776).

**Chip variants were designed for:** Organizations, Users, Repositories, and Concepts, each with corresponding tooltip designs showing extended information (#1776, September 2024). After the October 2024 dev/UAT call, slight updates were requested.

**Usage guidelines:** Chips are used in repository headers and dashboard event cards. Chips always show corresponding tooltips. A proposal to avoid chips in data tables was confirmed -- data tables use a different layout (#1776). paulsonder raised an important design system concern: when to use chips vs. other representations, noting that a list full of "fully loaded chips" would be difficult to read.

**Implementation questions** from snyaggarwal (#1776): what representation to show where (rules), what is mandatory without tooltip, and what goes inside the tooltip. A key rule: "Repo should never be shown without repo type and may be always with version (if applicable)."

#### Repo Type Filter

A repo type filter in repository listings (#2252, closed, Done) was implemented to allow filtering by repository type in search results.

#### Following and Bookmarking

Following/bookmarking (#1780, closed December 2024) underwent significant conceptual evolution. The initial framing was "bookmarks" -- a way to tag resources for quick navigation and narrower search results. Discussion evolved this into a "Follow" model, more aligned with GitHub conventions (#1780).

**Conceptual distinction:** Pins are how an owner highlights content they own to other viewers. Bookmarks/follows are how a user tags any owner/repo for personal tracking. These must remain separate (#1780). The API backend model is flexible: the existing Pin model (with resource_type, resource_uri, and order) was proposed to be extended with a `type` field for Pin, Bookmark, or Follow, with type-specific validations (#1780).

**Followable resources:** Organizations, repositories, users, and concepts. Concept following supports monitoring for updated mappings/attributes. Concept Proposals would be auto-followed once implemented (#1780).

**Events framework:** Events were documented in a separate spreadsheet. Initial events implemented include: Org Create/Delete, Source Create, Source Version Create, Follow/Unfollow User (#1780). Events for deleted resources initially showed "Created None" / "Deleted None" when the underlying resource no longer existed -- this was fixed (#1780).

**UI implementation:** An Input Chip design was used for follow/unfollow states. The follow/unfollow feature was deployed to QA in August 2024. Dashboard integration followed, with the "Your recent activity" section and the main feed reflecting followed entities.

#### Download and Export

Repository download/export (#1873, open) requires: compressed OCL-formatted JSON, CSV, and FHIR representation downloads. Mapping download (#1880, open) requires OCL-formatted JSON and potentially a FHIR representation of a single mapping, with clarity on which repo version applies.

#### Mapping Listing

The mapping listing view (#1758, open, marked OHIE Must-Haves) went through multiple design cycles. The original v2-derived design was noted as the "only place in the termbrowser where we display a concept like this" with just an ID, prompting a call for showing display names instead (#1758).

**Requirements (#1758):** filterable list, key attributes always visible (source/target repos, from/to codes, map type), visual indicator for custom attributes with expand option, indication of whether from/to concept exists in OCL with navigation, and retired styling for mappings and concepts.

**Design evolution:** paulsonder proposed grouping by source, with hover states and clickable concepts (#1758). jamlung-ri suggested incorporating repo chips (#1776) for better previews and proposed an MUI Collapsible Table approach: groupings by From Source, To Source, then Map Type as width-spanning collapsed rows that expand to show concept details (#1758).

The new mapping list design (#1948, open, Backlog) uses AG Grid with a Material theme for grouped data presentation. Grouping is by From Source + Target Source, with expandable rows. The design includes resolved/unresolved styling and retired concept indicators (#1948). Implementation was deployed to QA in November 2024 without grouping initially. Feedback addressed: long source IDs overflowing cells, broken hover tooltips on unresolvable repos, and concept tooltips not yet implemented (#1948).

**Grouping and filtering discussion (#1948):** Two grouping approaches -- (from source + target source) and (from source + from concept) -- serve different use cases. Filtering by map type is essential; filtering by target source and additional metadata (e.g., mappings with comments) is useful. Pagination should use infinite scroll given the hierarchical nature of mapping data.

**In-namespace mappings** (#1972, open, Testing/QA) addresses showing mappings within the same namespace in concept details.

#### Mapping Detail View

The mapping detail view (#1952, closed December 2024) was designed and implemented with iterative QA feedback. Key details:

- From/to concept boxes with source context, clickable to navigate to the concept
- Unresolved sources/concepts show no hyperlinks and no hover tooltips
- Truncated source text shows a tooltip on hover
- Properties section shows sort weight and extra attributes, hidden when empty
- Standard and smart checksums moved to the footer (borrowing from GitHub's checksum display approach)
- Source preview tooltips show short name/ID rather than relative URL
- Custom attributes appear with a "Custom" tag

A transition smoothness issue between mapping selections was noted but deferred to a future ticket (#1952).

#### References and Expansions

References and expansions are among the most complex consumer views, reflecting OCL's unique approach to building collections/value sets from reference expressions.

**Reference List** (#1949, open, In Development) shows references with their expressions, filters, and results. The design includes two views: expression/filter view and results view. Feedback highlighted the need to show whether references point to concepts or mappings, to clearly distinguish intensional references from grouped extensional references, and to show mapping references. This was acknowledged as "one of the hardest and most complex views" in TBv3 (#1949). A v2-based version was deployed to QA and Staging in late 2025 (#1949).

**Reference Detail** (#1953, open) shows individual reference attributes and a "View Expansion" tab with resolved concepts and mappings, including orphaned mappings and the resolved source URL. The design supports selecting different expansions. Closed duplicate: #1894.

**Reference Preview** (#1895, open) enables evaluating a reference on-the-fly without saving to an expansion -- critical for understanding how OCL would resolve a reference in isolation.

**Reference Search** (#1896, open) faces a technical limitation: references are not indexed in Elasticsearch, limiting search capabilities. Adding ES indexing with facets was proposed (#1896).

**Expansion View** (#1889, open) shows concepts/mappings resulting from expanding references, with optional grouping by reference/repo, filtering, expansion parameters, repo versions used, canonical URL resolution details, and all metadata.

**Collection References Tab** (#2123, open) tracks the broader consumer view of repository references and expansions.

**History for concepts and mappings** (#2290, open, User Testing) implements version history viewing in TBv3.

---

### 3c. Concept Views

#### Concept Detail Header

The concept detail header (#1620, open, Backlog) is assigned to paulsonder and tracked under the TermBrowser v3 MVP milestone. Specific requirements have not been extensively documented in the available tickets, but it follows the same header pattern established for repositories: key identifying information, version context, and action buttons.

#### Names and Descriptions

The names and descriptions card (#1734, open) has detailed requirements and went through thorough design review:

**Display requirements:** Group by locale/language (2-3 letter codes, lowercase by convention). Within a locale, sort by: "Preferred within locale" flag and Fully Specified Names first, then tagged names, then untagged names. Show name/description with truncation for long text, name/description type (as a chip), external ID with copy functionality, visual indicator for "preferred name within locale" flag, and ability to copy URL for each name/description (#1734).

**Design iteration:** paulsonder delivered initial designs in April 2024 showing the card in various states. jamlung-ri's feedback requested: multiple names within one locale (e.g., several EN names), long descriptions, auto-generation indicator for external IDs, and a "finished with names" workflow that submits all changes in a single API call (#1734).

**Key versioning decision:** Changes should be saved only when a user clicks "Finished editing," creating one new version with all changes rather than a separate version for each individual name addition. This was confirmed as the preferred approach (#1734). A dialog warning about unsaved changes when leaving edit mode was also planned.

**Long text handling:** MUI's textarea-autosize component was selected for fields that may have long descriptions (#1734).

#### Concept History

Concept version history (#1739, open) is tracked for design under the TermBrowser v3 MVP milestone. Implementation of history viewing for concepts and mappings in TBv3 is in User Testing (#2290).

#### Associations Card

The concept associations card (#1621, open, Testing/QA) shows mappings/associations for a concept. This is essentially cascade results with no recursion (as noted by paynejd in #1694). The design discussion included how to better display hierarchy in this panel and whether hierarchy editing should be incorporated (#1822, open), though hierarchy is technically different from mappings.

#### Collection Membership

Collection membership (#1738, open, marked discussion-needed) shows which collections contain a given concept. Specific requirements and design work are pending.

#### Hierarchy and Cascade

Hierarchy/cascade visualization spans multiple tickets. The cascade preview visualizer (#1455, open) is a top-level item. The hierarchy/cascade component (#1700, open) addresses "seeing context for a concept" -- critical for hierarchical code systems like ICD.

jamlung-ri documented current hierarchy/cascade appearances in OCL (#1700): Add to Collection (cascade only, no visualization), Clone workflow, concept details in global search, operations panel, hierarchy tree view (ICD), and cascade visualizer (for both ICD hierarchy and CIEL mappings).

The hierarchy as part of Add/Edit Mappings (#1822, open) emerged from discussions about showing parent/child relationships alongside mappings in concept details, noting that hierarchy relationships are technically different from mappings.

---

### 3d. User & Org Profiles

#### User Profile

The user profile went through two rounds of design and development. **Round 1** (#1756, closed March 2024) established the basic layout: left panel with avatar, name, organizations, and right panel with repos. Designs were provided for both viewing and editing states.

**Key decisions from Round 1:**

- Edit button placement follows GitHub's pattern: below the name/username (#1756)
- Left nav with icons is kept consistent across pages (#1756)
- Organizations without logos use 2-character abbreviation with hover tooltip, preferred over GitHub's random placeholder images (#1756)
- "My Repositories" shows repos owned by the user and by orgs where the user is a member; "User Profile" shows only repos owned directly by the user (#1756)
- A new API endpoint was needed to list user's repos plus repos owned by orgs the user belongs to (#1756)
- Owner column should be removed from the User Profile repo list since all repos are owned by the viewing user (#1756)

**Empty state and activity feed** (#1800, closed July 2024) addressed the problem that new users see an empty, valueless page. Activity feed events include: Joined OCL, Updated Profile, Created an Organization, Became a member of [org], Created/Published a Repository. An "About Me" section encourages users to write a blurb with a "Tell us about yourself" prompt (#1800).

**User summary statistics** available from the API (#1756): count of sources, collections, org memberships, directly owned orgs, and bookmarks. The team noted the lack of a verbose summary API for users/orgs and suggested creating one (#1756).

**Profile access permissions** (#1852, closed June 2024): Anonymous users cannot view other profiles; logged-in users can see any profile. Actions like "Copy API Token" and "Edit Profile" are restricted to the profile owner. The 403 vs 401 distinction was clarified: 403 is for authenticated users without access (no sign-in prompt needed), 401 is for unauthenticated users (already has sign-in/register) (#1852).

**User bio** (#1942, closed October 2024): enforced a character limit (under 200 characters), with the short bio displayed next to avatar and username.

**User settings page** (#1798, open, discussion-needed): a single entry point for customizing the OCL experience, including personal settings and links to collaborative object settings (e.g., Organization editing). Design shows a left-hand navigation with different setting categories, some editable in-page and others linking to specific edit UIs.

**User canonical registry** (#1888, open): adds a "View Canonical URL Registry" CTA to user profiles when registry entries exist. paulsonder prototyped a modal approach that keeps the user in context rather than navigating to Settings. The indicator appears only when registry entries are configured. A "Learn more" link would point to either help documentation or the canonical URL tool itself (#1888).

**Form / Edit user profile** (#1617, closed) and **Profile / User** (#1627, closed) completed the core user profile implementation.

#### Organization Views

Organization views followed a similar two-round pattern. **Round 1** (#1757, closed March 2024) established the basic org home page with an overview tab (About section, pinned repos) and a repositories tab.

**Design challenges:** Empty organizations posed a significant UX problem. When an org has no About section, no bookmarks, and no repos, the page was barren (#1757). paulsonder proposed combining the About and Repos sections (following GitHub's approach), adding pinned repositories, a featured repositories section (showing most recently updated repos unless the owner specifies others), and an empty state design (#1757).

**Pinned vs. Featured distinction** (#1757): jamlung-ri raised the question of differentiating pinning (more highlighted) from featuring. A "truly empty" state design was created for brand-new organizations with only minimum info, drawing inspiration from GitHub's blank repo page with immediate calls to action (#1757).

**Round 2** (#1799, closed August 2024) addressed: aggregate statistics across repos (novel concepts, published versions, most common concept classes), org ID in the header, member overflow for 8+ members, CIEL icon display, and empty state handling.

Detailed implementation in Round 2 included:

- "View all attributes" as a two-column table in a modal/popup for core and custom attributes (#1799)
- "View Canonical URL Registry" link when a registry exists (#1799)
- Browse Members dialog triggered from the org statistics panel (#1799)
- Default org avatar for orgs without uploaded logos (#1799)
- Org ID (short code) added to the header after it was noticed missing (#1799)
- Created date and metadata display in the About panel (#1799)
- Attribute redundancy eliminated between header and additional attributes popup (#1799)

**Outstanding items for org views:** Activity feed (dependent on events framework), number of followers statistic, "Add a member" button (no design yet), and download/share button consolidation.

**Global Search for Orgs** (#1864, open) tracks enhancements: mini org avatar in results, org summary (sources/collections/members count), filters/facets, and card view. paulsonder proposed keeping global search results inside Searchlight (as a modal overlay) rather than navigating to a separate page, which jamlung-ri supported for both UX and workflow benefits (e.g., the "add to collection" workflow could use a windowed global searchlight) (#1864).

**Org/User pinned repos sizing** (#1966, closed, Done) fixed a bug where pinned repos were shrinking too much on the page.

#### My Repositories

"My Repositories" (#1802, open) is an epic covering the user's personal repository management view. The initial implementation (#1755, closed March 2024) was deployed to QA with: table view of repos, pinned repos, and repo creation. Feedback led to: adding an Owner column, fixing pinned repo display (showing pin ID instead of repo name), and handling blank descriptions gracefully (show description, then full name, then nothing) (#1755).

Follow-up tickets include: Card View for My Repositories (#1803, open) and Create/Update from My Repositories (#1804, open, Testing/QA).

The distinction between "My Repositories" and the User Profile page was debated (#1755, #1756): My Repositories shows repos from all orgs the user belongs to plus the user's own repos, while the User Profile shows only directly owned repos. This mirrors GitHub's approach.

#### Sharing

Concept sharing (#1865, open, Backlog) defines a Share button with dropdown options: "Share this Page" (human-readable URL preserving search context), "Copy as FHIR Coding" (canonical pointer in FHIR Coding format, only for CodeSystem/Source with canonical URL), and "Copy OCL API" (API URL). The FHIR Coding option follows the FHIR spec format with system, version, code, and display (#1865). An open question remains about how sharing works within the context of a collection (#1865).

Repository sharing (#1916, open) requires human-readable URLs that navigate to the same location, an optional Share button, and FHIR representation links if available.

---

### Summary of Status and Key Patterns

#### Completed Work
- Dashboard for both anonymous and authenticated users (#1688 epic closed, children #1612, #1663, #1702, #1708, #1771, #1858, #1861, #1862, #1941, #1967 all closed)
- Searchlight component (#1704 closed) and search results templates (#1703 closed)
- Community website link (#1724 closed)
- User Profile Round 1 (#1756 closed) and Round 2 (#1800, #1627, #1617, #1852, #1942 closed)
- Org Home Round 1 (#1757 closed) and Round 2 (#1799 closed)
- My Repositories initial implementation (#1755 closed)
- Following/bookmarking (#1780 closed)
- Repo Summary (#1950 closed), Versions (#1955 closed), Mapping Detail (#1952 closed)
- Design for repo+version display (#1715 closed, subsumed into #1776)
- Custom emails (#1858 closed)
- Repo Type Filter (#2252 closed)
- Repo version metadata in header (#2275 closed)

#### In Progress / Testing
- Repo version comparison (#1853, Testing/QA)
- Concept associations card (#1621, Testing/QA)
- In-namespace mappings (#1972, Testing/QA)
- Concept/mapping history (#2290, User Testing)
- Collection References tab (#2273, User Testing)
- References list (#1949, In Development)

#### Open Design / Planned
- Concept detail header (#1620, Backlog)
- Objects chip system (#1776, Backlog)
- Repo header (#1871, Todo), version selector (#1872, Todo), overview (#1951, Todo)
- About page (#1892, Todo)
- Mapping listing with grouping (#1758, #1948, discussion-needed)
- Search enhancements (#1754, #1877, #1866)
- Download/export (#1873, #1880)
- Sharing (#1865, #1916)
- Reference detail/preview/search (#1953, #1895, #1896)
- User settings (#1798, discussion-needed)
- Hierarchy/cascade (#1455, #1700, #1822)
- Names and descriptions (#1734)
- Collection membership (#1738, discussion-needed)
- Sort order fixes (#1975)
- Loading performance benchmarks (#1741)

#### Design Principles Observed

1. **Skeleton loading over spinners** -- confirmed early and applied throughout (#1478)
2. **GitHub as UX precedent** -- profile layouts, edit buttons, empty states, following model all draw from GitHub patterns
3. **FHIR alignment** -- repo overview structured to match FHIR resource metadata, acceptance criteria include FHIR search parameters, sharing includes FHIR Coding format
4. **Modular components** -- chips, tooltips, search templates designed for reuse across all resource types
5. **"Finished editing" pattern** -- batch save rather than per-field versioning, creating one version with all changes
6. **Infinite scroll for hierarchical/grouped data** -- preferred pagination method for mappings and similar nested content
7. **Context preservation** -- users should be able to search and browse without losing their current position (split panels, modal overlays, Searchlight staying in-page)
