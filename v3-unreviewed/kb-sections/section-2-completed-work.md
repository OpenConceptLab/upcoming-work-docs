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
