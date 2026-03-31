# OCLv3 Knowledge Base: Sections 5-7

## Section 5: Cross-Cutting Concerns

Cross-cutting concerns are capabilities that span multiple functional areas of the TermBrowser. Unlike features confined to a single domain (e.g., concept editing or repository management), these concerns influence the user experience across the entire application and require coordinated design and implementation.

### 5.1 Multi-lingual Support

Multi-lingual support in OCL operates at two distinct levels: the language of the TermBrowser UI itself, and the language of the terminology content being browsed.

**UI Internationalization.** The epic for internationalizing the TermBrowser (#1186) envisions user-selectable UI languages, admin-managed translation uploads, and community-contributed translations. The practical first step -- extracting the English language bundle into an external YAML/JSON file (#1471) -- was originally scoped for v2 but deliberately deferred. As @snyaggarwal noted in July 2024: "this is happening as we build v3. So we can close this out." The implication is that v3 is being built with i18n as a structural assumption rather than a retrofit, and tools like Transifex (used within the OpenMRS community) are under consideration for managing translations.

**User Language Preferences.** The effects of a user's language preference on TermBrowser behavior remain under-documented (#1769). The team acknowledges the need to specify what the Language field on the User Profile actually controls -- whether it filters concept display names, changes UI labels, affects search ranking, or all of the above. This question intersects with search preferences (#1770), where the team has yet to define how language selection interacts with search result ordering.

**Content-level language handling** surfaces throughout the system. Advanced search requirements (#1607) explicitly mention cross-language use cases: "English user performing an advanced search to only match French names/descriptions -- e.g. working to localize terminology in their own application." The locale selector itself has bugs in v2 (#1681), where searching for common two-letter codes like "es" (Spanish) fails because exact matches are not prioritized over partial matches.

Multi-lingual support touches search (#1607, #1770), user profiles (#1769), content display (#1186), and import/export flows. It is one of the few cross-cutting concerns that was explicitly called out as a v3 structural requirement rather than a feature to be layered on later.

### 5.2 Import & Export

Import and export in OCL encompasses bulk data ingestion, repository downloads, individual resource downloads, and the emerging NPM/FHIR package ecosystem.

**Bulk Import.** The bulk import UI has accumulated a long list of improvement ideas (#863), including FHIR resource import support and auto-detection of hierarchy. A specific pain point is the import task state polling mechanism (#2040), which currently fires every 5 seconds regardless of whether the previous response has returned -- a straightforward fix to wait 5 seconds after the last completed response. NPM file upload support (#1959) extends bulk import to handle FHIR Implementation Guide packages, linking to the broader FHIR packaging work (#1917). The new Importer UI for v3 (#2161) is milestoned to the OCL Mapper MVP and is currently in QA testing.

**Repository Download and Export.** The Repository Download + Export epic (#1873) is milestoned for the TBv3 MVP and represents a redesign of how users obtain repository content. A long-standing request (#900) asks for the "retired" concept filter to be exposed in the export UI, a feature already supported by the API since issue #22. Individual resource downloads are being designed for concepts (#1879) and mappings (#1880), with formats including OCL JSON and FHIR representations. The ability to download or view content as FHIR (#591, #535) traces back to early 2021 and is being subsumed into v3's more comprehensive download architecture.

**Collection Reference Results.** When users add references to a collection, the results can be lengthy and difficult to parse. Two companion issues address this: the ability to copy/download add-reference results (#1537) and the ability to resolve references in the results page to show human-readable concept names and IDs (#1538). Both originated from the Kenya OpenMRS Hackathon and were tagged as v3 requirements. The broader challenge of making the add-references results panel useful (#1202) and resolving reference display text (#1375) feeds into the same problem space.

**Import from Existing Repositories.** A newer v3-era requirement (#2157) enables creating a repository by importing content from an existing one, complementing the fork-a-repo-version feature (#2156). Both are milestoned for the TBv3 MVP and represent a shift toward repository-level content reuse rather than concept-by-concept reference building.

### 5.3 Performance

Performance concerns in v3 center on perceived responsiveness and the scalability of complex operations.

**Loading Indicators and Benchmarks.** The "OCL Bouncy Ball" loading icon (#1741) is both a design deliverable (a branded loading animation) and a performance benchmarking initiative. The ticket calls for establishing measurable performance benchmarks alongside the visual indicator, acknowledging that users need clear feedback when operations take time.

**Cascade Performance.** The cascade preview visualizer (#1455) is designed as a reusable component that must handle potentially large hierarchical datasets across multiple view modes (hierarchical table, flattened table, visual, raw JSON). Performance is an implicit constraint here -- cascade operations can traverse deep hierarchies and return hundreds of entries, as demonstrated by the MSF-OCB collection example in #1763 where a single concept cascade returned 14 entries across multiple sources.

**Concept Details Loading.** The v2 hot fixes ticket (#2131) documents specific performance issues: loading 440 associations for a single concept (PIH:7936) takes over 15 seconds. The ticket proposes query optimization or indexing as solutions, and notes that this behavior also needs to be addressed in v3.

**API Throttling.** OCL API throttling (#2121) is in QA testing and represents an infrastructure-level performance concern -- protecting the API from overload while maintaining responsive UI interactions. This is particularly relevant for operations like bulk import and cascade evaluation that generate heavy API traffic.

### 5.4 Search Behavior

Search is the primary entry point for most OCL interactions and has undergone significant evolution from v2 to v3.

**Sort Order.** Sort order issues (#1975) affect how results are ranked and displayed across the application. The companion issue on general sorting behavior (#1939) covers concepts, mappings, and repositories. The question of whether global search should navigate to the latest released version rather than HEAD (#1752) remains tagged as "discussion-needed" -- it reflects a fundamental tension between consumers (who want stable released content) and authors (who need to see their latest work).

**Source Properties and Filters.** A major v3 search enhancement (#2174) migrates concept_class and datatype to become source-defined "properties" and exposes them as search filters. The implementation distinguishes between properties (schema definitions), filters (facet controls), and summary display configuration. As @snyaggarwal clarified: "Properties is just schema. Filters control facets. Include_in_summary only controls the default summary display." This allows source administrators to define which properties appear in concept summaries -- for example, CIEL might surface class and datatype, while LOINC surfaces its six component parts (Component, Property, Time, System, Scale, Method).

**Search Result Presentation.** The removal of alternating table background colors (#2120) is a small but telling change -- the v3 search results are being redesigned from scratch rather than inheriting v2 patterns. The search results icon for mapped concepts (#1974) adds visual indicators showing when a concept has mappings, helping users identify relationship-rich concepts at a glance.

**Advanced Search.** The advanced search MVP (#1607) remains one of the most ambitious search requirements. Compiled requirements include: restricting search to specific fields, searching custom attributes (with dynamic population of attribute keys), cross-language name matching, and finding concepts based on mapping characteristics. Andy Kanter's request -- "I'd love to see where there is not SAME-AS mapping to reference terms that we have a SAME-AS map to CIEL" -- captures the kind of relationship-aware search that distinguishes OCL from simpler terminology browsers.

### 5.5 Sharing & Collaboration

Sharing and collaboration features in v3 aim to make OCL content easily shareable both within and outside the platform.

**Deep Linking.** The deep linking requirement (#1522) is foundational: URLs should update to reflect the current view, copy-pasting a URL should reproduce the same view, and right-click-to-copy should work on links. The ticket explicitly notes that "there are places now where this doesn't work" and that selecting text sometimes triggers actions instead of allowing copy. Deep linking requirements were folded into the concept detail header design (#1620).

**Resource Sharing.** Individual share actions are being designed for concepts (#1865), mappings (#1878), repositories (#1916), and organizations (#2022). The concept share feature (#1865) is milestoned for the TBv3 MVP and is currently in the backlog. The pattern is consistent: each resource type gets a Share action that generates a URL or enables copying a reference in various formats.

**Following and Activity.** The "Following" feature (#1780) allows users to follow organizations, users, or repositories. This was closed as complete for its initial scope and is tied to the dashboard activity feeds (see Section 5.8). The design discussion around #1780 considered what actions should generate follow notifications and how to prevent information overload.

**Walled Garden.** The Walled Garden and Trusted Sources initiative (#1706) aims to surface content most relevant to each user, prioritizing reference content like CIEL and LOINC over the "noise" of all other user-generated content. The concept is related to canonical URL work and represents a content curation strategy that affects search ranking, dashboard content, and repository discoverability.

### 5.6 UI Patterns & Design System

Across the v3 issue corpus, several recurring UI patterns and design system components emerge that standardize interactions across functional areas.

**Chip Components.** The Objects (Chip view) pattern (#1776) provides a compact visual representation of OCL resources -- repositories, concepts, mappings -- used in search results, canonical URL resolution displays, and anywhere a resource needs to be referenced inline. The chip was designed iteratively during the canonical URL registry work (#1742) and is now a reusable design system element.

**Split View / Detail Panel.** The split view concept (#534) dates back to January 2021 and envisions a sidebar/detail layout similar to the ICD-10 browser. While the original ticket is classified as pre-v3, the pattern has been realized in v3's concept detail view alongside search results, as specified in the concept detail header (#1620), associations card (#1621), and names/descriptions panel (#1734).

**Custom View Configuration.** A family of tickets addresses how content views are customized: filter configuration (#530, #788), resource details page customization (#536), and custom view configuration broadly (#808). In v2, this was implemented through an admin configuration system that controlled which attributes appeared in headers (#1355), with built-in logic for default visible attributes and collapsible overflow. V3 inherits this pattern but redesigns it through the source properties/filters framework (#2174).

**Form Patterns.** Form design tickets for creating repos (#1615), orgs (#1616), and adding references (#1618) are all milestoned for the TBv3 MVP and follow a consistent design language. The tension between UI strictness and API flexibility (#958) -- where the UI intentionally restricts options to encourage best practices while the API allows power users more freedom -- was explicitly discussed. As @jamlung-ri noted: "the UI is more restrictive than the API, and I feel like we do that to encourage best practices in the UI for newer users."

**Extras Display.** The treatment of JSON "extras" attributes (#2402) is an active design challenge. The current raw JSON display is inadequate for structured data like CIEL's advanced description attributes. The proposal introduces a label/display/related_description_external_id schema that enables elegant rendering while maintaining data fidelity.

**Version Navigation.** The Version-to-HEAD mode transition (#1830) addresses a fundamental UX concern: how does a user know they are viewing a read-only published version versus the editable HEAD? The ticket calls for a scenario table mapping content types, user roles, and expected display behavior.

### 5.7 Hierarchy & Visualization

Hierarchy and visualization represent one of the most technically demanding cross-cutting concerns, touching search results, concept details, cascade operations, and collection management.

**Cascade as the Hierarchy Engine.** The pivot from a dedicated hierarchy view to cascade-powered hierarchy (#1592) is a key architectural decision. Cascade is "way more powerful than using hierarchy directly and allows for a lot of user customization." The target behavior loads children dynamically on node expansion, defaults to repo-level settings, and lets users switch between rendering hierarchy versus specific mapping types. The component is envisioned as reusable in both search results and the associations panel.

**Cascade Preview Visualizer.** The cascade preview component (#1455) supports four view modes -- hierarchical table, flattened table, visual, and raw JSON. It is a prerequisite for the Add References dialog with preview capabilities and is intended for deployment across multiple surfaces: the operations panel, the associations panel in concept details, and collection management workflows.

**Hierarchy in Mapping Workflows.** Hierarchy as part of Add/Edit Mappings (#1822) brings cascade visualization directly into the mapping creation flow, helping users understand the structural context when establishing relationships between concepts. This is milestoned for the TBv3 MVP.

**Hierarchy/Cascade Component.** The dedicated design ticket (#1700) for "Seeing context for a concept" integrates hierarchy into the search and browse experience. It sits under the Search UI epic (#1694) and is paired with the Searchlight component, indicating that hierarchy context is considered part of the search experience rather than a standalone feature.

### 5.8 Notifications & Activity Feeds

The notification and activity system in v3 is built around the dashboard and the following/subscription model.

**Dashboard Feeds.** The signed-in user dashboard includes a "Your recently updated repos" feed (#1708) that shows repositories the user owns or has recently interacted with. This was closed as complete. A companion feed for "Updated Reference Content" (#1771) notifies users when reference sources like CIEL or LOINC have been updated -- this directly supports the long-standing need to know when upstream content has changed (see #12, #13).

**Following Model.** The Following feature (#1780) enables users to subscribe to updates from organizations, users, or repositories. This feeds into the dashboard activity display and was designed as part of the Consumer: Repository epic (#1625). The feature is closed, indicating the initial implementation is complete.

**Activity as Discovery.** The dashboard feeds serve a dual purpose: notification of changes to content the user cares about, and discovery of new relevant content. The anonymous user dashboard (#1861) and authenticated user dashboard (#1862) present different activity views -- anonymous users see community-wide activity, while authenticated users see personalized feeds based on their followed entities and owned content.

---

## Section 6: Legacy & Migration Notes

The TBv3 project inherits a long history of feature development, design iteration, and architectural decisions from v2 and earlier. This section traces how that legacy shapes v3 by examining issues classified as "TBv2," "Not Clear," or marked for closure as outdated or stale.

### 6.1 The MSP Era: Domain-Specific Beginnings (Issues #667-#672)

Three issues from March 2021 (#667, #669, #672) concern the PEPFAR Metadata Sharing Platform (MSP), an OCL-powered application for browsing health indicator metadata. These tickets -- showing fiscal year data for reference indicators, fixing denominator display, and managing fiscal year filters -- represent a period when the TermBrowser was being extended to serve very specific domain use cases. None have any code activity or v3 board presence. Their existence in the issue tracker reflects the historical reality that ocl_issues serves as the issue repository for multiple OCL-adjacent applications, not just the core TermBrowser. They are artifacts of a time when the TermBrowser's scope was less clearly bounded.

### 6.2 The Configuration Ambition (2021): Customization as Strategy

A cluster of issues from early-to-mid 2021 reveals an ambitious vision for TermBrowser customization that influenced but did not directly carry into v3:

- **Filter Configuration** (#530) envisioned admin-configurable filters using Material UI Select components, with hardcoded options as a stepping stone to dynamic facets. The work was deprioritized repeatedly.
- **Split View** (#534) proposed a sidebar/detail layout modeled on the ICD-10 browser. Design artifacts were created in Miro and Zeplin but the concept was never built as described; instead, v3 adopted its own interpretation of detail panels.
- **Resource Download Formats** (#535) and **Resource Details Customization** (#536) proposed flexible, user-driven control over what information is displayed and how content is exported. These aspirations survive in v3's source properties/filters work (#2174) and download designs (#1873, #1879, #1880).
- **Custom View Configuration** (#808) and **Configuration Sandbox / Custom Domain** (#913) pushed further toward a vision of white-labeled, organization-branded TermBrowser instances. The custom domain concept has not resurfaced in v3 planning.

The pattern that emerges is one of narrowing scope: v2 aspired to be a configurable platform; v3 is focusing on being a well-designed product with strategic extension points.

### 6.3 The Connector Architecture (2022): Abstraction That Did Not Persist

Issue #1185 proposed abstracting TermBrowser connectors into independent objects, supporting OCL, HAPI FHIR, OCL FHIR, ICD-11 FHIR, OpenMRS, and DHIS2 as interchangeable backends. Separately, #1003 envisioned a standalone TermBrowser running without oclapi2, integrated directly with SVCM (Sharing ValueSets, Codes, and Maps) servers. Neither concept survived into v3. The v3 architecture assumes OCL as the backend, with FHIR served through OCL's own FHIR endpoints rather than through pluggable connectors.

### 6.4 Concept Modifications and Expansions: An Evolving Architecture

The concept modifications epic (#816) from June 2021 laid out an ambitious architectural roadmap: separating collection definitions from expansions, implementing custom expansion parameters, supporting multiple reference types with canonical URLs, and handling references to resources not defined in OCL. The companion TermBrowser ticket (#909) raised questions that remain relevant: releasing an expansion, retiring an expansion, exporting an expansion.

This architectural vision has largely been realized in v3's reference/expansion model (#1854, #1855), but through a different implementation path. The v2-era issues (#816, #909) are classified as "Not Clear" or "close-superseded" because their specific scope has been absorbed by v3's Consumer: Reference and Consumer: Expansion epics.

### 6.5 The Collection Update Problem: Seven Years and Counting

Issues #12 and #13, created in February 2018, describe the ability to check for and apply updates to collection references. The problem is deceptively simple: when a concept in a source is updated, collections referencing that concept should be able to detect and adopt the change. Andy Kanter described the scope in August 2019:

> "The update to latest released concept version is an incredibly important feature... There should be a way to filter the concept view to only those concepts needing an update. A full report of changes with the ability to select which updates to apply is probably best practice."

The discussion (#12 comments) revealed that `is_latest_concept_version` tracks HEAD changes but not released version changes, meaning users cannot distinguish between an unreleased edit and a formally released update. @karuhanga identified the gap: "We need a stronger constraint of a source version having been released before we consider a concept as having been updated."

These issues remain open. The dashboard feed for updated reference content (#1771) addresses the notification aspect, and the expansion rebuild mechanism (#1988) provides the action, but the comprehensive review-and-accept-changes workflow Kanter described has not been built. This remains one of the oldest unresolved design problems in OCL.

### 6.6 Mapping Display: Repeated Redesign

The mapping display has been redesigned across multiple issue generations:
- **OCL TermBrowser Mapping Revamp** (#793, June 2021) -- closed as outdated
- **Concept Modifications tracing** (#1763, February 2024) -- where the team discovered that collection-context concept details were pulling source-context mappings instead of collection-modified mappings
- **Mapping Listing View** (#1758) -- the v3 implementation, milestoned for MVP

Each iteration surfaced the same fundamental tension: mappings in OCL are independent resources that exist in sources, but users often think of them as attributes of concepts. The v3 mapping listing view (#1758) and the concept detail associations card (#1621) represent the latest attempt to present mappings in a way that serves both mental models.

### 6.7 What v2 Issues Tell Us About v3 Priorities

Analyzing the disposition of pre-v3 issues reveals the project's evolution:

**Closed as Outdated (26 issues):** Issues like #233 (the original "TermBrowser" epic), #530 (filter config), #536 (details customization), #808 (custom views), #882 (hierarchy UI), and #985 (async counts) represent v2-era specifications that have been superseded by v3's ground-up redesign. Their concepts often persist in v3 but under different framing.

**Closed as Stale (15 issues):** Issues like #535 (download formats), #591 (FHIR download), #865 (FHIR UI), #888 (resource comparison), #913 (custom domains), #1003 (SVCM standalone), and #1297 ($resolveReference in operations panel) represent features that were desired but never gained enough momentum. Some have v3 successors; others were quietly abandoned.

**Marked for Review (9 issues):** Issues like #534 (split view), #816 (concept modifications), #863 (bulk import improvements), #962 (validation schema errors), #1113 (favorites), #1281 (collection management), and #1361 (quick add mappings in collection) represent ideas that still have potential relevance but need re-evaluation in the v3 context.

---

## Section 7: Open Questions & Unresolved Discussions

### 7.1 The Permissions Model

The Roles and Permissions epic (#1812) is tagged as a "v3-foundation" item but has no milestone and sits in "No Status" on the project board. It has code activity in oclapi2, suggesting backend work is underway, but the TermBrowser-side design remains undefined.

The permissions question surfaces repeatedly across the issue corpus:
- **Registry permissions** (#1744): What permissions govern who can view, create, and modify canonical URL registry entries? How should `$resolveReference` behave for registries the user cannot access?
- **User profile visibility** (#1852): Who can view user profiles? The issue was closed after discussion, but the broader permissions framework is unresolved.
- **Repository release permissions** (#1981): Tagged "discussion-needed" -- who can release or un-release a version?
- **Private content in search** (#1887): V3 search did not return private content for non-admin users, exposing a gap in how permissions are applied to search indexing.

The absence of a defined permissions model is the single largest unresolved architectural question in v3.

### 7.2 The Canonical URL Registry: Resolved Design, Open Governance

The canonical URL registry was one of v3's most thoroughly designed features, with detailed mockups (#1742), implementation stages defined by @paynejd (Stage 1: staff manage global; Stage 2: users manage own namespaces; Stage 3: canonicals integrated throughout app), and a functioning QA deployment.

Unresolved questions remain around governance:
- **How does the registry behave if a canonical URL changed between repo versions?** (#1742 comment by @paynejd)
- **Canonical URL restrictions** (#1371): What characters and patterns are valid? The underscore issue (#1874) is one specific case where FHIR conventions conflict with existing OCL content.
- **Global registry population** (#1743): The task of populating the global registry across all environments is milestoned for MVP but assigned to three people (bmamlin, rkorytkowski, snyaggarwal), suggesting it requires cross-team coordination and possibly community input.

### 7.3 Collection Reference Interpretation

The Display/Interpretation of Collection References epic (#1374) is tagged "discussion-needed" and captures a fundamental UX problem: how do you convert a technical reference expression into human-readable language? As @jamlung-ri described: "I wanted to search for a specific code in a repository (collection) and diagnose what references brought the concept into this collection so that I can target my collection editing process."

Related unresolved questions:
- How should the "Remove Reference" prompt communicate the difference between removing a reference (which may affect many concepts) and excluding a specific concept (#1373)?
- Should reference display text include concept names in addition to IDs (#1375)?
- How should the TermBrowser handle collection-based references versus source-based references when adding concepts (#1772)?
- How should the consumer model for references (#1854) handle the fact that OCL's reference model is "not entirely FHIR conformant," as @jamlung-ri noted: "It may not necessarily be FHIR-illegal, but it at least doesn't go along with most of the value set building norms that FHIR would do."

### 7.4 Concept Comparison Approaches

The resource comparison capability has been an open question since #888 (August 2021). The v3 approach includes:
- **Detail view / Compare** (#1623): Milestoned for MVP, in "No Status"
- **Repo / Compare Versions** (#1853): In Testing/QA with oclweb3 commits
- **Repo Comparison MVP Gaps** (#2181): Acknowledges that mapping comparison and JSON comparison are missing from the initial implementation

The question of what constitutes a meaningful "diff" between terminology resources -- where changes to names, descriptions, mappings, and extras all carry different semantic weight -- remains a design problem without a fully articulated solution.

### 7.5 The Extras Schema Problem

Issue #2402 (tagged "discussion-needed") exposes a structural tension in OCL's data model. The `extras` field on concepts is a generic JSON key-value store, but real-world usage demands structured, linked, locale-aware data. The CIEL use case requires multiple "advanced description parts" that share an external_id and must be reassembled into OpenMRS-compatible descriptions.

The proposed solution introduces label/display/related_description_external_id patterns within extras, raising the question: at what point does extras become a schema-driven data structure rather than a free-form extension point? This decision has implications for the concept detail panel display, import/export formats, and API behavior.

### 7.6 Search Defaults: HEAD vs. Latest Released

Whether global search should navigate to the latest released version or HEAD (#1752) is tagged "discussion-needed" and milestoned for MVP. The tension:
- **Consumers** want to see stable, published content. Navigating to HEAD exposes them to in-progress work.
- **Authors** want to find their own content, which may only exist on HEAD.
- **The current behavior** (navigating to HEAD) can confuse consumers who don't understand the HEAD/version distinction.

This question connects to the Version-to-HEAD mode transition design (#1830) and affects how search results are presented, how deep links resolve, and how the dashboard surfaces content.

### 7.7 Deferred but Not Rejected

Several significant feature requests have been deferred without being formally rejected:

- **Concept Cloning** (#1444): The ability to copy a concept from one source to another, maintaining a "cloned-from" link. Requirements were expanded to include cascading (cloning a concept's mappings and answer sets). The $cascade operator was enhanced with `omitIfExistsIn` and `equivalencyMapType` parameters as prerequisites, but the full $clone operation and UI remain unbuilt.

- **Change Requests** (#1614): Discovered during v3 information architecture work as "an Object to represent and manage changes to Concepts and other content in OCL." A deep dive was proposed but the design was never completed. The concept of formal change request management -- distinct from version history -- represents a governance layer that could transform OCL from a terminology editing tool into a terminology governance platform.

- **Operations Panel** (#1624): The ability to execute FHIR operations ($translate, $lookup, $validate-code) and OCL operations ($cascade, $checksum) from within the TermBrowser. Requirements are well-defined but the feature has not been built for v3.

- **Walled Garden / Trusted Sources** (#1706): The vision of curating what content users see by default, prioritizing reference content over community noise. The ticket notes "It is unclear if this will be part of V3 quite yet or to what extent."

- **Concept Modification Tracking** (#1763, #1318): The ability to see when a concept in a collection has been modified from its source version, and to highlight those modifications visually. This is a prerequisite for trustworthy collection management but requires resolving the source-vs-collection context ambiguity that persists from v2.

- **Object-focused Summary Metrics** (#1857): Standardized metrics for organizations (repo count, member count, followers), users (repo count, org count, contribution history), and repositories (concept count, mapping count, version count). The "official/verified" flag for repositories was noted as not easily implementable.

### 7.8 Recurring Themes in Unresolved Discussions

Across the "discussion-needed" issues, several themes recur:

1. **Context ambiguity**: When viewing a concept, is the context the source or the collection? Different answers yield different mappings, different modification indicators, and different cascade results. This is the single most frequently revisited design problem.

2. **Power users vs. new users**: The UI/API restriction gap (#958) reflects a deliberate choice to guide new users while allowing API power users more flexibility. V3 must decide where this boundary lives for each feature.

3. **FHIR conformance vs. OCL flexibility**: OCL's data model predates and sometimes diverges from FHIR conventions. Issues like underscore warnings (#1874), reference model non-conformance (#1854), and the canonical URL restrictions (#1371) all navigate this tension.

4. **Notification without overwhelm**: The dashboard feed and following model need to communicate meaningful changes without becoming noisy. The seven-year-old collection update problem (#12, #13) shows how hard it is to determine what constitutes a meaningful change worth notifying about.
