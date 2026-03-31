# Section 5: Appendices

## Appendix A: Issue Index

All 314 issues in the api2 bucket, organized by state (OPEN first, then CLOSED), sorted by issue number within each group.

**Section Reference Key:**
- **2** = Completed work (Section 2)
- **3** = Open issues to keep (Section 3)
- **4** = Close/review candidates (Section 4)

### OPEN Issues (55)

| # | Title | Disposition | Subcategory | Section |
|---|-------|-------------|-------------|---------|
| 386 | Refactor lookup value schema for oclapi2 | close-stale | General | 4 |
| 426 | [OCLAPI2] Make redoc load faster | close-stale | API Documentation | 4 |
| 471 | Case Sensitive Search with extras attribute | close-stale | Bug | 4 |
| 588 | Org export | review | Import/Export | 4 |
| 745 | [OCLAPI2] Optimize search results using 'match_phrase' | close-stale | Search/Elasticsearch | 4 |
| 753 | Add "DELETE_IF_EXISTS" action into bulk import | close-stale | Import/Export | 4 |
| 757 | Implement optional country code support for locales | keep | Locales/Names | 3 |
| 828 | Automatically generate changelog for OCL primary repos | close-outdated | FHIR | 4 |
| 878 | Name_type Standardization | keep | Enhancement | 3 |
| 957 | Improve memory management for import tasks | keep | Import/Export | 3 |
| 1087 | OCL Connector Documentation | close-stale | API Documentation | 4 |
| 1194 | Changing an ID for an org, source, collection, etc. | keep | Collections | 3 |
| 1286 | Retire any APIs/data that use both repo version and resource version | close-outdated | Sources/Repos | 4 |
| 1310 | Implement recursive real-time expansions | keep | Collections | 3 |
| 1327 | Constrain processing of repo versions to be "consistent" within an expansion | keep | Collections | 3 |
| 1336 | Speed up tests by getting rid of delete_all and relying on rollback | close-stale | Performance | 4 |
| 1357 | Expose hard DELETE of concept/mapping for standard users | keep | Mappings | 3 |
| 1396 | User should have option not to auto-import Mappings to retired concepts | keep | Import/Export | 3 |
| 1420 | Remove Flower dependency in OCLAPI | review | General | 4 |
| 1431 | Implement maintenance page | close-stale | General | 4 |
| 1475 | Update authentication documentation | close-stale | API Documentation | 4 |
| 1508 | Setup limits on bulk imports | keep | Import/Export | 3 |
| 1548 | Collection References bug - Using the term "Unresolved" incorrectly? | review | Search/Elasticsearch | 4 |
| 1596 | Update CSV Bulk Import to catch up with new features | keep | Import/Export | 3 |
| 1603 | Dynamically populate display_name based on request header | keep | Locales/Names | 3 |
| 1653 | Track request source of a POST/PUT | keep | Sources/Repos | 3 |
| 1657 | Better handle invalid import JSON/CSV errors | keep | Import/Export | 3 |
| 1665 | OpenMRS Custom Validation Schema: All FSNs and preferred names within a locale should be unique | keep | Search/Elasticsearch | 3 |
| 1666 | Introduce "Synonym" name type and remove "None" name type | keep | Locales/Names | 3 |
| 1670 | Collection bug - collection isn't displaying the latest version of the concept | review | Concepts | 4 |
| 1671 | Rename `uuid` field to `id` for concept names and descriptions | review | Search/Elasticsearch | 4 |
| 1705 | Ensure names & description have unique UUIDs (external IDs) within OpenMRS Custom Validation Schema | keep | Search/Elasticsearch | 3 |
| 1712 | Update incorrect request fields in Swagger | keep | API Documentation | 3 |
| 1723 | Upgrade to Django 5 | keep | Enhancement | 3 |
| 1730 | Upgrade to python3.12 | review | Enhancement | 4 |
| 1740 | Maintain original casing for facets in filter panel | keep | General | 3 |
| 1746 | Only create new concept/mapping version if the resource has changed | keep | Mappings | 3 |
| 1782 | Implement standalone reference support in CSV bulk import | keep | Import/Export | 3 |
| 1783 | Add missing GET request parameters to swagger: Concepts and Mappings | close-stale | API Documentation | 4 |
| 1784 | Add missing GET request parameters to swagger: Sources and Collections | close-stale | Search/Elasticsearch | 4 |
| 1785 | Add missing GET request parameters to swagger: Orgs and Users | review | API Documentation | 4 |
| 1805 | Repo Version Summary counts are often incorrect | keep | Bug | 3 |
| 1867 | Create independent script for standard and smart checksums for concepts and mappings | keep | Mappings | 3 |
| 1868 | Enable creating/importing/editing resource in an older repo version | keep | Import/Export | 3 |
| 1925 | Request: Automatically add self-map | review | Enhancement | 4 |
| 1944 | Investigate slow DB responses | keep | Performance | 3 |
| 1962 | Record repos+versions that did and did not resolve with an expansion | keep | Collections | 3 |
| 2023 | Write boolean logic/pseudocode for mapping search | keep | Search/Elasticsearch | 3 |
| 2039 | Index Descriptions | keep | General | 3 |
| 2118 | Finalize new bulk import streaming capability | keep | Import/Export | 3 |
| 2136 | Missing Collection Export Attribute | keep | Import/Export | 3 |
| 2151 | Error bulk importing mapping resource | keep | Bug | 3 |
| 2152 | Update the bulk import message attribute | keep | Import/Export | 3 |
| 2153 | Mappings should persist repo URLs as submitted by the user | keep | Mappings | 3 |
| 2159 | Source properties and filters | keep | Search/Elasticsearch | 3 |
| 2231 | Dynamic reference cascade should account for equivalence to avoid false validation errors | keep | Cascade | 3 |

### CLOSED Issues (259)

| # | Title | Disposition | Subcategory | Section |
|---|-------|-------------|-------------|---------|
| 22 | Add feature to exclude retired concepts and/or mappings from exports | close-done | Import/Export | 2 |
| 110 | Implement versioned releases for ocl api and web | close-done | Search/Elasticsearch | 2 |
| 218 | Modify oclapi2 so that the trailing slash (`/`) is optional | close-done | General | 2 |
| 310 | Revise list of response text, error messages, etc. for oclapi2 | close-done | General | 2 |
| 463 | Summarize all new features/breaking changes in oclapi2/oclweb2 & infrastructure as release notes and change log | close-done | Search/Elasticsearch | 2 |
| 467 | Implement source/collection summary tab on their details page | close-done | Collections | 2 |
| 585 | Implement multi-hierarchy support | close-done | Enhancement | 2 |
| 590 | Long-running DELETE source request | close-done | Sources/Repos | 2 |
| 623 | [OCLAPI2] Make sure all query parameters are present in Swagger | close-done | API Documentation | 2 |
| 649 | Optimize weighting of concept search results | close-done | Search/Elasticsearch | 2 |
| 661 | Need ability to delete an existing source that other sources/collections are referencing | close-done | Collections | 2 |
| 679 | API Search Query ignores terms when searching more than 4 terms | close-done | Bug | 2 |
| 685 | Additional Sort Pattern Option? | close-done | Enhancement | 2 |
| 688 | Additional Sort Features for Metadata Browser Configs | close-done | Search/Elasticsearch | 2 |
| 702 | Do not modify references into versioned resource expressions by default | close-done | Search/Elasticsearch | 2 |
| 703 | Getting a list of queued bulk imports shows inconsistent results | close-done | Bug | 2 |
| 704 | Add queuing feature to all bulk import methods | close-done | Import/Export | 2 |
| 712 | Clean up user accounts in OCL staging/production | close-done | Users/Orgs | 2 |
| 728 | [OCLAPI2] Ability to get concepts/mappings within a source that are or are not part of a collection | close-done | Mappings | 2 |
| 732 | Small tweak for OpenMRS validation schema | close-done | General | 2 |
| 737 | Update syntax for concept codes | close-done | Concepts | 2 |
| 746 | Planning for Concept Modification | close-done | Concepts | 2 |
| 749 | Improve efficiency of OpenMRS validation schema | close-done | Bug | 2 |
| 750 | Compile all OpenMRS validation rules/code applied in OCL | close-done | General | 2 |
| 754 | [UI] [API] Concept/Mapping versions should show there associations with Source/Collection versions | close-done | Mappings | 2 |
| 756 | Enable FHIR UI as a Feature Toggle | close-done | FHIR | 2 |
| 758 | Export Content-Type header | close-done | Bug | 2 |
| 761 | CSV support in Bulk Imports | close-done | Import/Export | 2 |
| 766 | Add version number to API | close-done | Versioning | 2 |
| 779 | Permissions Issue: Concepts appear in Global Search but the Source is restricted | close-done | Bug | 2 |
| 781 | to_concept_url not being populated as expected | close-done | Bug | 2 |
| 784 | Updating references | close-done | Bug | 2 |
| 795 | Optimize bulk import with hierarchy | close-done | Import/Export | 2 |
| 796 | Optimize bulk import with hierarchy | close-done | Import/Export | 2 |
| 799 | Show hierarchy in TermBrowser (when applicable) | close-done | Enhancement | 2 |
| 804 | Parallel Bulk Import to accept JSON Body | close-done | Import/Export | 2 |
| 806 | Enable downloading HEAD export for source admins | close-done | Import/Export | 2 |
| 807 | Failure to import mapping with code containing plus sign | close-done | Bug | 2 |
| 817 | Export of HEAD not yet working as expected | close-done | Bug | 2 |
| 818 | Implement new expansion resource | close-done | Collections | 2 |
| 820 | Allow Collection Reference from outside OCL | close-done | Collections | 2 |
| 823 | includeMappings/includeInverseMappings for a collection's concept should use the collection's scope | close-done | Mappings | 2 |
| 826 | [Bulk Import] Index resources in batches | close-done | Import/Export | 2 |
| 829 | Ability to filter users by last login | close-done | Users/Orgs | 2 |
| 830 | Script to generate changelog and release notes | close-done | FHIR | 2 |
| 838 | Ability to filter users by date joined | close-done | Users/Orgs | 2 |
| 844 | Bulk import queue entries disappearing | close-done | Bug | 2 |
| 845 | Unable to edit sources on staging due to timeout fetching Locales | close-done | Bug | 2 |
| 846 | Unexpected duplicate result from collection concepts | close-done | Bug | 2 |
| 852 | Make first monthly usage report | close-done | Sources/Repos | 2 |
| 853 | Cannot view concepts in private source as an org member | close-done | Bug | 2 |
| 860 | Support Self-mappings for OCL imports | close-done | Import/Export | 2 |
| 870 | Missing mappings | close-done | Mappings | 2 |
| 871 | Precompute Display_name and Display_locale, rather than computing in real time | close-done | Locales/Names | 2 |
| 872 | Separate out Localized Text table | close-done | General | 2 |
| 896 | Report to get content authored by user(s) | close-done | Auth/Permissions | 2 |
| 898 | Disable direct source query | close-done | Bug | 2 |
| 934 | (High Priority) FHIR CodeSystems and ValueSets not appearing in OCL API queries when using search parameters | close-done | FHIR | 2 |
| 935 | Bulk import issues: mapping ID case sensitivity and update vs. create | close-done | Bug | 2 |
| 947 | API fails to load pages for items above 10k | close-done | Bug | 2 |
| 951 | URGENT: PEPFAR bulk import stuck in production | close-done | Import/Export | 2 |
| 955 | Hyphenation of Concept Classes lead to Failure with CSV Import | close-done | Import/Export | 2 |
| 960 | [API] Package Updates | close-done | General | 2 |
| 963 | OpenMRS Validation external_id | close-done | Enhancement | 2 |
| 965 | Swagger to work with Gunicorn | close-done | API Documentation | 2 |
| 970 | Implement collections of collections | close-done | Collections | 2 |
| 971 | Making sure the resources URL are RESTful | close-done | Bug | 2 |
| 972 | Add org creator as a member to an org with no member in all environments | close-done | Users/Orgs | 2 |
| 977 | 500 error when getting facets | close-done | Bug | 2 |
| 988 | Elastic Search returns different/inaccurate results compared to postgres | close-done | Bug | 2 |
| 989 | Add unique constraint on concept and mapping external ID in OpenMRS Validation Schema | close-done | Mappings | 2 |
| 993 | Permissions may not all be applied during bulk import | close-done | Bug | 2 |
| 1000 | [OCLAPI2] Delete Code to migrate data from v1 to v2 | close-done | General | 2 |
| 1008 | Source summary slow queries | close-done | Performance | 2 |
| 1038 | Automate monthly usage report for Prod/Stg on the first of each month | close-done | Sources/Repos | 2 |
| 1044 | [OCLAPI2] Package updates | close-done | Enhancement | 2 |
| 1057 | $cascade for OpenMRS - Automatically add sets when parent concept is added to my collection | close-done | Cascade | 2 |
| 1070 | OpenMRS custom validation schema should allow duplicate non-preferred synonyms | close-done | General | 2 |
| 1088 | $cascade Operation MVP | close-done | Cascade | 2 |
| 1116 | Add response time in API logs | close-done | General | 2 |
| 1124 | Merge master into dev (collection expansion) branch | close-done | Collections | 2 |
| 1126 | Errbit Fixes | close-done | Bug | 2 |
| 1127 | Run Coverage on Bamboo CI | close-done | Testing/CI | 2 |
| 1128 | [UI] Big Source/Collection Async DELETE request | close-done | Collections | 2 |
| 1131 | $cascade API round 3, including references | close-done | Cascade | 2 |
| 1132 | Ability to get concept / mappings from a source that are not part of a collection | close-done | Mappings | 2 |
| 1135 | Authenticated users should be able to view other user profiles | close-done | Auth/Permissions | 2 |
| 1136 | Migration script from old to new-style collections | close-done | Collections | 2 |
| 1145 | Implement API to return status of any task in API | close-done | Async/Queue | 2 |
| 1154 | API to make a user an admin (and vice-versa) | close-done | Users/Orgs | 2 |
| 1155 | Upgrade to Django4 | close-done | General | 2 |
| 1156 | Implement simple UI for management of Org Overview page | close-done | Users/Orgs | 2 |
| 1157 | Source/Collection Version not populating all HEAD's attributes | close-done | Bug | 2 |
| 1161 | OCL not properly handling some mappings with unusual codes | close-done | Bug | 2 |
| 1163 | Errbits - 20Dec21 to 2Jan22 | close-done | General | 2 |
| 1164 | Merge Collections Expansions to master | close-done | Collections | 2 |
| 1168 | $cascade response as hierarchy | close-done | Cascade | 2 |
| 1169 | Concept $cascade Hierarchy Visualization | close-done | Cascade | 2 |
| 1175 | Dev Environment: DELETEs take a long time | close-done | Bug | 2 |
| 1176 | Dev Environment Regression: GET requests for a non-existing concept return 200 | close-done | Concepts | 2 |
| 1179 | source/collection summaries show zero results if the actual summary isn't available | close-done | Search/Elasticsearch | 2 |
| 1197 | FSN error when adding a new concept in a source | close-done | Bug | 2 |
| 1198 | Outline rules for $cascade determining whether a node is "terminal" | close-done | Search/Elasticsearch | 2 |
| 1204 | Collection Reference association with computed concepts/mappings | close-done | Mappings | 2 |
| 1205 | Collection Version export should wait for auto expansion to be processed | close-done | Import/Export | 2 |
| 1206 | Remove concepts/mappings associations from collection versions | close-done | Mappings | 2 |
| 1208 | Outline rules for OCL resolving mapping sources (relative vs. canonical) | close-done | Search/Elasticsearch | 2 |
| 1215 | Handle bad CSV file upload error | close-done | Bug | 2 |
| 1221 | Implement $resolveReference API operation | close-done | Collections | 2 |
| 1224 | Restrict $cascade to the repo version by default | close-done | Cascade | 2 |
| 1225 | Change processing of expansions in bulk import scripts to be synchronous | close-done | Import/Export | 2 |
| 1235 | ConceptMap Operations | close-done | FHIR | 2 |
| 1239 | TermBrowser mapping incorrectly shows concepts as not being defined in OCL | close-done | Bug | 2 |
| 1241 | All direct concept details links in TermBrowser should display concept details | close-done | Bug | 2 |
| 1245 | Extras.exact api query not working as expected | close-done | Bug | 2 |
| 1258 | Add support for "update_comment" field in bulk import | close-done | Import/Export | 2 |
| 1261 | Use ES by default for Term Browser | close-done | Search/Elasticsearch | 2 |
| 1262 | Performance - Repo HEAD to not contain all resource versions | close-done | Performance | 2 |
| 1265 | Parameters for Expansions | close-done | Collections | 2 |
| 1267 | Delete old repo HEAD exports from S3 once a new export is uploaded | close-done | Import/Export | 2 |
| 1268 | ES not catching up with DB on Staging | close-done | Bug | 2 |
| 1275 | Implement expanded collection references & support for canonical URLs | close-done | FHIR | 2 |
| 1276 | Collection/Version/Expansion Concepts/Mappings CSV Error (from Errbit) | close-done | Bug | 2 |
| 1278 | Cannot delete concepts from a collection's Concepts tab | close-done | Bug | 2 |
| 1283 | CIEL Synonym Search for CHF (Congestive Heart Failure) not working | close-done | Bug | 2 |
| 1285 | Exports: Security Issue | close-done | Bug | 2 |
| 1290 | Auto-expand HEAD not being updated when deleting a reference | close-done | Bug | 2 |
| 1292 | API Development: Exclusion References | close-done | Collections | 2 |
| 1295 | Implement $cascade within a collection version | close-done | Cascade | 2 |
| 1301 | Collections Bug: Not bringing over names, descriptions, and attributes | close-done | Bug | 2 |
| 1303 | Concept shows up multiple times in source versions other than HEAD | close-done | Bug | 2 |
| 1305 | Parallel Import to handle resource's multiple updates synchronously | close-done | Bug | 2 |
| 1307 | Save resolved repo versions with an expansion | close-done | Collections | 2 |
| 1310 | Implement recursive real-time expansions | keep | Collections | 3 |
| 1311 | Use "best match" sorting by default for org search | close-done | Bug | 2 |
| 1319 | [Tech] Upgrade to pylint 2.14 | close-done | General | 2 |
| 1320 | Concepts/mappings appearing twice in collection | close-done | Bug | 2 |
| 1321 | Support starts with &/or exact match on custom attribute search when criteria includes hyphen | close-done | Bug | 2 |
| 1323 | Auto-ID - Handling existing sources | close-done | Sources/Repos | 2 |
| 1329 | Make canonical_url a URI instead of URL | close-done | General | 2 |
| 1330 | Change localized_text index to be hash based instead of b-tree | close-done | Checksums | 2 |
| 1332 | Old Reference/Expansion Migration/Backfills | close-done | Collections | 2 |
| 1333 | [SPIKE] Keycloak | close-done | General | 2 |
| 1338 | [SSO] KeyCloak Setup and Implementation | close-done | Enhancement | 2 |
| 1342 | Import for another user showing up in import queue | close-done | Import/Export | 2 |
| 1343 | Converting references into "plain english" | close-done | Search/Elasticsearch | 2 |
| 1351 | Term Browser Search incorrectly shows "no results" if hyphen is used in ID string | close-done | Search/Elasticsearch | 2 |
| 1352 | Filters panel not populating with certain search terms | close-done | Search/Elasticsearch | 2 |
| 1353 | Delete database field Collection.repository_type | close-done | Collections | 2 |
| 1354 | Support `retired` field for mappings in CSV bulk import | close-done | Import/Export | 2 |
| 1370 | "Add to collection" failing on a particular CIEL concept - cascade bug? | close-done | Bug | 2 |
| 1382 | Default language should automatically be added to Supported Languages for sources/collections | close-done | Search/Elasticsearch | 2 |
| 1387 | Setup Celery Beat Service | close-done | Async/Queue | 2 |
| 1399 | Split localized_text into 2 tables | close-done | General | 2 |
| 1406 | Supporting multiple parameters in Expansions | close-done | FHIR | 2 |
| 1407 | Dev contributions documentation | close-done | API Documentation | 2 |
| 1429 | Cascade Documentation, round 2 | close-done | Cascade | 2 |
| 1437 | OpenMRS Cascade bug encountered on Demo | close-done | Bug | 2 |
| 1446 | Sort Weight on Mappings | close-done | Mappings | 2 |
| 1449 | Monthly Report Changes | close-done | Sources/Repos | 2 |
| 1450 | Remove "uuid" from cascade response | close-done | Cascade | 2 |
| 1451 | Implement $cascade omitIfExistsIn & equivalencyMapType parameters | close-done | Cascade | 2 |
| 1453 | Implement clone operation | close-done | Enhancement | 2 |
| 1462 | Activate SSO on QA to prepare for testing | close-done | Testing/CI | 2 |
| 1463 | Missing concept name in mapping section | close-done | Bug | 2 |
| 1467 | API ability to generate a summary of map sources for a repository | close-done | Search/Elasticsearch | 2 |
| 1469 | Counts of concepts incorrect | close-done | Bug | 2 |
| 1485 | "Add to Collection" bug for a particular concept - Backend data bug? | close-done | Bug | 2 |
| 1492 | Unable to delete source in production | close-done | Bug | 2 |
| 1495 | Implement a collections summary tab | close-done | Collections | 2 |
| 1497 | FHIR Feedbacks/issues | close-done | FHIR | 2 |
| 1498 | Source Delete InvalidCursorName Error | close-done | Bug | 2 |
| 1499 | Index/facet mismatch for hierarchy meaning/custom validation schema | close-done | Bug | 2 |
| 1501 | Bulk Import to accept Zip file for single JSON/CSV file | close-done | Import/Export | 2 |
| 1507 | TB must report tasks that are pending in queue | close-done | Bug | 2 |
| 1510 | Implement Feature Toggles | close-done | General | 2 |
| 1513 | Bug: Concept appears twice in collection when searching | close-done | Bug | 2 |
| 1521 | Global search showing content that I don't have permission to see? | close-done | Bug | 2 |
| 1524 | Summary tab of CIEL on Prod is failing | close-done | Bug | 2 |
| 1527 | Source Version Summary APIs | close-done | Sources/Repos | 2 |
| 1528 | Source/Collection API include resources | close-done | Collections | 2 |
| 1533 | Review changes to indexes | close-done | Search/Elasticsearch | 2 |
| 1540 | Make Operations panel available to specific non-admin users | close-done | Users/Orgs | 2 |
| 1544 | Repo Export Performance Updates | close-done | Import/Export | 2 |
| 1547 | Duplicate concepts appearing on Prod in Global Search | close-done | Bug | 2 |
| 1549 | Auto-assign ID Enhancement - Ability to switch scheme when editing a source | close-done | Sources/Repos | 2 |
| 1550 | Update bulk importer to support auto-ID assignment | close-done | Import/Export | 2 |
| 1551 | Deprecate legacy bulk importer endpoints | close-done | Import/Export | 2 |
| 1557 | Export throwing 500 error on staging and cannot delete/recreate | close-done | Bug | 2 |
| 1559 | 502 error (timeout) when adding 30 references | close-done | Bug | 2 |
| 1562 | Missing concepts in collection defined with expansions | close-done | Bug | 2 |
| 1563 | Adding cascading reference fails if concept already exists in collection with OpenMRS validation schema | close-done | Bug | 2 |
| 1564 | Remove unused fields from concept | close-done | Concepts | 2 |
| 1565 | Collection limited to 1024 references | close-done | Collections | 2 |
| 1566 | Collection references do not include retired concepts | close-done | Bug | 2 |
| 1567 | Term browser shows inconsistent numbers of concepts due to retired | close-done | Bug | 2 |
| 1578 | Fuzzy Matching | close-done | Enhancement | 2 |
| 1583 | Enhance Search and Add mappings into concept search | close-done | Search/Elasticsearch | 2 |
| 1586 | SSO Problem? Duplicate users | close-done | Bug | 2 |
| 1588 | Importable Exports | close-done | Import/Export | 2 |
| 1591 | Option to view results with retired concepts does not work | close-done | Bug | 2 |
| 1593 | Bug when searching mappings? | close-done | Bug | 2 |
| 1595 | Improve Auto-Generated Zip Export Name Convention | close-done | Import/Export | 2 |
| 1597 | Migrate from ES to OpenSearch | close-done | Search/Elasticsearch | 2 |
| 1598 | Custom Attribute Summary API | close-done | General | 2 |
| 1609 | Display Name of codes in ValueSets should auto-populate | close-done | Bug | 2 |
| 1633 | Improve Monthly Usage Report | close-done | Sources/Repos | 2 |
| 1643 | Unexpected behavior - Add to Collection Bug? | close-done | Bug | 2 |
| 1645 | Unable to find collection by canonical URL | close-done | Bug | 2 |
| 1646 | Add References Bug | close-done | Bug | 2 |
| 1647 | I need help removing 2 concepts because of duplicate ID code | close-done | Bug | 2 |
| 1656 | Filter Pane showing irrelevant filters | close-done | Bug | 2 |
| 1659 | Features for Auditing Content in a Source | close-done | Search/Elasticsearch | 2 |
| 1664 | Concept ID Bug | close-done | Bug | 2 |
| 1667 | Failing DELETE Reference Endpoint on Swagger? | close-done | Bug | 2 |
| 1669 | Searching an ID doesn't give the precise search I expect | close-done | Search/Elasticsearch | 2 |
| 1672 | Fix duplicate Q-AND-A concept showing up in MapTypes source | close-done | Bug | 2 |
| 1674 | Implement Standard & Smart Checksums (round 2) | close-done | Checksums | 2 |
| 1675 | 400 Error on Summary API | close-done | Bug | 2 |
| 1677 | Add Map Type filter | close-done | Bug | 2 |
| 1679 | Collection Bug: Concept still appears in collection HEAD after removing reference | close-done | Bug | 2 |
| 1682 | Auto-assign sort order | close-done | General | 2 |
| 1683 | Auto-assign UUIDs for concept names and descriptions | close-done | Search/Elasticsearch | 2 |
| 1686 | Implement global endpoint for searching across repository types | close-done | Search/Elasticsearch | 2 |
| 1701 | Implement canonical url filter param for repos, sources, collections | close-done | Collections | 2 |
| 1709 | Index Term name type not accepted with OpenMRS Validation Schema | close-done | Bug | 2 |
| 1713 | POST CodeSystem and ValueSet fails due to DB cursor being unsupported | close-done | FHIR | 2 |
| 1728 | Support db user, redis and es credentials | close-done | Search/Elasticsearch | 2 |
| 1729 | Add support for Azure Storage as an alternative to S3 | close-done | General | 2 |
| 1731 | Repo Version Permissions (featuring LOINC) | close-done | Auth/Permissions | 2 |
| 1735 | Total time of processing for Exports | close-done | Import/Export | 2 |
| 1753 | Generate diff between 2 repo versions | close-done | Sources/Repos | 2 |
| 1760 | Minor monthly report improvements | close-done | Sources/Repos | 2 |
| 1764 | Reference Evaluation not working for references with collection context | close-done | Bug | 2 |
| 1777 | Maintain Tasks in Postgres | close-done | Async/Queue | 2 |
| 1779 | Exports should not be exposed without authentication | close-done | Import/Export | 2 |
| 1789 | When Hyphen used in the Search, not returning Concepts | close-done | Bug | 2 |
| 1794 | Support hyphens in external_id search | close-done | Bug | 2 |
| 1795 | Investigate why Add to Collection failed, failed, failed, then succeeded | close-done | Collections | 2 |
| 1806 | Show Export Time in User Interface | close-done | Import/Export | 2 |
| 1814 | Generate changelog between 2 repo versions | close-done | Sources/Repos | 2 |
| 1824 | New Cascade option - Transform to dynamic references | close-done | Cascade | 2 |
| 1825 | Simple error message fix for adding references to a collection | close-done | Search/Elasticsearch | 2 |
| 1841 | Special characters in CodeSystem/ValuSet Version | close-done | FHIR | 2 |
| 1842 | OCL API returns wrong FHIR url | close-done | Bug | 2 |
| 1844 | [Checksums] Test Import (using CIEL) with duplicate resources | close-done | Import/Export | 2 |
| 1845 | Deadlock on Expansion delete while its getting evaluated | close-done | Bug | 2 |
| 1849 | Handle too long search input | close-done | Bug | 2 |
| 1850 | Whenever I try to add references to a Collection using an implicit criterium, the references are unresolved | close-done | Search/Elasticsearch | 2 |
| 1884 | API: Get current status of indexing for a repository, plus a method for restarting failed indexes | close-done | Sources/Repos | 2 |
| 1907 | Bulk Import capability - Delete Reference | close-done | Import/Export | 2 |
| 1912 | Issue with bulk import status response | close-done | Import/Export | 2 |
| 1921 | Restrict FSN uniqueness to FSNs and preferred names for OpenMRS custom validation schema | close-done | Search/Elasticsearch | 2 |
| 1936 | Pre-populate events | close-done | General | 2 |
| 1946 | Fix monthly report automated email | close-done | Sources/Repos | 2 |
| 2024 | Implement mappings custom attribute support for CSV import | close-done | Import/Export | 2 |
| 2055 | Implement basic $match endpoint | close-done | General | 2 |
| 2170 | Implement cache on first page of latest version of all repos | close-done | Sources/Repos | 2 |
| 2197 | /repos/ ownerType and repoType URL params | close-done | Sources/Repos | 2 |

**Note:** Issue #1310 appears in the CLOSED table because its GitHub state is CLOSED, but its disposition is "keep" (high priority), indicating it was resolved but its pattern/approach remains relevant for ongoing work.

---

## Appendix B: Contributor Map

### Assigned Contributors

| Username | Issues Assigned | Primary Subcategories | Notable Issues |
|----------|---------------:|----------------------|----------------|
| snyaggarwal | 252 | Bug (56), Import/Export (35), Search/Elasticsearch (28) | #218, #310, #426, #585, #649 |
| paynejd | 34 | Import/Export (8), Collections (5), Cascade (4) | #463, #703, #704, #757, #878 |
| rkorytkowski | 20 | Search/Elasticsearch (4), FHIR (4), Bug (3) | #110, #649, #845, #965, #1235 |
| jamlung-ri | 15 | Enhancement (3), Import/Export (3), Collections (2) | #585, #746, #756, #1156, #1278 |
| PatrickCmd | 1 | Bug (1) | #988 |
| bmamlin | 2 | Sources/Repos (1), Bug (1) | #1549, #1709 |
| paulsonder | 2 | General (1), Import/Export (1) | #1431, #1806 |
| WestOnyinsi | 1 | API Documentation (1) | #1785 |
| delcroip | 0 | (commenter only) | #2151 (commenter) |

### Unassigned Issues

**52 issues** have no assignee. These are concentrated in:
- Later eras (V3 Development, V3 Maturation, Current), suggesting a shift toward community-filed issues
- "keep" and "review" dispositions, indicating open feature requests and design decisions without an assigned owner
- Notable unassigned issues: #1310, #1327, #1357, #1396, #1666, #1705, #1782, #2159

### Key Observations

- **snyaggarwal** is the dominant contributor, assigned to 80% of all issues (252/314). He is effectively the sole backend engineer for oclapi2 across the entire timeline.
- **paynejd** acts primarily in a product/architecture role, assigned to cross-cutting issues involving design decisions, cascading, and import/export workflows.
- **rkorytkowski** focuses on FHIR integration, infrastructure, and search/Elasticsearch concerns.
- **jamlung-ri** contributes across UI-API boundary issues and testing/validation work.
- The remaining contributors (PatrickCmd, bmamlin, paulsonder, WestOnyinsi) have minimal assignment counts, typically for specific targeted issues.

---

## Appendix C: Era Timeline

| Era | Issue Count | Date Range | Key Characteristics |
|-----|------------:|------------|---------------------|
| **Pre-oclapi2** | 9 | Feb 2018 -- Nov 2020 | Legacy issues filed before oclapi2 development began. Mostly enhancement requests and technical debt from oclapi v1. Many were carried forward and eventually resolved or became stale. |
| **oclapi2 Launch** | 91 | Feb 2021 -- Dec 2021 | Highest-volume era. Intense feature development and bug fixing during initial oclapi2 rollout. Covers sprints 10-17. Bulk import, collections, cascade, FHIR, and search/ES work dominated. |
| **Post-Launch** | 71 | Jan 2022 -- Dec 2022 | Stabilization and hardening phase. Heavy bug fixing (collections, search, ES sync issues), plus SSO/Keycloak implementation, expansion parameters, and performance optimization. |
| **V3 Development** | 62 | Jan 2023 -- Dec 2023 | Feature maturation for TermBrowser v3. Focus on search improvements, OpenMRS validation schema refinements, checksums, auto-ID/UUID assignment, fuzzy matching, and importable exports. |
| **V3 Maturation** | 42 | Jan 2024 -- Nov 2024 | Refinement and infrastructure hardening. Checksums finalization, Azure storage support, version diffs/changelogs, dynamic reference cascading, and bulk import streaming. Higher proportion of "keep" issues indicating forward-looking work. |
| **Current** | 39 | Jan 2025 -- Sep 2025 | Active development. Source properties and filters, $match endpoint, bulk import streaming finalization, collection export improvements. 12 issues still open, reflecting ongoing priorities. |

### Era Distribution Summary

```
Pre-oclapi2:      ████ 9 (3%)
oclapi2 Launch:   ████████████████████████████████████████████████ 91 (29%)
Post-Launch:      █████████████████████████████████████ 71 (23%)
V3 Development:   ████████████████████████████████ 62 (20%)
V3 Maturation:    █████████████████████ 42 (13%)
Current:          ████████████████████ 39 (12%)
```

The distribution shows a classic product lifecycle: rapid feature development during launch, stabilization post-launch, and a gradual settling into maintenance and targeted feature work in later eras.
