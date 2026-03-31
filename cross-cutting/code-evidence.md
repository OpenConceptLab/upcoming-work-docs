# Code Evidence Report for Historical Backlog

**Date:** 2026-03-20
**Scope:** 511 historical backlog issues scanned against 6 repos (oclweb3, oclweb2, oclapi2, oclmap, ocl-docs, ocl-cli)

## Summary

| Metric | Count |
|--------|-------|
| Issues with code evidence | 69 of 511 |
| Strong signal (5+ commits) | 27 |
| Moderate signal (2-4 commits) | 36 |
| Weak signal (1 commit) | 6 |
| No code evidence | 442 |

**Methodology:** Searched `git log` across all 6 repos for `#NNNN` references matching backlog issue numbers. Filtered out Dependabot/dependency bump PRs and their associated changelog noise.

---

## Issues Marked for Closure with Code Evidence (6)

These issues are currently recommended for closure but have moderate or strong commit activity. Their dispositions may need revision.

| # | Title | Disposition | Commits | Repos | Latest | Signal |
|---|-------|-------------|---------|-------|--------|--------|
| 985 | Add async counts into org sources, collections and memb... | close-outdated | 16 | oclweb2 | 2021-10-20 | strong |
| 828 | Automatically generate changelog for oclweb2, oclapi2, ... | close-outdated | 4 | oclapi2 | 2021-07-19 | moderate |
| 1681 | Search for some locales is broken | close-outdated | 2 | oclweb2 | 2026-03-13 | moderate |
| 2040 | Issue import task state update after previous state req... | close-outdated | 2 | oclweb2 | 2025-01-23 | moderate |
| 1673 | Datatype Dropdown bug - cannot use one of my common dat... | close-outdated | 2 | oclweb2 | 2023-10-03 | moderate |
| 1336 | Speed up tests by getting rid of delete_all and relying... | close-stale | 2 | oclapi2 | 2022-07-14 | moderate |

## Keep Issues with Strong Evidence (26)

These issues are marked `keep` and have 5+ commits. Many may be partially or fully implemented — worth verifying whether the issue can be closed as complete.

| # | Title | Commits | Repos | Latest |
|---|-------|---------|-------|--------|
| 1867 | Create independent script for standard and smart checksums f... | 54 | oclapi2 | 2024-12-02 |
| 2023 | Write boolean logic/pseudocode for mapping search | 48 | oclapi2, oclweb3 | 2025-01-31 |
| 1776 | Objects (Chip view) | 36 | oclapi2, oclweb3 | 2024-10-21 |
| 2174 | Implement source properties/filters in TB search | 30 | oclapi2, oclweb2, oclweb3 | 2025-08-11 |
| 1853 | Repo / Compare Versions | 24 | oclweb3 | 2025-06-04 |
| 1471 | Extract out English language bundle from TermBrowser | 22 | oclapi2, oclweb2 | 2023-06-29 |
| 1166 | NPM Import of Baseline FHIR Content, plus Known FHIR Service... | 22 | oclapi2 | 2022-04-25 |
| 1917 | Add S3 storage support for new bulk import | 20 | oclapi2 | 2024-12-13 |
| 957 | Improve memory management for import tasks | 20 | oclapi2 | 2024-12-04 |
| 1746 | Only create new concept/mapping version if the resource has ... | 18 | oclapi2, oclweb2 | 2024-03-12 |
| 1621 | Concept Detail view / Associations card | 16 | oclweb3 | 2024-10-09 |
| 2201 | Collection reference filter on language translation | 16 | oclapi2 | 2025-08-04 |
| 2205 | Add external $match APIs to OCL Mapper | 12 | oclapi2, oclmap | 2025-08-24 |
| 2121 | OCL API Throttling | 12 | oclapi2 | 2025-03-26 |
| 2145 | Simple URLs to redirect to SSO for Signin/up | 10 | oclweb2, oclweb3 | 2025-03-27 |
| 1972 | Show mappings in same namespace in concept details | 10 | oclapi2, oclweb3 | 2024-12-13 |
| 2035 | Fix new bulk import queuing | 10 | oclapi2 | 2025-01-22 |
| 1922 | Fix overwriting ConceptMap version | 10 | oclapi2 | 2024-12-06 |
| 1691 | Checksums: Addressing the details | 10 | oclapi2 | 2024-01-24 |
| 1978 | CTA / Repository / Create | 8 | oclweb3 | 2025-04-14 |
| 1948 | Repo - Mappings list | 8 | oclweb3 | 2024-11-12 |
| 878 | Name_type Standardization | 8 | oclapi2, oclweb2 | 2021-08-10 |
| 1981 | CTA / Repository / Release (or Un-release) a version | 6 | oclweb3 | 2025-05-01 |
| 2152 | Update the bulk import message attribute | 6 | oclapi2 | 2025-04-21 |
| 1833 | 502 Bad Gateway for Large CodeSystem resources | 6 | oclapi2 | 2024-05-16 |
| 2150 | Allow for column mapping "unselect" | 6 | oclmap | 2025-04-11 |

---

## Full Evidence Table

All 69 issues with code evidence, sorted by commit count.

| # | Title | Theme | Disposition | Commits | Repos | Latest | Signal |
|---|-------|-------|-------------|---------|-------|--------|--------|
| 1867 | Create independent script for standard and smart c... | API | keep | 54 | oclapi2 | 2024-12-02 | strong |
| 2023 | Write boolean logic/pseudocode for mapping search | Mapper | keep | 48 | oclapi2, oclweb3 | 2025-01-31 | strong |
| 1776 | Objects (Chip view) | Design | keep | 36 | oclapi2, oclweb3 | 2024-10-21 | strong |
| 2174 | Implement source properties/filters in TB search | TermBrowser | keep | 30 | oclapi2, oclweb2, oclweb3 | 2025-08-11 | strong |
| 1853 | Repo / Compare Versions | TermBrowser | keep | 24 | oclweb3 | 2025-06-04 | strong |
| 1471 | Extract out English language bundle from TermBrows... | TermBrowser | keep | 22 | oclapi2, oclweb2 | 2023-06-29 | strong |
| 1166 | NPM Import of Baseline FHIR Content, plus Known FH... | API | keep | 22 | oclapi2 | 2022-04-25 | strong |
| 1917 | Add S3 storage support for new bulk import | Infrastructure | keep | 20 | oclapi2 | 2024-12-13 | strong |
| 957 | Improve memory management for import tasks | API | keep | 20 | oclapi2 | 2024-12-04 | strong |
| 1746 | Only create new concept/mapping version if the res... | API | keep | 18 | oclapi2, oclweb2 | 2024-03-12 | strong |
| 1621 | Concept Detail view / Associations card | Design | keep | 16 | oclweb3 | 2024-10-09 | strong |
| 985 | Add async counts into org sources, collections and... | TermBrowser | close-outdated | 16 | oclweb2 | 2021-10-20 | strong |
| 2201 | Collection reference filter on language translatio... | API | keep | 16 | oclapi2 | 2025-08-04 | strong |
| 2205 | Add external $match APIs to OCL Mapper | Mapper | keep | 12 | oclapi2, oclmap | 2025-08-24 | strong |
| 2121 | OCL API Throttling | API | keep | 12 | oclapi2 | 2025-03-26 | strong |
| 2145 | Simple URLs to redirect to SSO for Signin/up | TermBrowser | keep | 10 | oclweb2, oclweb3 | 2025-03-27 | strong |
| 1972 | Show mappings in same namespace in concept details | TermBrowser | keep | 10 | oclapi2, oclweb3 | 2024-12-13 | strong |
| 2035 | Fix new bulk import queuing | API | keep | 10 | oclapi2 | 2025-01-22 | strong |
| 1922 | Fix overwriting ConceptMap version | API | keep | 10 | oclapi2 | 2024-12-06 | strong |
| 1691 | Checksums: Addressing the details | API | keep | 10 | oclapi2 | 2024-01-24 | strong |
| 1978 | CTA / Repository / Create | TermBrowser | keep | 8 | oclweb3 | 2025-04-14 | strong |
| 1948 | Repo - Mappings list | Design | keep | 8 | oclweb3 | 2024-11-12 | strong |
| 878 | Name_type Standardization | API | keep | 8 | oclapi2, oclweb2 | 2021-08-10 | strong |
| 1981 | CTA / Repository / Release (or Un-release) a versi... | TermBrowser | keep | 6 | oclweb3 | 2025-05-01 | strong |
| 2152 | Update the bulk import message attribute | API | keep | 6 | oclapi2 | 2025-04-21 | strong |
| 1833 | 502 Bad Gateway for Large CodeSystem resources | API | keep | 6 | oclapi2 | 2024-05-16 | strong |
| 2150 | Allow for column mapping "unselect" | Mapper | keep | 6 | oclmap | 2025-04-11 | strong |
| 2161 | Importer UI | Mapper | keep | 4 | oclweb3 | 2025-05-28 | moderate |
| 1616 | Form / Create org | Design | keep | 4 | oclweb3 | 2025-05-06 | moderate |
| 2003 | CTA / Mapping / Retire | TermBrowser | keep | 4 | oclweb3 | 2025-04-30 | moderate |
| 1376 | Create and Update Concepts and Mappings | TermBrowser | keep | 4 | oclweb3 | 2024-05-27 | moderate |
| 1758 | Mapping Listing View | TermBrowser | keep | 4 | oclweb3 | 2024-02-06 | moderate |
| 1670 | Collection bug - collection isn't displaying the l... | API | review | 4 | oclapi2, oclweb2 | 2023-10-27 | moderate |
| 757 | Implement optional country code support for locale... | API | keep | 4 | oclweb2 | 2021-06-02 | moderate |
| 2204 | Filtering of target repo | Mapper | keep | 4 | oclapi2 | 2025-07-31 | moderate |
| 2151 | Error bulk importing mapping resource | API | keep | 4 | oclapi2 | 2025-04-21 | moderate |
| 1957 | Test load baseline content via NPM import | API | keep | 4 | oclapi2 | 2025-02-04 | moderate |
| 2042 | Do not schedule all bulk import subtasks at once | API | keep | 4 | oclapi2 | 2025-01-24 | moderate |
| 2041 | Do not import npm hl7.fhir.r4.core 4.0.1 if listed... | API | keep | 4 | oclapi2 | 2025-01-24 | moderate |
| 1839 | Add code searchParam for CodeSystem | API | review | 4 | oclapi2 | 2024-05-21 | moderate |
| 1815 | FHIR CodeSystem Fixes | API | review | 4 | oclapi2 | 2024-05-09 | moderate |
| 1761 | Add FHIR xml support | API | review | 4 | oclapi2 | 2024-05-01 | moderate |
| 828 | Automatically generate changelog for oclweb2, ocla... | DevEx | close-outdated | 4 | oclapi2 | 2021-07-19 | moderate |
| 32 | Org and repository backup/restore | API | review | 3 | oclapi2, oclmap | 2026-01-20 | moderate |
| 2021 | CTA / Organization / Delete | TermBrowser | keep | 2 | oclweb3 | 2025-05-08 | moderate |
| 1997 | CTA / Concept / Retire | TermBrowser | keep | 2 | oclweb3 | 2025-04-30 | moderate |
| 2000 | CTA / Mapping / Create | TermBrowser | keep | 2 | oclweb3 | 2025-04-28 | moderate |
| 1980 | CTA / Repository / Create version | TermBrowser | keep | 2 | oclweb3 | 2025-04-24 | moderate |
| 1991 | CTA / Concept / Edit | TermBrowser | keep | 2 | oclweb3 | 2025-04-17 | moderate |
| 1951 | Repo - Overview | Design | keep | 2 | oclweb3 | 2024-11-04 | moderate |
| 1875 | Data tables | Design | keep | 2 | oclweb3 | 2024-09-24 | moderate |
| 1696 | Canonical URL Registry | API | keep | 2 | oclweb3 | 2024-04-03 | moderate |
| 1681 | Search for some locales is broken | TermBrowser | close-outdated | 2 | oclweb2 | 2026-03-13 | moderate |
| 2040 | Issue import task state update after previous stat... | TermBrowser | close-outdated | 2 | oclweb2 | 2025-01-23 | moderate |
| 1959 | Support NPM file upload in bulk import UI | TermBrowser | keep | 2 | oclweb2 | 2024-12-13 | moderate |
| 1673 | Datatype Dropdown bug - cannot use one of my commo... | TermBrowser | close-outdated | 2 | oclweb2 | 2023-10-03 | moderate |
| 2136 | Missing Collection Export Attribute | API | keep | 2 | oclapi2 | 2025-03-26 | moderate |
| 1923 | Persist partial progress for new bulk import | API | keep | 2 | oclapi2 | 2025-01-23 | moderate |
| 2030 | FHIR endpoints must be handled with or without tra... | API | keep | 2 | oclapi2 | 2024-11-27 | moderate |
| 1962 | Record repos+versions that did and did not resolve... | API | keep | 2 | oclapi2 | 2024-10-24 | moderate |
| 1840 | CodeSystem listing should include total | API | review | 2 | oclapi2 | 2024-05-17 | moderate |
| 1836 | FHIR ConceptMap fails to import due to "null" map_... | API | review | 2 | oclapi2 | 2024-05-14 | moderate |
| 1336 | Speed up tests by getting rid of delete_all and re... | API | close-stale | 2 | oclapi2 | 2022-07-14 | moderate |
| 12 | Ability to check if new versions of resources refe... | TermBrowser | close-stale | 1 | oclweb3 | 2026-03-16 | weak |
| 808 | Custom View Configuration in TermBrowser | TermBrowser | close-outdated | 1 | oclapi2 | 2025-11-25 | weak |
| 731 | Backup configuration for elastic search | Infrastructure | keep | 1 | oclapi2 | 2024-07-12 | weak |
| 132 | Create smarter (& smaller) import results response... | API | review | 1 | oclapi2 | 2021-12-21 | weak |
| 13 | Ability to update collection references to latest ... | TermBrowser | close-stale | 1 | oclapi2 | 2021-06-11 | weak |
| 41 | Support "social authentication" via Keycloak | API | review | 1 | ocl-docs | 2023-10-23 | weak |
