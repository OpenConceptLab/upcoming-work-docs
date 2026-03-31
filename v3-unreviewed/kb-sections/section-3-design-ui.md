## Section 3: Design System & UI Components

This section provides a deep dive into the 20 design-themed issues in the V3 unreviewed bucket. These issues collectively define the visual language, component specifications, and UX patterns for OCLv3's TermBrowser interface.

---

### 3.1 The Design System Epic (#1381)

**Issue:** #1381 -- "Design system"
**Status:** CLOSED (March 2026)
**Assignee:** @paulsonder
**Labels:** Epic, Design, DS, V3

The design system epic served as the top-level container for OCLv3's UI/UX design work. Created October 11, 2022, it ran for over three years before being closed during the March 2026 cleanup. The epic had no body text or comments -- it functioned purely as an organizational anchor, with individual design spec issues filed beneath it.

The design system is built on Material Design 3 (M3) guidelines, as evidenced by references across child issues to M3 components (navigation drawers, modals, data tables), M3 color tokens (primary80, primary90, primary95), and M3 interaction patterns. Design deliverables were primarily shared via Zeplin links and Loom video walkthroughs.

**Key decisions embedded in design work:**
- Adoption of M3 as the component framework
- Use of Zeplin for design handoff between @paulsonder and @snyaggarwal
- "Dot" favicon as the standard OCL icon across all properties
- Modal drawer (not persistent rail) for navigation
- Infinite scroll / virtual scroll for data tables instead of traditional pagination
- Distinct highlight colors for row selection vs. checkbox checking (Gmail-style interaction)

### 3.2 Closed Design Specifications

The following 16 design issues were completed (closed), roughly in chronological order of delivery:

#### Authentication & Onboarding

**#1479 -- OCL sign in, sign up, forgot password pages** (Closed Feb 2024)
- Assignee: @paulsonder
- @paynejd requested designs cover the full sign-in workflow across OCL Community Website, TermBrowser, and OCL Chat
- @paulsonder delivered updated designs via Loom walkthrough (July 2023)
- Implemented by @snyaggarwal in the KeyCloak theme

#### Forms & Versioning

**#1619 -- Form / Create Version** (Closed March 2026)
- Assignee: @paulsonder
- Empty body, no comments -- a placeholder design spec that was closed during cleanup
- Disposition: review (may need fresh ticket if form/version create designs are still needed)

#### Notifications & Social Features

**#1628 -- Notifications** (Closed March 2026)
- Assignee: @paulsonder
- Empty body, no comments -- design spec for a notification system
- Disposition: close-stale. No notification system has been built for v3; if needed, a fresh ticket with updated requirements should be created
- Note: The February 2026 CIEL Implementer ticket #2348 (dependency change notifications) represents the current thinking on notifications

**#1629 -- Comments** (Closed March 2026)
- Assignee: @paulsonder
- Empty body, no comments -- design spec for a commenting system
- Disposition: close-stale. No commenting system exists in v3; the concept proposals ticket (#2353) includes discussion threads as a related feature

#### Account & Navigation

**#1630 -- My account menu** (Closed March 2026)
- Assignees: @snyaggarwal, @paulsonder
- Defined the account menu with 9 items: profile, repos, orgs, bookmarks, UI language, settings, server switch, help docs, OCL chat
- @paulsonder delivered a design mockup (August 2023) showing the menu layout
- Disposition: review (menu was implemented but design spec may contain unimplemented items)

**#1775 -- Navigation drawer** (Closed March 2024)
- Assignees: @snyaggarwal, @jamlung-ri, @paulsonder
- Moved left navigation from a persistent rail to a modal drawer per M3 guidelines
- User story: quickly navigate to owned/bookmarked/collaborative content without confusing browse-only users
- Detailed design review between @paulsonder and @jamlung-ri on overflow handling (>5 orgs shows "Show all" link)
- @snyaggarwal implemented in ~2 days: no collapsed menu, drawer-based, orgs/repos/bookmarks in drawer, hidden for logged-out users
- @paulsonder provided feedback on active link rounded corners and drawer close-on-click behavior

#### List Views & Mappings

**#1631 -- List view / Mappings** (Closed March 2026)
- No assignees, no body
- @jamlung-ri noted potential duplicate of #1758 and raised questions about mapping column requirements and ConceptMap-like views (February 2024)
- Disposition: review (mappings list view work continued in other tickets)

#### Community Website

**#1632 -- Community website** (Closed March 2026)
- Assignee: @paulsonder
- Empty body, no comments -- placeholder for community website design
- Disposition: close-stale. Superseded by the detailed community website ticket #1797

**#1797 -- Community website** (Closed July 2024)
- Assignees: @kaalcumm, @paulsonder
- Labels: Design, V3, community site
- Comprehensive community website design project built on Webflow with Relume components
- Work included: copy updates, imagery, trademark review (FHIR, SNOMED CT, LOINC), user testimonials (PIH quote from Ellen Ball, Brazil quotes from Beatriz de Faria Leao and Italo Macedo)
- Final designs shared on Miro board with outstanding question around app screenshot imagery
- Involved multi-stakeholder review with @kaalcumm handling community engagement and @jamlung-ri sourcing approval for testimonials

#### Error States & Edge Cases

**#1693 -- Error pages** (Closed Feb 2024)
- Assignees: @snyaggarwal, @paulsonder
- @paulsonder delivered error page UI designs via Zeplin (December 2023)
- Implemented and deployed by @snyaggarwal

#### Branding & Icons

**#1707 -- Fav icon** (Closed Dec 2023)
- Assignee: @paulsonder
- Initial favicon design specification

**#1718 -- v3 Fav icons** (Closed Jan 2024)
- Assignee: @snyaggarwal
- @paulsonder provided favicon asset package (ZIP with multiple sizes)
- @snyaggarwal implemented across v3 properties
- The "dot" favicon was established as the standard, with @paulsonder noting the full logo is not legible at small sizes

#### Internationalization

**#1719 -- Right to left support - exploration** (Closed Jan 2024)
- Assignee: @paulsonder
- Exploratory design mockup showing RTL layout for search results and detail view
- @paulsonder delivered design via Zeplin and noted a new ticket should be created when RTL needs deeper exploration
- This was a proof-of-concept, not a production implementation

#### Search Results

**#1725 -- Repo version in search results** (Closed Feb 2024)
- Assignees: @jamlung-ri, @paulsonder
- User story: dictionary managers need to understand the source version of concepts in their collections
- @paulsonder delivered UI via Zeplin; @snyaggarwal deployed to QA
- @jamlung-ri confirmed concept search results looked good and asked about extending to repo search results
- Discussion yielded a second user story: consumers/dictionary managers want to see latest released version and release date to assess whether content is actively curated

#### Repository Design

**#1935 -- Repository design** (Closed Oct 2024)
- Assignees: @snyaggarwal, @paulsonder
- While labeled TermBrowser (not Design), this is the most comprehensive design specification in the bucket
- Covers: header patterns (code, type, version, name, owner, CTAs), summary panel (chips, summary stats, contributors with avatars), overview tabs (metadata modeled on FHIR resource attributes grouped by Descriptions/Use, Publisher/Contact, Reviews/Approvals), content tabs (concepts with hierarchy/card views, mappings with group-by-source, references with group-by-source, expansions), and version selector
- Key discussion points: expansion picker positioning relative to content vs. metadata, infinite scroll for grouped data tables, CRMI attributes placement, mapping pagination in grouped views
- Full design screens delivered via Zeplin

### 3.3 Open Design Issues (Reviewed/Keep)

Four design issues remain open and have been marked `reviewed/keep`, indicating they represent active or planned work:

#### #1958 -- Expansion picker
- Assignees: @jamlung-ri, @paulsonder
- Labels: Design, V3, reviewed/keep
- Created October 2024
- Proposes moving the expansion picker closer to the content it affects (concepts, mappings, references) rather than placing it at the repository metadata level alongside the version picker
- Extensive requirements discussion between @jamlung-ri and @paulsonder:
  - 5 user stories covering expansion visibility, metadata viewing, expansion listing, expansion switching, and expansion summaries
  - @paulsonder delivered initial design via Zeplin (October 2024) showing expansion list with concept/mapping counts
  - @jamlung-ri requested additional "Resolved Repo Versions" statistic and expansion parameter visibility
  - Iterated to include info icon opening a modal for detailed parameter viewing, with indicator showing number of non-default parameters
  - Final iteration approved by @jamlung-ri (November 2024)
- **Status:** Design approved, awaiting implementation

#### #1960 -- Object preview
- Assignees: @jamlung-ri, @paulsonder
- Labels: Design, V3, reviewed/keep
- Created October 2024
- Hover-based preview cards for objects (concepts, organizations, users, repositories) when hovering over links or chips
- @paulsonder provided mockups for concept, org, user, and repo preview cards
- Further requirements identified: repo type in concept preview, slight delay before preview loads, mapping preview needed
- @paulsonder suggested in-person session with @jamlung-ri to define content requirements and whether previews change by context (recommendation: consistent previews regardless of context)
- **Status:** Design concepts shared, needs requirements finalization

#### #1971 -- Mobile updates
- Assignee: @paulsonder
- Labels: Design, V3, reviewed/keep
- Created November 2024
- Mobile-responsive design specifications for TBv3
- Body contains dashboard mobile mockup (iPhone 16)
- Related to #1970 (mobile-ready screens), which flagged that M3 components have mobile references but custom components (Searchlight, data tables, repo headers, detail views) lack mobile designs
- @snyaggarwal noted search results with tables are not mobile-friendly
- **Status:** Initial mockups created, more screens needed

#### #2350 -- Implement TBv3 collection versions and expansions controls
- No assignees
- Labels: Design, V3, Feature, reviewed/keep
- Milestone: [CIEL Implementers] Collection & Reference Creation E2E Workflow
- Created February 2026
- Backend functionality is complete; needs TBv3 UI design and implementation
- Covers: versions tab, version selector dropdown, expansions management, version comparison, expansion selector, create version workflow
- Priority design needs identified: information architecture, selector design, versions list, expansion management UI, comparison view, create version wizard
- **Status:** Requirements defined, needs design work

### 3.4 Open Component Issues

Three additional open issues in this bucket address specific UI component patterns:

#### #1875 -- Data tables
- Assignees: @jamlung-ri, @paulsonder
- Labels: V3
- Created July 2024
- Defines data table configurations for v3:
  - Source / Hierarchy (grouped by code in parent/child) -- design delivered
  - Source / Mappings (grouped by "From source") -- design delivered
  - Collection / Grouped by References -- pending
  - Collection / Concepts -- pending
  - Associations panel -- design delivered
- Detailed iconography work for concept/mapping status:
  - Concepts in OCL vs. external concepts
  - Retired mappings vs. active mappings to retired concepts
  - Each status has distinct visual treatment with tooltips
- @paulsonder delivered filter placement reference (September 2024)
- **Status:** 3 of 5 table configurations designed, 2 remaining

#### #1904 -- Modals
- Assignee: @paulsonder
- Labels: V3
- Created July 2024
- Brief note: "Modals in M3 do not include a close icon button in the top right"
- No comments or further activity
- **Disposition:** close-stale (single-line M3 compliance note with no actionable design work)

#### #1905 -- Avatars
- Assignee: @paulsonder
- Labels: V3
- Created July 2024
- Requirements: document avatar use for orgs without uploads, users without uploads, update/cropping process, specs/dimensions
- @paulsonder and @snyaggarwal discussed avatar library concept (predefined terminology-related avatars in various colors) as alternative to user-generated content
- @paulsonder shared avatar illustration concept (November 2024), positively received by @jamlung-ri
- Marked as post-MVP work
- **Status:** Concept approved, implementation deferred to post-MVP

### 3.5 Design Tooling & Process

Across these 20 issues, a consistent design-to-implementation workflow emerges:

1. **Design creation:** @paulsonder creates designs, primarily in Zeplin (Figma-based handoff tool) with some use of Miro for broader collaboration and Loom for video walkthroughs
2. **Design review:** @jamlung-ri provides UX feedback, user story validation, and edge case identification; @paynejd provides product direction
3. **Implementation:** @snyaggarwal implements designs, typically deploying to QA within days of design approval
4. **QA verification:** @jamlung-ri verifies on QA environment, provides feedback, and closes tickets

**Key Zeplin project links referenced across issues:**
- Design System file (multiple screen links)
- Individual screen links for specific components (navigation drawer, error pages, repo version, expansion picker, etc.)

**Design conventions established:**
- M3 color tokens for interactive states (primary80, primary90, primary95)
- "Dot" favicon for all OCL properties
- Modal drawer over persistent rail for navigation
- Infinite scroll over traditional pagination for data tables
- Group-by views for mappings and references
- Skeleton loading indicators for async content updates
- Tooltip-based parameter display for complex data (expansion parameters, mapping status)
