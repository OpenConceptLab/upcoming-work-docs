# V3 Unreviewed Issues: Knowledge Base

**Generated:** 2026-03-26
**Scope:** 70 issues from OpenConceptLab/ocl_issues with the V3 label that were NOT included in the main TBv3 project board analysis
**Source:** [OpenConceptLab/ocl_issues](https://github.com/OpenConceptLab/ocl_issues) GitHub repository
**Companion data:** `v3unrev-raw-archive.json` (full issue bodies + comments), `v3unrev-issue-classification.csv` (70-row analysis)

---

## Section 1: Executive Summary

### 1.1 What This Bucket Is

The "V3 (unreviewed)" bucket contains 70 issues that carry the `V3` label on `ocl_issues` but were never added to the main TermBrowser v3 project board. These issues fell through the cracks for several reasons:

- **Design specs filed outside the project board.** A large cluster of Design-labeled issues (#1619, #1628--#1632, #1693, #1707, #1718, #1719, #1725, #1775, #1797) were created by @paulsonder as part of the design system effort (#1381) but tracked separately from the project board's epic structure.
- **v2-era issues tagged for v3 consideration.** Issues like #1494 (source summary UI), #1531 (sign up on community site), #1539 (icon color for associations), and #1655 (promote demo site) were originally v2 tickets that @paynejd tagged with V3 in July 2023 as "relevant for v3 -- not planning to do a redesign for v2." They were never formally triaged onto the board.
- **Foundation epics managed outside the board.** Several `v3-foundation` epics (#1166 FHIR, #1433 Locales, #1697 Lookup Fields, #1698 OWASP, #1773 Queue Management, #1792 Analytics) lived at the architectural level and were tracked through architecture calls rather than the project board.
- **Late-filed feature requests.** The February 2026 batch of CIEL Implementer tickets (#2339, #2346--#2350, #2353) were filed with milestone tags but not yet added to the board.
- **Bug fixes resolved quickly.** Several bugs (#1765, #1851, #1899, #1900, #1965, #1973) were reported and fixed within days, bypassing the board workflow entirely.

### 1.2 Key Stakeholders

| Contributor | Role in This Bucket | Issue Count |
|---|---|---|
| **@paulsonder** (Paul Sonder) | UI/UX designer; created the bulk of design spec issues and component tickets | ~25 issues assigned |
| **@snyaggarwal** (Sunny Aggarwal) | Primary implementer; resolved most bugs, built infrastructure, implemented designs | ~25 issues assigned |
| **@jamlung-ri** (James Amlung) | QA, user stories, design review; active commenter and closer on many tickets | ~10 issues assigned |
| **@paynejd** (Jonathan Payne) | Product owner; tagged v2 issues for v3, defined requirements, architectural decisions | ~5 issues assigned |
| **@rkorytkowski** (Rafal Korytkowski) | Infrastructure; set up deployment pipelines and subdomains | ~3 issues assigned |
| **@bmamlin** (Burke Mamlin) | Domain expert; active on checksums discussion (#1691) | 1 issue assigned |
| **@kaalcumm** | Community engagement; worked on community website content (#1797) | 1 issue assigned |

### 1.3 Timeline

**Pre-V3 Legacy (pre-2022).** One issue in this bucket (#1166, FHIR NPM import) predates the v3 initiative, created December 2021. It was tagged `v3-foundation` retroactively and closed during the March 2026 FHIR backlog cleanup.

**V3 Early Development (Oct 2022 -- Jun 2023).** The design system epic (#1381) was created October 2022, alongside the advanced references panel (#1378) and hierarchy settings (#1391). The locales epic (#1433) was filed in November 2022. In early 2023, @paulsonder delivered sign-in/sign-up page designs (#1479). By mid-2023, @paynejd began systematically tagging v2 issues for v3 consideration (#1494, #1531, #1539, #1555, #1604, #1655).

**V3 Active Development (Jul 2023 -- Dec 2023).** July 2023 saw a burst of design spec creation: #1619 (form/create version), #1628 (notifications), #1629 (comments), #1630 (my account menu), #1631 (mappings list view), #1632 (community website). The async requests flow (#1561) was implemented. The search enhancements (#1604, #1635) were completed. Foundation epics were filed: #1697 (lookup fields), #1698 (OWASP), and infrastructure work began on TBv3 subdomains (#1685). By December, favicons (#1707, #1718), RTL exploration (#1719), error pages (#1693), and the repo home view (#1722) were all delivered.

**V3 Maturation (Jan 2024 -- Dec 2024).** This was the most productive period. Repo version display in search results (#1725) shipped in January. The navigation drawer (#1775) went from design to deployment in under a month (February--March 2024). The community website design (#1797) involved multi-stakeholder content review with @kaalcumm through April. The KeyCloak branding (#1774) and environment indicators (#1863) were completed. The data tables design (#1875) iterated through July--September with detailed iconography for retired concepts/mappings. TBv3 was deployed to staging (#1934) in October. The repository design (#1935) was finalized with comprehensive specs for headers, summaries, tabs, and version selectors. The expansion picker (#1958) and object preview (#1960) designs were created. Critical OHIE-prep bugs were fixed (#1965 concept details crash, #1968 quick changes, #1969 repo summary labels, #1973 blank source type). Mobile readiness was flagged (#1970, #1971).

**Current (2025--2026).** Several foundation epics were closed during cleanup: #1166 (FHIR, March 2026), #1381 (design system, March 2026), #1433 (locales, March 2026), #1698 (OWASP, March 2026), #1773 (queue management, March 2026), #1792 (analytics, March 2026), #1890 (community website build, March 2026). In February 2026, a new batch of CIEL Implementer feature requests was filed: #2339 (reference transformations), #2346 (schema validation), #2347 (linked source workflow), #2348 (dependency notifications), #2349 (dependency update workflow), #2350 (collection versions/expansions UI), #2353 (concept proposals).

### 1.4 Disposition Breakdown

Of the 70 issues:

**CLOSED: 46 issues**
- **close-done (28):** Completed work including design specs, bug fixes, infrastructure setup, and feature implementations
- **close-stale (8, among closed):** Design specs with no implementation activity (#1628 notifications, #1629 comments, #1632 community website) closed during March 2026 cleanup
- **close-superseded (1):** Queue Management Service (#1773) superseded by newer task management approach
- **keep (9, among closed):** Foundation epics and significant completed work worth preserving as reference (#1166, #1381, #1433, #1698, #1749, #1792)
- **review (3, among closed):** Issues needing further assessment (#1619, #1630, #1631, #1890)

**OPEN: 24 issues**
- **keep (16):** Active or relevant issues including:
  - Foundation epics: #1697 (lookup fields standardization), #1691 (checksums details)
  - Active feature work: #1801 (user profile summary API), #1875 (data tables), #1905 (avatars), #1970 (mobile-ready screens)
  - Design specs with `reviewed/keep`: #1958 (expansion picker), #1960 (object preview), #1971 (mobile updates), #2350 (collection versions/expansions)
  - New CIEL Implementer features: #2339, #2346, #2347, #2348, #2349, #2353
  - Other: #1555 (operations panel docs), #1641 (match explanation tooltip), #1891 (freeze on delete)
- **close-stale (8):** Issues with no activity since 2023 or early 2024, recommended for closure:
  - #1494 (source summary UI, last activity Jul 2023)
  - #1531 (sign up on community site, last activity Jul 2023)
  - #1539 (icon color for associations, last activity Jul 2023)
  - #1655 (promote demo site, last activity Aug 2023)
  - #1904 (modals M3 compliance, last activity Jul 2024)

### 1.5 Relationship to Main TBv3 Knowledge Base

This bucket is complementary to the main TBv3 knowledge base (262 issues). Key overlaps and distinctions:

- **Design system work** in this bucket (#1381 and children) underpins the UI components documented in the main KB but was tracked separately.
- **Foundation epics** here (#1166 FHIR, #1433 Locales, #1697 Lookup Fields, #1698 OWASP) overlap with the `v3-foundation` label but were not on the project board.
- **Bug fixes** here were resolved independently of the board workflow and represent the "quick-turn" operational side of v3 development.
- **CIEL Implementer features** (#2339--#2353) represent a new workstream that emerged in 2026 and is not yet covered in the main KB.

---

## Section 2: Completed V3 Work

This section covers the 46 closed issues in the V3 unreviewed bucket, organized by theme. These represent work that was completed as part of the v3 initiative but tracked outside the main project board.

---

### 2.1 Design Specifications (20 issues)

The largest cluster of completed work consists of design specifications produced by @paulsonder, anchored by the **Design System epic (#1381)**. This epic, created October 2022 and closed March 2026, served as the umbrella for OCLv3's visual language and component library. See Section 3 for a detailed treatment of all design issues.

**Summary:** 16 closed design issues delivered specifications for sign-in/sign-up pages, forms, navigation, error states, favicons, RTL support, search results, community website, navigation drawer, and repository layouts. 4 design issues remain open (expansion picker, object preview, mobile updates, collection controls).

### 2.2 TermBrowser Features & Bug Fixes (15 issues)

This cluster covers functional improvements and bug fixes to the TermBrowser v3 application, primarily implemented by @snyaggarwal.

**Features delivered:**

| Issue | Title | Delivered | Key Detail |
|---|---|---|---|
| #1391 | Hierarchy (beta) in Source Advanced Settings | Dec 2025 | Added ability to edit `hierarchy_root` and `hierarchy_meaning` in source settings; required concept search/select component |
| #1722 | Repo Home View | Feb 2024 | Initial repository home view for TBv3 |
| #1856 | Concept (epic) | Jun 2024 | Closed as duplicate of #1733; defined user stories for concept download, operations, visualization, search, view, share, compare |
| #1903 | Register button in Account side menu | Aug 2024 | Added registration option for unauthenticated users in the account menu |
| #1913 | Checkbox behavior mimicking Gmail | Dec 2024 | Implemented distinction between row selection (retrieves details) and checkbox checking (batch operations) with distinct highlight colors |
| #1935 | Repository design | Oct 2024 | Comprehensive repository layout specification: header, summary panel, overview tabs, content tabs (concepts, mappings, references, expansions), and version selector |
| #1863 | Environment indicator on auth forms | Jul 2024 | Non-production environments now display environment name on sign-in/register/forgot-password forms via KeyCloak realm display name |
| #1774 | KeyCloak favicon update | Mar 2024 | Updated KeyCloak favicon to new OCL "dot" logo across all properties |

**Bugs fixed:**

| Issue | Title | Fixed | Key Detail |
|---|---|---|---|
| #1765 | Remove Last Login column | Feb 2024 | Removed non-public "Last Login" data from v3 Users search results |
| #1851 | Org repo search bug | Jun 2024 | Fixed search input staying on Overview page instead of switching to Repositories tab |
| #1886 | Sidebar refresh | Jul 2024 | Fixed navigation sidebar not refreshing org/bookmark data without full page reload |
| #1899 | User repo list refresh | Jul 2024 | Fixed repository list not refreshing when navigating between user profiles |
| #1900 | Search term persistence | Oct 2024 | Search term now clears from search bar when entering an org, user, or repo page |
| #1965 | Concept Details crash | Nov 2024 | Fixed page crash when clicking any concept in a collection; tagged OHIE Must-Haves |
| #1968 | Concept Details quick changes | Dec 2024 | Visual loading indicator (skeleton), removed version ID display, reduced spacing, normalized font sizes |
| #1969 | Repo Summary labels | Dec 2024 | Fixed label formatting for active/retired counts, released/unreleased versions, accurate result counts |
| #1973 | Blank Source Type | Dec 2024 | Added "(None)" placeholder for empty source type strings in filter pane |

### 2.3 Infrastructure & Deployment (3 issues)

| Issue | Title | Delivered | Key Detail |
|---|---|---|---|
| #1685 | Setup subdomains and deployment pipeline | Jan 2024 | @rkorytkowski created GitHub Actions deployment at `github.com/OpenConceptLab/oclweb3/actions`; established subdomain routing for TBv3 |
| #1934 | Deploy TBv3 to staging | Oct 2024 | @snyaggarwal and @rkorytkowski set up KeyCloak staging client, Terraform deploy, and GitHub Action for staging environment with real data for UAT |
| #1890 | Community website build | Mar 2026 (closed) | @paulsonder led Webflow-based community site build including page structure, CMS configuration, styling, and content migration planning |

### 2.4 API Work (4 issues)

| Issue | Title | Delivered | Key Detail |
|---|---|---|---|
| #1561 | TB/API async requests flow | Apr 2024 | Standardized async request handling: all async APIs return task IDs with embedded username, TB copies task ID to clipboard. Implemented for collection references add, source/collection/org delete |
| #1635 | Replace "UpdatedOn" with repo Version | Oct 2023 | Global search now shows results from latest released repo version with version label instead of "Updated On" timestamp; HEAD requires explicit search |
| #1710 | "Latest released" behavior in TBv3 | Jan 2024 | TBv3 defaults to showing latest released version instead of HEAD when navigating to repos |
| #1856 | Concept epic | Jun 2024 | Closed as duplicate of #1733; consolidated concept user stories into the main project board |

### 2.5 Search (3 issues)

| Issue | Title | Delivered | Key Detail |
|---|---|---|---|
| #1604 | Compile advanced search features | Oct 2023 | Compiled requirements for v3 advanced search (field-restricted search, custom attribute search, cross-locale search); closed as duplicate of existing search epic |
| #1749 | Global Search (epic) | Feb 2025 | Global search epic closed after underlying work was completed through child tickets on the main project board |
| #1900 | Search term clearing bug | Oct 2024 | (Also listed under bugs) Search term now clears when navigating away from search results |

### 2.6 Security & Foundation (4 issues)

| Issue | Title | Delivered | Key Detail |
|---|---|---|---|
| #1698 | OWASP Top-10 | Mar 2026 | Foundation epic for OWASP security compliance; closed during March 2026 cleanup |
| #1773 | Queue Management Service | Mar 2026 | Removed Flower dependency, added longer Celery task persistence, reliable in-progress state events, and user-tagged tasks. All checkboxes completed. Closed as superseded |
| #1166 | FHIR NPM Import | Mar 2026 | Long-running FHIR epic covering CodeSystem CRUD, validate-code, lookup operations. Closed during FHIR backlog cleanup with content captured in FHIR Service Knowledge Base |
| #1433 | Fix OCL Locales Round 2 | Mar 2026 | Foundation epic for getting secondary language codes into OCL; closed during cleanup |

### 2.7 Data Quality & Analytics (2 issues)

| Issue | Title | Delivered | Key Detail |
|---|---|---|---|
| #1792 | OCL v3 Analytics | Mar 2026 | Foundation epic for analytics needed for v3 launch; closed during March 2026 cleanup |
| #1378 | Advanced Add References panel | Mar 2024 | Extensive requirements gathering for $cascade-based reference addition with OpenMRS community use cases (lab panels, concept hierarchies). Closed; work moved to upcoming v3 repository management epic |

### 2.8 Completion Timeline

The chart below shows the cadence of issue closure across this bucket:

- **2023 (5 closures):** #1604, #1635, #1707, #1718, #1719 -- early design specs and search work
- **Q1 2024 (11 closures):** #1479, #1685, #1693, #1710, #1722, #1725, #1765 -- bulk of infrastructure and design delivery
- **Q2 2024 (5 closures):** #1378, #1561, #1775, #1797, #1851 -- navigation drawer, community website, async flow
- **Q3 2024 (6 closures):** #1856, #1863, #1886, #1899, #1900, #1903 -- bug fixes and auth improvements
- **Q4 2024 (6 closures):** #1913, #1934, #1935, #1965, #1968, #1969, #1973 -- staging deploy, repository design, OHIE prep
- **2025 (2 closures):** #1391, #1749 -- hierarchy settings, global search epic
- **Q1 2026 (11 closures):** #1166, #1381, #1433, #1619, #1628--#1632, #1698, #1773, #1792, #1890 -- March 2026 cleanup wave

---

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

---

# Section 4: Open Feature Requests

This section covers the 20 open issues in the V3 (unreviewed) bucket that represent active feature requests, enhancements, and design work that has not yet been completed. These are organized by era and theme.

---

## 4.1 Legacy UI Improvements (2023)

These issues were tagged for V3 during mid-2023 but have seen little to no activity since. They represent small, concrete improvements that were relevant during v2-to-v3 transition planning.

### #1494 -- Update UI/UX of Source Summary Tab
- **What:** Redesign the source summary tab to improve clarity. User feedback (Andy Kanter) noted that the summary statistics are confusing -- e.g., language counts represent "concepts with at least one name in that language," not the number of names, but this is not labeled.
- **Why it matters:** The summary tab is a primary entry point for understanding a source's content. Misleading labels undermine trust.
- **Status:** Open since Feb 2023. Last activity Jul 2023 (paynejd tagged it for v3). Assigned to paulsonder. No design work or implementation has been done.
- **Disposition:** **Close-stale.** The v3 repository design (#1935, closed) and data tables (#1875) have since addressed summary presentation at a higher level. If summary improvements are still needed, a fresh ticket scoped to the current v3 design should be created.

### #1531 -- Add Sign Up Option on Community Site
- **What:** Add a "sign up" link on the OCL community site home page so users do not have to navigate to the TermBrowser first to create an account.
- **Why it matters:** Reduces friction for new users discovering OCL through the community site.
- **Status:** Open since Mar 2023. No comments. Last activity Jul 2023. Assigned to paulsonder.
- **Disposition:** **Close-stale.** The community website has since been redesigned (#1797, #1890, both closed). The sign-up flow was addressed as part of the Keycloak SSO integration (#1702) and community site build. If still missing, re-file against the current community site.

### #1539 -- Change Icon Color for Unresolvable Associations
- **What:** In the concept details page, associations that cannot be resolved in OCL use an orange icon that looks like an error/warning. Proposal to change the icon style (e.g., outlined instead of filled) to distinguish "not resolvable" from "error."
- **Why it matters:** Visual clarity for users browsing concept mappings.
- **Status:** Open since Apr 2023. Last activity Jul 2023 (paynejd flagged for v3 design). Assigned to paulsonder.
- **Disposition:** **Close-stale.** The data tables (#1875) and association panel redesign (comments on #1875 from paulsonder, Jul 2024) have since addressed association iconography with a new system distinguishing OCL-internal concepts, external concepts, retired variants, and retired mappings. This specific concern has been subsumed.

### #1555 -- Draft Operations Panel Documentation
- **What:** Document the operations panel feature: server types supported (OCL, OCL FHIR, SVCM, ICD11 FHIR), operations per server type ($resolveReference, $cascade, $checksum, $lookup, $translate, $validate-code), and authentication behavior.
- **Why it matters:** The operations panel is a distinctive OCL feature with no documentation. Without docs, users cannot discover or use it effectively.
- **Status:** Open since Apr 2023. Last activity Jul 2024 (paynejd flagged as important for v3). Assigned to paynejd, snyaggarwal, jamlung-ri.
- **Disposition:** **Keep.** This is a documentation gap that persists. The operations panel exists and works but remains undocumented. Should be scoped as a docs task for v3 launch readiness.

### #1641 -- Add Map Source to Match Explanation Tooltip
- **What:** When searching concepts and a map code is matched (e.g., searching for "B50"), ElasticSearch returns the map code and map type but not the map source. The tooltip should also show the source and display name.
- **Why it matters:** Without the map source, users cannot determine which terminology system the matched code belongs to.
- **Status:** Open since Aug 2023. No comments. Assigned to snyaggarwal. Last activity Mar 2024.
- **Disposition:** **Keep.** This is a concrete, well-defined API enhancement that improves search result quality. Still relevant for v3.

### #1655 -- Promote OCL Demo Site
- **What:** Promote the OCL demo site (which resets weekly) on the OCL community site to drive more usage beyond hands-on workshops.
- **Why it matters:** The demo site is underutilized despite being a safe sandbox for exploration.
- **Status:** Open since Aug 2023. paulsonder commented "Working on this now" in Aug 2023. No further activity.
- **Disposition:** **Close-stale.** The community website was redesigned in 2024 (#1797, #1890). If the demo site still needs promotion, this should be a fresh content task against the current Webflow-based community site.

---

## 4.2 Foundation & Data Quality (2023)

### #1691 -- Checksums: Addressing the Details
- **What:** Discussion ticket exploring how checksums are used in practice: differentiating concepts in the comparison tool, interaction with mappings, and reproducibility outside OCL. Burke Mamlin (bmamlin) provided a detailed example of difficulty reproducing checksums externally and requested a standalone Python script.
- **Why it matters:** Checksums are a v3-foundation feature (#1690 parent epic). External reproducibility is critical for interoperability with systems like CIEL that need to verify content independently.
- **Status:** Open since Nov 2023. Active discussion through Apr 2024 (bmamlin's detailed request for a checksum calculation script). Labeled `discussion-needed`. Assigned to bmamlin, paynejd, snyaggarwal.
- **Disposition:** **Keep.** The checksum reproducibility question remains unresolved and is important for CIEL and other external consumers. This should be addressed as part of the broader checksums epic (#1690).

### #1697 -- Standardizing Lookup Fields (Epic)
- **What:** Epic for cleaning up and standardizing lookup fields (e.g., concept classes, datatypes, map types, locales) across OCL. Brainstorming captured in a Miro board.
- **Why it matters:** Inconsistent lookup values create data quality issues, complicate search, and make FHIR compliance harder. This is labeled `v3-foundation` and `reviewed/keep`.
- **Status:** Open since Nov 2023. Last activity Mar 2027 (auto-update). No assignees. The Miro board has the brainstorming but no sub-issues have been created.
- **Disposition:** **Keep.** This is a recognized foundational need. Should be scoped into actionable sub-issues when resources are available.

---

## 4.3 User Experience Enhancements (2024)

### #1801 -- User Profile Summary API
- **What:** Define what summary information should appear on user profiles and make profiles more publicly accessible. Current summary API returns counts of sources, collections, org memberships, owned orgs, and bookmarks.
- **Why it matters:** User profiles are a key social feature for v3. The current API is minimal and profiles may not be viewable by others.
- **Status:** Open since Mar 2024. No comments since creation. Assigned to paynejd, paulsonder.
- **Disposition:** **Keep.** User profiles are part of the v3 consumer experience. This needs requirements definition and API enhancement.

### #1875 -- Data Tables
- **What:** Comprehensive ticket describing data table layouts for v3, including hierarchy views (grouped by parent/child), mappings views (grouped by source), collection views (grouped by references), and association panels. Includes designs for filter placement, iconography for OCL-internal vs. external concepts, and handling of retired items.
- **Why it matters:** Data tables are the primary way users interact with content in OCL. The designs define how concepts, mappings, and references are presented across all repository types.
- **Status:** Open since Jul 2024. Active design iteration through Sep 2024 with designs in Zeplin. Assigned to jamlung-ri, paulsonder. Several table configurations are checked off (hierarchy, mappings, associations) but collection views remain.
- **Disposition:** **Keep.** Active design work with concrete deliverables. Core to v3 UI.

### #1891 -- Freeze Large Resources Upon Deletion
- **What:** When deleting a large repo or org, there is no "processing" flag and content is not frozen. Users can continue interacting with content being asynchronously deleted. Proposal: implement a "frozen" flag that makes content read-only during deletion (and potentially during other long operations like loading or versioning).
- **Why it matters:** Prevents confusing user experience and potential data corruption during async operations.
- **Status:** Open since Jul 2024. jamlung-ri commented it is valuable for v3 but could wait for CodeSystem Author persona work. No assignees.
- **Disposition:** **Keep.** Well-defined platform enhancement. The "frozen" concept has broader applicability beyond deletion. Priority is medium -- not blocking launch but important for production readiness.

### #1904 -- Modals
- **What:** Brief note that modals in Material Design 3 (M3) do not include a close icon button in the top right. This is a design system alignment issue.
- **Why it matters:** Consistency with M3 design guidelines across the v3 UI.
- **Status:** Open since Jul 2024. No comments. Assigned to paulsonder.
- **Disposition:** **Close-stale.** This is a one-line design note, not a actionable feature request. If modal behavior needs updating, it should be captured as part of a broader design system ticket or addressed inline during implementation.

### #1905 -- Avatars
- **What:** Document and implement avatar handling: default avatars for orgs/users without uploads, upload and cropping workflow, specs and dimensions, and potentially a library of pre-made avatars for users to choose from.
- **Why it matters:** Avatars improve the visual identity of the platform and help users quickly identify orgs and users.
- **Status:** Open since Jul 2024. Active discussion through Nov 2024 with paulsonder sharing avatar concepts and jamlung-ri expressing support. Labeled as post-MVP work. Assigned to paulsonder.
- **Disposition:** **Keep.** Active design work with team consensus. Correctly scoped as post-MVP. Low priority but good polish item.

### #1970 -- Mobile-Ready Screens (OHIE Must-Haves)
- **What:** Make v3 screens mobile-ready. Priority screens: anonymous dashboard, searchlight, search results, and concept details. Identified as a must-have for OHIE24 (Nov 2024).
- **Why it matters:** Many users will first access v3 on mobile devices. Search result tables are not mobile-friendly.
- **Status:** Open since Nov 2024. paulsonder noted M3 components are mobile-ready but custom components (searchlight, data tables, repo headers, detail views) need mobile designs. snyaggarwal confirmed search results with tables are not mobile-friendly. Assigned to snyaggarwal.
- **Disposition:** **Keep.** Mobile readiness is important for broad adoption. Partial work has been done (M3 components) but custom components still need attention.

---

## 4.4 Collection Management Features (2026)

These five issues were created in February 2026 as part of the CIEL Implementers workflow planning. They are well-scoped feature requests with detailed acceptance criteria, milestones, and dependency tracking.

### #2339 -- Reference Transformation Actions
- **What:** Enable users to transform references between versioning strategies (unversioned, resource-versioned, repo-versioned) directly in the TBv3 References tab. Includes transform dialog with preview, batch operations, error handling, and rollback.
- **Why it matters:** Collection managers frequently need to lock or unlock references for different use cases (development vs. production). Currently this requires manual recreation.
- **Status:** Open since Feb 2026. No comments. No assignees. Depends on #2273 (Collection References tab). Milestone: CIEL Implementers Collection & Reference Creation E2E Workflow.
- **Disposition:** **Keep.** Well-defined, milestone-tracked feature. Part of the CIEL Implementers workflow.

### #2346 -- Real-Time Schema Validation for References
- **What:** Implement real-time validation warnings when references violate schema constraints (required properties, allowed concept classes, datatype restrictions, mapping constraints). Warnings displayed inline, in preview, and in the References tab with severity levels (error/warning/info).
- **Why it matters:** Currently, schema validation errors are only discovered during expansion or version creation -- too late. Real-time validation catches issues immediately.
- **Status:** Open since Feb 2026. No comments. No assignees. Milestone: CIEL Implementers Collection & Reference Creation E2E Workflow. Q2 2026 target.
- **Disposition:** **Keep.** Important quality-of-life feature for collection managers. Ambitious scope -- may need phasing.

### #2347 -- Linked Source Workflow
- **What:** Allow collections to link to a specific source version for reference resolution, providing an intermediate state between "always HEAD" and "fully locked versioned references." Includes test-new-version workflow, lock-to-version conversion, and warnings for outdated linked versions.
- **Why it matters:** Provides safe, controlled update path for production collections that depend on evolving terminologies like CIEL.
- **Status:** Open since Feb 2026. No comments. No assignees. Milestone: CIEL Implementers Collection Maintenance E2E Workflow. Q2 2026 target.
- **Disposition:** **Keep.** Addresses a real pain point in collection lifecycle management. Well-designed workflow.

### #2348 -- Collection Dependency Notifications
- **What:** Notify collection owners when dependencies (source versions, nested collections) are updated, deprecated, or deleted. Includes dependency tracking, notification triggers, in-app and email channels, preference configuration, and a dependency health dashboard.
- **Why it matters:** Collection owners are often unaware when their dependencies change, leading to outdated or broken collections.
- **Status:** Open since Feb 2026. No comments. No assignees. Milestone: CIEL Implementers Collection Maintenance E2E Workflow. Q2 2026 target.
- **Disposition:** **Keep.** Important for production collection management. Large scope -- should be phased. Foundation for #2349.

### #2349 -- Collection Dependency Update Workflow
- **What:** Safe workflow for reviewing and accepting dependency updates: before/after comparison, impact assessment, test expansions, apply/rollback, scheduled updates, and batch operations. Builds on #2348 (notifications).
- **Why it matters:** Updating collection dependencies is currently risky with no preview, testing, or rollback capability.
- **Status:** Open since Feb 2026. No comments. No assignees. Milestone: CIEL Implementers Collection Maintenance E2E Workflow. Q2 2026 target. Depends on #2348.
- **Disposition:** **Keep.** Logical extension of #2348. Very ambitious scope -- likely a multi-sprint effort.

### #2353 -- Concept Proposals in Mapper and TBv3
- **What:** Enable users to propose new concepts or changes to existing concepts from within OCL Mapper and TBv3. Includes proposal form, review workflow for repository maintainers (approve/reject/request changes), discussion threads, tracking dashboard, and analytics.
- **Why it matters:** Currently there is no formal way to request new concepts. Users work around by creating local concepts, and maintainers do not know what is needed.
- **Status:** Open since Feb 2026. No comments. No assignees. Milestone: CIEL Implementers Concept Proposals E2E Workflow. Q2 2026 target.
- **Disposition:** **Keep.** Significant new capability that bridges the gap between terminology consumers and maintainers. Large scope requiring API, Mapper, and TBv3 work.

---

## 4.5 Summary of Dispositions

| Disposition | Count | Issues |
|---|---|---|
| **Keep** | 14 | #1555, #1641, #1691, #1697, #1801, #1875, #1891, #1905, #1970, #2339, #2346, #2347, #2348, #2349, #2353 |
| **Close-stale** | 5 | #1494, #1531, #1539, #1655, #1904 |
| **Review** | 0 | -- |

The open feature requests split into two clear groups: (1) older 2023 issues that have been superseded by subsequent design work and should be closed, and (2) active 2024-2026 issues that represent genuine planned work. The 2026 CIEL Implementer issues (#2339, #2346, #2347, #2348, #2349, #2353) are particularly well-scoped and milestone-tracked, representing the next major phase of collection management capability.

---

# Section 5: Platform & Infrastructure

This section covers the closed epics and infrastructure issues in the V3 (unreviewed) bucket. These represent completed foundational work that enabled the v3 platform. Understanding what was delivered -- and how -- provides context for ongoing and future work.

---

## 5.1 Completed Epics

### #1166 -- NPM Import of Baseline FHIR Content (Epic)
- **Scope:** Remaking OCL's FHIR service to implement business rules directly into OCL. Originally filed Dec 2021, this was a large initiative covering CodeSystem CRUD, ValueSet operations, FHIR resource filtering, concept pagination, and $resolveReference integration.
- **Key activity:** Rafal Korytkowski (rkorytkowski) and Sunny Aggarwal (snyaggarwal) drove implementation. James Amlung (jamlung-ri) performed extensive testing of CodeSystem read/create operations and documented bugs (caseSensitive expecting string instead of Boolean, missing concept pagination, inconsistent canonical URLs for CIEL). A Nov 2023 FHIR Core Planning Scratchpad was linked.
- **Resolution:** Closed Mar 2024 as part of a systematic FHIR Service backlog cleanup. Content captured in the FHIR Service Knowledge Base wiki. Fresh tickets to be created if work is still needed.
- **Sub-issues:** 30 sub-issues, all closed.
- **Disposition:** Keep as reference. This epic represents the foundational FHIR service work that v3 builds upon.

### #1433 -- Fix OCL Locales Round 2 (Epic)
- **Scope:** Follow-up to #1360, focused on getting secondary language codes into OCL. Part of the `v3-foundation` label group.
- **Key activity:** Minimal discussion in the archive -- the issue body references #1360 and the need for secondary locale support.
- **Resolution:** Closed Mar 2027 (auto-cleanup cycle). No assignees in the archive.
- **Disposition:** Keep as reference. Locale handling is foundational for OCL's multilingual content support.

### #1698 -- OWASP Top-10 (Epic)
- **Scope:** Epic tracking OWASP Top-10 security compliance for the v3 platform. Part of the `v3-foundation` label group.
- **Key activity:** No body, no comments in the archive. This appears to have been a tracking placeholder.
- **Resolution:** Closed Mar 2027.
- **Disposition:** Keep as reference. Security compliance is an ongoing concern, but the specific v3-era work has been completed or folded into operational practices.

### #1749 -- Global Search (Epic)
- **Scope:** Epic for implementing global search in TBv3.
- **Key activity:** No body, no comments in the archive. Sub-issues were tracked separately.
- **Resolution:** Closed Feb 2025. Global search is operational in v3.
- **Disposition:** Keep as reference. Global search is a shipped feature.

### #1773 -- Queue Management Service (Epic)
- **Scope:** Service to manage asynchronous tasks for users. Goals: remove dependency on Flower APIs, longer persistence of Celery tasks, reliable in-progress state events, and clear user task tagging. All four goals were checked off in the issue body.
- **Key activity:** Task ID format standardized to `<uuid>-<username>-<queue>`. All async API requests return taskId, state, and queue info. Part of the `v3-foundation` label group.
- **Resolution:** Closed Mar 2027. All checklist items completed.
- **Disposition:** Close-superseded (per classification). The queue management work is done. Any remaining task UI work would be tracked under separate v3 tickets.

### #1792 -- OCL v3 Analytics (Epic)
- **Scope:** Epic focused on analytics for OCL v3 and what was missing for launch. Part of the `v3-foundation` label group.
- **Key activity:** No body detail beyond "New epic focused only on analytics for OCL v3 and what we're missing for launch." No comments.
- **Resolution:** Closed Mar 2027.
- **Disposition:** Keep as reference. Analytics requirements for v3 have been addressed at the epic level.

---

## 5.2 Completed Infrastructure Tasks

### #1685 -- Setup Subdomains and Deployment Pipeline
- **What:** Set up GitHub Actions for build/deployment of TBv3, including subdomain configuration.
- **Key activity:** rkorytkowski created the deployment pipeline at `github.com/OpenConceptLab/oclweb3/actions` (confirmed Jan 2024).
- **Resolution:** Closed Jan 2024. Deployment pipeline is operational.
- **Significance:** This established the CI/CD foundation for all subsequent v3 deployments.

### #1934 -- Deploy TBv3 to Staging
- **What:** Deploy v3 to the staging environment with real data for UAT testing beyond the QA environment. Required KeyCloak staging client, Terraform deployment, and GitHub Action configuration.
- **Key activity:** snyaggarwal completed all three tasks (KeyCloak client, Terraform, GitHub Action) by Oct 2024. Assigned to rkorytkowski and snyaggarwal.
- **Resolution:** Closed Oct 2024. Staging environment is operational.
- **Significance:** Enabled user acceptance testing with production-like data, a critical step before v3 launch.

---

## 5.3 Completed API & Backend Work

### #1561 -- TB/API Async Requests Flow
- **What:** Standardize how the TermBrowser handles asynchronous API requests. Key decisions: request async by default with username-embedded task IDs, return response if task finishes within X seconds or else return task info, and copy task ID to clipboard in TB.
- **Key activity:** Implemented for collection references add, source delete, collection delete, and org delete. Discussion about a dedicated tasks UI deferred to v3.
- **Resolution:** Closed Apr 2024. The async flow pattern is established. snyaggarwal confirmed the remaining work is a v3 tasks UI.
- **Significance:** Established the async request pattern used throughout v3 for long-running operations.

### #1635 -- Replace UpdatedOn with Latest Repo Version
- **What:** In search results, replace the "Updated On" column with the latest released repo version label (e.g., `CIEL v2023-02-12`). Also: only search latest released version (not HEAD), and redirect versionless repo URLs to latest released version.
- **Key activity:** snyaggarwal implemented and deployed to dev environment. paynejd confirmed the approach and flagged it for v3 adoption. Screenshots provided showing the new display.
- **Resolution:** Closed Oct 2023. Implemented in dev environment and adopted as the standard for v3.
- **Significance:** Fundamental UX improvement that changed how users discover and contextualize content in search results.

### #1710 -- Implement Latest Released Behavior
- **What:** From the beginning, TBv3 implements the "latest released" search behavior: global search shows latest released version, results include repo version label, navigating to a repo (no version) shows latest released, and HEAD may not be publicly accessible.
- **Key activity:** snyaggarwal implemented and requested closure Jan 2024.
- **Resolution:** Closed Jan 2024. The "latest released" behavior is a core v3 design principle.
- **Significance:** This decision shapes how all content is surfaced in v3 -- users see stable, released content by default rather than in-progress HEAD content.

---

## 5.4 Summary

The infrastructure and platform work in this bucket represents the foundation that v3 was built on:

| Area | Issues | Status |
|---|---|---|
| **FHIR Service** | #1166 (30 sub-issues) | All closed. FHIR service operational. |
| **Data Quality** | #1433 (locales) | Closed. Secondary locale support added. |
| **Security** | #1698 (OWASP) | Closed. Compliance addressed. |
| **Search** | #1749 (global search) | Closed. Global search shipped. |
| **Async Operations** | #1773 (queue mgmt), #1561 (async flow) | Closed. Task management and async patterns established. |
| **Analytics** | #1792 (v3 analytics) | Closed. Analytics baseline set. |
| **Deployment** | #1685 (CI/CD), #1934 (staging) | Closed. Full deployment pipeline operational. |
| **API Behavior** | #1635 (repo version display), #1710 (latest released) | Closed. Core v3 behavior established. |

All 11 issues in this section are closed and represent completed work. No action is required, but they provide important historical context for understanding v3's architectural decisions and infrastructure.

---

# Section 6: Appendices

---

## Appendix A: Issue Index

Complete index of all 70 issues in the V3 (unreviewed) bucket, sorted by issue number.

**Section key:**
- **S2** = Section 2: Design System & UI/UX
- **S3** = Section 3: Closed Implementation Work (bugs, shipped features)
- **S4** = Section 4: Open Feature Requests
- **S5** = Section 5: Platform & Infrastructure

| # | Title | Status | Disposition | Section |
|---|---|---|---|---|
| 1166 | NPM Import of Baseline FHIR Content | CLOSED | keep | S5 |
| 1378 | Implement Advanced Add References panel | CLOSED | close-done | S2 |
| 1381 | Design system | CLOSED | keep | S2 |
| 1391 | Add "Hierarchy (beta)" section under Source Advanced Settings | CLOSED | close-done | S3 |
| 1433 | Fix OCL Locales - Round 2 | CLOSED | keep | S5 |
| 1479 | OCL sign in, sign up, forgot password pages | CLOSED | close-done | S2 |
| 1494 | Update the UI/UX of the new source summary tab | OPEN | close-stale | S4 |
| 1531 | Add "sign up" option on the OCL community site home page | OPEN | close-stale | S4 |
| 1539 | Change icon color for associations that cannot be resolved | OPEN | close-stale | S4 |
| 1555 | Draft operations panel documentation | OPEN | keep | S4 |
| 1561 | TB/API async requests flow | CLOSED | close-done | S5 |
| 1604 | Compile advanced search features for v3 | CLOSED | close-done | S3 |
| 1619 | Form / Create Version | CLOSED | review | S2 |
| 1628 | Notifications | CLOSED | close-stale | S2 |
| 1629 | Comments | CLOSED | close-stale | S2 |
| 1630 | My account menu | CLOSED | review | S2 |
| 1631 | List view / Mappings | CLOSED | review | S2 |
| 1632 | Community website | CLOSED | close-stale | S2 |
| 1635 | Replace "UpdatedOn" with latest repo "Version" | CLOSED | close-done | S5 |
| 1641 | Add map source to "Match explanation" tooltip | OPEN | keep | S4 |
| 1655 | Promote OCL Demo site in OCLv3 Community Site | OPEN | close-stale | S4 |
| 1685 | Setup subdomains and deployment pipeline for TBv3 | CLOSED | close-done | S5 |
| 1691 | Checksums: Addressing the details | OPEN | keep | S4 |
| 1693 | Error pages | CLOSED | close-done | S2 |
| 1697 | Standardizing Lookup Fields | OPEN | keep | S4 |
| 1698 | OWASP Top-10 | CLOSED | keep | S5 |
| 1707 | Fav icon | CLOSED | close-done | S2 |
| 1710 | Implement "latest released" behavior in TBv3 | CLOSED | close-done | S5 |
| 1718 | v3 Fav icons | CLOSED | close-done | S2 |
| 1719 | Right to left support - exploration | CLOSED | close-done | S2 |
| 1722 | [TB] Repo Home View | CLOSED | close-done | S3 |
| 1725 | Repo version in search results | CLOSED | close-done | S2 |
| 1749 | Global Search | CLOSED | close-done | S5 |
| 1765 | Remove Last Login column from v3 Users search | CLOSED | close-done | S3 |
| 1773 | Queue Management Service | CLOSED | close-superseded | S5 |
| 1774 | Change KeyCloak favicon to the new OCL logo | CLOSED | close-done | S3 |
| 1775 | Navigation drawer | CLOSED | close-done | S2 |
| 1792 | OCL v3 Analytics | CLOSED | keep | S5 |
| 1797 | Community website (design) | CLOSED | close-done | S2 |
| 1801 | User Profile - Summary API | OPEN | keep | S4 |
| 1851 | v3 Bug - Searching an Org for Repos | CLOSED | close-done | S3 |
| 1856 | Concept (epic, duplicate of #1733) | CLOSED | close-done | S3 |
| 1863 | Indicate the env in Sign In, Register, Forgot Password forms | CLOSED | close-done | S3 |
| 1875 | Data tables | OPEN | keep | S4 |
| 1886 | V3 Sidebar doesn't refresh? | CLOSED | close-done | S3 |
| 1890 | Community website build | CLOSED | review | S2 |
| 1891 | Freeze large resources upon deletion request | OPEN | keep | S4 |
| 1899 | Bug: Repository list does not refresh on user navigation | CLOSED | close-done | S3 |
| 1900 | Bug: Search term should be cleared on page navigation | CLOSED | close-done | S3 |
| 1903 | Add Register button to Account side menu | CLOSED | close-done | S3 |
| 1904 | Modals | OPEN | close-stale | S4 |
| 1905 | Avatars | OPEN | keep | S4 |
| 1913 | TBv3 checkbox behavior should mimic gmail | CLOSED | close-done | S3 |
| 1934 | Deploy TBv3 to staging | CLOSED | close-done | S5 |
| 1935 | Repository design | CLOSED | close-done | S2 |
| 1958 | Expansion picker | OPEN | keep | S2 |
| 1960 | Object preview | OPEN | keep | S2 |
| 1965 | V3 Bug: Page crashes on Concept Details | CLOSED | close-done | S3 |
| 1968 | Concept Details Quick Changes | CLOSED | close-done | S3 |
| 1969 | Repo Summary Label and other fixes | CLOSED | close-done | S3 |
| 1970 | Mobile-ready screens for V3 | OPEN | keep | S4 |
| 1971 | Mobile updates (design) | OPEN | keep | S2 |
| 1973 | Blank Source Type | CLOSED | close-done | S3 |
| 2339 | Reference transformation actions | OPEN | keep | S4 |
| 2346 | Real-time schema validation for references | OPEN | keep | S4 |
| 2347 | Linked source workflow | OPEN | keep | S4 |
| 2348 | Collection dependency notifications | OPEN | keep | S4 |
| 2349 | Collection dependency update workflow | OPEN | keep | S4 |
| 2350 | TBv3 collection versions and expansions controls | OPEN | keep | S2 |
| 2353 | Concept proposals in Mapper and TBv3 | OPEN | keep | S4 |

### Disposition Summary

| Disposition | Count |
|---|---|
| keep | 27 |
| close-done | 30 |
| close-stale | 7 |
| close-superseded | 1 |
| review | 5 |
| **Total** | **70** |

### Status Summary

| Status | Count |
|---|---|
| OPEN | 27 |
| CLOSED | 43 |
| **Total** | **70** |

### Section Distribution

| Section | Count | Description |
|---|---|---|
| S2 | 22 | Design System & UI/UX |
| S3 | 17 | Closed Implementation Work |
| S4 | 20 | Open Feature Requests |
| S5 | 11 | Platform & Infrastructure |
| **Total** | **70** | |

---

## Appendix B: Contributor Map

This table maps all assignees found in the V3 (unreviewed) dataset to their issue numbers and primary sections. Unassigned issues are not listed.

| Contributor | Issue Count | Primary Sections | Issue Numbers |
|---|---|---|---|
| **@paulsonder** (Paul Sonder) | 30 | S2, S4 | #1378, #1381, #1391, #1479, #1494, #1531, #1539, #1619, #1628, #1629, #1630, #1632, #1693, #1707, #1719, #1725, #1775, #1797, #1801, #1875, #1890, #1900, #1904, #1905, #1935, #1958, #1960, #1971, #2350 (note: some issues have multiple assignees) |
| **@snyaggarwal** (Sunny Aggarwal) | 27 | S3, S5, S2 | #1166, #1391, #1561, #1630, #1635, #1641, #1693, #1691, #1710, #1718, #1722, #1765, #1774, #1775, #1851, #1863, #1886, #1899, #1900, #1903, #1913, #1934, #1935, #1968, #1969, #1970, #1973 |
| **@jamlung-ri** (James Amlung) | 9 | S2, S4 | #1378, #1555, #1725, #1775, #1875, #1958, #1960 (note: also active as commenter/reviewer on many more issues) |
| **@paynejd** (Jonathan Payne) | 4 | S4 | #1555, #1691, #1801 |
| **@rkorytkowski** (Rafal Korytkowski) | 3 | S5 | #1166, #1685, #1934 |
| **@bmamlin** (Burke Mamlin) | 1 | S4 | #1691 |
| **@kaalcumm** (Karen Aalcumm) | 1 | S2 | #1797 |

### Contributor Roles

| Contributor | Primary Role in V3 (Unreviewed) Bucket |
|---|---|
| **@paulsonder** | UI/UX design lead. Assigned to nearly all Design-labeled issues. Produced Zeplin designs for navigation, data tables, expansion picker, object previews, mobile layouts, community website, and avatars. |
| **@snyaggarwal** | Frontend and API engineering lead. Implemented and deployed the majority of shipped features and bug fixes. Also handled infrastructure tasks (staging deployment, KeyCloak configuration). |
| **@jamlung-ri** | QA, user stories, and requirements. Active reviewer and commenter on design issues. Provided user stories for expansion picker, data tables, and repository design. |
| **@paynejd** | Product owner. Filed requirements, tagged issues for v3, and made architectural decisions. Less directly assigned but heavily involved in comments. |
| **@rkorytkowski** | Infrastructure and deployment. Set up CI/CD pipeline and managed FHIR service implementation. |
| **@bmamlin** | Clinical domain expert. Engaged on checksums reproducibility for external verification (CIEL). |
| **@kaalcumm** | Community engagement. Contributed to community website content (testimonials, trademark review, imagery). |

### Unassigned Issues

The following 12 issues have no assignees:

| # | Title | Status |
|---|---|---|
| 1433 | Fix OCL Locales - Round 2 | CLOSED |
| 1604 | Compile advanced search features for v3 | CLOSED |
| 1631 | List view / Mappings | CLOSED |
| 1697 | Standardizing Lookup Fields | OPEN |
| 1698 | OWASP Top-10 | CLOSED |
| 1749 | Global Search | CLOSED |
| 1773 | Queue Management Service | CLOSED |
| 1792 | OCL v3 Analytics | CLOSED |
| 1856 | Concept | CLOSED |
| 1891 | Freeze large resources upon deletion request | OPEN |
| 2339 | Reference transformation actions | OPEN |
| 2346 | Real-time schema validation for references | OPEN |
| 2347 | Linked source workflow | OPEN |
| 2348 | Collection dependency notifications | OPEN |
| 2349 | Collection dependency update workflow | OPEN |
| 2353 | Concept proposals in Mapper and TBv3 | OPEN |

Note: The six 2026-era CIEL Implementer issues (#2339, #2346, #2347, #2348, #2349, #2353) are all unassigned, indicating they are planned but not yet staffed.
