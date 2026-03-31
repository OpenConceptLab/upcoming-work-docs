# OCL Community Backlog Synthesis Report

## Executive Summary

**Generated:** 2026-03-19 (updated 2026-03-20)
**Scope:** Open issues created before August 2025, excluding "CIEL-OCL 2026 Part 1" project members
**Total issues analyzed:** 510 (of 633 total open issues)

This report synthesizes 7+ years of community input from the `OpenConceptLab/ocl_issues` repository, organized thematically. It captures institutional knowledge from the backlog and recommends dispositions for each issue to inform a systematic cleanup.

**Not included in this report:**

- 75 issues in "CIEL-OCL 2026 Part 1" project (active sprint work)
- 48 issues created Aug 2025+ (see separate Active Review List)

### Disposition Summary


| Disposition         | Count   | %         | Description                                                  |
| ------------------- | ------- | --------- | ------------------------------------------------------------ |
| keep                | 303     | 59.4%     | Still relevant, should remain open                           |
| close-stale         | 103     | 20.2%     | Dormant 1yr+, vague or low-value                             |
| review              | 59      | 11.6%     | Ambiguous, needs human decision                              |
| close-outdated      | 40      | 7.8%      | Refers to old infra, v1/v2-specific, or no longer applicable |
| close-superseded    | 3       | 0.6%      | Feature has been implemented or replaced                     |
| close-duplicate     | 2       | 0.4%      | Duplicates another issue                                     |
| **Total closeable** | **148** | **29.0%** |                                                              |
| **Total**           | **510** |           |                                                              |


### Issues by Theme


| #   | Theme                                     | Total | Keep | Close | Review |
| --- | ----------------------------------------- | ----- | ---- | ----- | ------ |
| 1   | Core Terminology Browser (TermBrowser v3) | 181   | 129  | 43    | 9      |
| 2   | API Platform (oclapi2)                    | 156   | 94   | 31    | 31     |
| 3   | UX/UI & Design System                     | 49    | 27   | 17    | 5      |
| 4   | Infrastructure & DevOps                   | 39    | 10   | 23    | 6      |
| 5   | Community & Ecosystem                     | 28    | 8    | 17    | 3      |
| 6   | Developer Experience                      | 26    | 10   | 13    | 3      |
| 7   | OCL Mapper                                | 19    | 19   | 0     | 0      |
| 8   | CIEL & Dictionary Management (Historical) | 12    | 6    | 4     | 2      |


### Age Distribution


| Year Created | Count |
| ------------ | ----- |
| 2018         | 7     |
| 2019         | 3     |
| 2020         | 21    |
| 2021         | 97    |
| 2022         | 52    |
| 2023         | 78    |
| 2024         | 187   |
| 2025         | 65    |


### How to Read This Report

Each thematic section groups related issues by sub-theme. Issues are tagged:

- `KEEP` — Still relevant. Priority shown as [high], [medium], or [low]
- `CLOSE` — Recommended for closure (stale, outdated, superseded, or duplicate)
- `REVIEW` — Ambiguous; needs human decision

The full disposition table in the Appendix can be exported for batch processing.

---

## 1. Core Terminology Browser (TermBrowser v3) (181 issues)

The primary OCL user interface for browsing, searching, and managing terminology content. The largest area of community interest with 190 issues spanning search/navigation, concept and mapping CRUD, collection management, and repository versioning. The TermBrowser v3 MVP milestone (84 of these issues) represents the most active development workstream.

### Repository Management (45 issues — 36 keep, 9 close, 0 review)

- `KEEP` **#1699**: Latest Released Repo Version [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone updated Feb 2025; switching default to latest released version is a key V3 change.
- `KEEP` **#1706**: Walled Garden and Trusted Sources [medium]
  - Epic for content curation and trusted sources is important for user experience and content quality in V3.
- `KEEP` **#1727**: Implement repo_type attribute in TBv3 [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone updated Feb 2025; frontend counterpart to API repo_type attribute (#1687).
- `KEEP` **#1750**: Organization, incl. details + membership [high] *(milestone: TermBrowser v3 MVP)*
  - V3 Epic in TermBrowser v3 MVP milestone with Feb 2025 activity.
- `KEEP` **#1803**: My Repositories - Card View [medium]
  - V3 feature for repository card view; part of the My Repositories experience.
- `KEEP` **#1804**: My Repositories - Create/Update [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with Feb 2025 activity; core repo management feature.
- `KEEP` **#1821**: Implement namespace selector for canonical URL registry tool [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with Feb 2025 activity; well-defined user story.
- `KEEP` **#1827**: Canonical URL Registry - Add Canonical URL (basic) [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with Feb 2025 activity.
- `KEEP` **#1853**: Repo / Compare Versions [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with May 2025 activity; detailed user stories for version diff functionality.
  - **Code evidence:** 24 commits in oclweb3, latest 2025-06-04
- `KEEP` **#1859**: Repository Summary [medium]
  - Epic with detailed acceptance criteria for repo summary metrics; foundational for v3 repo experience.
- `KEEP` **#1871**: Repo / Header [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with Feb 2025 activity; defines key repo header attributes.
- `KEEP` **#1872**: Repo Version Selector [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with Feb 2025 activity; core navigation component.
- `KEEP` **#1874**: In TB, warn users that underscore not officially supported by FHIR in canonical URL or mnemonic [low]
  - Small but useful UX improvement for FHIR compliance; prevents users from creating non-compliant URLs.
- `KEEP` **#1892**: Repository - About [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with Feb 2025 activity; defines repo about page including license, activity feed, and description.
- `KEEP` **#1893**: Repository / Operations [medium]
  - V3 feature for repo-level FHIR operations; context-aware based on repo type.
- `KEEP` **#1897**: Repo-type specific Summary [low]
  - Epic for customized summary views per repository type; empty body but the concept is still relevant for v3.
- `KEEP` **#1916**: Repo / Share [medium] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone with clear acceptance criteria and recent activity.
- `KEEP` **#1978**: CTA / Repository / Create [high] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone with detailed acceptance criteria and multiple assignees.
  - **Code evidence:** 8 commits in oclweb3, latest 2025-04-14
- `KEEP` **#1979**: CTA / Repository / Edit [high] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone with design docs and acceptance criteria.
- `KEEP` **#1980**: CTA / Repository / Create version [high] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone covering version creation workflow.
- `KEEP` **#1981**: CTA / Repository / Release (or Un-release) a version [high] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone with detailed acceptance criteria for release workflow.
  - **Code evidence:** 6 commits in oclweb3, latest 2025-05-01
- `KEEP` **#1982**: CTA / Repository / Make a copy [medium]
  - V3 tagged feature with design docs for cloning repositories; no milestone but clear requirements.
- `KEEP` **#2014**: CTA / Organization / Create [medium]
  - V3 tagged feature with detailed acceptance criteria and design docs for org creation.
- `KEEP` **#2015**: CTA / Organization / Add members [medium]
  - V3 tagged feature for adding members to organizations.
- `KEEP` **#2016**: CTA / Organization / Edit [medium]
  - V3 tagged feature for editing organization metadata.
- `KEEP` **#2017**: CTA / Organization / Create repository [medium]
  - V3 tagged feature for org-scoped repository creation.
- `KEEP` **#2018**: CTA / Organization / Pin repository [low]
  - V3 tagged feature for pinning repos on organization pages.
- `KEEP` **#2020**: CTA / Organization / Edit canonical registry [medium]
  - V3 tagged feature for managing organization canonical registries.
- `KEEP` **#2021**: CTA / Organization / Delete [low]
  - V3 tagged feature for organization deletion with confirmation.
- `KEEP` **#2022**: CTA / Organization / Share [low]
  - V3 tagged feature for sharing organizations; empty body but part of org authoring epic.
- `KEEP` **#2025**: Template / Repository / Source [high] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone defining page structure for Source repository type.
- `KEEP` **#2027**: Template / Repository / ValueSet [high] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone defining page structure for ValueSet repository type.
- `KEEP` **#2028**: Template / Repository / CodeSystem [high] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone defining page structure for CodeSystem repository type.
- `KEEP` **#2155**: Repo Creation Starting Point UI [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone; provides guided repo creation experience.
- `KEEP` **#2156**: Fork a repo version [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone; core feature for creating repos from existing versions.
- `KEEP` **#2181**: Repo Comparison MVP Gaps - Mappings and JSON [medium]
  - Tracks gaps in repo comparison feature for mappings and JSON views; no body but the title is specific enough.
- `CLOSE` **#591**: Download/View as FHIR
  - Empty epic from 2021, no description, last updated July 2021.
- `CLOSE` **#865**: FHIR UI in TermBrowser
  - Empty epic from 2021 with no description, no updates since creation.
- `CLOSE` **#888**: OCL Resource Comparison
  - Empty epic from 2021 with no description, no updates since creation.
- `CLOSE` **#1003**: Support standalone integration of TermBrowser with SVCM server
  - From 2021 with no updates since creation -- standalone SVCM mode has not been prioritized and v3 architecture has evolved differently.
- `CLOSE` **#1160**: Overview tab background image upload
  - Low-priority cosmetic feature from 2021 with no updates since creation and no milestone.
- `CLOSE` **#1491**: Tooltips for $clone UI in TermBrowser
  - Minor UI enhancement from Feb 2023 with no updates since creation and no milestone; likely stale.
- `CLOSE` **#1022**: Unable to add members to an org in the UI
  - Bug report against the v2 web UI from 2021 -- v3 TermBrowser has redesigned org management.
- `CLOSE` **#1185**: Abstract TermBrowser connectors into their own objects
  - Labeled web2; v3 TermBrowser has a different connector/integration architecture.
- `CLOSE` **#1355**: Repo Header showing unnecessary information
  - Labeled web2; the v3 TermBrowser has redesigned repo headers.

### Concepts & Mappings (35 issues — 31 keep, 3 close, 1 review)

- `KEEP` **#1376**: Create and Update Concepts and Mappings [high] *(milestone: TermBrowser v3 MVP)*
  - In the TermBrowser v3 MVP milestone with V3 and Design labels, updated February 2025 -- core v3 functionality.
- `KEEP` **#1444**: Concept Cloning [medium]
  - Concept cloning is a valuable feature for source management and was updated in 2024, indicating ongoing relevance.
- `KEEP` **#1733**: Consumer: Concept Details [high]
  - Epic for concept detail consumer view updated Feb 2025; core V3 feature with well-defined user stories.
- `KEEP` **#1734**: Concept Detail View / Names + Descriptions [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone updated Feb 2025; detailed requirements for name/description display.
- `KEEP` **#1748**: Consumer: Mappings [medium]
  - V3 Epic with activity in Feb 2025; represents a broad feature area that is still relevant for the TermBrowser.
- `KEEP` **#1758**: Mapping Listing View [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with OHIE Must-Haves label; core mapping display feature for v3.
- `KEEP` **#1763**: Concept tracing information - Modification indicators [medium]
  - V3 design issue addressing important UX need for understanding whether a concept in a collection differs from its source; still relevant.
- `KEEP` **#1828**: Option to also retire mappings when retiring a concept [medium]
  - V3-labeled enhancement for a common workflow need; concrete and actionable.
- `KEEP` **#1865**: Concept / Share [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with Feb 2025 activity; detailed acceptance criteria for share functionality including FHIR Coding copy.
- `KEEP` **#1878**: Mapping / Share [medium]
  - Adapts concept share (#1865) for mappings; concrete requirement tied to an active feature.
- `KEEP` **#1881**: Mapping / Operations [medium]
  - Epic for $translate operation in mapping details panel; supports FHIR interoperability UX.
- `KEEP` **#1882**: Concept / Operations [medium]
  - Mirrors mapping operations (#1881) for concepts with $lookup and $validate-code; still relevant for v3.
- `KEEP` **#1901**: Concept / History [medium]
  - V3 feature for viewing concept history alongside repo versions and comparing concept versions.
- `KEEP` **#1902**: Concept / Membership [medium]
  - V3 Design feature showing which repos reference a concept; important for understanding concept reuse.
- `KEEP` **#1963**: Displaying sorted concept list on Mapping Detail page [low]
  - V3 UX improvement for displaying sorted target concepts when mappings have sort weights.
- `KEEP` **#1972**: Show mappings in same namespace in concept details [medium]
  - V3 feature to show namespace-level mappings (e.g. ConceptMap) in concept details, assigned and active.
  - **Code evidence:** 10 commits in oclapi2, oclweb3, latest 2024-12-13
- `KEEP` **#1990**: CTA / Concept / Create [medium]
  - Core v3 authoring feature; no milestone but part of the concept authoring epic.
- `KEEP` **#1991**: CTA / Concept / Edit [high] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone, assigned and updated April 2025.
- `KEEP` **#1992**: CTA / Concept / Clone to repo [medium] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone for concept cloning workflow.
- `KEEP` **#1993**: CTA / Concept / Add to repo [medium] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone for adding concepts as references to collections.
- `KEEP` **#1994**: CTA / Concept / Create similar [medium] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone for creating concepts based on existing ones.
- `KEEP` **#1995**: CTA / Concept / Add mapping [high] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone, assigned to paynejd and updated June 2025.
- `KEEP` **#1996**: CTA / Concept / Create mapped concept [low]
  - V3 concept authoring feature; no milestone but part of concept authoring epic.
- `KEEP` **#1997**: CTA / Concept / Retire [medium] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone for concept retirement workflow.
- `KEEP` **#2000**: CTA / Mapping / Create [high] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone, updated May 2025.
- `KEEP` **#2001**: CTA / Mapping / Edit [high] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone for mapping editing workflow.
- `KEEP` **#2002**: CTA / Mapping / Create similar [medium] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone for creating mappings based on existing ones.
- `KEEP` **#2003**: CTA / Mapping / Retire [medium] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone for mapping retirement workflow.
- `KEEP` **#2004**: CTA / Mapping / Delete [medium] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone for mapping deletion workflow.
- `KEEP` **#2029**: Template / Repository / Concept Map [high] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone defining page structure for Concept Map repository type.
- `KEEP` **#2056**: Concept Details Query Gone Wrong [high]
  - Reproducible bug where clicking a mapping shows the wrong concept; assigned and affects user experience.
- `REVIEW` **#816**: Concept Modifications
  - Concept editing epic updated in 2022 with a requirements doc -- concept CRUD is still core to TermBrowser v3.
- `CLOSE` **#793**: OCL TermBrowser Mapping Revamp
  - Epic from 2021 referencing oclweb2 mapping design (#589, #676); mapping UI has been redesigned in v3.
- `CLOSE` **#1673**: Datatype Dropdown bug - cannot use one of my common datatypes in a source
  - Labeled web2; this is a V2-specific UI bug that V3 concept forms should address with a fresh implementation.
  - **Code evidence:** 2 commits in oclweb2, latest 2023-10-03
- `CLOSE` **#909**: Concept Modification/Expansion Support in TermBrowser
  - This Epic from 2021 is superseded by v3 concept CRUD work tracked in #1376 and the TermBrowser v3 MVP milestone.

### Collections & References (29 issues — 18 keep, 9 close, 2 review)

- `KEEP` **#1318**: Highlight concept attributes/associations that were modified in the collection [medium]
  - V3-tagged design issue updated in February 2024 -- showing collection-level modifications to concepts is valuable for collection managers.
- `KEEP` **#1374**: Display/Interpretation of Collection References [medium]
  - Epic updated in June 2024 about human-readable reference display -- still relevant for v3 collection management.
- `KEEP` **#1537**: Ability to copy/download the results from adding references to a collection [low]
  - Useful feature request from Kenya hackathon feedback; still relevant for V3 collection management workflows.
- `KEEP` **#1538**: Resolve references (where possible) in the add references results page [low]
  - Improving reference resolution display is valuable UX improvement for collection management in V3.
- `KEEP` **#1772**: UI Method for adding collection-based reference to a collection [medium]
  - V3 web3 feature for adding concepts to collections with source vs. collection perspective; API piece is done but UI is still needed.
- `KEEP` **#1854**: Consumer: Reference [high]
  - V3 Epic with Feb 2025 activity; references are a core collection concept in OCL.
- `KEEP` **#1855**: Consumer: Expansion [high] *(milestone: TermBrowser v3 MVP)*
  - V3 Epic in TermBrowser v3 MVP milestone with Feb 2025 activity; expansions are core to collection functionality.
- `KEEP` **#1889**: Expansion / View [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with Feb 2025 activity; detailed requirements for viewing expansion results.
- `KEEP` **#1984**: CTA / Expansion / Create ($expand) [high] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone for expansion creation workflow.
- `KEEP` **#1985**: CTA / Expansion / Set as default [medium] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone for setting default expansion.
- `KEEP` **#1986**: CTA / Expansion / Delete [medium] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone for expansion deletion.
- `KEEP` **#1987**: CTA / Expansion / Update metadata [low]
  - V3 tagged task for expansion metadata editing; no milestone but part of expansion authoring epic.
- `KEEP` **#1988**: CTA / Expansion / Rebuild expansion [medium] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone for rebuilding expansions.
- `KEEP` **#2007**: CTA / Reference / Preview [medium] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone for reference preview functionality.
- `KEEP` **#2008**: CTA / Reference / Delete [medium] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone for reference deletion.
- `KEEP` **#2009**: CTA / Reference / Create ($expand) [medium] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone for creating references through expansion.
- `KEEP` **#2012**: CTA / Reference / Update metadata [medium] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone for reference metadata editing.
- `KEEP` **#2026**: Template / Repository / Collection [high] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone defining page structure for Collection repository type.
- `REVIEW` **#1281**: Collection Management UI and Workflows
  - Epic with no body from 2022 -- collection management is core v3 functionality but this specific ticket may be superseded by more specific v3 issues.
- `REVIEW` **#1361**: Quick Add Mappings in Collection
  - Epic from 2022 about adding mappings in collection context -- relevant to v3 collection workflows but no milestone and no updates since creation.
- `CLOSE` **#12**: Ability to check if new versions of resources referenced in a collection are available
  - From 2018, last updated 2021, no milestone -- collection version management has evolved significantly since then.
- `CLOSE` **#13**: Ability to update collection references to latest version of concepts/mappings
  - From 2018, last updated 2021, no milestone -- closely related to #12 and likely superseded by newer collection management work.
- `CLOSE` **#1202**: API and UI: Better results panel when adding references to collections
  - UX improvement from 2022 with no updates since creation and no milestone -- v3 collection workflows will address this differently.
- `CLOSE` **#1322**: Revise display string representation of references
  - Discussion from 2022 about reference display text with no updates since October 2022 and no milestone.
- `CLOSE` **#1375**: Reference display text update - include concept name in addition to its ID?
  - Small UX suggestion from 2022 with no updates since creation and no milestone -- likely a sub-task of #1374.
- `CLOSE` **#667**: MSP: Show years in which a reference indicator is active when viewing a reference indicator
  - MSP-specific feature request from 2021 referencing DATIM/PEPFAR metadata browser which has been sunset.
- `CLOSE` **#1373**: Remove References from Collection
  - Labeled web2 Epic from 2022 with no updates since creation -- v3 collection management will handle reference removal differently.
- `CLOSE` **#1684**: "Add Expression" workflow appears to make invalid references?
  - Labeled web2 and wontfix; V2-specific bug in add expression workflow that V3 replaces.
- `CLOSE` **#2011**: CTA / Reference / Delete *(milestone: TermBrowser v3 MVP)*
  - Appears to be a duplicate of #2008 with the same title and milestone.

### Search & Navigation (24 issues — 16 keep, 6 close, 2 review)

- `KEEP` **#1607**: Advanced search MVP [high]
  - Epic for advanced search is a key V3 feature area that exposes API capabilities to the UI.
- `KEEP` **#1694**: Search UI, incl. preview and search results [high]
  - Epic for search UX/UI updated Feb 2025; core V3 feature area with active design work.
- `KEEP` **#1752**: Selecting repo in global search should navigate to latest not head [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone; addresses important UX pattern for how users land on repo versions from search.
- `KEEP` **#1754**: Searchlight enhancements [medium]
  - V3 web3-labeled search enhancement; empty body but searchlight is a core v3 feature.
- `KEEP` **#1830**: Version-to-HEAD Mode Transition/Navigation [medium]
  - Important v3 UX concern about transitioning between view-only versions and editable HEAD; well-described requirements.
- `KEEP` **#1864**: Global Search / Org [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with Feb 2025 activity; concrete checklist of search enhancements.
- `KEEP` **#1866**: Repo / Search - Enhancements [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with Feb 2025 activity; specific enhancements like owner avatar and latest version column.
- `KEEP` **#1877**: Search a Repository [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with Feb 2025 activity; detailed search requirements including in-page search and pagination.
- `KEEP` **#1883**: Concept / Search [medium]
  - Core v3 concept search requirements including full-text search, sorting, filtering, and version-aware context.
- `KEEP` **#1887**: v3 Search does not return private content [high]
  - Bug where private repos don't appear in v3 global search; important for users with private content.
- `KEEP` **#1896**: Reference / Search [medium]
  - V3 feature for searching and understanding how a valueset is composed via its references.
- `KEEP` **#1974**: Search Results icon for Mapped Concepts [medium] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone; provides important UX clarity for why results appear in search.
- `KEEP` **#1975**: Fix Sort order issues [medium]
  - V3 tagged issue addressing multiple sort UX problems identified at OHIE and UAT testing.
- `KEEP` **#2031**: Author: Searchlight [high]
  - V3 Epic tracking Searchlight feature stories for v3 beta release.
- `KEEP` **#2120**: Remove alternating table bgcolor in search results [low] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone; straightforward UI polish task.
- `KEEP` **#2174**: Implement source properties/filters in TB search [high]
  - Many checkboxes completed; assigned with recent activity (Jul 2025); connects source properties to TB search UI.
  - **Code evidence:** 30 commits in oclapi2, oclweb2, oclweb3, latest 2025-08-11
- `REVIEW` **#1770**: Search Preferences - How does this affect the user
  - Discussion-needed V3 issue with no updates since March 2024; requirements are still vague and may need human decision on whether to pursue.
- `REVIEW` **#1939**: Sorting when displaying Concepts, Mappings, Repositories, etc.
  - Valid UX issue from UAT testing with assignees, but no milestone; may have been addressed in v3 sort redesign.
- `CLOSE` **#1079**: Add filter button for Extra Attributes in the Associations Section of the Concept Details Page
  - Feature request from 2021 with no updates since creation, no milestone -- the v3 concept detail page will handle this differently.
- `CLOSE` **#530**: Filter Configuration
  - Epic from 2021 for oclweb2 filter configuration; filter system has been redesigned in v3.
- `CLOSE` **#672**: MSP: Changing Fiscal Year filter when navigating to a previous version of reference indicator
  - MSP-specific UI bug from 2021; MSP has been sunset.
- `CLOSE` **#788**: Filter Configuration Feature Additions (Not Immediate)
  - From 2021, references oclweb2 filter configuration (#574) which has been replaced in v3.
- `CLOSE` **#1681**: Search for some locales is broken
  - Labeled web2; locale search bug in V2 UI that V3 should address with new locale selection implementation.
  - **Code evidence:** 2 commits in oclweb2, latest 2026-03-13
- `CLOSE` **#1937**: Fuzzy search result formatting - slight adjustment
  - Tagged web2 with no milestone; v3 search UI has been redesigned and this is no longer applicable.

### User & Auth (18 issues — 15 keep, 2 close, 1 review)

- `KEEP` **#1186**: Multi-lingual support in OCL TermBrowser [medium]
  - V3-tagged Epic for TermBrowser internationalization, updated in November 2023 -- multi-lingual support remains a priority.
- `KEEP` **#1471**: Extract out English language bundle from TermBrowser [low]
  - Internationalization is an important long-term goal for V3; labeled both web2 and V3, updated in 2024.
  - **Code evidence:** 22 commits in oclapi2, oclweb2, latest 2023-06-29
- `KEEP` **#1751**: Consumer: User [high] *(milestone: TermBrowser v3 MVP)*
  - V3 Epic in TermBrowser v3 MVP milestone with Feb 2025 activity.
- `KEEP` **#1769**: User Language Preferences [medium]
  - V3-labeled feature defining how language preferences affect the TermBrowser experience; still relevant for internationalization.
- `KEEP` **#1798**: User settings page [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with Feb 2025 activity; well-defined user story for centralized settings.
- `KEEP` **#1802**: My Repositories + My Orgs [high] *(milestone: TermBrowser v3 MVP)*
  - V3 Epic in TermBrowser v3 MVP milestone with Feb 2025 activity.
- `KEEP` **#1888**: User - View canonical registry [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with Feb 2025 activity; adds CTA to user profile for registry viewing.
- `KEEP` **#1977**: Author: Repository [high] *(milestone: TermBrowser v3 MVP)*
  - Epic in TermBrowser v3 MVP milestone covering repository CRUD, updated March 2025.
- `KEEP` **#1983**: Author: Expansion [medium]
  - V3 Epic tracking expansion management features, updated Feb 2025.
- `KEEP` **#1989**: Author: Concept [high]
  - V3 Epic for concept CRUD operations, a core feature area.
- `KEEP` **#1999**: Author: Mapping [high] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone Epic, updated June 2025.
- `KEEP` **#2013**: Author: Organization [high] *(milestone: TermBrowser v3 MVP)*
  - TermBrowser v3 MVP milestone Epic for organization management in v3.
- `KEEP` **#2132**: Improve forced sign-in/sign-out behavior [medium]
  - Describes a poor UX that can result in lost work across all OCL web apps including TBv3 and Mapper.
- `KEEP` **#2138**: Implement user sign-in form for django-auth in oclweb3/oclmap [medium]
  - Assigned task for implementing django-auth sign-in in web3 and mapper applications.
- `KEEP` **#2145**: Simple URLs to redirect to SSO for Signin/up [medium] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone; provides clean sign-in/sign-up URL redirects.
  - **Code evidence:** 10 commits in oclweb2, oclweb3, latest 2025-03-27
- `REVIEW` **#1113**: Favorite Icon, allowing users to "Favorite" any repo
  - Nice-to-have UX feature that could still be relevant for v3 but has had no updates since 2021 and no milestone.
- `CLOSE` **#1906**: Editable email address for user
  - Deliberately deferred in mid-2024 with no follow-up; low demand and no milestone assigned.
- `CLOSE` **#2131**: TBv2 concept details & associations hot fixes
  - Tagged web2 and describes v2-specific hot fixes; v3 has replaced v2.

### General UI (15 issues — 4 keep, 9 close, 2 review)

- `KEEP` **#1522**: Deep linking [high]
  - Deep linking is a fundamental UX requirement for V3 that ensures URLs are shareable and bookmarkable.
- `KEEP` **#1614**: Change requests and management [medium]
  - Change request management is a significant V3 feature for content governance workflows.
- `KEEP` **#1624**: Operations panel [medium]
  - Epic for operations panel supporting FHIR and OCL operations; updated July 2024 and still relevant.
- `KEEP` **#1857**: Object-focused Summary Metrics [medium]
  - Epic defining metrics for orgs, users, repos; concrete table of metrics provided.
- `REVIEW` **#534**: New View: Split View
  - Split view concept is still valuable for TermBrowser v3 and may inform current design, but the specific requirements doc is from v2 era.
- `REVIEW` **#962**: Expose validation schema error messages to user
  - Showing validation schema errors to users is still valuable, but no updates since 2022 and no milestone -- unclear if addressed in v3.
- `CLOSE` **#913**: Configuration Sandbox / Custom Domain for TermBrowser
  - Epic from 2021 with no updates since August 2021, no milestone -- aspirational feature that has not been prioritized.
- `CLOSE` **#1297**: Add $resolveReference to Operations Panel
  - Small UI feature from 2022 with no updates since creation and no body -- the operations panel may be redesigned in v3.
- `CLOSE` **#233**: TermBrowser
  - Empty project-level epic from 2020 for TermBrowser v2; v3 has replaced v2 and this top-level tracker is no longer useful.
- `CLOSE` **#536**: Resource Details Page Customization Options
  - Epic from 2021 for oclweb2 concept/mapping detail customization; v3 has a new detail page design.
- `CLOSE` **#669**: MSP: Indicator denominator not displaying properly
  - MSP-specific bug from 2021 referencing old QA environment; MSP has been sunset.
- `CLOSE` **#808**: Custom View Configuration in TermBrowser
  - Epic from 2021 for oclweb2 view customization; v3 has its own view/layout system.
- `CLOSE` **#958**: Compare UI validation/restrictions to API
  - Filed against the v2 web UI in 2021 -- v3 TermBrowser has its own validation approach and this specific comparison is no longer applicable.
- `CLOSE` **#985**: Add async counts into org sources, collections and members tabs
  - Labeled web2; the v3 TermBrowser has redesigned org/repo pages and this v2-specific UI enhancement no longer applies.
  - **Code evidence:** 16 commits in oclweb2, latest 2021-10-20
- `CLOSE` **#1918**: Double-clicking Add Version crashes the page
  - Tagged web2 with no assignee or milestone; v3 has replaced v2 and this bug is likely not relevant.

### Import & Export (11 issues — 7 keep, 3 close, 1 review)

- `KEEP` **#1873**: Repository / Download + Export [high] *(milestone: TermBrowser v3 MVP)*
  - V3 Epic in TermBrowser v3 MVP milestone with Feb 2025 activity; supports JSON, CSV, and FHIR export formats.
- `KEEP` **#1879**: Concept / Download [medium]
  - V3 feature for downloading individual concepts in OCL JSON or FHIR coding formats; well-defined requirements.
- `KEEP` **#1880**: Mapping / Download [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with Feb 2025 activity; parallel to concept download feature.
- `KEEP` **#1898**: Download the (or one of the) FHIR representation of a repository [medium]
  - Supports FHIR IG Publisher workflow; related to the broader Repository Download + Export epic (#1873).
- `KEEP` **#1959**: Support NPM file upload in bulk import UI [medium]
  - Related to S3 storage support (#1917); enables users to upload NPM packages through the web UI.
- `KEEP` **#1998**: CTA / Concept / Import code list [medium]
  - V3 authoring feature for bulk concept creation from code lists.
- `KEEP` **#2157**: Create repo --> Import content from existing repo [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone; follows from #2156 to import content during repo creation.
- `REVIEW` **#863**: Bulk Import UI Improvements
  - Lists useful UI improvement ideas (FHIR import, auto-detect hierarchy) but no updates since 2021.
- `CLOSE` **#535**: Resource Download Formats
  - Vague epic from 2021, no updates since January 2021, no specific requirements listed.
- `CLOSE` **#900**: Expose "retired" option when Exporting in UI
  - UI enhancement from 2021 with no assignee, no milestone, and no updates -- likely superseded by v3 export redesign.
- `CLOSE` **#2040**: Issue import task state update after previous state request completed
  - Tagged web2 and describes a v2-specific UI polling issue; v3 has replaced v2.
  - **Code evidence:** 2 commits in oclweb2, latest 2025-01-23

### Hierarchy & Visualization (4 issues — 2 keep, 2 close, 0 review)

- `KEEP` **#1455**: Cascade preview visualizer/component [medium]
  - Reusable cascade preview component is a core V3 feature with multiple views and active assignees; last updated mid-2024.
- `KEEP` **#1822**: Hierarchy as part of Add/Edit Mappings on Concept Details [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with Feb 2025 activity; addresses hierarchy display and editing in concept details.
- `CLOSE` **#882**: Hierarchy UI in TermBrowser
  - Empty epic from 2021 for oclweb2 hierarchy UI; v3 has its own hierarchy browsing implementation.
- `CLOSE` **#1592**: Switch TermBrowser hierarchy view to use cascade
  - Labeled web2 and V3 but last updated June 2023; V3 hierarchy implementation likely supersedes this specific ticket.

---

## 2. API Platform (oclapi2) (156 issues)

The Django REST API powering all OCL applications. With 161 issues, this covers FHIR integration (the largest sub-area), bulk import/export operations, Elasticsearch-backed search and performance, data model and versioning, and authentication.

### FHIR Service — Key Themes from Cleanup (March 2026)

> **Note:** 48 FHIR issues were closed during the March 2026 cleanup. The full analysis is in `reports/fhir-analysis/fhir-knowledge-base.md`. The following highlights are preserved here for community visibility.

#### Ideas Important for the Future

These concepts were closed as tickets but remain strategically important. When the time is right, they should be re-scoped as fresh tickets:

- **Implicit Value Sets** (#444) — How OCL should auto-generate ValueSet entities for CodeSystems per the FHIR spec. No implementation to date; foundational for FHIR compliance.
- **FHIR UI in TermBrowser** (#865) — Exposing FHIR resource representations directly in the TermBrowser UI. Relevant as v3 matures.
- **Recursive Real-time Expansions** (#1310) — Real-time expansion computation for nested ValueSets. Critical for advanced FHIR ValueSet support.
- **Terminology Packaging Service** (#2045) — Packaging OCL content for distribution as FHIR terminology packages. Enables IG authoring workflows.
- **Automated FHIR Testing Pipeline** (#2046) — Automated validation of OCL's FHIR compliance. Essential for quality assurance at scale.
- **FHIR Resource Validation** (#2053, #2050) — Automated validation of FHIR resources on import and batch validation of existing content.
- **Batch Translation** (#2052) — Batch $translate operations across ConceptMaps.

#### $resolveReference + Canonical URL Registry (Active — `reviewed/keep`)

These issues represent the core FHIR infrastructure that remains actively important. They are labeled `reviewed/keep` and will be addressed as part of ongoing v3 and FHIR Service work:

- **#1696**: Canonical URL Registry — the registry that maps canonical URLs to OCL repositories. TBv3 MVP milestone. Epic with active sub-issues.
- **#1744**: Permissions for registries and $resolveReference behavior — multi-tenant permissions model for the registry.
- **#1610**: Use canonical URL where possible in the "system" field of a ValueSet — FHIR compliance for ValueSet compose statements.
- **#2261**: Use $resolveReference to resolve canonical URL to OCL repo version — FHIR Service MVP milestone.
- **#2262**: Expose OCL source.properties & source.filters through FHIR CodeSystem.property/filter — FHIR Service MVP milestone.

---

### FHIR Integration (38 issues — 25 keep, 3 close, 10 review)

- `KEEP` **#444**: Plan how to handle "implicit value sets" in FHIR [medium]
  - FHIR implicit value set handling is an important compliance feature, updated as recently as 2023.
- `KEEP` **#782**: Introduce attribute to control how an OCL source is exposed via FHIR [high]
  - Important FHIR compliance feature for authoritative vocabularies like LOINC/SNOMED; core to multi-tenant FHIR support.
- `KEEP` **#974**: FHIR $expand operation should utilize OCL's full text search, not just conceptId [high]
  - FHIR $expand with full text search is an important capability gap; updated in 2023 and FHIR work is evergreen.
- `KEEP` **#1166**: NPM Import of Baseline FHIR Content, plus Known FHIR Service Enhancements and Bugs [high]
  - V3-tagged Epic updated in January 2025 about remaking OCL's FHIR service -- actively relevant foundational work.
  - **Code evidence:** 22 commits in oclapi2, latest 2022-04-25
- `KEEP` **#1296**: Requirements: Basic expansion matching logic for ValueSet operations [high]
  - FHIR-labeled requirements issue updated in March 2024 -- expansion matching logic is essential for a compliant terminology server.
- `KEEP` **#1310**: Implement recursive real-time expansions [high]
  - Updated in March 2024; recursive real-time expansions with system-version parameter support is important for FHIR compliance.
- `KEEP` **#1599**: CodeSystem POST Bug - Display attribute seems to be required for OCL [medium]
  - FHIR compliance bug where display attribute should be optional per spec; important for interoperability.
- `KEEP` **#1610**: Use canonical URL where possible in the "system" field of a ValueSet [medium]
  - FHIR compliance issue where canonical URLs should be used in ValueSet system field; updated Jan 2024.
- `KEEP` **#1823**: CodeSystem $lookup Enhancement - displayLanguage Parameter [medium]
  - Concrete FHIR enhancement requested by HL7 Brazil for IPS Viewer; supports internationalization use case.
- `KEEP` **#1833**: 502 Bad Gateway for Large CodeSystem resources [high]
  - Bug affecting FHIR CodeSystem imports over ~250 codes; likely still relevant as large resource handling is an ongoing concern.
  - **Code evidence:** 6 commits in oclapi2, latest 2024-05-16
- `KEEP` **#1837**: Review/finalize $translate operation [medium]
  - FHIR operation correctness is evergreen; specific issues identified with resolveReference and system parameters.
- `KEEP` **#1910**: FHIR baseline content [high]
  - Epic with active assignee tracking baseline FHIR content availability in OCL, a strategic initiative.
- `KEEP` **#1915**: OCL support for Publishing terminology the FHIR ecosystem, including Direct IG Building from OCL [high]
  - Epic for strategic FHIR ecosystem publishing support, updated as recently as Jan 2025.
- `KEEP` **#1919**: Support ConceptMap and CodeSystem with the same ID [high]
  - Architectural issue blocking baseline FHIR content loading; needs resolution for FHIR compliance.
- `KEEP` **#1922**: Fix overwriting ConceptMap version [medium]
  - Bug with traceback related to FHIR import pipeline, assigned to rkorytkowski.
  - **Code evidence:** 10 commits in oclapi2, latest 2024-12-06
- `KEEP` **#1924**: Import r4.core dependency once [medium]
  - Optimization to avoid redundant imports of r4.core across FHIR packages.
- `KEEP` **#1927**: CodeSystem Import Bug for Date property [medium]
  - Bug where Date attribute is stripped during FHIR CodeSystem import; assigned and tagged fhir.
- `KEEP` **#1929**: CodeSystem Import Bug: New line character removed when importing into OCL [medium]
  - Data fidelity bug in FHIR CodeSystem import pipeline, assigned to rkorytkowski.
- `KEEP` **#1957**: Test load baseline content via NPM import [high]
  - Active testing task for baseline FHIR content loading, updated Jan 2025.
- `KEEP` **#2030**: FHIR endpoints must be handled with or without trailing slash [medium]
  - API compatibility issue for FHIR endpoints, assigned to rkorytkowski.
- `KEEP` **#2047**: Implement FHIR Serialization Library [high]
  - Epic for a core FHIR capability with an assigned developer.
- `KEEP` **#2048**: FHIR Content Traceability [medium]
  - Epic for traceability of FHIR content, a key requirement for production terminology services.
- `KEEP` **#2049**: CRMI Compliance [medium]
  - Epic for compliance with the Canonical Resource Management Infrastructure IG; strategically important.
- `KEEP` **#2053**: Automated FHIR Resource Validation [medium]
  - Epic for automated validation of FHIR resources; closely related to #2050 but focused on automation.
- `KEEP` **#2114**: Bug: Value Set Compose Statement shows "ValueSet" in the "system" field [medium]
  - Valid FHIR bug where system field shows incorrect resource type; unassigned but clearly actionable.
- `REVIEW` **#583**: Ability to perform FHIR operation by Owner and Id
  - FHIR operation enhancement that may still be relevant for multi-tenant FHIR support, last updated 2021.
- `REVIEW` **#869**: FHIR/SVCM Support in OCL
  - FHIR/SVCM is still a core initiative, but this empty epic may not be the right tracking mechanism.
- `REVIEW` **#1744**: Permissions for registries and $resolveReference behavior
  - No milestone, empty body, no assignee, and no updates since March 2024; needs human decision on whether registry permission requirements are still relevant.
- `REVIEW` **#1761**: Add FHIR xml support
  - No milestone, no updates since March 2024; FHIR XML is a nice-to-have but unclear if still prioritized.
- `REVIEW` **#1815**: FHIR CodeSystem Fixes
  - Has checklist items (some checked, some not visible in preview); needs verification on whether all fixes were completed.
- `REVIEW` **#1835**: OCL rejects "duplicate" resource imports - "org_source_unique" is violated
  - Bug from May 2024 with no updates since; needs verification on whether the duplicate handling was fixed.
- `REVIEW` **#1836**: FHIR ConceptMap fails to import due to "null" map_type
  - Bug from May 2024; needs verification on whether equivalence vs relationship map type issue was resolved.
- `REVIEW` **#1839**: Add code searchParam for CodeSystem
  - Small FHIR compliance fix from May 2024; needs verification on whether this was implemented.
- `REVIEW` **#1840**: CodeSystem listing should include total
  - Small FHIR compliance fix from May 2024; needs verification on whether this was implemented.
- `REVIEW` **#1961**: Implement FHIR import validation/comparison process
  - Empty body with no assignee or milestone; the concept is valuable but needs scoping.
- `CLOSE` **#472**: Provide response for naked fhir request
  - Minor FHIR endpoint behavior issue from 2020, last updated 2021, references old QA environment URLs.
- `CLOSE` **#582**: Ability to filter by codesystem properties
  - Brief issue from 2021, no assignee, no milestone, last updated 2021.
- `CLOSE` **#1793**: Implement basic analytics on OCL FHIR Core utilization
  - Requirements marked as TBD, no updates since March 2024, no assignee; too vague to be actionable.

### Data Model & Versioning (33 issues — 23 keep, 7 close, 3 review)

- `KEEP` **#638**: Allow source/collection admins to control visibility of repo versions separate from tags [high]
  - Important access control feature for version resolution, updated as recently as March 2024.
- `KEEP` **#757**: Implement optional country code support for locales [high]
  - Locale validation issue affecting real dictionary imports (PIH), updated March 2024, still relevant.
- `KEEP` **#878**: Name_type Standardization [medium]
  - Data standardization issue with concrete examples, updated September 2023, affects OpenMRS Dictionary Manager.
  - **Code evidence:** 8 commits in oclapi2, oclweb2, latest 2021-08-10
- `KEEP` **#1194**: Changing an ID for an org, source, collection, etc. [medium]
  - Discussion-needed enhancement updated in March 2024 with multiple assignees -- resource ID changes are a real operational need (e.g. IHTSDO to SNOMED-International).
- `KEEP` **#1327**: Constrain processing of repo versions to be "consistent" within an expansion [high]
  - Important API correctness issue updated in March 2024 -- ensuring expansion consistency during processing is critical for reliable terminology services.
- `KEEP` **#1433**: Fix OCL Locales - Round 2 [high]
  - V3-tagged foundational Epic updated in March 2024 -- proper locale support with secondary language codes is essential.
- `KEEP` **#1666**: Introduce "Synonym" name type and remove "None" name type [medium]
  - Breaking change to fix confusing name type semantics; updated Oct 2024 indicating ongoing discussion.
- `KEEP` **#1687**: Implement repo_type attribute for sources and collections [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with recent Feb 2025 update; foundational API change for V3.
- `KEEP` **#1690**: Diffs and Checksums [high]
  - Epic for checksums and diffs is a V3 foundational feature important for CIEL imports and resource comparison.
- `KEEP` **#1691**: Checksums: Addressing the details [medium]
  - Discussion ticket for checksum details with active assignees; updated April 2024 and relevant to V3 foundation.
  - **Code evidence:** 10 commits in oclapi2, latest 2024-01-24
- `KEEP` **#1697**: Standardizing Lookup Fields - Approaches for cleaning up data in OCL [medium]
  - V3 foundational epic for standardizing lookup fields; no assignee but the data quality concern is evergreen.
- `KEEP` **#1726**: Repo Configuration and Content Validation - Configuring Lookup values for a Repo - including FHIR properties and filters [medium]
  - Epic for repo configuration and content validation; relevant for FHIR compliance and data quality.
- `KEEP` **#1746**: Only create new concept/mapping version if the resource has changed [high]
  - Important performance and correctness enhancement for bulk imports and resource versioning; has assignees and detailed requirements.
  - **Code evidence:** 18 commits in oclapi2, oclweb2, latest 2024-03-12
- `KEEP` **#1805**: Repo Version Summary counts are often incorrect [high]
  - Bug affecting data integrity display after imports; has assignee and concrete description of the problem.
- `KEEP` **#1867**: Create independent script for standard and smart checksums for concepts and mappings [medium]
  - Supports CIEL validation workflow; has assignee and Dec 2024 activity.
  - **Code evidence:** 54 commits in oclapi2, latest 2024-12-02
- `KEEP` **#1868**: Enable creating/importing/editing resource in an older repo version [medium]
  - Complex but important API enhancement for version management; detailed technical tasks outlined.
- `KEEP` **#1891**: Freeze large resources upon deletion request [medium]
  - V3-labeled enhancement for a real UX problem where users can interact with content being asynchronously deleted.
- `KEEP` **#1962**: Record repos+versions that did and did not resolve with an expansion [medium]
  - API enhancement to track unresolvable references in expansions, assigned to snyaggarwal.
- `KEEP` **#2149**: The first version's hierarchy different from the HEAD's [medium]
  - Valid bug where first version's hierarchy differs from HEAD despite no content change; unassigned but clearly reproducible.
- `KEEP` **#2153**: Mappings should persist repo URLs as submitted by the user [high]
  - Important data integrity issue where canonical URLs should be preserved as submitted; assigned.
- `KEEP` **#2159**: Source properties and filters [high]
  - Core capability for FHIR CodeSystem properties/filters; assigned with detailed specification and recent activity.
- `KEEP` **#2175**: Enforce source properties as schema [medium]
  - Follow-on to #2159 for enforcing properties as concept schema; important for data quality.
- `KEEP` **#2176**: Source properties and filters (part 4) [low]
  - Future phase of source properties work including FHIR profile generation; still being defined.
- `REVIEW` **#18**: API-level diff functionality to compare 2 resources or 2 resource versions
  - Evergreen feature request for semantic diff that remains valuable, but no activity since 2021 and no assignee.
- `REVIEW` **#1143**: Ability to transfer ownership of a source or collection
  - Evergreen feature request for both API and TermBrowser, but no updates since 2021 and no milestone.
- `REVIEW` **#1670**: Collection bug - collection isn't displaying the latest version of the concept
  - Bug where collections show outdated concept versions; no assignee and last updated Nov 2023, unclear if fixed.
- `CLOSE` **#19**: API-level diff for repos
  - From 2018, very brief description, no assignee, no milestone, no activity since 2021.
- `CLOSE` **#104**: Expose an api endpoint, which lists linked mappings/references of a source
  - From 2019, last updated 2022, no milestone -- a nice-to-have that has not been prioritized in 4+ years.
- `CLOSE` **#386**: Refactor lookup value schema for oclapi2
  - From 2020, vague one-line description, last updated 2021 -- likely no longer relevant after years of API evolution.
- `CLOSE` **#899**: Mappings version summary
  - Small API feature request from 2021 with no assignee, no milestone, and no updates since creation.
- `CLOSE` **#901**: Lookup Tables
  - Vague Epic from 2021 with minimal description, no assignee, no milestone, and no updates since creation.
- `CLOSE` **#1117**: Save some concept/mapping details in an expansion
  - From 2021 with no updates since creation -- expansion architecture has likely evolved past this specific requirement.
- `CLOSE` **#1286**: Retire any APIs/data that use both repo version and resource version
  - Labeled web2 and api2 from 2022 -- this v2-era API cleanup may already be addressed in v3 or no longer applicable.

### Bulk Import/Export (34 issues — 22 keep, 5 close, 7 review)

- `KEEP` **#597**: [OCLAPI2] Design CSV Generation and Content Changes [medium]
  - CSV generation improvements with specific checklist items, updated in 2023, still relevant for export workflows.
- `KEEP` **#790**: Implement access control for exports [high]
  - Important access control feature distinguishing reference access from distribution, updated March 2024.
- `KEEP` **#887**: Content Exports [medium]
  - Content exports epic updated as recently as June 2024, indicating ongoing relevance.
- `KEEP` **#957**: Improve memory management for import tasks [medium]
  - Detailed performance issue about import memory management, updated in 2024 -- bulk import performance is an evergreen concern.
  - **Code evidence:** 20 commits in oclapi2, latest 2024-12-04
- `KEEP` **#1115**: OCL exports (zips and subscriptions) should include full concept source information [medium]
  - Updated in July 2024, indicating ongoing relevance; export format improvements are important for downstream consumers like OpenMRS.
- `KEEP` **#1508**: Setup limits on bulk imports [medium]
  - Rate limiting for bulk imports is an evergreen operational concern for system stability.
- `KEEP` **#1596**: Update CSV Bulk Import to catch up with new features [medium]
  - CSV bulk import is actively used and keeping it aligned with new features is an evergreen need.
- `KEEP` **#1657**: Better handle invalid import JSON/CSV errors [medium]
  - Better error handling for bulk imports is an evergreen quality improvement; empty body suggests it needs refinement.
- `KEEP` **#1782**: Implement standalone reference support in CSV bulk import [medium]
  - Enhances bulk import to support standalone references; concrete requirements and evergreen import improvement.
- `KEEP` **#1847**: Import Performance [high]
  - Epic for import performance with active assignees; performance is evergreen and critical for large-scale users like CIEL.
- `KEEP` **#1911**: OCL CSV exports truncated at 1000 [medium]
  - Valid bug report about export truncation affecting real users of large sources like CIEL.
- `KEEP` **#1923**: Persist partial progress for new bulk import [high]
  - Performance issue causing timeouts on large imports, updated Jan 2025.
- `KEEP` **#2035**: Fix new bulk import queuing [high]
  - Bug causing infinite loop when importing hl7.fhir.r4.core package, updated Jan 2025.
  - **Code evidence:** 10 commits in oclapi2, latest 2025-01-22
- `KEEP` **#2041**: Do not import npm hl7.fhir.r4.core 4.0.1 if listed in dependencies [medium]
  - Practical optimization for bulk FHIR imports to avoid redundant re-importing of the core R4 package.
- `KEEP` **#2042**: Do not schedule all bulk import subtasks at once [high]
  - Addresses a real Celery scalability issue with large imports; assigned and well-described.
- `KEEP` **#2043**: Test new bulk import for oclapi imports [high]
  - Active testing task for new bulk import with recent updates in July 2025.
- `KEEP` **#2057**: Collection Importing via Version Export [high]
  - Important for collection portability between OCL servers; assigned and actively discussed.
- `KEEP` **#2118**: Finalize new bulk import streaming capability [high]
  - Assigned and tracks finalization of a new bulk import capability with known errors to fix.
- `KEEP` **#2136**: Missing Collection Export Attribute [high]
  - High priority label, assigned; cascade logic missing from collection exports breaks portability.
- `KEEP` **#2137**: Collection Version via Bulk Import fails [high]
  - Bug where collection version bulk import fails with 'Head not found'; related to #2057.
- `KEEP` **#2151**: Error bulk importing mapping resource [high]
  - Bug where bulk import fails for mappings that work via direct POST; assigned with clear reproduction steps.
- `KEEP` **#2152**: Update the bulk import message attribute [low]
  - Quality-of-life improvement for bulk import message formatting and content; assigned.
  - **Code evidence:** 6 commits in oclapi2, latest 2025-04-21
- `REVIEW` **#132**: Create smarter (& smaller) import results response designed for processing
  - Import result optimization is still valuable; last updated 2023, suggesting some recent relevance.
- `REVIEW` **#202**: Add to bulk importer the ability to delete all references from a collection
  - Assigned to paynejd and updated in 2024, suggesting ongoing relevance for bulk import workflows.
- `REVIEW` **#588**: Org export
  - Related to backup/restore (#32); exporting all org content in a single request remains useful for country deployments.
- `REVIEW` **#855**: CSV Bulk Import Gaps
  - Documents specific CSV import gaps (nested extras, hierarchy) that may still be unresolved, but no updates since 2021.
- `REVIEW` **#856**: JSON Bulk Import Gaps
  - Documents specific JSON import gaps (mappings within concept, hierarchy root) that may still be unresolved, but no updates since 2021.
- `REVIEW` **#904**: Diff Imports, as opposed to full imports
  - Diff/delta import is a valuable concept for large sources but this Epic has no details, no assignee, and no updates since 2021.
- `REVIEW` **#1212**: CSV export of a the concepts or mappings of a source/collection version should not be limited to 1000
  - Concrete bug/limitation that may still exist, but no updates since 2022 and no assignee -- needs verification of current state.
- `CLOSE` **#114**: Add "test_mode" parameter to bulk import api
  - From 2019, last updated 2021, refers to OclFlexImporter which may no longer be the current import path.
- `CLOSE` **#753**: Add "DELETE_IF_EXISTS" action into bulk import
  - From 2021, last updated July 2021, a convenience feature that was never prioritized.
- `CLOSE` **#867**: Bulk Import API
  - Empty epic from 2021 with no description, no updates since creation.
- `CLOSE` **#926**: Export Boost - Export in Parallel
  - Performance optimization idea from 2021 with no updates since creation and no milestone.
- `CLOSE` **#1317**: Harmonize OCL export/import formats
  - Labeled as duplicate; the issue itself notes OCL cannot import its own exports, which is tracked elsewhere.

### Core API Features (26 issues — 14 keep, 7 close, 5 review)

- `KEEP` **#1357**: Expose hard DELETE of concept/mapping for standard users [medium]
  - Updated in March 2024; hard delete for standard users is an important API feature that needs careful design.
- `KEEP` **#1371**: Canonical URL Restrictions (Round 1) [high] *(milestone: TermBrowser v3 MVP)*
  - In the TermBrowser v3 MVP milestone, updated February 2025 -- canonical URL handling is foundational for FHIR compliance.
- `KEEP` **#1396**: User should have option not to auto-import Mappings to retired concepts [medium]
  - Updated in March 2024; controlling mapping import behavior for retired concepts is important for collection quality.
- `KEEP` **#1603**: Dynamically populate display_name based on request header [medium]
  - Multi-lingual display name support is important for internationalization and updated in 2024.
- `KEEP` **#1653**: Track request source of a POST/PUT [low]
  - Tracking how resources are created/updated is valuable for auditing and analytics; evergreen enhancement.
- `KEEP` **#1696**: Canonical URL Registry [high] *(milestone: TermBrowser v3 MVP)*
  - Epic in TermBrowser v3 MVP milestone updated Feb 2025; foundational V3 feature for FHIR compliance.
- `KEEP` **#1801**: User Profile - Summary API [medium]
  - V3-labeled API enhancement for richer user profile data; supports user/org profile pages in v3.
- `KEEP` **#1885**: Events and Feeds Framework [medium]
  - Epic for event recording and activity feeds; foundational API effort supporting multiple UI features.
- `KEEP` **#2045**: Terminology Packaging Service [high]
  - Epic representing a strategic capability area with active assignees including paynejd.
- `KEEP` **#2050**: Batch Validation [medium]
  - Epic for batch validation capability; relevant to FHIR compliance and data quality.
- `KEEP` **#2052**: Batch Translation [medium]
  - Epic for batch translation capability; relevant to multilingual terminology workflows.
- `KEEP` **#2166**: Bad API call always returns some arbitrary results [medium]
  - Valid bug where malformed API queries return arbitrary results instead of an error.
- `KEEP` **#2194**: Cannot update user email address [medium]
  - Clear bug report where email update silently fails; well-documented with screenshots.
- `KEEP` **#2201**: Collection reference filter on language translation [high]
  - Supports OpenMRS community need for language-based dynamic collection references; assigned with recent activity.
  - **Code evidence:** 16 commits in oclapi2, latest 2025-08-04
- `REVIEW` **#252**: API Feature Request: "fields=" parameter
  - Field selection is a common API performance optimization that remains useful, but no activity since 2021.
- `REVIEW` **#323**: Update behavior for DELETE requests to concepts and references
  - API design question about retire vs hard delete semantics that may still be unresolved, but no activity since 2021.
- `REVIEW` **#881**: Hierarchy Support in API
  - Hierarchy is important for SNOMED/ICD browsing; empty epic but the feature area is still relevant.
- `REVIEW` **#1548**: Collection References bug - Using the term "Unresolved" incorrectly?
  - Bug in how OCL classifies unresolved references; unclear if this was fixed, but the logic issue is still relevant.
- `REVIEW` **#1671**: Rename `uuid` field to `id` for concept names and descriptions
  - Breaking API field rename; assigned but last updated Nov 2023, unclear if impact analysis was completed.
- `CLOSE` **#51**: "contains" filter for collections should disregard reference version if not provided
  - Bug from 2018, last updated 2019, likely addressed or no longer relevant with oclapi2 rewrite.
- `CLOSE` **#213**: Add advanced comparisons to custom attribute filter
  - From 2020, last updated 2021, no milestone or recent activity -- advanced filter comparisons remain unimplemented and low priority.
- `CLOSE` **#479**: Add validation for trailing/preceding whitespace in IMAP IDs
  - From 2020, no updates since creation, references IMAP-specific workflow that may no longer be in use.
- `CLOSE` **#632**: Implement features to allow configuration of case sensitivity at the source/codesystem level
  - From 2021, no updates since creation, no assignee -- the initial case-sensitive mnemonic work was done but this follow-up was never prioritized.
- `CLOSE` **#866**: Core OCL/API
  - Empty project-level epic from 2021 with no description.
- `CLOSE` **#873**: API Parameters, Properties, and Filters
  - Empty epic from 2021 with no description, no updates since August 2021.
- `CLOSE` **#1291**: Expanded Reference adjustment - Multiple resources in a single reference
  - API enhancement from 2022 with no updates since creation and no milestone.

### Search & Performance (12 issues — 6 keep, 5 close, 1 review)

- `KEEP` **#1259**: Index a concept's mappings along with a concept [medium]
  - Valuable search improvement that would allow finding concepts by their mapped codes -- a real usability gap in the search experience.
- `KEEP` **#1606**: Re-Index ES indexes in a more de-coupled and zero downtime way. [medium]
  - Zero-downtime ES reindexing is an evergreen infrastructure/performance need.
- `KEEP` **#1641**: Add the map source and display name to the "Match explanation" tooltip [low]
  - Improving search match explanations with map source info is valuable for user understanding of search results.
- `KEEP` **#1740**: Maintain original casing for facets in filter panel [low]
  - ES indexing issue affecting facets and repo summary display; impacts data quality perception.
- `KEEP` **#2039**: Index Descriptions [high]
  - Indexing descriptions for search and mapping tool is an active, valuable improvement with an assignee and recent discussion.
- `KEEP` **#2193**: OCL Caching & Performance Spike [high]
  - Performance analysis and caching improvements including LOINC performance; assigned and evergreen.
- `REVIEW` **#876**: API Performance Improvement
  - API performance is evergreen, but this empty epic from 2021 may not be the right tracking mechanism.
- `CLOSE` **#471**: Case Sensitive Search with extras attribute
  - Bug from 2020 referencing DATIM-specific extras queries, last updated 2021 -- likely resolved or no longer relevant.
- `CLOSE` **#482**: Implement sorting of search results by business revision date
  - From 2020, last updated 2021, references a manual revision date field whose status is unclear.
- `CLOSE` **#745**: [OCLAPI2] Optimize search results using 'match_phrase'
  - Empty body, from 2021, last updated August 2021 -- search optimization likely addressed in subsequent work.
- `CLOSE` **#886**: API Search Results
  - Empty epic from 2021 with no description, no updates since creation.
- `CLOSE` **#1336**: Speed up tests by getting rid of delete_all and relying on rollback
  - Tech debt issue from 2022 with no updates since creation and no milestone.
  - **Code evidence:** 2 commits in oclapi2, latest 2022-07-14

### Infrastructure & Operations (8 issues — 2 keep, 3 close, 3 review)

- `KEEP` **#1723**: Upgrade to Django 5 [medium]
  - Framework upgrade is important for security and maintainability; tagged as tech debt.
- `KEEP` **#2121**: OCL API Throttling [high]
  - Important API hardening feature to apply throttling across all endpoints; assigned with a linked spec.
  - **Code evidence:** 12 commits in oclapi2, latest 2025-03-26
- `REVIEW` **#32**: Org and repository backup/restore
  - Important feature for country deployments but no activity since 2020; related to #588 (org export) -- needs human decision on whether still relevant.
- `REVIEW` **#1420**: Remove Flower dependency in OCLAPI
  - Tech debt issue from 2022 about removing Flower; unclear if this has been addressed or is still relevant to current API architecture.
- `REVIEW` **#1730**: Upgrade to python3.12
  - Python upgrade from Jan 2024; may already be completed or superseded by newer Python versions.
- `CLOSE` **#311**: oclapi2 Maintenance
  - Generic maintenance epic from 2020 with no description, no milestone, and no activity since 2021.
- `CLOSE` **#905**: API-level Reporting
  - Empty-body Epic from 2021 with no assignee, no milestone, and no updates since creation.
- `CLOSE` **#1773**: Queue Management Service
  - All checklist items are marked complete (removed Flower dependency, longer task persistence, reliable state events, user task tagging); this Epic appears done.

### Authentication & Authorization (5 issues — 2 keep, 1 close, 2 review)

- `KEEP` **#1698**: OWASP Top-10 [medium]
  - Security compliance epic is always relevant; V3 foundation label indicates it is part of the platform maturity roadmap.
- `KEEP` **#1812**: Roles and Permissions for OCLv3 [high]
  - V3 foundation Epic with Feb 2025 activity; advanced RBAC is a critical feature for v3.
- `REVIEW` **#41**: Support "social authentication" via Keycloak
  - Social auth via Keycloak may still be relevant depending on current auth architecture; last updated 2022.
- `REVIEW` **#889**: Content Distribution License
  - Related to #744 and #790; content licensing is important for SNOMED/LOINC distribution but this epic is empty.
- `CLOSE` **#744**: Implement user license(s) agreement features
  - Tagged web2, references oclweb2-specific sign-in flow; license management would need fresh design for v3.

---

## 3. UX/UI & Design System (49 issues)

User experience improvements and design system development. 49 issues covering accessibility, design system components, navigation/layout, and analytics.

### Accessibility & UX (30 issues — 15 keep, 10 close, 5 review)

- `KEEP` **#1615**: Form / Create repo [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with recent updates in Feb 2025.
- `KEEP` **#1616**: Form / Create org [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with recent updates in Feb 2025.
- `KEEP` **#1618**: Form / Repo / Add references [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with recent updates in Feb 2025.
- `KEEP` **#1621**: Concept Detail view / Associations card [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with very recent update in March 2025.
  - **Code evidence:** 16 commits in oclweb3, latest 2024-10-09
- `KEEP` **#1622**: Detail view / Change request [medium]
  - V3 design ticket for change request detail view, updated Feb 2025; part of content governance feature set.
- `KEEP` **#1623**: Detail view / Compare [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with recent updates in Feb 2025; comparison is a key V3 feature.
- `KEEP` **#1625**: Consumer: Repository [high] *(milestone: TermBrowser v3 MVP)*
  - Epic in TermBrowser v3 MVP milestone with recent updates in Feb 2025.
- `KEEP` **#1626**: Profile / Org [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with recent updates in Feb 2025.
- `KEEP` **#1640**: Design for retired mappings vs. concepts [medium]
  - User confusion about retired concepts vs mappings is a real UX problem; relevant for V3 concept detail redesign.
- `KEEP` **#1738**: Concept detail view / Collection membership [low]
  - V3 design ticket for showing collection membership in concept detail; useful cross-referencing feature.
- `KEEP` **#1739**: Concept detail view / History [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone updated Feb 2025; concept version history is a core feature.
- `KEEP` **#1948**: Repo - Mappings list [medium]
  - V3 design ticket with OHIE Must-Haves label and active assignee; part of v3 UI build-out.
  - **Code evidence:** 8 commits in oclweb3, latest 2024-11-12
- `KEEP` **#1951**: Repo - Overview [medium]
  - V3 design ticket with multiple assignees covering FHIR-aligned repository overview layout.
- `KEEP` **#1958**: Expansion picker [medium]
  - V3 design ticket detailing expansion picker requirements and placement in the UI.
- `KEEP` **#2019**: CTA / Organization / Customize appearance [low]
  - V3 tagged feature for org avatar and header customization.
- `REVIEW` **#1442**: Design for a retired concept vs. retired mapping
  - Design task about distinguishing retired concepts from retired mappings, last updated February 2023 -- the visual distinction is still a valid UX concern for v3.
- `REVIEW` **#1478**: Repository version summary
  - Design ticket for repo version summary updated in 2024 with active assignees, but unclear if this was completed in V3.
- `REVIEW` **#1619**: Form / Create Version
  - V3 design ticket but no milestone and no updates since July 2023; may have been addressed in other MVP design work.
- `REVIEW` **#1630**: My account menu
  - V3 design for account menu with clear requirements; no milestone but may already be implemented in V3.
- `REVIEW` **#1631**: List view / Mappings
  - V3 design ticket with empty body and no milestone; unclear if this was addressed as part of other V3 work.
- `CLOSE` **#774**: Mockup cross-server resource comparison
  - From 2021, no updates since creation -- cross-server comparison remains aspirational but unmocked.
- `CLOSE` **#1494**: Update the UI/UX of the new source summary tab
  - V3 design ticket from 2023 with no updates since July 2023 and no milestone; likely superseded by V3 design work.
- `CLOSE` **#1628**: Notifications
  - Empty body, no milestone, no updates since July 2023; notifications are a future feature with no active work.
- `CLOSE` **#1629**: Comments
  - Empty body, no milestone, no updates since July 2023; commenting is a future feature with no active work.
- `CLOSE` **#1932**: Event feed: Card architecture
  - Empty body, no assignee, no milestone, no activity since Sept 2024; too vague to act on.
- `CLOSE` **#1933**: Visual customization
  - Empty body, no assignee, no milestone, no activity since Sept 2024; too vague to act on.
- `CLOSE` **#346**: Malawi Mockup for Metadata Browser
  - From 2020, references oclweb2 metadata browser components and Adobe XD mockups that are no longer current with v3.
- `CLOSE` **#473**: Design mappings details page for oclweb2
  - Explicitly for oclweb2 which has been replaced by v3; mapping design has been revisited.
- `CLOSE` **#705**: Design Continued - Improve presentation of mappings throughout oclweb2
  - Explicitly references oclweb2 which has been replaced by v3; mapping presentation has been redesigned.
- `CLOSE` **#1153**: Next round of expansion design work
  - Design feedback from 2021 about v2 expansion UI -- v3 has its own expansion design approach.

### Design System (12 issues — 7 keep, 5 close, 0 review)

- `KEEP` **#1381**: Design system [high]
  - V3-tagged Epic updated in March 2024 -- design system is foundational to the v3 TermBrowser.
- `KEEP` **#1700**: Hierarchy/Cascade Component - Seeing context for a concept [medium]
  - V3 design ticket for hierarchy/cascade visualization; updated Jan 2024 and relevant to core navigation experience.
- `KEEP` **#1741**: OCL Bouncy Ball Loading icon and performance benchmark [low]
  - V3 UX issue where loading indicator creates perception of slow performance; well-defined benchmark levels.
- `KEEP` **#1776**: Objects (Chip view) [medium] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with Feb 2025 activity; design component for repo type identification.
  - **Code evidence:** 36 commits in oclapi2, oclweb3, latest 2024-10-21
- `KEEP` **#1875**: Data tables [medium]
  - V3 design ticket with detailed table configurations and checklist; some items complete, some pending. Updated Sept 2024.
- `KEEP` **#1905**: Avatars [low]
  - V3 design documentation for avatar handling including upload, cropping, and dimensions; updated Nov 2024.
- `KEEP` **#1960**: Object preview [medium]
  - V3 design ticket with detailed mockups for concept/org/user hover previews.
- `CLOSE` **#1398**: Table empty states
  - Design system task from 2022 with no body and no updates since creation -- likely addressed as part of ongoing v3 design work.
- `CLOSE` **#1435**: Multi-line tooltip
  - Design system component from 2022, last updated December 2023 but originally v2 web-labeled -- v3 design system handles tooltips separately.
- `CLOSE` **#1539**: Change icon color for associations that cannot be resolved (in concept details page)
  - Minor design tweak from 2023 with no updates since July 2023; V3 concept detail redesign likely supersedes this.
- `CLOSE` **#1876**: Disabled text field
  - Empty body, no labels, no assignee, no milestone, no updates since July 2024; likely a minor design note that was never fleshed out.
- `CLOSE` **#1904**: Modals
  - Very minor design note about close icon in M3 modals from July 2024; likely addressed as part of broader component work.

### Navigation & Layout (5 issues — 3 keep, 2 close, 0 review)

- `KEEP` **#1620**: Concept detail view / Header [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with recent updates in Feb 2025; well-defined user stories.
- `KEEP` **#1970**: Mobile-ready screens for V3 [high]
  - Tagged OHIE Must-Haves; many users access OCL on mobile and this is critical for adoption.
- `KEEP` **#1971**: Mobile updates [medium]
  - V3 design ticket with mobile mockups, companion to #1970.
- `CLOSE` **#1379**: TermBrowser page templates redesign and navigation
  - Design task from 2022 with no body and no updates since creation -- v3 design work has progressed beyond this.
- `CLOSE` **#1380**: OCL online (website) redesign
  - Empty-body design task from 2022 with no updates since creation -- website redesign has likely been handled separately.

### Analytics & Tracking (2 issues — 2 keep, 0 close, 0 review)

- `KEEP` **#1766**: Generate additional analytics [medium]
  - Analytics on most-mapped sources, concepts, and searches remain valuable; no updates since March 2024 but the requirements are concrete and evergreen.
- `KEEP` **#1792**: OCL v3 Analytics [medium]
  - V3 foundation Epic for analytics; still relevant as v3 analytics requirements need to be addressed.

---

## 4. Infrastructure & DevOps (39 issues)

Deployment, environments, monitoring, and operational concerns. 39 issues including CI/CD tooling, data integrity, deployment configurations, and error tracking.

### CI/CD & Tooling (12 issues — 2 keep, 7 close, 3 review)

- `KEEP` **#2046**: Automated FHIR Testing Pipeline [high]
  - Epic for automated FHIR testing with active assignees; critical for quality assurance.
- `KEEP` **#2134**: Google CAPTCHA API JS is not available here (cn) [medium]
  - Blocks user registration in China where Google services are unavailable; valid accessibility issue.
- `REVIEW` **#1243**: Setup Gatling
  - Updated in March 2024 suggesting some interest, but Gatling setup for CI may have been deprioritized or replaced by other approaches.
- `REVIEW` **#1337**: Create automated test for PEPFAR IMAP import scripts
  - Updated in March 2024 with multiple assignees -- PEPFAR IMAP import is operationally important but unclear if this specific test automation is still needed.
- `REVIEW` **#2058**: API dev bambooCI build failing -- ES setup (and hence tests) failing
  - CI build issue from Feb 2025 with no updates since; may have been resolved but needs verification.
- `CLOSE` **#344**: OCL Administrative
  - Empty project-level epic from 2020 with no description and no activity since 2021.
- `CLOSE` **#747**: Plan load testing for expected growth in OpenMRS use
  - From 2021, vague planning ticket, no updates since August 2021.
- `CLOSE` **#858**: Infrastructure
  - Empty project-level epic from 2021 with no description and no recent activity.
- `CLOSE` **#952**: Performance Testing on Production
  - Empty-body Epic from 2021 with no assignee and no updates -- too vague to be actionable.
- `CLOSE` **#1676**: Accidental New Account on OCL Chat?
  - One-off SSO bug report from Oct 2023 with no updates; likely addressed or no longer reproducible.
- `CLOSE` **#1401**: Upgrade to nodejs 19
  - Labeled web2; Node.js 19 is EOL and v3 uses its own stack -- this is no longer applicable.
- `CLOSE` **#1426**: Migrate OCL builds to use Bamboo Specs
  - From 2022 about Bamboo Specs -- OCL has likely moved away from Bamboo or addressed this differently.

### Data Issues (11 issues — 4 keep, 5 close, 2 review)

- `KEEP` **#731**: Backup configuration for elastic search [medium]
  - Elasticsearch backup remains an important infrastructure concern, updated in 2023.
- `KEEP` **#1400**: OCL Online database cleaning using checksums [medium]
  - Updated in March 2024; database cleaning and deduplication using checksums is an important operational concern.
- `KEEP` **#1917**: Add S3 storage support for new bulk import [medium]
  - Active infrastructure task with assignee, needed for NPM package caching and file uploads.
  - **Code evidence:** 20 commits in oclapi2, latest 2024-12-13
- `KEEP` **#1944**: Investigate slow DB responses [high]
  - Tagged top-priority and performance; ongoing DB hiccups and IOPS limit issues on production.
- `REVIEW` **#1649**: Change ES to use instance storage instead of EBS
  - Infrastructure optimization for ES storage; may still be relevant depending on current ES deployment architecture.
- `REVIEW` **#1678**: Please Delete the fake OpenMRS Org
  - Data cleanup request to remove duplicate OpenMRS org; simple task but unclear if it was completed.
- `CLOSE` **#875**: Data Management
  - Empty epic from 2021 with no description, no updates since creation.
- `CLOSE` **#890**: Content Load Pipeline from Apelon
  - Epic from 2021 with no body, no milestone, and no updates since creation -- Apelon pipeline work appears abandoned.
- `CLOSE` **#932**: Load Smart Guidelines content into Staging
  - Operational task from 2021 about loading specific content into staging -- likely completed or no longer relevant.
- `CLOSE` **#1569**: Migrate chat from bare machine to ECS
  - ECS migration ticket for Discourse from 2023 with last update Dec 2023; likely outdated given infra changes since then.
- `CLOSE` **#262**: Data Corruption Risk Mitigation Plan
  - From 2020, references Postgres refactor which has since been completed in oclapi2; the plan is outdated.

### Deployment & Environments (10 issues — 3 keep, 7 close, 0 review)

- `KEEP` **#1743**: Populate global URL registry on all environments [high] *(milestone: TermBrowser v3 MVP)*
  - In TermBrowser v3 MVP milestone with recent activity and active assignees; foundational for canonical URL resolution across environments.
- `KEEP` **#1846**: Demo environment [medium]
  - Epic with detailed requirements for demo environment including auth, auto-reset, and onboarding considerations; still relevant for v3 launch.
- `KEEP` **#1940**: Make use of aws_ecs_capacity_provider [high]
  - Tagged top-priority and infra; addresses real downtime risk during EC2 instance upgrades.
- `CLOSE` **#1366**: Support Kenya using standard OCL images instead of fork
  - Operational task from 2022 about Kenya deployment, last updated January 2023 -- specific deployment concern likely resolved or no longer relevant.
- `CLOSE` **#1431**: Implement maintenance page
  - Infrastructure feature from 2022, last updated February 2023 -- either implemented or deprioritized.
- `CLOSE` **#1568**: Setup S3 and CDN for chat
  - Infrastructure ticket for OCL Chat from 2023 with no updates since July 2023; chat infra priorities may have shifted.
- `CLOSE` **#1594**: Eliminate downtime when refreshing EC2 instances
  - Infrastructure ticket from June 2023 with no updates since creation; references old ECS container draining approach.
- `CLOSE` **#831**: Demo Environment Not Resetting Daily
  - From 2021, references v1 Demo environment CI plan -- infrastructure has completely changed.
- `CLOSE` **#978**: Switch to 1-yr reserved instances on AWS
  - Operational task from September 2021 about switching to reserved instances in Oct 2021 -- either completed or infrastructure has changed.
- `CLOSE` **#1425**: Use AWS CodeDeploy to deploy OCL
  - From 2022 about migrating from Bamboo to CodeDeploy -- OCL infrastructure and deployment approach has likely changed since then.

### Monitoring & Error Tracking (6 issues — 1 keep, 4 close, 1 review)

- `KEEP` **#1637**: Create alarms for performance/stability metrics [medium]
  - Monitoring alarms are evergreen infrastructure needs; some items checked off but incomplete tasks remain.
- `REVIEW` **#1650**: Deploy Kibana to all envs
  - Kibana deployment for ES monitoring; updated April 2024 but unclear if this has been completed or deprioritized.
- `CLOSE` **#575**: [Infra] Load balancer and ECS to use /healthcheck end point
  - From 2021, no updates since May 2021 -- likely already implemented or infrastructure has changed.
- `CLOSE` **#1427**: Errbit compatibility with OpenID SSO?
  - Question about Errbit/KeyCloak compatibility from 2022, last updated February 2023 -- likely resolved or Errbit replaced.
- `CLOSE` **#1571**: Migrate and upgrade errbit to common cluster
  - Errbit migration ticket from 2023 with minimal description and last update March 2024; may no longer be relevant.
- `CLOSE` **#1767**: Adjust OCL Online cloudwatch settings to store logs for longer
  - Simple infra config task from Feb 2024 with no updates since March 2024; likely already done or no longer a priority.

---

## 5. Community & Ecosystem (28 issues)

Connections to the broader health informatics ecosystem. 29 issues covering the community site, OpenMRS OCL Client integration, and partnerships with organizations like PEPFAR and WHO.

### Community Site & Outreach (14 issues — 4 keep, 8 close, 2 review)

- `KEEP` **#1423**: Adopt OCL Code of Conduct (for the development community) [low]
  - Updated in March 2024 with all core team assigned -- community governance is important for an open-source project.
- `KEEP` **#1838**: OCL community projects/locations on Community Website [low]
  - Community engagement feature for the website; still relevant for OCL visibility.
- `KEEP` **#2086**: Legal Terms [high] *(milestone: OCL Mapper MVP)*
  - In Mapper MVP milestone, high priority label, with recent updates; legal terms are a blocker for public launch.
- `KEEP` **#2122**: OCL Responsible AI Policy [medium]
  - Policy document for responsible AI use within OCL; assigned to paynejd with recent updates.
- `REVIEW` **#908**: Compile licensing requirements for reference vocabularies *(milestone: Sprint 17)*
  - Updated in 2024 which suggests some ongoing relevance; licensing for reference vocabularies is still an important topic for OCL.
- `REVIEW` **#1890**: Community website build
  - Community site build in Webflow from July 2024; may already be completed or deprioritized -- needs status check.
- `CLOSE` **#349**: OCL Community Site
  - Epic from 2020, last updated 2021, with no specific actionable items remaining.
- `CLOSE` **#390**: OCL User Support - Design and Launch
  - Epic from 2020 with no updates since creation -- user support processes have been established separately.
- `CLOSE` **#626**: Automating the OCL sign-up to the MailChimp
  - From 2021, no updates since creation -- MailChimp integration is a low-priority task from 4+ years ago.
- `CLOSE` **#907**: Kickoff content owner conversations
  - Operational task from 2021 about licensing conversations -- not a software issue, no updates since creation.
- `CLOSE` **#1509**: Draft approach/level of effort for using Atlassian confluence for an OCL wiki
  - Exploratory ticket from 2023 about Confluence wiki; no assignee, no milestone, and OCL has not pursued this direction.
- `CLOSE` **#1531**: Add "sign up" option on the OCL community site home page
  - Small UX fix from 2023 with no updates since July 2023; V3 community site redesign likely addresses this.
- `CLOSE` **#1632**: Community website
  - Empty body, no milestone, no updates since July 2023; community website work has likely evolved beyond this placeholder.
- `CLOSE` **#1655**: Promote OCL Demo site in OCLv3 Community Site
  - Promotional task from 2023 with no updates since August 2023; V3 community site design has likely moved past this.

### OpenMRS Integration (11 issues — 4 keep, 6 close, 1 review)

- `KEEP` **#1340**: OpenMRS custom validation should ensure external IDs are unique [medium]
  - Concrete API validation enhancement updated in March 2024 -- ensuring unique external IDs is important for OpenMRS data integrity.
- `KEEP` **#1341**: For OMRS Validation Schema, require both from & to concepts in Q-AND-A & CONCEPT-SET are in collection [medium]
  - Specific OpenMRS validation requirement updated in November 2023 -- still relevant for OpenMRS dictionary integrity.
- `KEEP` **#1665**: OpenMRS Custom Validation Schema: All FSNs and preferred names within a locale should be unique [medium]
  - OpenMRS validation schema refinement discovered during CIEL release; important for OpenMRS interoperability.
- `KEEP` **#1705**: Ensure names & description have unique UUIDs (external IDs) within OpenMRS Custom Validation Schema [medium]
  - Important for OpenMRS interoperability; ensures content created in OCL imports successfully into OpenMRS.
- `REVIEW` **#892**: OpenMRS Dictionary Manager Support
  - Project-level Epic for OpenMRS integration; still potentially relevant but no updates since 2022 and no milestone.
- `CLOSE` **#721**: Convert liquibaserunner to use GitHub Action
  - Travis-to-GitHub Actions migration request from 2021 for an OpenMRS contrib repo; likely already done or abandoned.
- `CLOSE` **#1118**: Importing OMRS dictionary into OCL should store retire_reason in update_comment
  - Specific import enhancement from 2021, last updated 2022, with no milestone -- low-priority integration detail.
- `CLOSE` **#1188**: Linked sources and preferred sources - Start within Source Context
  - OpenMRS-labeled feature from 2022 with no updates since November 2022 and no milestone.
- `CLOSE` **#1216**: Mappings Modification Requirements
  - OpenMRS-labeled requirements gathering from 2022 with no updates since May 2022 -- specific PIH/CIEL mapping modification workflow.
- `CLOSE` **#2032**: Query OpenMRS repos in OCL prod
  - One-time analytics query from Dec 2024; the data has likely been gathered and is now stale.
- `CLOSE` **#1692**: OpenMRS Burning Needs (V2)
  - Epic specifically for V2 burning needs while V3 was being developed; V3 is now the focus, making this outdated.

### External Integrations (3 issues — 0 keep, 3 close, 0 review)

- `CLOSE` **#868**: PEPFAR-related Projects
  - Empty project-level epic from 2021 with no description; PEPFAR work is tracked differently now.
- `CLOSE` **#885**: PEPFAR DASH
  - Empty epic from 2021 with no description, no updates since creation; PEPFAR dashboard work has evolved separately.
- `CLOSE` **#893**: PIH Dictionary
  - Epic from 2021 with no body, no assignee, and no updates since 2022 -- PIH dictionary work likely handled through other channels.

---

## 6. Developer Experience (26 issues)

Documentation, CLI tooling, and developer onboarding. 26 issues focused on making OCL more accessible to developers and implementers.

### Documentation (18 issues — 9 keep, 8 close, 1 review)

- `KEEP` **#1493**: Add the new source summary endpoints to OCL Docs [low]
  - Documentation of source summary endpoints is still valuable; updated in 2024 with multiple related tickets.
- `KEEP` **#1555**: Draft operations panel documentation [low]
  - Documentation for operations panel is still needed; updated in 2024 with multiple assignees.
- `KEEP` **#1581**: Public documentation for Collection Reference evaluation logic [medium]
  - Collection reference evaluation is complex and poorly documented; this remains a valuable documentation task.
- `KEEP` **#1711**: Update mapping documentation for canonical URLs [low]
  - Mapping documentation update with detailed checklist of remaining items; relevant for canonical URL support.
- `KEEP` **#1712**: Update incorrect request fields in Swagger [low]
  - Swagger accuracy is important for developer experience; specific examples of incorrect fields are documented.
- `KEEP` **#1786**: User documentation on repo versioning and releases [medium]
  - Documentation on repo versioning is evergreen and important for user onboarding; has key assignees.
- `KEEP` **#2051**: OCL/FHIR Model Documentation [medium]
  - Epic for documenting OCL's FHIR model; important for developer adoption and clarity.
- `KEEP` **#2082**: Documentation [medium] *(milestone: OCL Mapper MVP)*
  - Epic for OCL Mapper documentation in the Mapper MVP milestone.
- `KEEP` **#2084**: User Documentation [medium] *(milestone: OCL Mapper MVP)*
  - In the Mapper MVP milestone with multiple assignees; user docs are critical for adoption.
- `REVIEW` **#1785**: Add missing GET request parameters to swagger: Orgs and Users
  - Has an assignee and was updated in Sept 2024, so may still be in progress; but intro-labeled swagger tasks may be stale.
- `CLOSE` **#426**: [OCLAPI2] Make redoc load faster
  - From 2020, empty body, last updated 2021 -- Redoc performance is a minor issue and may have been addressed.
- `CLOSE` **#1087**: OCL Connector Documentation
  - Documentation task from 2021 with no updates since December 2021 -- connector architecture has evolved significantly.
- `CLOSE` **#1475**: Update authentication documentation
  - Documentation update ticket from 2023 with no milestone and no recent activity; docs may have been updated separately.
- `CLOSE` **#1768**: ES (and other) service dev debugging documentation
  - Empty body, no updates since March 2024, no milestone; documentation task that has not been actioned.
- `CLOSE` **#1783**: Add missing GET request parameters to swagger: Concepts and Mappings
  - Intro-labeled task from Feb 2024 with no assignee and no updates; likely stale or already partially addressed.
- `CLOSE` **#1784**: Add missing GET request parameters to swagger: Sources and Collections
  - Intro-labeled task from Feb 2024 with no assignee and no updates; likely stale or already partially addressed.
- `CLOSE` **#1796**: OOUX documentation
  - Empty body, no labels, no assignee, no milestone, no updates since March 2024.
- `CLOSE` **#1811**: Draft checksum documentation (to go into OCL Docs)
  - All checklist items are marked complete; documentation has been drafted.

### CLI & Tooling (6 issues — 0 keep, 4 close, 2 review)

- `REVIEW` **#874**: Automated code changelog
  - Empty epic but updated as recently as March 2024, suggesting it may still be relevant.
- `REVIEW` **#928**: Automated Content Validation Tooling for OCL
  - Epic describing automated validation tooling -- the need is still relevant but no updates since 2021; could be folded into broader quality efforts.
- `CLOSE` **#994**: Update bulk import validation script
  - Task from 2021 about updating a specific gist-based validation script, no updates since 2022 -- likely superseded by newer tooling.
- `CLOSE` **#447**: Develop UI tests for oclweb2
  - References oclweb v1 and oclweb2 test infrastructure with Bamboo; v3 has replaced v2 and CI has changed.
- `CLOSE` **#828**: Automatically generate changelog for oclweb2, oclapi2, oclfhir from code commits/PRs *(milestone: Sprint 17)*
  - References oclweb2 and Sprint 17 from 2021; changelog tooling and repos have changed with v3.
  - **Code evidence:** 4 commits in oclapi2, latest 2021-07-19
- `CLOSE` **#1142**: [WEB] [UI] Unit tests using Jest
  - Labeled web2 and about Jest testing for the v2 codebase -- v3 has its own testing approach.

### Developer Onboarding (2 issues — 1 keep, 1 close, 0 review)

- `KEEP` **#1574**: Draft page re: local vs OCL Online decision [low]
  - Documentation helping users decide between local and hosted OCL is an ongoing need for user onboarding.
- `CLOSE` **#1298**: Create test data import scripts & deploy on all environments
  - Operational task from 2022 with no updates since creation -- test data scripts have likely evolved independently.

---

## 7. OCL Mapper (19 issues)

The terminology mapping tool. 25 issues covering mapping workflows, AI-assisted mapping, mapper-specific UI, and team collaboration features.

### AI-Assisted Mapping (5 issues — 5 keep, 0 close, 0 review)

- `KEEP` **#2023**: Write boolean logic/pseudocode for mapping search [medium]
  - Documentation of prototype matching/mapping search logic, assigned and relevant to mapper development.
  - **Code evidence:** 48 commits in oclapi2, oclweb3, latest 2025-01-31
- `KEEP` **#2112**: Memory Update [high] *(milestone: OCL Mapper MVP)*
  - In Mapper MVP milestone with recent updates; building up matching memory is a core Mapper capability.
- `KEEP` **#2139**: Automatically accept or bulk approve exact ID matches [medium]
  - Based on user feedback; would significantly reduce manual validation for obvious matches.
- `KEEP` **#2165**: Implement result categorization for semantic search - To review [high] *(milestone: OCL Mapper MVP)*
  - In Mapper MVP milestone with high priority label; improves match quality communication to users.
- `KEEP` **#2205**: Add external $match APIs to OCL Mapper [high]
  - Strategic feature to integrate third-party matching algorithms (ICD11, LOINC); assigned with recent activity.
  - **Code evidence:** 12 commits in oclapi2, oclmap, latest 2025-08-24

### Mapping Workflows (9 issues — 9 keep, 0 close, 0 review)

- `KEEP` **#2033**: OCLv3 Mapping tool prototype [high]
  - Detailed prototype requirements for the v3 mapping UI, foundational to the Mapper initiative.
- `KEEP` **#2034**: OCL Mapping Tool MVP [high]
  - Epic for the mapping tool MVP supporting OpenMRS Concept Prevalence study.
- `KEEP` **#2072**: Map Concepts from an Existing OCL Source [low]
  - Feature to load existing OCL source terms into the mapper; low priority but still relevant.
- `KEEP` **#2089**: Save and Export Mapping Progress [high] *(milestone: OCL Mapper MVP)*
  - Epic in the Mapper MVP milestone for core save/export functionality.
- `KEEP` **#2093**: Export Metadata as a ConceptMap [low]
  - Valuable FHIR-compliant export option for mapping projects; low priority but relevant long-term.
- `KEEP` **#2125**: Spreadsheet with multiple sheets support [medium] *(milestone: OCL Mapper MVP)*
  - In Mapper MVP milestone with recent activity (Oct 2025); addresses common user need.
- `KEEP` **#2126**: Single and bulk create proposed concepts in OCL [medium] *(milestone: OCL Mapper MVP)*
  - In Mapper MVP milestone; allows creating new concepts when no match exists.
- `KEEP` **#2161**: Importer UI [medium] *(milestone: OCL Mapper MVP)*
  - In Mapper MVP milestone; web3-tagged UI for import functionality.
- `KEEP` **#2188**: Enable auto-save upon changes (config, metadata, mapping, decisions) [high] *(milestone: Mapper Public Showcase - Wrap-up and Release Prep)*
  - In active milestone with recent updates (Feb 2026); auto-save is critical for user experience.

### Mapper UI (3 issues — 3 keep, 0 close, 0 review)

- `KEEP` **#2128**: Navigate terms using arrow keys [low] *(milestone: OCL Mapper MVP)*
  - In Mapper MVP milestone with recent activity; keyboard shortcuts would significantly improve mapper UX.
- `KEEP` **#2150**: Allow for column mapping "unselect" [medium] *(milestone: OCL Mapper MVP)*
  - In Mapper MVP milestone; basic usability issue where users cannot unselect a mapping.
  - **Code evidence:** 6 commits in oclmap, latest 2025-04-11
- `KEEP` **#2204**: Filtering of target repo [medium]
  - Enables filtering match results by concept category (e.g. LOINC terms vs parts); practical and well-specified.

### Team Collaboration (2 issues — 2 keep, 0 close, 0 review)

- `KEEP` **#2096**: Review Mapping Candidates [high] *(milestone: OCL Mapper MVP)*
  - Epic in Mapper MVP milestone for core review/decision functionality; assigned and actively discussed.
- `KEEP` **#2111**: Mapping Authority Categorization [low]
  - Low priority feature for tagging mapping authority roles; relevant for governance but not urgent.

---

## 8. CIEL & Dictionary Management (Historical) (12 issues)

Historical issues related to CIEL dictionary management that are NOT part of active CIEL sprint milestones. 12 issues covering source management and content curation.

### Content Curation (7 issues — 4 keep, 2 close, 1 review)

- `KEEP` **#879**: SNOMED Import and Maintenance [medium]
  - SNOMED import and maintenance is an ongoing operational concern for OCL's reference vocabulary hosting.
- `KEEP` **#880**: LOINC Import and Maintenance [medium]
  - LOINC import and maintenance is an ongoing operational concern for OCL's reference vocabulary hosting.
- `KEEP` **#883**: RxNorm Import and Maintenance [medium]
  - RxNorm import and maintenance is an ongoing operational concern for OCL's reference vocabulary hosting.
- `KEEP` **#884**: ICD-10-CM Import and Maintenance [medium]
  - ICD-10-CM import and maintenance is an ongoing operational concern for OCL's reference vocabulary hosting.
- `REVIEW` **#1925**: Request: Automatically add self-map
  - Enhancement request from CIEL/OpenMRS workflow; tagged web2 and api2 but the feature concept is version-agnostic.
- `CLOSE` **#903**: Content Cleaning and Validation
  - Empty-body Epic from 2021 with no assignee, no milestone, and no updates -- too vague to be actionable.
- `CLOSE` **#1158**: Content Management Features
  - Empty-body Epic from 2021 with no assignee, no milestone, and no updates -- too vague to act on.

### Source Management (5 issues — 2 keep, 2 close, 1 review)

- `KEEP` **#1490**: Document CIEL import process to get ready to train others [low]
  - Training others on CIEL maintenance is an ongoing organizational need; still relevant even if not actively worked.
- `KEEP` **#2172**: LOINC (v2.80 or 2.81) Content Importing into OCL Online [high]
  - Active content curation task with assignees and recent updates (Sep 2025); important for reference terminology availability.
- `REVIEW` **#1138**: SNOMED GPS
  - Epic with an assignee and updated in December 2023, suggesting some ongoing relevance for SNOMED GPS content.
- `CLOSE` **#458**: Content Preparation, Import, and Publication
  - Project-level epic from 2020, last updated 2021, served as a broad tracker that is no longer actively used.
- `CLOSE` **#1190**: WHO-ATC Content Publication and Maintenance
  - Epic explicitly noted as de-prioritized in its own description; no updates since 2022.

---

## Appendix: Full Disposition Table


| #    | Title                                                      | Theme          | Sub-theme                      | Disposition      | Priority | Reason                                                                    |
| ---- | ---------------------------------------------------------- | -------------- | ------------------------------ | ---------------- | -------- | ------------------------------------------------------------------------- |
| 12   | Ability to check if new versions of resources reference... | TermBrowser    | Collections & References       | close-stale      | medium   | From 2018, last updated 2021, no milestone -- collection version manag... |
| 13   | Ability to update collection references to latest versi... | TermBrowser    | Collections & References       | close-stale      | medium   | From 2018, last updated 2021, no milestone -- closely related to #12 a... |
| 233  | TermBrowser                                                | TermBrowser    | General UI                     | close-outdated   | low      | Empty project-level epic from 2020 for TermBrowser v2; v3 has replaced... |
| 530  | Filter Configuration                                       | TermBrowser    | Search & Navigation            | close-outdated   | low      | Epic from 2021 for oclweb2 filter configuration; filter system has bee... |
| 534  | New View: Split View                                       | TermBrowser    | General UI                     | review           | medium   | Split view concept is still valuable for TermBrowser v3 and may inform... |
| 535  | Resource Download Formats                                  | TermBrowser    | Import & Export                | close-stale      | low      | Vague epic from 2021, no updates since January 2021, no specific requi... |
| 536  | Resource Details Page Customization Options                | TermBrowser    | General UI                     | close-outdated   | low      | Epic from 2021 for oclweb2 concept/mapping detail customization; v3 ha... |
| 591  | Download/View as FHIR                                      | TermBrowser    | Repository Management          | close-stale      | low      | Empty epic from 2021, no description, last updated July 2021.             |
| 667  | MSP: Show years in which a reference indicator is activ... | TermBrowser    | Collections & References       | close-outdated   | low      | MSP-specific feature request from 2021 referencing DATIM/PEPFAR metada... |
| 669  | MSP: Indicator denominator not displaying properly         | TermBrowser    | General UI                     | close-outdated   | low      | MSP-specific bug from 2021 referencing old QA environment; MSP has bee... |
| 672  | MSP: Changing Fiscal Year filter when navigating to a p... | TermBrowser    | Search & Navigation            | close-outdated   | low      | MSP-specific UI bug from 2021; MSP has been sunset.                       |
| 788  | Filter Configuration Feature Additions (Not Immediate)     | TermBrowser    | Search & Navigation            | close-outdated   | low      | From 2021, references oclweb2 filter configuration (#574) which has be... |
| 793  | OCL TermBrowser Mapping Revamp                             | TermBrowser    | Concepts & Mappings            | close-outdated   | low      | Epic from 2021 referencing oclweb2 mapping design (#589, #676); mappin... |
| 808  | Custom View Configuration in TermBrowser                   | TermBrowser    | General UI                     | close-outdated   | low      | Epic from 2021 for oclweb2 view customization; v3 has its own view/lay... |
| 816  | Concept Modifications                                      | TermBrowser    | Concepts & Mappings            | review           | medium   | Concept editing epic updated in 2022 with a requirements doc -- concep... |
| 863  | Bulk Import UI Improvements                                | TermBrowser    | Import & Export                | review           | medium   | Lists useful UI improvement ideas (FHIR import, auto-detect hierarchy)... |
| 865  | FHIR UI in TermBrowser                                     | TermBrowser    | Repository Management          | close-stale      | low      | Empty epic from 2021 with no description, no updates since creation.      |
| 882  | Hierarchy UI in TermBrowser                                | TermBrowser    | Hierarchy & Visualization      | close-outdated   | low      | Empty epic from 2021 for oclweb2 hierarchy UI; v3 has its own hierarch... |
| 888  | OCL Resource Comparison                                    | TermBrowser    | Repository Management          | close-stale      | low      | Empty epic from 2021 with no description, no updates since creation.      |
| 900  | Expose "retired" option when Exporting in UI               | TermBrowser    | Import & Export                | close-stale      | low      | UI enhancement from 2021 with no assignee, no milestone, and no update... |
| 909  | Concept Modification/Expansion Support in TermBrowser      | TermBrowser    | Concepts & Mappings            | close-superseded | low      | This Epic from 2021 is superseded by v3 concept CRUD work tracked in #... |
| 913  | Configuration Sandbox / Custom Domain for TermBrowser      | TermBrowser    | General UI                     | close-stale      | low      | Epic from 2021 with no updates since August 2021, no milestone -- aspi... |
| 958  | Compare UI validation/restrictions to API                  | TermBrowser    | General UI                     | close-outdated   | low      | Filed against the v2 web UI in 2021 -- v3 TermBrowser has its own vali... |
| 962  | Expose validation schema error messages to user            | TermBrowser    | General UI                     | review           | medium   | Showing validation schema errors to users is still valuable, but no up... |
| 985  | Add async counts into org sources, collections and memb... | TermBrowser    | General UI                     | close-outdated   | low      | Labeled web2; the v3 TermBrowser has redesigned org/repo pages and thi... |
| 1003 | Support standalone integration of TermBrowser with SVCM... | TermBrowser    | Repository Management          | close-stale      | low      | From 2021 with no updates since creation -- standalone SVCM mode has n... |
| 1022 | Unable to add members to an org in the UI                  | TermBrowser    | Repository Management          | close-outdated   | low      | Bug report against the v2 web UI from 2021 -- v3 TermBrowser has redes... |
| 1079 | Add filter button for Extra Attributes in the Associati... | TermBrowser    | Search & Navigation            | close-stale      | low      | Feature request from 2021 with no updates since creation, no milestone... |
| 1113 | Favorite Icon, allowing users to "Favorite" any repo       | TermBrowser    | User & Auth                    | review           | low      | Nice-to-have UX feature that could still be relevant for v3 but has ha... |
| 1160 | Overview tab background image upload                       | TermBrowser    | Repository Management          | close-stale      | low      | Low-priority cosmetic feature from 2021 with no updates since creation... |
| 1185 | Abstract TermBrowser connectors into their own objects     | TermBrowser    | Repository Management          | close-outdated   | low      | Labeled web2; v3 TermBrowser has a different connector/integration arc... |
| 1186 | Multi-lingual support in OCL TermBrowser                   | TermBrowser    | User & Auth                    | keep             | medium   | V3-tagged Epic for TermBrowser internationalization, updated in Novemb... |
| 1202 | API and UI: Better results panel when adding references... | TermBrowser    | Collections & References       | close-stale      | low      | UX improvement from 2022 with no updates since creation and no milesto... |
| 1281 | Collection Management UI and Workflows                     | TermBrowser    | Collections & References       | review           | medium   | Epic with no body from 2022 -- collection management is core v3 functi... |
| 1297 | Add $resolveReference to Operations Panel                  | TermBrowser    | General UI                     | close-stale      | low      | Small UI feature from 2022 with no updates since creation and no body ... |
| 1318 | Highlight concept attributes/associations that were mod... | TermBrowser    | Collections & References       | keep             | medium   | V3-tagged design issue updated in February 2024 -- showing collection-... |
| 1322 | Revise display string representation of references         | TermBrowser    | Collections & References       | close-stale      | low      | Discussion from 2022 about reference display text with no updates sinc... |
| 1355 | Repo Header showing unnecessary information                | TermBrowser    | Repository Management          | close-outdated   | low      | Labeled web2; the v3 TermBrowser has redesigned repo headers.             |
| 1361 | Quick Add Mappings in Collection                           | TermBrowser    | Collections & References       | review           | medium   | Epic from 2022 about adding mappings in collection context -- relevant... |
| 1373 | Remove References from Collection                          | TermBrowser    | Collections & References       | close-outdated   | low      | Labeled web2 Epic from 2022 with no updates since creation -- v3 colle... |
| 1374 | Display/Interpretation of Collection References            | TermBrowser    | Collections & References       | keep             | medium   | Epic updated in June 2024 about human-readable reference display -- st... |
| 1375 | Reference display text update - include concept name in... | TermBrowser    | Collections & References       | close-stale      | low      | Small UX suggestion from 2022 with no updates since creation and no mi... |
| 1376 | Create and Update Concepts and Mappings                    | TermBrowser    | Concepts & Mappings            | keep             | high     | In the TermBrowser v3 MVP milestone with V3 and Design labels, updated... |
| 1444 | Concept Cloning                                            | TermBrowser    | Concepts & Mappings            | keep             | medium   | Concept cloning is a valuable feature for source management and was up... |
| 1455 | Cascade preview visualizer/component                       | TermBrowser    | Hierarchy & Visualization      | keep             | medium   | Reusable cascade preview component is a core V3 feature with multiple ... |
| 1471 | Extract out English language bundle from TermBrowser       | TermBrowser    | User & Auth                    | keep             | low      | Internationalization is an important long-term goal for V3; labeled bo... |
| 1491 | Tooltips for $clone UI in TermBrowser                      | TermBrowser    | Repository Management          | close-stale      | low      | Minor UI enhancement from Feb 2023 with no updates since creation and ... |
| 1522 | Deep linking                                               | TermBrowser    | General UI                     | keep             | high     | Deep linking is a fundamental UX requirement for V3 that ensures URLs ... |
| 1537 | Ability to copy/download the results from adding refere... | TermBrowser    | Collections & References       | keep             | low      | Useful feature request from Kenya hackathon feedback; still relevant f... |
| 1538 | Resolve references (where possible) in the add referenc... | TermBrowser    | Collections & References       | keep             | low      | Improving reference resolution display is valuable UX improvement for ... |
| 1592 | Switch TermBrowser hierarchy view to use cascade           | TermBrowser    | Hierarchy & Visualization      | close-outdated   | low      | Labeled web2 and V3 but last updated June 2023; V3 hierarchy implement... |
| 1607 | Advanced search MVP                                        | TermBrowser    | Search & Navigation            | keep             | high     | Epic for advanced search is a key V3 feature area that exposes API cap... |
| 1614 | Change requests and management                             | TermBrowser    | General UI                     | keep             | medium   | Change request management is a significant V3 feature for content gove... |
| 1624 | Operations panel                                           | TermBrowser    | General UI                     | keep             | medium   | Epic for operations panel supporting FHIR and OCL operations; updated ... |
| 1673 | Datatype Dropdown bug - cannot use one of my common dat... | TermBrowser    | Concepts & Mappings            | close-outdated   | low      | Labeled web2; this is a V2-specific UI bug that V3 concept forms shoul... |
| 1681 | Search for some locales is broken                          | TermBrowser    | Search & Navigation            | close-outdated   | low      | Labeled web2; locale search bug in V2 UI that V3 should address with n... |
| 1684 | "Add Expression" workflow appears to make invalid refer... | TermBrowser    | Collections & References       | close-outdated   | low      | Labeled web2 and wontfix; V2-specific bug in add expression workflow t... |
| 1694 | Search UI, incl. preview and search results                | TermBrowser    | Search & Navigation            | keep             | high     | Epic for search UX/UI updated Feb 2025; core V3 feature area with acti... |
| 1699 | Latest Released Repo Version                               | TermBrowser    | Repository Management          | keep             | high     | In TermBrowser v3 MVP milestone updated Feb 2025; switching default to... |
| 1706 | Walled Garden and Trusted Sources                          | TermBrowser    | Repository Management          | keep             | medium   | Epic for content curation and trusted sources is important for user ex... |
| 1727 | Implement repo_type attribute in TBv3                      | TermBrowser    | Repository Management          | keep             | high     | In TermBrowser v3 MVP milestone updated Feb 2025; frontend counterpart... |
| 1733 | Consumer: Concept Details                                  | TermBrowser    | Concepts & Mappings            | keep             | high     | Epic for concept detail consumer view updated Feb 2025; core V3 featur... |
| 1734 | Concept Detail View / Names + Descriptions                 | TermBrowser    | Concepts & Mappings            | keep             | high     | In TermBrowser v3 MVP milestone updated Feb 2025; detailed requirement... |
| 1748 | Consumer: Mappings                                         | TermBrowser    | Concepts & Mappings            | keep             | medium   | V3 Epic with activity in Feb 2025; represents a broad feature area tha... |
| 1750 | Organization, incl. details + membership                   | TermBrowser    | Repository Management          | keep             | high     | V3 Epic in TermBrowser v3 MVP milestone with Feb 2025 activity.           |
| 1751 | Consumer: User                                             | TermBrowser    | User & Auth                    | keep             | high     | V3 Epic in TermBrowser v3 MVP milestone with Feb 2025 activity.           |
| 1752 | Selecting repo in global search should navigate to late... | TermBrowser    | Search & Navigation            | keep             | high     | In TermBrowser v3 MVP milestone; addresses important UX pattern for ho... |
| 1754 | Searchlight enhancements                                   | TermBrowser    | Search & Navigation            | keep             | medium   | V3 web3-labeled search enhancement; empty body but searchlight is a co... |
| 1758 | Mapping Listing View                                       | TermBrowser    | Concepts & Mappings            | keep             | high     | In TermBrowser v3 MVP milestone with OHIE Must-Haves label; core mappi... |
| 1763 | Concept tracing information - Modification indicators      | TermBrowser    | Concepts & Mappings            | keep             | medium   | V3 design issue addressing important UX need for understanding whether... |
| 1769 | User Language Preferences                                  | TermBrowser    | User & Auth                    | keep             | medium   | V3-labeled feature defining how language preferences affect the TermBr... |
| 1770 | Search Preferences - How does this affect the user         | TermBrowser    | Search & Navigation            | review           | low      | Discussion-needed V3 issue with no updates since March 2024; requireme... |
| 1772 | UI Method for adding collection-based reference to a co... | TermBrowser    | Collections & References       | keep             | medium   | V3 web3 feature for adding concepts to collections with source vs. col... |
| 1798 | User settings page                                         | TermBrowser    | User & Auth                    | keep             | high     | In TermBrowser v3 MVP milestone with Feb 2025 activity; well-defined u... |
| 1802 | My Repositories + My Orgs                                  | TermBrowser    | User & Auth                    | keep             | high     | V3 Epic in TermBrowser v3 MVP milestone with Feb 2025 activity.           |
| 1803 | My Repositories - Card View                                | TermBrowser    | Repository Management          | keep             | medium   | V3 feature for repository card view; part of the My Repositories exper... |
| 1804 | My Repositories - Create/Update                            | TermBrowser    | Repository Management          | keep             | high     | In TermBrowser v3 MVP milestone with Feb 2025 activity; core repo mana... |
| 1821 | Implement namespace selector for canonical URL registry... | TermBrowser    | Repository Management          | keep             | high     | In TermBrowser v3 MVP milestone with Feb 2025 activity; well-defined u... |
| 1822 | Hierarchy as part of Add/Edit Mappings on Concept Detai... | TermBrowser    | Hierarchy & Visualization      | keep             | high     | In TermBrowser v3 MVP milestone with Feb 2025 activity; addresses hier... |
| 1827 | Canonical URL Registry - Add Canonical URL (basic)         | TermBrowser    | Repository Management          | keep             | high     | In TermBrowser v3 MVP milestone with Feb 2025 activity.                   |
| 1828 | Option to also retire mappings when retiring a concept     | TermBrowser    | Concepts & Mappings            | keep             | medium   | V3-labeled enhancement for a common workflow need; concrete and action... |
| 1830 | Version-to-HEAD Mode Transition/Navigation                 | TermBrowser    | Search & Navigation            | keep             | medium   | Important v3 UX concern about transitioning between view-only versions... |
| 1853 | Repo / Compare Versions                                    | TermBrowser    | Repository Management          | keep             | high     | In TermBrowser v3 MVP milestone with May 2025 activity; detailed user ... |
| 1854 | Consumer: Reference                                        | TermBrowser    | Collections & References       | keep             | high     | V3 Epic with Feb 2025 activity; references are a core collection conce... |
| 1855 | Consumer: Expansion                                        | TermBrowser    | Collections & References       | keep             | high     | V3 Epic in TermBrowser v3 MVP milestone with Feb 2025 activity; expans... |
| 1857 | Object-focused Summary Metrics                             | TermBrowser    | General UI                     | keep             | medium   | Epic defining metrics for orgs, users, repos; concrete table of metric... |
| 1859 | Repository Summary                                         | TermBrowser    | Repository Management          | keep             | medium   | Epic with detailed acceptance criteria for repo summary metrics; found... |
| 1864 | Global Search / Org                                        | TermBrowser    | Search & Navigation            | keep             | high     | In TermBrowser v3 MVP milestone with Feb 2025 activity; concrete check... |
| 1865 | Concept / Share                                            | TermBrowser    | Concepts & Mappings            | keep             | high     | In TermBrowser v3 MVP milestone with Feb 2025 activity; detailed accep... |
| 1866 | Repo / Search - Enhancements                               | TermBrowser    | Search & Navigation            | keep             | high     | In TermBrowser v3 MVP milestone with Feb 2025 activity; specific enhan... |
| 1871 | Repo / Header                                              | TermBrowser    | Repository Management          | keep             | high     | In TermBrowser v3 MVP milestone with Feb 2025 activity; defines key re... |
| 1872 | Repo Version Selector                                      | TermBrowser    | Repository Management          | keep             | high     | In TermBrowser v3 MVP milestone with Feb 2025 activity; core navigatio... |
| 1873 | Repository / Download + Export                             | TermBrowser    | Import & Export                | keep             | high     | V3 Epic in TermBrowser v3 MVP milestone with Feb 2025 activity; suppor... |
| 1874 | In TB, warn users that underscore not officially suppor... | TermBrowser    | Repository Management          | keep             | low      | Small but useful UX improvement for FHIR compliance; prevents users fr... |
| 1877 | Search a Repository                                        | TermBrowser    | Search & Navigation            | keep             | high     | In TermBrowser v3 MVP milestone with Feb 2025 activity; detailed searc... |
| 1878 | Mapping / Share                                            | TermBrowser    | Concepts & Mappings            | keep             | medium   | Adapts concept share (#1865) for mappings; concrete requirement tied t... |
| 1879 | Concept / Download                                         | TermBrowser    | Import & Export                | keep             | medium   | V3 feature for downloading individual concepts in OCL JSON or FHIR cod... |
| 1880 | Mapping / Download                                         | TermBrowser    | Import & Export                | keep             | high     | In TermBrowser v3 MVP milestone with Feb 2025 activity; parallel to co... |
| 1881 | Mapping / Operations                                       | TermBrowser    | Concepts & Mappings            | keep             | medium   | Epic for $translate operation in mapping details panel; supports FHIR ... |
| 1882 | Concept / Operations                                       | TermBrowser    | Concepts & Mappings            | keep             | medium   | Mirrors mapping operations (#1881) for concepts with $lookup and $vali... |
| 1883 | Concept / Search                                           | TermBrowser    | Search & Navigation            | keep             | medium   | Core v3 concept search requirements including full-text search, sortin... |
| 1887 | v3 Search does not return private content                  | TermBrowser    | Search & Navigation            | keep             | high     | Bug where private repos don't appear in v3 global search; important fo... |
| 1888 | User - View canonical registry                             | TermBrowser    | User & Auth                    | keep             | high     | In TermBrowser v3 MVP milestone with Feb 2025 activity; adds CTA to us... |
| 1889 | Expansion / View                                           | TermBrowser    | Collections & References       | keep             | high     | In TermBrowser v3 MVP milestone with Feb 2025 activity; detailed requi... |
| 1892 | Repository - About                                         | TermBrowser    | Repository Management          | keep             | high     | In TermBrowser v3 MVP milestone with Feb 2025 activity; defines repo a... |
| 1893 | Repository / Operations                                    | TermBrowser    | Repository Management          | keep             | medium   | V3 feature for repo-level FHIR operations; context-aware based on repo... |
| 1896 | Reference / Search                                         | TermBrowser    | Search & Navigation            | keep             | medium   | V3 feature for searching and understanding how a valueset is composed ... |
| 1897 | Repo-type specific Summary                                 | TermBrowser    | Repository Management          | keep             | low      | Epic for customized summary views per repository type; empty body but ... |
| 1898 | Download the (or one of the) FHIR representation of a r... | TermBrowser    | Import & Export                | keep             | medium   | Supports FHIR IG Publisher workflow; related to the broader Repository... |
| 1901 | Concept / History                                          | TermBrowser    | Concepts & Mappings            | keep             | medium   | V3 feature for viewing concept history alongside repo versions and com... |
| 1902 | Concept / Membership                                       | TermBrowser    | Concepts & Mappings            | keep             | medium   | V3 Design feature showing which repos reference a concept; important f... |
| 1906 | Editable email address for user                            | TermBrowser    | User & Auth                    | close-stale      | low      | Deliberately deferred in mid-2024 with no follow-up; low demand and no... |
| 1916 | Repo / Share                                               | TermBrowser    | Repository Management          | keep             | medium   | TermBrowser v3 MVP milestone with clear acceptance criteria and recent... |
| 1918 | Double-clicking Add Version crashes the page               | TermBrowser    | General UI                     | close-outdated   | low      | Tagged web2 with no assignee or milestone; v3 has replaced v2 and this... |
| 1937 | Fuzzy search result formatting - slight adjustment         | TermBrowser    | Search & Navigation            | close-outdated   | low      | Tagged web2 with no milestone; v3 search UI has been redesigned and th... |
| 1939 | Sorting when displaying Concepts, Mappings, Repositorie... | TermBrowser    | Search & Navigation            | review           | medium   | Valid UX issue from UAT testing with assignees, but no milestone; may ... |
| 1959 | Support NPM file upload in bulk import UI                  | TermBrowser    | Import & Export                | keep             | medium   | Related to S3 storage support (#1917); enables users to upload NPM pac... |
| 1963 | Displaying sorted concept list on Mapping Detail page      | TermBrowser    | Concepts & Mappings            | keep             | low      | V3 UX improvement for displaying sorted target concepts when mappings ... |
| 1972 | Show mappings in same namespace in concept details         | TermBrowser    | Concepts & Mappings            | keep             | medium   | V3 feature to show namespace-level mappings (e.g. ConceptMap) in conce... |
| 1974 | Search Results icon for Mapped Concepts                    | TermBrowser    | Search & Navigation            | keep             | medium   | TermBrowser v3 MVP milestone; provides important UX clarity for why re... |
| 1975 | Fix Sort order issues                                      | TermBrowser    | Search & Navigation            | keep             | medium   | V3 tagged issue addressing multiple sort UX problems identified at OHI... |
| 1977 | Author: Repository                                         | TermBrowser    | User & Auth                    | keep             | high     | Epic in TermBrowser v3 MVP milestone covering repository CRUD, updated... |
| 1978 | CTA / Repository / Create                                  | TermBrowser    | Repository Management          | keep             | high     | TermBrowser v3 MVP milestone with detailed acceptance criteria and mul... |
| 1979 | CTA / Repository / Edit                                    | TermBrowser    | Repository Management          | keep             | high     | TermBrowser v3 MVP milestone with design docs and acceptance criteria.    |
| 1980 | CTA / Repository / Create version                          | TermBrowser    | Repository Management          | keep             | high     | TermBrowser v3 MVP milestone covering version creation workflow.          |
| 1981 | CTA / Repository / Release (or Un-release) a version       | TermBrowser    | Repository Management          | keep             | high     | TermBrowser v3 MVP milestone with detailed acceptance criteria for rel... |
| 1982 | CTA / Repository / Make a copy                             | TermBrowser    | Repository Management          | keep             | medium   | V3 tagged feature with design docs for cloning repositories; no milest... |
| 1983 | Author: Expansion                                          | TermBrowser    | User & Auth                    | keep             | medium   | V3 Epic tracking expansion management features, updated Feb 2025.         |
| 1984 | CTA / Expansion / Create ($expand)                         | TermBrowser    | Collections & References       | keep             | high     | TermBrowser v3 MVP milestone for expansion creation workflow.             |
| 1985 | CTA / Expansion / Set as default                           | TermBrowser    | Collections & References       | keep             | medium   | TermBrowser v3 MVP milestone for setting default expansion.               |
| 1986 | CTA / Expansion / Delete                                   | TermBrowser    | Collections & References       | keep             | medium   | TermBrowser v3 MVP milestone for expansion deletion.                      |
| 1987 | CTA / Expansion / Update metadata                          | TermBrowser    | Collections & References       | keep             | low      | V3 tagged task for expansion metadata editing; no milestone but part o... |
| 1988 | CTA / Expansion / Rebuild expansion                        | TermBrowser    | Collections & References       | keep             | medium   | TermBrowser v3 MVP milestone for rebuilding expansions.                   |
| 1989 | Author: Concept                                            | TermBrowser    | User & Auth                    | keep             | high     | V3 Epic for concept CRUD operations, a core feature area.                 |
| 1990 | CTA / Concept / Create                                     | TermBrowser    | Concepts & Mappings            | keep             | medium   | Core v3 authoring feature; no milestone but part of the concept author... |
| 1991 | CTA / Concept / Edit                                       | TermBrowser    | Concepts & Mappings            | keep             | high     | TermBrowser v3 MVP milestone, assigned and updated April 2025.            |
| 1992 | CTA / Concept / Clone to repo                              | TermBrowser    | Concepts & Mappings            | keep             | medium   | TermBrowser v3 MVP milestone for concept cloning workflow.                |
| 1993 | CTA / Concept / Add to repo                                | TermBrowser    | Concepts & Mappings            | keep             | medium   | TermBrowser v3 MVP milestone for adding concepts as references to coll... |
| 1994 | CTA / Concept / Create similar                             | TermBrowser    | Concepts & Mappings            | keep             | medium   | TermBrowser v3 MVP milestone for creating concepts based on existing o... |
| 1995 | CTA / Concept / Add mapping                                | TermBrowser    | Concepts & Mappings            | keep             | high     | TermBrowser v3 MVP milestone, assigned to paynejd and updated June 202... |
| 1996 | CTA / Concept / Create mapped concept                      | TermBrowser    | Concepts & Mappings            | keep             | low      | V3 concept authoring feature; no milestone but part of concept authori... |
| 1997 | CTA / Concept / Retire                                     | TermBrowser    | Concepts & Mappings            | keep             | medium   | TermBrowser v3 MVP milestone for concept retirement workflow.             |
| 1998 | CTA / Concept / Import code list                           | TermBrowser    | Import & Export                | keep             | medium   | V3 authoring feature for bulk concept creation from code lists.           |
| 1999 | Author: Mapping                                            | TermBrowser    | User & Auth                    | keep             | high     | TermBrowser v3 MVP milestone Epic, updated June 2025.                     |
| 2000 | CTA / Mapping / Create                                     | TermBrowser    | Concepts & Mappings            | keep             | high     | TermBrowser v3 MVP milestone, updated May 2025.                           |
| 2001 | CTA / Mapping / Edit                                       | TermBrowser    | Concepts & Mappings            | keep             | high     | TermBrowser v3 MVP milestone for mapping editing workflow.                |
| 2002 | CTA / Mapping / Create similar                             | TermBrowser    | Concepts & Mappings            | keep             | medium   | TermBrowser v3 MVP milestone for creating mappings based on existing o... |
| 2003 | CTA / Mapping / Retire                                     | TermBrowser    | Concepts & Mappings            | keep             | medium   | TermBrowser v3 MVP milestone for mapping retirement workflow.             |
| 2004 | CTA / Mapping / Delete                                     | TermBrowser    | Concepts & Mappings            | keep             | medium   | TermBrowser v3 MVP milestone for mapping deletion workflow.               |
| 2007 | CTA / Reference / Preview                                  | TermBrowser    | Collections & References       | keep             | medium   | TermBrowser v3 MVP milestone for reference preview functionality.         |
| 2008 | CTA / Reference / Delete                                   | TermBrowser    | Collections & References       | keep             | medium   | TermBrowser v3 MVP milestone for reference deletion.                      |
| 2009 | CTA / Reference / Create ($expand)                         | TermBrowser    | Collections & References       | keep             | medium   | TermBrowser v3 MVP milestone for creating references through expansion... |
| 2011 | CTA / Reference / Delete                                   | TermBrowser    | Collections & References       | close-duplicate  | low      | Appears to be a duplicate of #2008 with the same title and milestone.     |
| 2012 | CTA / Reference / Update metadata                          | TermBrowser    | Collections & References       | keep             | medium   | TermBrowser v3 MVP milestone for reference metadata editing.              |
| 2013 | Author: Organization                                       | TermBrowser    | User & Auth                    | keep             | high     | TermBrowser v3 MVP milestone Epic for organization management in v3.      |
| 2014 | CTA / Organization / Create                                | TermBrowser    | Repository Management          | keep             | medium   | V3 tagged feature with detailed acceptance criteria and design docs fo... |
| 2015 | CTA / Organization / Add members                           | TermBrowser    | Repository Management          | keep             | medium   | V3 tagged feature for adding members to organizations.                    |
| 2016 | CTA / Organization / Edit                                  | TermBrowser    | Repository Management          | keep             | medium   | V3 tagged feature for editing organization metadata.                      |
| 2017 | CTA / Organization / Create repository                     | TermBrowser    | Repository Management          | keep             | medium   | V3 tagged feature for org-scoped repository creation.                     |
| 2018 | CTA / Organization / Pin repository                        | TermBrowser    | Repository Management          | keep             | low      | V3 tagged feature for pinning repos on organization pages.                |
| 2020 | CTA / Organization / Edit canonical registry               | TermBrowser    | Repository Management          | keep             | medium   | V3 tagged feature for managing organization canonical registries.         |
| 2021 | CTA / Organization / Delete                                | TermBrowser    | Repository Management          | keep             | low      | V3 tagged feature for organization deletion with confirmation.            |
| 2022 | CTA / Organization / Share                                 | TermBrowser    | Repository Management          | keep             | low      | V3 tagged feature for sharing organizations; empty body but part of or... |
| 2025 | Template / Repository / Source                             | TermBrowser    | Repository Management          | keep             | high     | TermBrowser v3 MVP milestone defining page structure for Source reposi... |
| 2026 | Template / Repository / Collection                         | TermBrowser    | Collections & References       | keep             | high     | TermBrowser v3 MVP milestone defining page structure for Collection re... |
| 2027 | Template / Repository / ValueSet                           | TermBrowser    | Repository Management          | keep             | high     | TermBrowser v3 MVP milestone defining page structure for ValueSet repo... |
| 2028 | Template / Repository / CodeSystem                         | TermBrowser    | Repository Management          | keep             | high     | TermBrowser v3 MVP milestone defining page structure for CodeSystem re... |
| 2029 | Template / Repository / Concept Map                        | TermBrowser    | Concepts & Mappings            | keep             | high     | TermBrowser v3 MVP milestone defining page structure for Concept Map r... |
| 2031 | Author: Searchlight                                        | TermBrowser    | Search & Navigation            | keep             | high     | V3 Epic tracking Searchlight feature stories for v3 beta release.         |
| 2040 | Issue import task state update after previous state req... | TermBrowser    | Import & Export                | close-outdated   | low      | Tagged web2 and describes a v2-specific UI polling issue; v3 has repla... |
| 2056 | Concept Details Query Gone Wrong                           | TermBrowser    | Concepts & Mappings            | keep             | high     | Reproducible bug where clicking a mapping shows the wrong concept; ass... |
| 2120 | Remove alternating table bgcolor in search results         | TermBrowser    | Search & Navigation            | keep             | low      | In TermBrowser v3 MVP milestone; straightforward UI polish task.          |
| 2131 | TBv2 concept details & associations hot fixes              | TermBrowser    | User & Auth                    | close-outdated   | low      | Tagged web2 and describes v2-specific hot fixes; v3 has replaced v2.      |
| 2132 | Improve forced sign-in/sign-out behavior                   | TermBrowser    | User & Auth                    | keep             | medium   | Describes a poor UX that can result in lost work across all OCL web ap... |
| 2138 | Implement user sign-in form for django-auth in oclweb3/... | TermBrowser    | User & Auth                    | keep             | medium   | Assigned task for implementing django-auth sign-in in web3 and mapper ... |
| 2145 | Simple URLs to redirect to SSO for Signin/up               | TermBrowser    | User & Auth                    | keep             | medium   | In TermBrowser v3 MVP milestone; provides clean sign-in/sign-up URL re... |
| 2155 | Repo Creation Starting Point UI                            | TermBrowser    | Repository Management          | keep             | high     | In TermBrowser v3 MVP milestone; provides guided repo creation experie... |
| 2156 | Fork a repo version                                        | TermBrowser    | Repository Management          | keep             | high     | In TermBrowser v3 MVP milestone; core feature for creating repos from ... |
| 2157 | Create repo --> Import content from existing repo          | TermBrowser    | Import & Export                | keep             | high     | In TermBrowser v3 MVP milestone; follows from #2156 to import content ... |
| 2174 | Implement source properties/filters in TB search           | TermBrowser    | Search & Navigation            | keep             | high     | Many checkboxes completed; assigned with recent activity (Jul 2025); c... |
| 2181 | Repo Comparison MVP Gaps - Mappings and JSON               | TermBrowser    | Repository Management          | keep             | medium   | Tracks gaps in repo comparison feature for mappings and JSON views; no... |
| 18   | API-level diff functionality to compare 2 resources or ... | API            | Data Model & Versioning        | review           | medium   | Evergreen feature request for semantic diff that remains valuable, but... |
| 19   | API-level diff for repos                                   | API            | Data Model & Versioning        | close-stale      | low      | From 2018, very brief description, no assignee, no milestone, no activ... |
| 32   | Org and repository backup/restore                          | API            | Infrastructure & Operations    | review           | medium   | Important feature for country deployments but no activity since 2020; ... |
| 41   | Support "social authentication" via Keycloak               | API            | Authentication & Authorization | review           | low      | Social auth via Keycloak may still be relevant depending on current au... |
| 51   | "contains" filter for collections should disregard refe... | API            | Core API Features              | close-stale      | low      | Bug from 2018, last updated 2019, likely addressed or no longer releva... |
| 104  | Expose an api endpoint, which lists linked mappings/ref... | API            | Data Model & Versioning        | close-stale      | low      | From 2019, last updated 2022, no milestone -- a nice-to-have that has ... |
| 114  | Add "test_mode" parameter to bulk import api               | API            | Bulk Import/Export             | close-stale      | low      | From 2019, last updated 2021, refers to OclFlexImporter which may no l... |
| 132  | Create smarter (& smaller) import results response desi... | API            | Bulk Import/Export             | review           | medium   | Import result optimization is still valuable; last updated 2023, sugge... |
| 202  | Add to bulk importer the ability to delete all referenc... | API            | Bulk Import/Export             | review           | medium   | Assigned to paynejd and updated in 2024, suggesting ongoing relevance ... |
| 213  | Add advanced comparisons to custom attribute filter        | API            | Core API Features              | close-stale      | low      | From 2020, last updated 2021, no milestone or recent activity -- advan... |
| 252  | API Feature Request: "fields=" parameter                   | API            | Core API Features              | review           | medium   | Field selection is a common API performance optimization that remains ... |
| 311  | oclapi2 Maintenance                                        | API            | Infrastructure & Operations    | close-stale      | low      | Generic maintenance epic from 2020 with no description, no milestone, ... |
| 323  | Update behavior for DELETE requests to concepts and ref... | API            | Core API Features              | review           | medium   | API design question about retire vs hard delete semantics that may sti... |
| 386  | Refactor lookup value schema for oclapi2                   | API            | Data Model & Versioning        | close-stale      | low      | From 2020, vague one-line description, last updated 2021 -- likely no ... |
| 444  | Plan how to handle "implicit value sets" in FHIR           | API            | FHIR Integration               | keep             | medium   | FHIR implicit value set handling is an important compliance feature, u... |
| 471  | Case Sensitive Search with extras attribute                | API            | Search & Performance           | close-stale      | low      | Bug from 2020 referencing DATIM-specific extras queries, last updated ... |
| 472  | Provide response for naked fhir request                    | API            | FHIR Integration               | close-stale      | low      | Minor FHIR endpoint behavior issue from 2020, last updated 2021, refer... |
| 479  | Add validation for trailing/preceding whitespace in IMA... | API            | Core API Features              | close-stale      | low      | From 2020, no updates since creation, references IMAP-specific workflo... |
| 482  | Implement sorting of search results by business revisio... | API            | Search & Performance           | close-stale      | low      | From 2020, last updated 2021, references a manual revision date field ... |
| 582  | Ability to filter by codesystem properties                 | API            | FHIR Integration               | close-stale      | low      | Brief issue from 2021, no assignee, no milestone, last updated 2021.      |
| 583  | Ability to perform FHIR operation by Owner and Id          | API            | FHIR Integration               | review           | medium   | FHIR operation enhancement that may still be relevant for multi-tenant... |
| 588  | Org export                                                 | API            | Bulk Import/Export             | review           | medium   | Related to backup/restore (#32); exporting all org content in a single... |
| 597  | [OCLAPI2] Design CSV Generation and Content Changes        | API            | Bulk Import/Export             | keep             | medium   | CSV generation improvements with specific checklist items, updated in ... |
| 632  | Implement features to allow configuration of case sensi... | API            | Core API Features              | close-stale      | low      | From 2021, no updates since creation, no assignee -- the initial case-... |
| 638  | Allow source/collection admins to control visibility of... | API            | Data Model & Versioning        | keep             | high     | Important access control feature for version resolution, updated as re... |
| 744  | Implement user license(s) agreement features               | API            | Authentication & Authorization | close-outdated   | medium   | Tagged web2, references oclweb2-specific sign-in flow; license managem... |
| 745  | [OCLAPI2] Optimize search results using 'match_phrase'     | API            | Search & Performance           | close-stale      | low      | Empty body, from 2021, last updated August 2021 -- search optimization... |
| 753  | Add "DELETE_IF_EXISTS" action into bulk import             | API            | Bulk Import/Export             | close-stale      | low      | From 2021, last updated July 2021, a convenience feature that was neve... |
| 757  | Implement optional country code support for locales        | API            | Data Model & Versioning        | keep             | high     | Locale validation issue affecting real dictionary imports (PIH), updat... |
| 782  | Introduce attribute to control how an OCL source is exp... | API            | FHIR Integration               | keep             | high     | Important FHIR compliance feature for authoritative vocabularies like ... |
| 790  | Implement access control for exports                       | API            | Bulk Import/Export             | keep             | high     | Important access control feature distinguishing reference access from ... |
| 855  | CSV Bulk Import Gaps                                       | API            | Bulk Import/Export             | review           | medium   | Documents specific CSV import gaps (nested extras, hierarchy) that may... |
| 856  | JSON Bulk Import Gaps                                      | API            | Bulk Import/Export             | review           | medium   | Documents specific JSON import gaps (mappings within concept, hierarch... |
| 866  | Core OCL/API                                               | API            | Core API Features              | close-stale      | low      | Empty project-level epic from 2021 with no description.                   |
| 867  | Bulk Import API                                            | API            | Bulk Import/Export             | close-stale      | low      | Empty epic from 2021 with no description, no updates since creation.      |
| 869  | FHIR/SVCM Support in OCL                                   | API            | FHIR Integration               | review           | medium   | FHIR/SVCM is still a core initiative, but this empty epic may not be t... |
| 873  | API Parameters, Properties, and Filters                    | API            | Core API Features              | close-stale      | low      | Empty epic from 2021 with no description, no updates since August 2021... |
| 876  | API Performance Improvement                                | API            | Search & Performance           | review           | medium   | API performance is evergreen, but this empty epic from 2021 may not be... |
| 878  | Name_type Standardization                                  | API            | Data Model & Versioning        | keep             | medium   | Data standardization issue with concrete examples, updated September 2... |
| 881  | Hierarchy Support in API                                   | API            | Core API Features              | review           | medium   | Hierarchy is important for SNOMED/ICD browsing; empty epic but the fea... |
| 886  | API Search Results                                         | API            | Search & Performance           | close-stale      | low      | Empty epic from 2021 with no description, no updates since creation.      |
| 887  | Content Exports                                            | API            | Bulk Import/Export             | keep             | medium   | Content exports epic updated as recently as June 2024, indicating ongo... |
| 889  | Content Distribution License                               | API            | Authentication & Authorization | review           | medium   | Related to #744 and #790; content licensing is important for SNOMED/LO... |
| 899  | Mappings version summary                                   | API            | Data Model & Versioning        | close-stale      | low      | Small API feature request from 2021 with no assignee, no milestone, an... |
| 901  | Lookup Tables                                              | API            | Data Model & Versioning        | close-stale      | low      | Vague Epic from 2021 with minimal description, no assignee, no milesto... |
| 904  | Diff Imports, as opposed to full imports                   | API            | Bulk Import/Export             | review           | medium   | Diff/delta import is a valuable concept for large sources but this Epi... |
| 905  | API-level Reporting                                        | API            | Infrastructure & Operations    | close-stale      | low      | Empty-body Epic from 2021 with no assignee, no milestone, and no updat... |
| 926  | Export Boost - Export in Parallel                          | API            | Bulk Import/Export             | close-stale      | low      | Performance optimization idea from 2021 with no updates since creation... |
| 957  | Improve memory management for import tasks                 | API            | Bulk Import/Export             | keep             | medium   | Detailed performance issue about import memory management, updated in ... |
| 974  | FHIR $expand operation should utilize OCL's full text s... | API            | FHIR Integration               | keep             | high     | FHIR $expand with full text search is an important capability gap; upd... |
| 1115 | OCL exports (zips and subscriptions) should include ful... | API            | Bulk Import/Export             | keep             | medium   | Updated in July 2024, indicating ongoing relevance; export format impr... |
| 1117 | Save some concept/mapping details in an expansion          | API            | Data Model & Versioning        | close-stale      | low      | From 2021 with no updates since creation -- expansion architecture has... |
| 1143 | Ability to transfer ownership of a source or collection    | API            | Data Model & Versioning        | review           | low      | Evergreen feature request for both API and TermBrowser, but no updates... |
| 1166 | NPM Import of Baseline FHIR Content, plus Known FHIR Se... | API            | FHIR Integration               | keep             | high     | V3-tagged Epic updated in January 2025 about remaking OCL's FHIR servi... |
| 1194 | Changing an ID for an org, source, collection, etc.        | API            | Data Model & Versioning        | keep             | medium   | Discussion-needed enhancement updated in March 2024 with multiple assi... |
| 1212 | CSV export of a the concepts or mappings of a source/co... | API            | Bulk Import/Export             | review           | medium   | Concrete bug/limitation that may still exist, but no updates since 202... |
| 1259 | Index a concept's mappings along with a concept            | API            | Search & Performance           | keep             | medium   | Valuable search improvement that would allow finding concepts by their... |
| 1286 | Retire any APIs/data that use both repo version and res... | API            | Data Model & Versioning        | close-outdated   | low      | Labeled web2 and api2 from 2022 -- this v2-era API cleanup may already... |
| 1291 | Expanded Reference adjustment - Multiple resources in a... | API            | Core API Features              | close-stale      | low      | API enhancement from 2022 with no updates since creation and no milest... |
| 1296 | Requirements: Basic expansion matching logic for ValueS... | API            | FHIR Integration               | keep             | high     | FHIR-labeled requirements issue updated in March 2024 -- expansion mat... |
| 1310 | Implement recursive real-time expansions                   | API            | FHIR Integration               | keep             | high     | Updated in March 2024; recursive real-time expansions with system-vers... |
| 1317 | Harmonize OCL export/import formats                        | API            | Bulk Import/Export             | close-duplicate  | low      | Labeled as duplicate; the issue itself notes OCL cannot import its own... |
| 1327 | Constrain processing of repo versions to be "consistent... | API            | Data Model & Versioning        | keep             | high     | Important API correctness issue updated in March 2024 -- ensuring expa... |
| 1336 | Speed up tests by getting rid of delete_all and relying... | API            | Search & Performance           | close-stale      | low      | Tech debt issue from 2022 with no updates since creation and no milest... |
| 1357 | Expose hard DELETE of concept/mapping for standard user... | API            | Core API Features              | keep             | medium   | Updated in March 2024; hard delete for standard users is an important ... |
| 1371 | Canonical URL Restrictions (Round 1)                       | API            | Core API Features              | keep             | high     | In the TermBrowser v3 MVP milestone, updated February 2025 -- canonica... |
| 1396 | User should have option not to auto-import Mappings to ... | API            | Core API Features              | keep             | medium   | Updated in March 2024; controlling mapping import behavior for retired... |
| 1420 | Remove Flower dependency in OCLAPI                         | API            | Infrastructure & Operations    | review           | low      | Tech debt issue from 2022 about removing Flower; unclear if this has b... |
| 1433 | Fix OCL Locales - Round 2                                  | API            | Data Model & Versioning        | keep             | high     | V3-tagged foundational Epic updated in March 2024 -- proper locale sup... |
| 1508 | Setup limits on bulk imports                               | API            | Bulk Import/Export             | keep             | medium   | Rate limiting for bulk imports is an evergreen operational concern for... |
| 1548 | Collection References bug - Using the term "Unresolved"... | API            | Core API Features              | review           | medium   | Bug in how OCL classifies unresolved references; unclear if this was f... |
| 1596 | Update CSV Bulk Import to catch up with new features       | API            | Bulk Import/Export             | keep             | medium   | CSV bulk import is actively used and keeping it aligned with new featu... |
| 1599 | CodeSystem POST Bug - Display attribute seems to be req... | API            | FHIR Integration               | keep             | medium   | FHIR compliance bug where display attribute should be optional per spe... |
| 1603 | Dynamically populate display_name based on request head... | API            | Core API Features              | keep             | medium   | Multi-lingual display name support is important for internationalizati... |
| 1606 | Re-Index ES indexes in a more de-coupled and zero downt... | API            | Search & Performance           | keep             | medium   | Zero-downtime ES reindexing is an evergreen infrastructure/performance... |
| 1610 | Use canonical URL where possible in the "system" field ... | API            | FHIR Integration               | keep             | medium   | FHIR compliance issue where canonical URLs should be used in ValueSet ... |
| 1641 | Add the map source and display name to the "Match expla... | API            | Search & Performance           | keep             | low      | Improving search match explanations with map source info is valuable f... |
| 1653 | Track request source of a POST/PUT                         | API            | Core API Features              | keep             | low      | Tracking how resources are created/updated is valuable for auditing an... |
| 1657 | Better handle invalid import JSON/CSV errors               | API            | Bulk Import/Export             | keep             | medium   | Better error handling for bulk imports is an evergreen quality improve... |
| 1666 | Introduce "Synonym" name type and remove "None" name ty... | API            | Data Model & Versioning        | keep             | medium   | Breaking change to fix confusing name type semantics; updated Oct 2024... |
| 1670 | Collection bug - collection isn't displaying the latest... | API            | Data Model & Versioning        | review           | medium   | Bug where collections show outdated concept versions; no assignee and ... |
| 1671 | Rename `uuid` field to `id` for concept names and descr... | API            | Core API Features              | review           | medium   | Breaking API field rename; assigned but last updated Nov 2023, unclear... |
| 1687 | Implement repo_type attribute for sources and collectio... | API            | Data Model & Versioning        | keep             | high     | In TermBrowser v3 MVP milestone with recent Feb 2025 update; foundatio... |
| 1690 | Diffs and Checksums                                        | API            | Data Model & Versioning        | keep             | high     | Epic for checksums and diffs is a V3 foundational feature important fo... |
| 1691 | Checksums: Addressing the details                          | API            | Data Model & Versioning        | keep             | medium   | Discussion ticket for checksum details with active assignees; updated ... |
| 1696 | Canonical URL Registry                                     | API            | Core API Features              | keep             | high     | Epic in TermBrowser v3 MVP milestone updated Feb 2025; foundational V3... |
| 1697 | Standardizing Lookup Fields - Approaches for cleaning u... | API            | Data Model & Versioning        | keep             | medium   | V3 foundational epic for standardizing lookup fields; no assignee but ... |
| 1698 | OWASP Top-10                                               | API            | Authentication & Authorization | keep             | medium   | Security compliance epic is always relevant; V3 foundation label indic... |
| 1723 | Upgrade to Django 5                                        | API            | Infrastructure & Operations    | keep             | medium   | Framework upgrade is important for security and maintainability; tagge... |
| 1726 | Repo Configuration and Content Validation - Configuring... | API            | Data Model & Versioning        | keep             | medium   | Epic for repo configuration and content validation; relevant for FHIR ... |
| 1730 | Upgrade to python3.12                                      | API            | Infrastructure & Operations    | review           | medium   | Python upgrade from Jan 2024; may already be completed or superseded b... |
| 1740 | Maintain original casing for facets in filter panel        | API            | Search & Performance           | keep             | low      | ES indexing issue affecting facets and repo summary display; impacts d... |
| 1744 | Permissions for registries and $resolveReference behavi... | API            | FHIR Integration               | review           | medium   | No milestone, empty body, no assignee, and no updates since March 2024... |
| 1746 | Only create new concept/mapping version if the resource... | API            | Data Model & Versioning        | keep             | high     | Important performance and correctness enhancement for bulk imports and... |
| 1761 | Add FHIR xml support                                       | API            | FHIR Integration               | review           | low      | No milestone, no updates since March 2024; FHIR XML is a nice-to-have ... |
| 1773 | Queue Management Service                                   | API            | Infrastructure & Operations    | close-superseded | low      | All checklist items are marked complete (removed Flower dependency, lo... |
| 1782 | Implement standalone reference support in CSV bulk impo... | API            | Bulk Import/Export             | keep             | medium   | Enhances bulk import to support standalone references; concrete requir... |
| 1793 | Implement basic analytics on OCL FHIR Core utilization     | API            | FHIR Integration               | close-stale      | low      | Requirements marked as TBD, no updates since March 2024, no assignee; ... |
| 1801 | User Profile - Summary API                                 | API            | Core API Features              | keep             | medium   | V3-labeled API enhancement for richer user profile data; supports user... |
| 1805 | Repo Version Summary counts are often incorrect            | API            | Data Model & Versioning        | keep             | high     | Bug affecting data integrity display after imports; has assignee and c... |
| 1812 | Roles and Permissions for OCLv3                            | API            | Authentication & Authorization | keep             | high     | V3 foundation Epic with Feb 2025 activity; advanced RBAC is a critical... |
| 1815 | FHIR CodeSystem Fixes                                      | API            | FHIR Integration               | review           | medium   | Has checklist items (some checked, some not visible in preview); needs... |
| 1823 | CodeSystem $lookup Enhancement - displayLanguage Parame... | API            | FHIR Integration               | keep             | medium   | Concrete FHIR enhancement requested by HL7 Brazil for IPS Viewer; supp... |
| 1833 | 502 Bad Gateway for Large CodeSystem resources             | API            | FHIR Integration               | keep             | high     | Bug affecting FHIR CodeSystem imports over ~250 codes; likely still re... |
| 1835 | OCL rejects "duplicate" resource imports - "org_source_... | API            | FHIR Integration               | review           | medium   | Bug from May 2024 with no updates since; needs verification on whether... |
| 1836 | FHIR ConceptMap fails to import due to "null" map_type     | API            | FHIR Integration               | review           | medium   | Bug from May 2024; needs verification on whether equivalence vs relati... |
| 1837 | Review/finalize $translate operation                       | API            | FHIR Integration               | keep             | medium   | FHIR operation correctness is evergreen; specific issues identified wi... |
| 1839 | Add code searchParam for CodeSystem                        | API            | FHIR Integration               | review           | medium   | Small FHIR compliance fix from May 2024; needs verification on whether... |
| 1840 | CodeSystem listing should include total                    | API            | FHIR Integration               | review           | medium   | Small FHIR compliance fix from May 2024; needs verification on whether... |
| 1847 | Import Performance                                         | API            | Bulk Import/Export             | keep             | high     | Epic for import performance with active assignees; performance is ever... |
| 1867 | Create independent script for standard and smart checks... | API            | Data Model & Versioning        | keep             | medium   | Supports CIEL validation workflow; has assignee and Dec 2024 activity.    |
| 1868 | Enable creating/importing/editing resource in an older ... | API            | Data Model & Versioning        | keep             | medium   | Complex but important API enhancement for version management; detailed... |
| 1885 | Events and Feeds Framework                                 | API            | Core API Features              | keep             | medium   | Epic for event recording and activity feeds; foundational API effort s... |
| 1891 | Freeze large resources upon deletion request               | API            | Data Model & Versioning        | keep             | medium   | V3-labeled enhancement for a real UX problem where users can interact ... |
| 1910 | FHIR baseline content                                      | API            | FHIR Integration               | keep             | high     | Epic with active assignee tracking baseline FHIR content availability ... |
| 1911 | OCL CSV exports truncated at 1000                          | API            | Bulk Import/Export             | keep             | medium   | Valid bug report about export truncation affecting real users of large... |
| 1915 | OCL support for Publishing terminology the FHIR ecosyst... | API            | FHIR Integration               | keep             | high     | Epic for strategic FHIR ecosystem publishing support, updated as recen... |
| 1919 | Support ConceptMap and CodeSystem with the same ID         | API            | FHIR Integration               | keep             | high     | Architectural issue blocking baseline FHIR content loading; needs reso... |
| 1922 | Fix overwriting ConceptMap version                         | API            | FHIR Integration               | keep             | medium   | Bug with traceback related to FHIR import pipeline, assigned to rkoryt... |
| 1923 | Persist partial progress for new bulk import               | API            | Bulk Import/Export             | keep             | high     | Performance issue causing timeouts on large imports, updated Jan 2025.    |
| 1924 | Import r4.core dependency once                             | API            | FHIR Integration               | keep             | medium   | Optimization to avoid redundant imports of r4.core across FHIR package... |
| 1927 | CodeSystem Import Bug for Date property                    | API            | FHIR Integration               | keep             | medium   | Bug where Date attribute is stripped during FHIR CodeSystem import; as... |
| 1929 | CodeSystem Import Bug: New line character removed when ... | API            | FHIR Integration               | keep             | medium   | Data fidelity bug in FHIR CodeSystem import pipeline, assigned to rkor... |
| 1957 | Test load baseline content via NPM import                  | API            | FHIR Integration               | keep             | high     | Active testing task for baseline FHIR content loading, updated Jan 202... |
| 1961 | Implement FHIR import validation/comparison process        | API            | FHIR Integration               | review           | medium   | Empty body with no assignee or milestone; the concept is valuable but ... |
| 1962 | Record repos+versions that did and did not resolve with... | API            | Data Model & Versioning        | keep             | medium   | API enhancement to track unresolvable references in expansions, assign... |
| 2030 | FHIR endpoints must be handled with or without trailing... | API            | FHIR Integration               | keep             | medium   | API compatibility issue for FHIR endpoints, assigned to rkorytkowski.     |
| 2035 | Fix new bulk import queuing                                | API            | Bulk Import/Export             | keep             | high     | Bug causing infinite loop when importing hl7.fhir.r4.core package, upd... |
| 2039 | Index Descriptions                                         | API            | Search & Performance           | keep             | high     | Indexing descriptions for search and mapping tool is an active, valuab... |
| 2041 | Do not import npm hl7.fhir.r4.core 4.0.1 if listed in d... | API            | Bulk Import/Export             | keep             | medium   | Practical optimization for bulk FHIR imports to avoid redundant re-imp... |
| 2042 | Do not schedule all bulk import subtasks at once           | API            | Bulk Import/Export             | keep             | high     | Addresses a real Celery scalability issue with large imports; assigned... |
| 2043 | Test new bulk import for oclapi imports                    | API            | Bulk Import/Export             | keep             | high     | Active testing task for new bulk import with recent updates in July 20... |
| 2045 | Terminology Packaging Service                              | API            | Core API Features              | keep             | high     | Epic representing a strategic capability area with active assignees in... |
| 2047 | Implement FHIR Serialization Library                       | API            | FHIR Integration               | keep             | high     | Epic for a core FHIR capability with an assigned developer.               |
| 2048 | FHIR Content Traceability                                  | API            | FHIR Integration               | keep             | medium   | Epic for traceability of FHIR content, a key requirement for productio... |
| 2049 | CRMI Compliance                                            | API            | FHIR Integration               | keep             | medium   | Epic for compliance with the Canonical Resource Management Infrastruct... |
| 2050 | Batch Validation                                           | API            | Core API Features              | keep             | medium   | Epic for batch validation capability; relevant to FHIR compliance and ... |
| 2052 | Batch Translation                                          | API            | Core API Features              | keep             | medium   | Epic for batch translation capability; relevant to multilingual termin... |
| 2053 | Automated FHIR Resource Validation                         | API            | FHIR Integration               | keep             | medium   | Epic for automated validation of FHIR resources; closely related to #2... |
| 2057 | Collection Importing via Version Export                    | API            | Bulk Import/Export             | keep             | high     | Important for collection portability between OCL servers; assigned and... |
| 2114 | Bug: Value Set Compose Statement shows "ValueSet" in th... | API            | FHIR Integration               | keep             | medium   | Valid FHIR bug where system field shows incorrect resource type; unass... |
| 2118 | Finalize new bulk import streaming capability              | API            | Bulk Import/Export             | keep             | high     | Assigned and tracks finalization of a new bulk import capability with ... |
| 2121 | OCL API Throttling                                         | API            | Infrastructure & Operations    | keep             | high     | Important API hardening feature to apply throttling across all endpoin... |
| 2136 | Missing Collection Export Attribute                        | API            | Bulk Import/Export             | keep             | high     | High priority label, assigned; cascade logic missing from collection e... |
| 2137 | Collection Version via Bulk Import fails                   | API            | Bulk Import/Export             | keep             | high     | Bug where collection version bulk import fails with 'Head not found'; ... |
| 2149 | The first version's hierarchy different from the HEAD's    | API            | Data Model & Versioning        | keep             | medium   | Valid bug where first version's hierarchy differs from HEAD despite no... |
| 2151 | Error bulk importing mapping resource                      | API            | Bulk Import/Export             | keep             | high     | Bug where bulk import fails for mappings that work via direct POST; as... |
| 2152 | Update the bulk import message attribute                   | API            | Bulk Import/Export             | keep             | low      | Quality-of-life improvement for bulk import message formatting and con... |
| 2153 | Mappings should persist repo URLs as submitted by the u... | API            | Data Model & Versioning        | keep             | high     | Important data integrity issue where canonical URLs should be preserve... |
| 2159 | Source properties and filters                              | API            | Data Model & Versioning        | keep             | high     | Core capability for FHIR CodeSystem properties/filters; assigned with ... |
| 2166 | Bad API call always returns some arbitrary results         | API            | Core API Features              | keep             | medium   | Valid bug where malformed API queries return arbitrary results instead... |
| 2175 | Enforce source properties as schema                        | API            | Data Model & Versioning        | keep             | medium   | Follow-on to #2159 for enforcing properties as concept schema; importa... |
| 2176 | Source properties and filters (part 4)                     | API            | Data Model & Versioning        | keep             | low      | Future phase of source properties work including FHIR profile generati... |
| 2193 | OCL Caching & Performance Spike                            | API            | Search & Performance           | keep             | high     | Performance analysis and caching improvements including LOINC performa... |
| 2194 | Cannot update user email address                           | API            | Core API Features              | keep             | medium   | Clear bug report where email update silently fails; well-documented wi... |
| 2201 | Collection reference filter on language translation        | API            | Core API Features              | keep             | high     | Supports OpenMRS community need for language-based dynamic collection ... |
| 346  | Malawi Mockup for Metadata Browser                         | Design         | Accessibility & UX             | close-outdated   | low      | From 2020, references oclweb2 metadata browser components and Adobe XD... |
| 473  | Design mappings details page for oclweb2                   | Design         | Accessibility & UX             | close-outdated   | low      | Explicitly for oclweb2 which has been replaced by v3; mapping design h... |
| 705  | Design Continued - Improve presentation of mappings thr... | Design         | Accessibility & UX             | close-outdated   | low      | Explicitly references oclweb2 which has been replaced by v3; mapping p... |
| 774  | Mockup cross-server resource comparison                    | Design         | Accessibility & UX             | close-stale      | low      | From 2021, no updates since creation -- cross-server comparison remain... |
| 1153 | Next round of expansion design work                        | Design         | Accessibility & UX             | close-outdated   | low      | Design feedback from 2021 about v2 expansion UI -- v3 has its own expa... |
| 1379 | TermBrowser page templates redesign and navigation         | Design         | Navigation & Layout            | close-stale      | low      | Design task from 2022 with no body and no updates since creation -- v3... |
| 1380 | OCL online (website) redesign                              | Design         | Navigation & Layout            | close-stale      | low      | Empty-body design task from 2022 with no updates since creation -- web... |
| 1381 | Design system                                              | Design         | Design System                  | keep             | high     | V3-tagged Epic updated in March 2024 -- design system is foundational ... |
| 1398 | Table empty states                                         | Design         | Design System                  | close-stale      | low      | Design system task from 2022 with no body and no updates since creatio... |
| 1435 | Multi-line tooltip                                         | Design         | Design System                  | close-stale      | low      | Design system component from 2022, last updated December 2023 but orig... |
| 1442 | Design for a retired concept vs. retired mapping           | Design         | Accessibility & UX             | review           | medium   | Design task about distinguishing retired concepts from retired mapping... |
| 1478 | Repository version summary                                 | Design         | Accessibility & UX             | review           | medium   | Design ticket for repo version summary updated in 2024 with active ass... |
| 1494 | Update the UI/UX of the new source summary tab             | Design         | Accessibility & UX             | close-stale      | low      | V3 design ticket from 2023 with no updates since July 2023 and no mile... |
| 1539 | Change icon color for associations that cannot be resol... | Design         | Design System                  | close-stale      | low      | Minor design tweak from 2023 with no updates since July 2023; V3 conce... |
| 1615 | Form / Create repo                                         | Design         | Accessibility & UX             | keep             | high     | In TermBrowser v3 MVP milestone with recent updates in Feb 2025.          |
| 1616 | Form / Create org                                          | Design         | Accessibility & UX             | keep             | high     | In TermBrowser v3 MVP milestone with recent updates in Feb 2025.          |
| 1618 | Form / Repo / Add references                               | Design         | Accessibility & UX             | keep             | high     | In TermBrowser v3 MVP milestone with recent updates in Feb 2025.          |
| 1619 | Form / Create Version                                      | Design         | Accessibility & UX             | review           | medium   | V3 design ticket but no milestone and no updates since July 2023; may ... |
| 1620 | Concept detail view / Header                               | Design         | Navigation & Layout            | keep             | high     | In TermBrowser v3 MVP milestone with recent updates in Feb 2025; well-... |
| 1621 | Concept Detail view / Associations card                    | Design         | Accessibility & UX             | keep             | high     | In TermBrowser v3 MVP milestone with very recent update in March 2025.    |
| 1622 | Detail view / Change request                               | Design         | Accessibility & UX             | keep             | medium   | V3 design ticket for change request detail view, updated Feb 2025; par... |
| 1623 | Detail view / Compare                                      | Design         | Accessibility & UX             | keep             | high     | In TermBrowser v3 MVP milestone with recent updates in Feb 2025; compa... |
| 1625 | Consumer: Repository                                       | Design         | Accessibility & UX             | keep             | high     | Epic in TermBrowser v3 MVP milestone with recent updates in Feb 2025.     |
| 1626 | Profile / Org                                              | Design         | Accessibility & UX             | keep             | high     | In TermBrowser v3 MVP milestone with recent updates in Feb 2025.          |
| 1628 | Notifications                                              | Design         | Accessibility & UX             | close-stale      | low      | Empty body, no milestone, no updates since July 2023; notifications ar... |
| 1629 | Comments                                                   | Design         | Accessibility & UX             | close-stale      | low      | Empty body, no milestone, no updates since July 2023; commenting is a ... |
| 1630 | My account menu                                            | Design         | Accessibility & UX             | review           | medium   | V3 design for account menu with clear requirements; no milestone but m... |
| 1631 | List view / Mappings                                       | Design         | Accessibility & UX             | review           | medium   | V3 design ticket with empty body and no milestone; unclear if this was... |
| 1640 | Design for retired mappings vs. concepts                   | Design         | Accessibility & UX             | keep             | medium   | User confusion about retired concepts vs mappings is a real UX problem... |
| 1700 | Hierarchy/Cascade Component - Seeing context for a conc... | Design         | Design System                  | keep             | medium   | V3 design ticket for hierarchy/cascade visualization; updated Jan 2024... |
| 1738 | Concept detail view / Collection membership                | Design         | Accessibility & UX             | keep             | low      | V3 design ticket for showing collection membership in concept detail; ... |
| 1739 | Concept detail view / History                              | Design         | Accessibility & UX             | keep             | high     | In TermBrowser v3 MVP milestone updated Feb 2025; concept version hist... |
| 1741 | OCL Bouncy Ball Loading icon and performance benchmark     | Design         | Design System                  | keep             | low      | V3 UX issue where loading indicator creates perception of slow perform... |
| 1766 | Generate additional analytics                              | Design         | Analytics & Tracking           | keep             | medium   | Analytics on most-mapped sources, concepts, and searches remain valuab... |
| 1776 | Objects (Chip view)                                        | Design         | Design System                  | keep             | medium   | In TermBrowser v3 MVP milestone with Feb 2025 activity; design compone... |
| 1792 | OCL v3 Analytics                                           | Design         | Analytics & Tracking           | keep             | medium   | V3 foundation Epic for analytics; still relevant as v3 analytics requi... |
| 1875 | Data tables                                                | Design         | Design System                  | keep             | medium   | V3 design ticket with detailed table configurations and checklist; som... |
| 1876 | Disabled text field                                        | Design         | Design System                  | close-stale      | low      | Empty body, no labels, no assignee, no milestone, no updates since Jul... |
| 1904 | Modals                                                     | Design         | Design System                  | close-stale      | low      | Very minor design note about close icon in M3 modals from July 2024; l... |
| 1905 | Avatars                                                    | Design         | Design System                  | keep             | low      | V3 design documentation for avatar handling including upload, cropping... |
| 1932 | Event feed: Card architecture                              | Design         | Accessibility & UX             | close-stale      | low      | Empty body, no assignee, no milestone, no activity since Sept 2024; to... |
| 1933 | Visual customization                                       | Design         | Accessibility & UX             | close-stale      | low      | Empty body, no assignee, no milestone, no activity since Sept 2024; to... |
| 1948 | Repo - Mappings list                                       | Design         | Accessibility & UX             | keep             | medium   | V3 design ticket with OHIE Must-Haves label and active assignee; part ... |
| 1951 | Repo - Overview                                            | Design         | Accessibility & UX             | keep             | medium   | V3 design ticket with multiple assignees covering FHIR-aligned reposit... |
| 1958 | Expansion picker                                           | Design         | Accessibility & UX             | keep             | medium   | V3 design ticket detailing expansion picker requirements and placement... |
| 1960 | Object preview                                             | Design         | Design System                  | keep             | medium   | V3 design ticket with detailed mockups for concept/org/user hover prev... |
| 1970 | Mobile-ready screens for V3                                | Design         | Navigation & Layout            | keep             | high     | Tagged OHIE Must-Haves; many users access OCL on mobile and this is cr... |
| 1971 | Mobile updates                                             | Design         | Navigation & Layout            | keep             | medium   | V3 design ticket with mobile mockups, companion to #1970.                 |
| 2019 | CTA / Organization / Customize appearance                  | Design         | Accessibility & UX             | keep             | low      | V3 tagged feature for org avatar and header customization.                |
| 262  | Data Corruption Risk Mitigation Plan                       | Infrastructure | Data Issues                    | close-outdated   | low      | From 2020, references Postgres refactor which has since been completed... |
| 344  | OCL Administrative                                         | Infrastructure | CI/CD & Tooling                | close-stale      | low      | Empty project-level epic from 2020 with no description and no activity... |
| 575  | [Infra] Load balancer and ECS to use /healthcheck end p... | Infrastructure | Monitoring & Error Tracking    | close-stale      | low      | From 2021, no updates since May 2021 -- likely already implemented or ... |
| 731  | Backup configuration for elastic search                    | Infrastructure | Data Issues                    | keep             | medium   | Elasticsearch backup remains an important infrastructure concern, upda... |
| 747  | Plan load testing for expected growth in OpenMRS use       | Infrastructure | CI/CD & Tooling                | close-stale      | low      | From 2021, vague planning ticket, no updates since August 2021.           |
| 831  | Demo Environment Not Resetting Daily                       | Infrastructure | Deployment & Environments      | close-outdated   | low      | From 2021, references v1 Demo environment CI plan -- infrastructure ha... |
| 858  | Infrastructure                                             | Infrastructure | CI/CD & Tooling                | close-stale      | low      | Empty project-level epic from 2021 with no description and no recent a... |
| 875  | Data Management                                            | Infrastructure | Data Issues                    | close-stale      | low      | Empty epic from 2021 with no description, no updates since creation.      |
| 890  | Content Load Pipeline from Apelon                          | Infrastructure | Data Issues                    | close-stale      | low      | Epic from 2021 with no body, no milestone, and no updates since creati... |
| 932  | Load Smart Guidelines content into Staging                 | Infrastructure | Data Issues                    | close-stale      | low      | Operational task from 2021 about loading specific content into staging... |
| 952  | Performance Testing on Production                          | Infrastructure | CI/CD & Tooling                | close-stale      | low      | Empty-body Epic from 2021 with no assignee and no updates -- too vague... |
| 978  | Switch to 1-yr reserved instances on AWS                   | Infrastructure | Deployment & Environments      | close-outdated   | low      | Operational task from September 2021 about switching to reserved insta... |
| 1243 | Setup Gatling                                              | Infrastructure | CI/CD & Tooling                | review           | low      | Updated in March 2024 suggesting some interest, but Gatling setup for ... |
| 1337 | Create automated test for PEPFAR IMAP import scripts       | Infrastructure | CI/CD & Tooling                | review           | medium   | Updated in March 2024 with multiple assignees -- PEPFAR IMAP import is... |
| 1366 | Support Kenya using standard OCL images instead of fork    | Infrastructure | Deployment & Environments      | close-stale      | low      | Operational task from 2022 about Kenya deployment, last updated Januar... |
| 1400 | OCL Online database cleaning using checksums               | Infrastructure | Data Issues                    | keep             | medium   | Updated in March 2024; database cleaning and deduplication using check... |
| 1401 | Upgrade to nodejs 19                                       | Infrastructure | CI/CD & Tooling                | close-outdated   | low      | Labeled web2; Node.js 19 is EOL and v3 uses its own stack -- this is n... |
| 1425 | Use AWS CodeDeploy to deploy OCL                           | Infrastructure | Deployment & Environments      | close-outdated   | low      | From 2022 about migrating from Bamboo to CodeDeploy -- OCL infrastruct... |
| 1426 | Migrate OCL builds to use Bamboo Specs                     | Infrastructure | CI/CD & Tooling                | close-outdated   | low      | From 2022 about Bamboo Specs -- OCL has likely moved away from Bamboo ... |
| 1427 | Errbit compatibility with OpenID SSO?                      | Infrastructure | Monitoring & Error Tracking    | close-stale      | low      | Question about Errbit/KeyCloak compatibility from 2022, last updated F... |
| 1431 | Implement maintenance page                                 | Infrastructure | Deployment & Environments      | close-stale      | low      | Infrastructure feature from 2022, last updated February 2023 -- either... |
| 1568 | Setup S3 and CDN for chat                                  | Infrastructure | Deployment & Environments      | close-stale      | low      | Infrastructure ticket for OCL Chat from 2023 with no updates since Jul... |
| 1569 | Migrate chat from bare machine to ECS                      | Infrastructure | Data Issues                    | close-stale      | low      | ECS migration ticket for Discourse from 2023 with last update Dec 2023... |
| 1571 | Migrate and upgrade errbit to common cluster               | Infrastructure | Monitoring & Error Tracking    | close-stale      | low      | Errbit migration ticket from 2023 with minimal description and last up... |
| 1594 | Eliminate downtime when refreshing EC2 instances           | Infrastructure | Deployment & Environments      | close-stale      | low      | Infrastructure ticket from June 2023 with no updates since creation; r... |
| 1637 | Create alarms for performance/stability metrics            | Infrastructure | Monitoring & Error Tracking    | keep             | medium   | Monitoring alarms are evergreen infrastructure needs; some items check... |
| 1649 | Change ES to use instance storage instead of EBS           | Infrastructure | Data Issues                    | review           | low      | Infrastructure optimization for ES storage; may still be relevant depe... |
| 1650 | Deploy Kibana to all envs                                  | Infrastructure | Monitoring & Error Tracking    | review           | low      | Kibana deployment for ES monitoring; updated April 2024 but unclear if... |
| 1676 | Accidental New Account on OCL Chat?                        | Infrastructure | CI/CD & Tooling                | close-stale      | low      | One-off SSO bug report from Oct 2023 with no updates; likely addressed... |
| 1678 | Please Delete the fake OpenMRS Org                         | Infrastructure | Data Issues                    | review           | low      | Data cleanup request to remove duplicate OpenMRS org; simple task but ... |
| 1743 | Populate global URL registry on all environments           | Infrastructure | Deployment & Environments      | keep             | high     | In TermBrowser v3 MVP milestone with recent activity and active assign... |
| 1767 | Adjust OCL Online cloudwatch settings to store logs for... | Infrastructure | Monitoring & Error Tracking    | close-stale      | low      | Simple infra config task from Feb 2024 with no updates since March 202... |
| 1846 | Demo environment                                           | Infrastructure | Deployment & Environments      | keep             | medium   | Epic with detailed requirements for demo environment including auth, a... |
| 1917 | Add S3 storage support for new bulk import                 | Infrastructure | Data Issues                    | keep             | medium   | Active infrastructure task with assignee, needed for NPM package cachi... |
| 1940 | Make use of aws_ecs_capacity_provider                      | Infrastructure | Deployment & Environments      | keep             | high     | Tagged top-priority and infra; addresses real downtime risk during EC2... |
| 1944 | Investigate slow DB responses                              | Infrastructure | Data Issues                    | keep             | high     | Tagged top-priority and performance; ongoing DB hiccups and IOPS limit... |
| 2046 | Automated FHIR Testing Pipeline                            | Infrastructure | CI/CD & Tooling                | keep             | high     | Epic for automated FHIR testing with active assignees; critical for qu... |
| 2058 | API dev bambooCI build failing -- ES setup (and hence t... | Infrastructure | CI/CD & Tooling                | review           | medium   | CI build issue from Feb 2025 with no updates since; may have been reso... |
| 2134 | Google CAPTCHA API JS is not available here (cn)           | Infrastructure | CI/CD & Tooling                | keep             | medium   | Blocks user registration in China where Google services are unavailabl... |
| 349  | OCL Community Site                                         | Community      | Community Site & Outreach      | close-stale      | low      | Epic from 2020, last updated 2021, with no specific actionable items r... |
| 390  | OCL User Support - Design and Launch                       | Community      | Community Site & Outreach      | close-stale      | low      | Epic from 2020 with no updates since creation -- user support processe... |
| 626  | Automating the OCL sign-up to the MailChimp                | Community      | Community Site & Outreach      | close-stale      | low      | From 2021, no updates since creation -- MailChimp integration is a low... |
| 721  | Convert liquibaserunner to use GitHub Action               | Community      | OpenMRS Integration            | close-stale      | low      | Travis-to-GitHub Actions migration request from 2021 for an OpenMRS co... |
| 868  | PEPFAR-related Projects                                    | Community      | External Integrations          | close-stale      | low      | Empty project-level epic from 2021 with no description; PEPFAR work is... |
| 885  | PEPFAR DASH                                                | Community      | External Integrations          | close-stale      | low      | Empty epic from 2021 with no description, no updates since creation; P... |
| 892  | OpenMRS Dictionary Manager Support                         | Community      | OpenMRS Integration            | review           | medium   | Project-level Epic for OpenMRS integration; still potentially relevant... |
| 893  | PIH Dictionary                                             | Community      | External Integrations          | close-stale      | low      | Epic from 2021 with no body, no assignee, and no updates since 2022 --... |
| 907  | Kickoff content owner conversations                        | Community      | Community Site & Outreach      | close-stale      | low      | Operational task from 2021 about licensing conversations -- not a soft... |
| 908  | Compile licensing requirements for reference vocabulari... | Community      | Community Site & Outreach      | review           | medium   | Updated in 2024 which suggests some ongoing relevance; licensing for r... |
| 1118 | Importing OMRS dictionary into OCL should store retire_... | Community      | OpenMRS Integration            | close-stale      | low      | Specific import enhancement from 2021, last updated 2022, with no mile... |
| 1188 | Linked sources and preferred sources - Start within Sou... | Community      | OpenMRS Integration            | close-stale      | low      | OpenMRS-labeled feature from 2022 with no updates since November 2022 ... |
| 1216 | Mappings Modification Requirements                         | Community      | OpenMRS Integration            | close-stale      | low      | OpenMRS-labeled requirements gathering from 2022 with no updates since... |
| 1340 | OpenMRS custom validation should ensure external IDs ar... | Community      | OpenMRS Integration            | keep             | medium   | Concrete API validation enhancement updated in March 2024 -- ensuring ... |
| 1341 | For OMRS Validation Schema, require both from & to conc... | Community      | OpenMRS Integration            | keep             | medium   | Specific OpenMRS validation requirement updated in November 2023 -- st... |
| 1423 | Adopt OCL Code of Conduct (for the development communit... | Community      | Community Site & Outreach      | keep             | low      | Updated in March 2024 with all core team assigned -- community governa... |
| 1509 | Draft approach/level of effort for using Atlassian conf... | Community      | Community Site & Outreach      | close-stale      | low      | Exploratory ticket from 2023 about Confluence wiki; no assignee, no mi... |
| 1531 | Add "sign up" option on the OCL community site home pag... | Community      | Community Site & Outreach      | close-stale      | low      | Small UX fix from 2023 with no updates since July 2023; V3 community s... |
| 1632 | Community website                                          | Community      | Community Site & Outreach      | close-stale      | low      | Empty body, no milestone, no updates since July 2023; community websit... |
| 1655 | Promote OCL Demo site in OCLv3 Community Site              | Community      | Community Site & Outreach      | close-stale      | low      | Promotional task from 2023 with no updates since August 2023; V3 commu... |
| 1665 | OpenMRS Custom Validation Schema: All FSNs and preferre... | Community      | OpenMRS Integration            | keep             | medium   | OpenMRS validation schema refinement discovered during CIEL release; i... |
| 1692 | OpenMRS Burning Needs (V2)                                 | Community      | OpenMRS Integration            | close-outdated   | low      | Epic specifically for V2 burning needs while V3 was being developed; V... |
| 1705 | Ensure names & description have unique UUIDs (external ... | Community      | OpenMRS Integration            | keep             | medium   | Important for OpenMRS interoperability; ensures content created in OCL... |
| 1838 | OCL community projects/locations on Community Website      | Community      | Community Site & Outreach      | keep             | low      | Community engagement feature for the website; still relevant for OCL v... |
| 1890 | Community website build                                    | Community      | Community Site & Outreach      | review           | medium   | Community site build in Webflow from July 2024; may already be complet... |
| 2032 | Query OpenMRS repos in OCL prod                            | Community      | OpenMRS Integration            | close-stale      | low      | One-time analytics query from Dec 2024; the data has likely been gathe... |
| 2086 | Legal Terms                                                | Community      | Community Site & Outreach      | keep             | high     | In Mapper MVP milestone, high priority label, with recent updates; leg... |
| 2122 | OCL Responsible AI Policy                                  | Community      | Community Site & Outreach      | keep             | medium   | Policy document for responsible AI use within OCL; assigned to paynejd... |
| 426  | [OCLAPI2] Make redoc load faster                           | DevEx          | Documentation                  | close-stale      | low      | From 2020, empty body, last updated 2021 -- Redoc performance is a min... |
| 447  | Develop UI tests for oclweb2                               | DevEx          | CLI & Tooling                  | close-outdated   | low      | References oclweb v1 and oclweb2 test infrastructure with Bamboo; v3 h... |
| 828  | Automatically generate changelog for oclweb2, oclapi2, ... | DevEx          | CLI & Tooling                  | close-outdated   | low      | References oclweb2 and Sprint 17 from 2021; changelog tooling and repo... |
| 874  | Automated code changelog                                   | DevEx          | CLI & Tooling                  | review           | low      | Empty epic but updated as recently as March 2024, suggesting it may st... |
| 928  | Automated Content Validation Tooling for OCL               | DevEx          | CLI & Tooling                  | review           | medium   | Epic describing automated validation tooling -- the need is still rele... |
| 994  | Update bulk import validation script                       | DevEx          | CLI & Tooling                  | close-stale      | low      | Task from 2021 about updating a specific gist-based validation script,... |
| 1087 | OCL Connector Documentation                                | DevEx          | Documentation                  | close-stale      | low      | Documentation task from 2021 with no updates since December 2021 -- co... |
| 1142 | [WEB] [UI] Unit tests using Jest                           | DevEx          | CLI & Tooling                  | close-outdated   | low      | Labeled web2 and about Jest testing for the v2 codebase -- v3 has its ... |
| 1298 | Create test data import scripts & deploy on all environ... | DevEx          | Developer Onboarding           | close-stale      | low      | Operational task from 2022 with no updates since creation -- test data... |
| 1475 | Update authentication documentation                        | DevEx          | Documentation                  | close-stale      | low      | Documentation update ticket from 2023 with no milestone and no recent ... |
| 1493 | Add the new source summary endpoints to OCL Docs           | DevEx          | Documentation                  | keep             | low      | Documentation of source summary endpoints is still valuable; updated i... |
| 1555 | Draft operations panel documentation                       | DevEx          | Documentation                  | keep             | low      | Documentation for operations panel is still needed; updated in 2024 wi... |
| 1574 | Draft page re: local vs OCL Online decision                | DevEx          | Developer Onboarding           | keep             | low      | Documentation helping users decide between local and hosted OCL is an ... |
| 1581 | Public documentation for Collection Reference evaluatio... | DevEx          | Documentation                  | keep             | medium   | Collection reference evaluation is complex and poorly documented; this... |
| 1711 | Update mapping documentation for canonical URLs            | DevEx          | Documentation                  | keep             | low      | Mapping documentation update with detailed checklist of remaining item... |
| 1712 | Update incorrect request fields in Swagger                 | DevEx          | Documentation                  | keep             | low      | Swagger accuracy is important for developer experience; specific examp... |
| 1768 | ES (and other) service dev debugging documentation         | DevEx          | Documentation                  | close-stale      | low      | Empty body, no updates since March 2024, no milestone; documentation t... |
| 1783 | Add missing GET request parameters to swagger: Concepts... | DevEx          | Documentation                  | close-stale      | low      | Intro-labeled task from Feb 2024 with no assignee and no updates; like... |
| 1784 | Add missing GET request parameters to swagger: Sources ... | DevEx          | Documentation                  | close-stale      | low      | Intro-labeled task from Feb 2024 with no assignee and no updates; like... |
| 1785 | Add missing GET request parameters to swagger: Orgs and... | DevEx          | Documentation                  | review           | low      | Has an assignee and was updated in Sept 2024, so may still be in progr... |
| 1786 | User documentation on repo versioning and releases         | DevEx          | Documentation                  | keep             | medium   | Documentation on repo versioning is evergreen and important for user o... |
| 1796 | OOUX documentation                                         | DevEx          | Documentation                  | close-stale      | low      | Empty body, no labels, no assignee, no milestone, no updates since Mar... |
| 1811 | Draft checksum documentation (to go into OCL Docs)         | DevEx          | Documentation                  | close-superseded | low      | All checklist items are marked complete; documentation has been drafte... |
| 2051 | OCL/FHIR Model Documentation                               | DevEx          | Documentation                  | keep             | medium   | Epic for documenting OCL's FHIR model; important for developer adoptio... |
| 2082 | Documentation                                              | DevEx          | Documentation                  | keep             | medium   | Epic for OCL Mapper documentation in the Mapper MVP milestone.            |
| 2084 | User Documentation                                         | DevEx          | Documentation                  | keep             | medium   | In the Mapper MVP milestone with multiple assignees; user docs are cri... |
| 2023 | Write boolean logic/pseudocode for mapping search          | Mapper         | AI-Assisted Mapping            | keep             | medium   | Documentation of prototype matching/mapping search logic, assigned and... |
| 2033 | OCLv3 Mapping tool prototype                               | Mapper         | Mapping Workflows              | keep             | high     | Detailed prototype requirements for the v3 mapping UI, foundational to... |
| 2034 | OCL Mapping Tool MVP                                       | Mapper         | Mapping Workflows              | keep             | high     | Epic for the mapping tool MVP supporting OpenMRS Concept Prevalence st... |
| 2072 | Map Concepts from an Existing OCL Source                   | Mapper         | Mapping Workflows              | keep             | low      | Feature to load existing OCL source terms into the mapper; low priorit... |
| 2089 | Save and Export Mapping Progress                           | Mapper         | Mapping Workflows              | keep             | high     | Epic in the Mapper MVP milestone for core save/export functionality.      |
| 2093 | Export Metadata as a ConceptMap                            | Mapper         | Mapping Workflows              | keep             | low      | Valuable FHIR-compliant export option for mapping projects; low priori... |
| 2096 | Review Mapping Candidates                                  | Mapper         | Team Collaboration             | keep             | high     | Epic in Mapper MVP milestone for core review/decision functionality; a... |
| 2111 | Mapping Authority Categorization                           | Mapper         | Team Collaboration             | keep             | low      | Low priority feature for tagging mapping authority roles; relevant for... |
| 2112 | Memory Update                                              | Mapper         | AI-Assisted Mapping            | keep             | high     | In Mapper MVP milestone with recent updates; building up matching memo... |
| 2125 | Spreadsheet with multiple sheets support                   | Mapper         | Mapping Workflows              | keep             | medium   | In Mapper MVP milestone with recent activity (Oct 2025); addresses com... |
| 2126 | Single and bulk create proposed concepts in OCL            | Mapper         | Mapping Workflows              | keep             | medium   | In Mapper MVP milestone; allows creating new concepts when no match ex... |
| 2128 | Navigate terms using arrow keys                            | Mapper         | Mapper UI                      | keep             | low      | In Mapper MVP milestone with recent activity; keyboard shortcuts would... |
| 2139 | Automatically accept or bulk approve exact ID matches      | Mapper         | AI-Assisted Mapping            | keep             | medium   | Based on user feedback; would significantly reduce manual validation f... |
| 2150 | Allow for column mapping "unselect"                        | Mapper         | Mapper UI                      | keep             | medium   | In Mapper MVP milestone; basic usability issue where users cannot unse... |
| 2161 | Importer UI                                                | Mapper         | Mapping Workflows              | keep             | medium   | In Mapper MVP milestone; web3-tagged UI for import functionality.         |
| 2165 | Implement result categorization for semantic search - T... | Mapper         | AI-Assisted Mapping            | keep             | high     | In Mapper MVP milestone with high priority label; improves match quali... |
| 2188 | Enable auto-save upon changes (config, metadata, mappin... | Mapper         | Mapping Workflows              | keep             | high     | In active milestone with recent updates (Feb 2026); auto-save is criti... |
| 2204 | Filtering of target repo                                   | Mapper         | Mapper UI                      | keep             | medium   | Enables filtering match results by concept category (e.g. LOINC terms ... |
| 2205 | Add external $match APIs to OCL Mapper                     | Mapper         | AI-Assisted Mapping            | keep             | high     | Strategic feature to integrate third-party matching algorithms (ICD11,... |
| 458  | Content Preparation, Import, and Publication               | CIEL           | Source Management              | close-stale      | low      | Project-level epic from 2020, last updated 2021, served as a broad tra... |
| 879  | SNOMED Import and Maintenance                              | CIEL           | Content Curation               | keep             | medium   | SNOMED import and maintenance is an ongoing operational concern for OC... |
| 880  | LOINC Import and Maintenance                               | CIEL           | Content Curation               | keep             | medium   | LOINC import and maintenance is an ongoing operational concern for OCL... |
| 883  | RxNorm Import and Maintenance                              | CIEL           | Content Curation               | keep             | medium   | RxNorm import and maintenance is an ongoing operational concern for OC... |
| 884  | ICD-10-CM Import and Maintenance                           | CIEL           | Content Curation               | keep             | medium   | ICD-10-CM import and maintenance is an ongoing operational concern for... |
| 903  | Content Cleaning and Validation                            | CIEL           | Content Curation               | close-stale      | low      | Empty-body Epic from 2021 with no assignee, no milestone, and no updat... |
| 1138 | SNOMED GPS                                                 | CIEL           | Source Management              | review           | medium   | Epic with an assignee and updated in December 2023, suggesting some on... |
| 1158 | Content Management Features                                | CIEL           | Content Curation               | close-stale      | low      | Empty-body Epic from 2021 with no assignee, no milestone, and no updat... |
| 1190 | WHO-ATC Content Publication and Maintenance                | CIEL           | Source Management              | close-stale      | low      | Epic explicitly noted as de-prioritized in its own description; no upd... |
| 1490 | Document CIEL import process to get ready to train othe... | CIEL           | Source Management              | keep             | low      | Training others on CIEL maintenance is an ongoing organizational need;... |
| 1925 | Request: Automatically add self-map                        | CIEL           | Content Curation               | review           | medium   | Enhancement request from CIEL/OpenMRS workflow; tagged web2 and api2 b... |
| 2172 | LOINC (v2.80 or 2.81) Content Importing into OCL Online    | CIEL           | Source Management              | keep             | high     | Active content curation task with assignees and recent updates (Sep 20... |


