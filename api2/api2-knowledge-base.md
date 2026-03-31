# oclapi2 Bucket Knowledge Base: Section 1 -- Executive Summary

**Generated:** 2026-03-26
**Scope:** 314 issues with the `api2` label, not covered by TBv3, Design, Epic/Meta, or V3-unreviewed analyses
**Source:** [OpenConceptLab/ocl_issues](https://github.com/OpenConceptLab/ocl_issues) GitHub repository
**Companion data:** `api2-raw-archive.json` (314 issues, 1,367 comments), `api2-issue-classification.csv` (314-row analysis)

---

## 1.1 What Is oclapi2

oclapi2 is the Django REST API backend for the Open Concept Lab (OCL) platform, replacing the original Java-based oclapi (v1). Built on Django REST Framework with PostgreSQL, Elasticsearch (later OpenSearch), Celery, and Redis, oclapi2 provides the full suite of terminology management services: CRUD for organizations, users, sources, collections, concepts, and mappings; bulk import/export pipelines; FHIR-compliant serialization; cascading operations; versioning; and search. It serves as the backend for both the TermBrowser v2 (oclweb2) and the in-development TermBrowser v3 (oclweb3), as well as external API consumers including the OCL Mapper.

This analysis covers the **api2 bucket** -- the 314 issues labeled `api2` that were not already classified under the TBv3, Design, Epic/Meta, or V3-unreviewed buckets. These issues represent the core API engineering work: bug fixes, feature implementation, infrastructure improvements, and operational concerns that shaped the oclapi2 platform from its pre-launch origins through its current production state.

## 1.2 Issue Status

| Status | Count |
|---|---|
| CLOSED | 259 |
| OPEN | 55 |
| **Total** | **314** |

## 1.3 Key Contributors

The assignee data reveals a tightly concentrated contributor model:

| Contributor | Role / Focus | Assigned Issues |
|---|---|---|
| **@snyaggarwal** (Sunny Aggarwal) | Primary API engineer; implemented the vast majority of features, bug fixes, and infrastructure work | ~250+ (appears on nearly every issue) |
| **@rkorytkowski** (Rafal Korytkowski) | Infrastructure, FHIR, DevOps; led migration work, FHIR operations, and infra concerns | ~30 (often co-assigned) |
| **@paynejd** (Jonathan Payne) | Product owner, architecture, requirements; defined specifications and reviewed implementations | ~30 (often co-assigned as reviewer/specifier) |
| **@jamlung-ri** (James Amlung) | QA, user stories, testing; involved in validation schema and cascade-related work | ~10 |
| **@bmamlin** (Burke Mamlin) | Clinical domain expertise; contributed to OpenMRS validation and naming conventions | ~5 |
| **@PatrickCmd** | Contributor on specific search/ES issues | ~2 |
| **@paulsonder** (Paul Sonder) | UI/UX design input on export display and error messages | ~3 |
| **@WestOnyinsi** | Contributor on Swagger documentation | ~1 |

The pattern is consistent: @paynejd defines requirements and acceptance criteria, @snyaggarwal implements them, @rkorytkowski handles infrastructure and FHIR-specific work, and @jamlung-ri performs QA and user acceptance testing.

## 1.4 Timeline

The 314 issues span from early 2018 through mid-2025, divided into six eras:

| Era | Period | Issues | Description |
|---|---|---|---|
| **Pre-oclapi2** | 2018-02 to 2020-11 | 9 | Enhancement requests filed against the original v1 API or early oclapi2 planning |
| **oclapi2 Launch** | 2021-02 to 2021-12 | 100 | The initial build-out and launch of oclapi2, including bulk import, export, search, FHIR, cascade, and collections infrastructure |
| **Post-Launch** | 2022-01 to 2022-12 | 73 | Stabilization, bug fixing, and feature expansion after production deployment; collection expansions, SSO/Keycloak, and performance improvements |
| **V3 Development** | 2023-01 to 2023-12 | 78 | Maturation of core API capabilities to support TBv3; auto-ID, checksums, fuzzy matching, OpenSearch migration, and continued collections/cascade refinement |
| **V3 Maturation** | 2024-01 to 2024-11 | 43 | Hardening and advanced features: Azure storage support, changelog generation, dynamic references, streaming imports, and checksum infrastructure |
| **Current** | 2025-01 to 2025-09 | 11 | Active work: source properties/filters, caching, $match endpoint, import streaming, and repo type URL parameters |

The heaviest period of activity was **oclapi2 Launch (2021)** with 100 issues, reflecting the intensity of building out the new API from scratch and migrating production workloads. Activity remained high through Post-Launch and V3 Development (73 and 78 issues respectively), then tapered during V3 Maturation as the platform stabilized.

## 1.5 Subcategory Spread

Issues were classified into functional subcategories reflecting the API's domain areas:

| Subcategory | Count | Description |
|---|---|---|
| **Bug** | 85 | Defect reports across all functional areas |
| **Import/Export** | 42 | Bulk import pipelines, export generation, CSV/JSON/ZIP support |
| **Search/Elasticsearch** | 33 | Search relevance, facets, ES/OpenSearch indexing, query behavior |
| **Collections** | 24 | Collection references, expansions, exclusion references, recursive expansion |
| **Sources/Repos** | 17 | Source management, repo versions, summaries, auto-ID, monthly reports |
| **Mappings** | 13 | Mapping CRUD, sort weight, inverse mappings, hard delete |
| **Cascade** | 12 | $cascade operation across multiple rounds of specification and implementation |
| **FHIR** | 10 | FHIR CodeSystem/ValueSet serialization, ConceptMap operations, FHIR URL handling |
| **Enhancement** | 10 | Cross-cutting enhancements not fitting a single domain |
| **API Documentation** | 9 | Swagger completeness, authentication docs, connector docs |
| **General** | 9 | Framework upgrades (Django 4/5, pylint), package updates, feature toggles |
| **Users/Orgs** | 8 | User/org management, admin APIs, user filtering |
| **Locales/Names** | 5 | Country code support, display name population, name type changes |
| **Auth/Permissions** | 4 | Repo version permissions, user profile visibility, content authorship reports |
| **Concepts** | 4 | Concept code syntax, concept modification planning, unused field removal |
| **Performance** | 4 | Query optimization, source summary performance, DB response investigation |
| **Async/Queue** | 3 | Task status API, Celery Beat setup, task persistence in Postgres |
| **Checksums** | 3 | Standard and smart checksums, localized text index changes |
| **Testing/CI** | 3 | CI coverage, SSO QA activation, test speed improvements |
| **Versioning** | 2 | API version numbering, repo version attribute handling |

## 1.6 Disposition Summary

Each issue was assigned a disposition indicating its recommended treatment:

| Disposition | Count | Meaning |
|---|---|---|
| **close-done** | 258 | Work completed; issue can be confirmed closed |
| **keep** | 35 | Issue remains relevant and should stay open for future work |
| **close-stale** | 11 | Issue has gone stale with no activity; no longer actionable |
| **review** | 8 | Needs human review to determine correct disposition |
| **close-outdated** | 2 | Requirements have been superseded or are no longer applicable |

The overwhelming majority (258 of 314, 82%) are completed work. The 35 "keep" issues represent the active backlog for oclapi2, including high-priority items like:
- Source properties and filters (#2159) -- FHIR CodeSystem property/filter support
- Finalize new bulk import streaming (#2118)
- Repo version summary count accuracy (#1805)
- Investigate slow DB responses (#1944)
- Only create new concept/mapping version if resource has changed (#1746)
- Dynamic reference cascade with equivalence (#2231)
- Index descriptions in ES (#2039)

The 8 "review" issues require human judgment, including an org export feature request (#588), a Flower dependency removal (#1420), a collection reference "Unresolved" semantics question (#1548), and potential Python/Django version upgrades (#1730).

## 1.7 Key Themes

Several cross-cutting themes emerge from this bucket:

1. **Import/Export pipeline maturation.** From basic bulk import (#704) through CSV support (#761), hierarchy optimization (#795, #796), ZIP uploads (#1501), streaming imports (#2118), and authenticated exports (#1779), the import/export system evolved from a simple JSON ingestion tool into a full-featured, production-grade pipeline.

2. **Collections and expansions.** The collection model underwent fundamental redesign: from simple reference lists to expansion-based evaluation (#818), exclusion references (#1292), recursive expansion (#1310), canonical URL resolution (#1275, #1701), and dynamic references with cascade (#1824, #2231).

3. **Search infrastructure.** The search system progressed through multiple generations: initial ES optimization (#649), synonym and fuzzy matching (#1283, #1578, #1583), migration to OpenSearch (#1597), and ongoing work on source properties/filters (#2159).

4. **Cascade operation.** The $cascade operation was built in iterative rounds: MVP (#1088), hierarchy response (#1168), reference integration (#1131), collection-scoped cascade (#1295), equivalency parameters (#1451), and dynamic reference transformation (#1824).

5. **Operational hardening.** Consistent attention to production reliability: error monitoring via Errbit (#1126), monthly usage reports (#852, #1038, #1633), task management (#1145, #1777), and performance investigation (#1944).

---

# oclapi2 Bucket Knowledge Base: Section 2 -- Completed Work

**Scope:** 259 CLOSED issues from the api2 bucket, organized by subcategory

---

## 2.1 Bug Fixes (85 issues closed)

Bug fixes represent the largest subcategory, spanning the full lifecycle of oclapi2 from launch through maturation. These reflect the reality of building a complex terminology management API -- edge cases in search, collections, mappings, and imports surfaced continuously as production usage grew.

### Search and Elasticsearch Bugs
- **Query behavior:** Search ignoring terms beyond 4 words (#679, Sprint 10), hyphen handling in ID and concept search (#1321, #1351, #1789, #1794), extras.exact queries not working (#1245)
- **Result accuracy:** ES returning different results than Postgres (#988), duplicate concepts in global search (#1547), concepts appearing twice in collections (#1320, #1513), filter pane showing irrelevant filters (#1656)
- **Facets and summaries:** 500 error on facets (#977), summary tab failures (#1524), 400 error on summary API (#1675), map type filter missing (#1677)
- **Permissions in search:** Restricted source concepts appearing in global search (#779), private content visible to unauthorized users (#1521)

### Collections and References Bugs
- **Duplicate/missing content:** Unexpected duplicate results (#846), concepts appearing twice (#1320), missing concepts in expansion-defined collections (#1562), concept still appearing after reference removal (#1679)
- **Reference handling:** Updating references (#784), auto-expand HEAD not updating on reference delete (#1290), collection limited to 1024 references (#1565), add-to-collection failures (#1370, #1485, #1643, #1646)
- **Data integrity:** Collections not bringing over names/descriptions/attributes (#1301), concepts showing up multiple times in non-HEAD versions (#1303), retired concepts excluded from collection references (#1566), inconsistent concept counts due to retired status (#1567)

### Import/Export Bugs
- **Import failures:** Mapping with plus sign in code (#807), hyphenation of concept classes in CSV (#955), bulk import queue entries disappearing (#844), permissions not applied during bulk import (#993), parallel import resource conflicts (#1305)
- **Export issues:** HEAD export not working (#817), export Content-Type header (#758), export security issue (#1285), export throwing 500 on staging (#1557)
- **Data issues:** Mapping ID case sensitivity (#935), bad CSV file upload errors (#1215), cascading reference failures with OpenMRS validation (#1563)

### Other Bugs
- **Performance:** DELETEs taking long time in dev (#1175), 502 timeout adding 30 references (#1559), deadlock on expansion delete (#1845), too-long search input (#1849)
- **API correctness:** GET for non-existing concept returning 200 (#1176), non-RESTful resource URLs (#971), to_concept_url not populated (#781), concept ID bugs (#1664)
- **SSO/Auth:** Duplicate users from SSO (#1586), reference evaluation failures (#1764)
- **FHIR:** OCL API returning wrong FHIR URL (#1842)

**Key contributors:** @snyaggarwal resolved the vast majority of bugs. @rkorytkowski assisted on infrastructure-related bugs (ES sync, source deletion cursors). Issues were concentrated in the oclapi2 Launch (2021) and Post-Launch (2022) eras, with a second wave during V3 Development (2023).

---

## 2.2 Import/Export (42 issues, 36 closed)

The import/export pipeline is the second-largest functional area, reflecting oclapi2's critical role as a data integration platform for health terminology content.

### Bulk Import Infrastructure
- **Foundation:** Add queuing to all bulk import methods (#704, Sprint 10), parallel bulk import accepting JSON body (#804), CSV support (#761)
- **Optimization:** Optimize bulk import with hierarchy (#795, #796, Sprint 12-13), index resources in batches (#826), change expansion processing to synchronous (#1225)
- **Enhancements:** Support self-mappings (#860), support `retired` field in CSV (#1354), `update_comment` field (#1258), `DELETE_IF_EXISTS` action (#753, stale), ZIP file support (#1501), auto-ID assignment in imports (#1550), deprecate legacy endpoints (#1551)
- **Production incidents:** PEPFAR bulk import stuck in production (#951), import queue entries disappearing (#844), import for another user showing in queue (#1342)
- **Maturation:** Importable exports round-trip (#1588), delete reference capability (#1907), mappings custom attribute support in CSV (#2024), checksums test import with CIEL (#1844), bulk import status response fix (#1912)

### Export Pipeline
- **Core features:** Feature to exclude retired concepts/mappings from exports (#22), enable downloading HEAD export for admins (#806), collection version export waiting for auto-expansion (#1205)
- **Operations:** Delete old HEAD exports from S3 (#1267), export performance updates (#1544), total processing time tracking (#1735), show export time in UI (#1806), authenticated exports (#1779)
- **Naming:** Improve auto-generated zip export name convention (#1595)

**Timeline:** Import/export work began at oclapi2 launch (Feb 2021) with basic queuing and CSV support, matured through 2022-2023 with hierarchy optimization and OpenMRS-specific features, and continues into 2025 with streaming imports and collection export improvements.

**Key contributors:** @snyaggarwal (primary implementer), @paynejd (requirements, especially around bulk import architecture), @rkorytkowski (production incident response), @jamlung-ri (QA for import workflows).

---

## 2.3 Search / Elasticsearch (33 issues, 27 closed)

Search infrastructure evolved through multiple generations as the platform's content and user base grew.

### Search Relevance and Behavior
- **Weighting:** Optimize weighting of concept search results (#649, Sprint 10), "best match" sorting by default for org search (#1311)
- **Query improvements:** Sort pattern options (#688), versioned resource references (#702), mapping source resolution rules (#1208), enhance search to include mappings in concept search (#1583), auto-assign UUIDs for concept names (#1683), global endpoint for searching across repo types (#1686)
- **Specialized search:** Features for auditing content in a source (#1659), summary of map sources for a repository (#1467), custom attribute summary API (#1598), "plain English" reference conversion (#1343)

### Elasticsearch Infrastructure
- **Index management:** Review changes to indexes (#1533), default language auto-added to supported languages (#1382), use ES by default for TermBrowser (#1261)
- **Migration:** Migrate from ES to OpenSearch (#1597, led by @rkorytkowski)
- **Credentials:** Support DB, Redis, and ES credentials (#1728)
- **Validation:** OpenMRS FSN uniqueness restricted to FSNs and preferred names (#1921)

### Search Features
- **Source/collection summaries:** Summaries showing zero when actual summary unavailable (#1179), source version summary APIs (#1527)
- **Filter improvements:** Filters panel not populating (#1352), implicit criteria reference resolution (#1850), error messages for adding references (#1825)

**Key contributors:** @snyaggarwal (implementation), @rkorytkowski (OpenSearch migration, infrastructure credentials).

---

## 2.4 Collections (24 issues, 21 closed)

Collections are one of the most architecturally complex areas of oclapi2, having undergone a fundamental redesign from simple reference lists to expansion-based evaluation.

### Expansion Model
- **Foundation:** Implement new expansion resource (#818), merge collections expansions to master (#1164), parameters for expansions (#1265)
- **Migration:** Migration script from old to new-style collections (#1136), old reference/expansion migration and backfills (#1332)
- **Advanced features:** Exclusion references (#1292), save resolved repo versions with expansions (#1307), expanded collection references with canonical URL support (#1275), canonical URL filter parameter (#1701)

### Collection Operations
- **CRUD:** Source/collection summary tab (#467), collections of collections (#970), collection summary tab (#1495), source/collection API include resources (#1528), big source/collection async DELETE (#1128)
- **References:** Allow collection reference from outside OCL (#820), delete concepts from collection (#1278), $resolveReference API operation (#1221)
- **Cleanup:** Delete database field Collection.repository_type (#1353), collection limited to 1024 references fixed (#1565)

### Scoping and Permissions
- **Scope:** includeMappings/includeInverseMappings scoped to collection (#823), ability to get concepts/mappings within a source that are or are not part of a collection (#728)
- **Delete:** Need ability to delete source referenced by other sources/collections (#661)

**Timeline:** Collections work started in the oclapi2 Launch era with the expansion model (#818, Jun 2021), went through major development in Post-Launch (2022) with canonical URL support and exclusion references, and continued refinement through V3 Development (2023).

**Key contributors:** @snyaggarwal (all implementation), @paynejd (expansion parameters specification, $resolveReference requirements).

---

## 2.5 Sources / Repos (17 issues, 14 closed)

### Repository Management
- **Operations:** Long-running DELETE source request (#590), auto-assign ID scheme switching (#1549), auto-ID handling for existing sources (#1323)
- **Versioning:** Generate diff between 2 repo versions (#1753), generate changelog between 2 repo versions (#1814)
- **Performance:** Source summary slow queries (#1008), repo HEAD optimization (#1262), implement cache on first page of latest version (#2170)
- **Monitoring:** Make first monthly usage report (#852), automate monthly report (#1038), report improvements (#1449, #1633, #1760), fix monthly report email (#1946)
- **API:** /repos/ ownerType and repoType URL params (#2197), indexing status and restart method (#1884)

**Key contributors:** @snyaggarwal (implementation), @rkorytkowski (co-assigned on reporting and infra).

---

## 2.6 Mappings (13 issues, 10 closed)

### Mapping Features
- **Querying:** Get concepts/mappings within a source that are/aren't part of a collection (#728, Sprint 10), concept/mapping versions showing associations with source/collection versions (#754), get concept/mappings from source not part of collection (#1132)
- **Data quality:** Missing mappings investigation (#870), collection reference association with computed concepts/mappings (#1204), remove concepts/mappings associations from collection versions (#1206)
- **Enhancements:** Sort weight on mappings (#1446, OpenMRS-specific), unique constraint on mapping external ID (#989)

**Key contributors:** @snyaggarwal (all implementation).

---

## 2.7 Cascade (12 issues, 11 closed)

The $cascade operation was built iteratively across four rounds, becoming one of oclapi2's most distinctive features for terminology content management.

### Development Rounds
- **Round 1 -- MVP:** $cascade operation MVP (#1088, Nov 2021) -- basic cascading of concepts through their mappings
- **Round 2 -- Hierarchy:** $cascade response as hierarchy (#1168), concept $cascade hierarchy visualization (#1169)
- **Round 3 -- References:** $cascade API round 3, including references (#1131), OpenMRS cascade -- automatically add sets when parent concept added (#1057)
- **Round 4 -- Scoping:** Restrict $cascade to repo version by default (#1224), implement $cascade within a collection version (#1295)
- **Round 5 -- Parameters:** Implement $cascade omitIfExistsIn and equivalencyMapType parameters (#1451), remove "uuid" from cascade response (#1450)
- **Round 6 -- Documentation and dynamic references:** Cascade documentation, round 2 (#1429), transform to dynamic references (#1824)

### Bug Fixes
- "Add to collection" failing due to cascade bug (#1370), OpenMRS cascade bug on demo (#1437)

**Timeline:** Nov 2021 (MVP) through Apr 2024 (dynamic reference transformation). The cascade operation matured over 2.5 years.

**Key contributors:** @snyaggarwal (implementation), @paynejd (specification of cascade parameters and behavior), @rkorytkowski and @jamlung-ri (documentation review).

---

## 2.8 FHIR (10 issues, 9 closed)

### FHIR Compliance
- **Feature toggles:** Enable FHIR UI as feature toggle (#756)
- **Operations:** ConceptMap operations (#1235, led by @rkorytkowski), supporting multiple parameters in expansions (#1406)
- **Serialization:** FHIR CodeSystems/ValueSets not appearing in API queries (#934), display name of codes in ValueSets auto-populating (#1609), expanded collection references with canonical URLs (#1275)
- **Bug fixes:** POST CodeSystem/ValueSet fails due to DB cursor (#1713), special characters in CodeSystem/ValueSet version (#1841), OCL API returning wrong FHIR URL (#1842)
- **Reporting:** Script to generate changelog and release notes (#830), FHIR feedback/issues tracker (#1497)

**Key contributors:** @rkorytkowski (FHIR domain expertise, ConceptMap operations), @snyaggarwal (API implementation), @paynejd (expansion parameters).

---

## 2.9 API Documentation (9 issues, 6 closed)

- **Swagger completeness:** Make sure all query parameters are present (#623), Swagger to work with Gunicorn (#965), update incorrect request fields (#1712, still open)
- **Developer docs:** Dev contributions documentation (#1407), authentication documentation update (#1475, stale)
- **Performance:** Make redoc load faster (#426, stale)

**Key contributors:** @snyaggarwal (all implementation).

---

## 2.10 Smaller Subcategories (grouped)

### General / Framework (9 closed)
Package and framework upgrades formed a steady drumbeat: Django 4 upgrade (#1155), pylint 2.14 upgrade (#1319), package updates (#960, #1044). Other general work included making trailing slashes optional (#218), revising error messages (#310), compiling OpenMRS validation rules (#750), splitting localized_text into 2 tables (#1399), implementing feature toggles (#1510), and adding response time to API logs (#1116).

### Enhancement (8 closed)
Cross-cutting enhancements including multi-hierarchy support (#585), additional sort features (#685, #799), OpenMRS validation for external_id (#963), implement clone operation (#1453), fuzzy matching (#1578), auto-assign sort order (#1682), and the $match endpoint for OCL Mapper (#2055).

### Users / Orgs (6 closed)
Clean up user accounts (#712), filter users by last login (#829) and date joined (#838), API to make user an admin (#1154), org overview page management (#1156), make operations panel available to non-admin users (#1540).

### Auth / Permissions (3 closed)
Report to get content authored by users (#896), authenticated users viewing other profiles (#1135), repo version permissions featuring LOINC (#1731).

### Concepts (3 closed)
Update syntax for concept codes (#737), planning for concept modification (#746), remove unused fields from concept (#1564).

### Locales / Names (2 closed)
Precompute display_name and display_locale (#871), separate out localized text table (#872).

### Async / Queue (3 closed)
Implement API to return task status (#1145), setup Celery Beat service (#1387), maintain tasks in Postgres (#1777).

### Checksums (2 closed)
Change localized_text index to hash-based (#1330), implement standard and smart checksums round 2 (#1674).

### Performance (3 closed)
Source summary slow queries (#1008), repo HEAD not containing all resource versions (#1262), implement cache on first page of repos (#2170).

### Testing / CI (2 closed)
Run coverage on Bamboo CI (#1127), activate SSO on QA (#1462).

### Versioning (2 closed)
Add version number to API (#766), source/collection version attribute population (#1157).

### SSO / Keycloak (2 closed)
Keycloak spike (#1333), SSO setup and implementation (#1338).

---

## 2.11 Delivery Summary

The 259 closed issues represent a massive body of completed engineering work spanning 4+ years (2021-2025). Key delivery milestones:

| Period | Milestone | Key Issues |
|---|---|---|
| **2021 Q1-Q2** | oclapi2 initial launch with bulk import, search, FHIR toggle | #649, #679, #704, #756, #761 |
| **2021 Q3-Q4** | Collections expansion model, $cascade MVP, hierarchy support | #818, #1057, #1088, #1131, #1168 |
| **2022 Q1-Q2** | Collection expansion merge to master, exclusion references, $resolveReference | #1164, #1221, #1265, #1292, #1295 |
| **2022 Q3-Q4** | SSO/Keycloak, ConceptMap operations, cascade parameters | #1338, #1235, #1406, #1451 |
| **2023 Q1-Q2** | Auto-ID assignment, legacy import deprecation, import ZIP support | #1501, #1510, #1549, #1550, #1551 |
| **2023 Q3-Q4** | OpenSearch migration, fuzzy matching, checksums round 2, global repo search | #1597, #1578, #1674, #1686 |
| **2024 Q1-Q2** | Azure storage, repo version diffs/changelogs, authenticated exports | #1729, #1753, #1777, #1779, #1814 |
| **2024 Q3-Q4** | Dynamic reference cascade, delete reference import, events system | #1824, #1907, #1936 |
| **2025 Q1-Q3** | Caching, $match endpoint, repo type URL params | #2055, #2170, #2197 |

---

# Section 3: Open Issues -- Keep

**Scope:** 35 OPEN issues with disposition `keep` from the oclapi2 bucket
**Source:** `api2-raw-archive.json` and `api2-issue-classification.csv`

These issues represent valid, current work that should remain open. They span from foundational platform improvements to active bug fixes and feature development.

---

## 3.1 Import/Export & Bulk Import (9 issues)

This is the largest subcategory, reflecting the central role that bulk import plays in OCL's content management workflows (CIEL, PEPFAR, WHO, PIH).

### #2118 -- Finalize new bulk import streaming capability (HIGH)
**Created:** 2025-02-20 | **Updated:** 2025-02-20 | **Assigned:** snyaggarwal

The new streaming bulk import capability encountered errors during a CIEL import test in a local dev environment. The work needs replication/fix in another dev environment before deployment to all OCL environments. References #1957 for prior context.

**Why it matters:** Streaming import is the next-generation bulk import pipeline, critical for handling large terminology sets like CIEL (50k+ concepts) without memory issues.
**Status:** Blocked on replication and fix of errors discovered during testing.

### #2136 -- Missing Collection Export Attribute (HIGH)
**Created:** 2025-03-24 | **Updated:** 2025-03-27 | **Assigned:** snyaggarwal

Collection exports were missing the cascade logic metadata in the References portion of exports. Without cascade info, reimporting an export could not reproduce the original collection structure.

**Why it matters:** Export/import round-tripping is fundamental to OCL's backup and migration workflows.
**Status:** Fix deployed to QA, Staging, and Production per comments from snyaggarwal (2025-03-27). Existing exports need regeneration. May be closeable pending final verification.

### #957 -- Improve memory management for import tasks (MEDIUM)
**Created:** 2021-09-06 | **Updated:** 2024-01-05 | **Assigned:** rkorytkowski, snyaggarwal

Import files are stored entirely in memory and passed to Redis/workers. The fix involves storing files in S3, streaming reads, and proper cleanup after processing. Initial low-hanging-fruit fixes were made in 2021; additional memory/indexing optimizations were added in Jan 2024. "Big chunks of work" remain.

**Why it matters:** Memory pressure from large imports (CIEL, PEPFAR) causes instability in production. This is the root-cause ticket for import reliability.
**Status:** Partially addressed over multiple rounds. Ongoing.

### #1508 -- Setup limits on bulk imports (MEDIUM)
**Created:** 2023-03-09 | **Updated:** 2023-03-10 | **Assigned:** rkorytkowski, paynejd, snyaggarwal

Need to agree on per-user import limits to prevent system overload. Should allow elevated limits for specific users. No implementation work has started.

**Why it matters:** Without limits, a single large import can degrade the system for all users.
**Status:** Discussion needed. No comments beyond the initial filing.

### #1596 -- Update CSV Bulk Import to catch up with new features (MEDIUM)
**Created:** 2023-06-09 | **Updated:** 2024-03-12 | **Assigned:** paynejd, snyaggarwal, jamlung-ri

The CSV bulk importer in ocldev needs to support features that have been added to the JSON importer (e.g., auto-ID assignment per #1550). Minimal body/details.

**Why it matters:** Many OCL users prefer CSV format for managing terminology content. Feature parity with JSON import is essential.
**Status:** No work started. Tracking ticket.

### #1657 -- Better handle invalid import JSON/CSV errors (MEDIUM)
**Created:** 2023-09-06 | **Updated:** 2023-09-06 | **Assigned:** rkorytkowski, paynejd, snyaggarwal

Empty body -- the title captures the requirement. Invalid import files should produce clear, actionable error messages rather than cryptic failures.

**Why it matters:** User experience and self-service for content managers.
**Status:** No work started.

### #1782 -- Implement standalone reference support in CSV bulk import (MEDIUM)
**Created:** 2024-02-26 | **Updated:** 2024-03-12

Support for a standalone `Reference` row type in CSV bulk import format, allowing users to add references to collections via CSV. Example syntax provided in the issue.

**Why it matters:** Users managing collections need to define references in CSV, not just concepts and mappings.
**Status:** No work started.

### #1868 -- Enable creating/importing/editing resource in an older repo version (MEDIUM)
**Created:** 2024-06-25 | **Updated:** 2024-06-25 | **Assigned:** paynejd, snyaggarwal

Detailed technical design for supporting versioned resource insertion into non-HEAD repo versions. Involves linked-list versioning with `previous_version_uri` and `version_order` fields. Comprehensive task breakdown provided by snyaggarwal.

**Why it matters:** Supports back-porting content to older versions, which is required for certain editorial workflows.
**Status:** Design complete, no implementation started.

### #2152 -- Update the bulk import message attribute (LOW)
**Created:** 2025-04-15 | **Updated:** 2025-04-17 | **Assigned:** snyaggarwal

The bulk import `message` field should include all non-zero counts and format time with 2 decimal places. Deployed to QA per snyaggarwal comment.

**Why it matters:** Quality-of-life improvement for import monitoring.
**Status:** Deployed on QA. Needs promotion and verification.

---

## 3.2 Search/Elasticsearch (5 issues)

### #2159 -- Source properties and filters (HIGH)
**Created:** 2025-05-09 | **Updated:** 2026-03-24

A major feature: implementing FHIR CodeSystem-style `properties` and `filters` for OCL sources. This enables schema-driven extras, FHIR filter operators, and structured search. A 4-phase MVP plan is defined with detailed API design from snyaggarwal and architectural guidance from paynejd. MVP Round 1 is scoped at 24 story points.

**Why it matters:** Core capability gap for FHIR compliance and structured concept search. Foundational for HAPI FHIR integration.
**Status:** Active design discussion (6 comments through May 2025). MVP Round 1 work may be in progress.

### #1665 -- OpenMRS Custom Validation Schema: FSN/preferred name uniqueness (MEDIUM)
**Created:** 2023-09-14 | **Updated:** 2024-03-12 | **Assigned:** snyaggarwal

Enforce uniqueness among FSNs and preferred synonyms within a locale (case-insensitive). The original rule was too strict -- non-preferred synonyms should be allowed to match FSNs. Related to #1921 (which was completed for a narrower scope) and #1666.

**Why it matters:** Directly impacts CIEL imports and OpenMRS interoperability.
**Status:** Partially addressed by #1921. The broader case-insensitive uniqueness rule described here may still need implementation.

### #1705 -- Ensure names & descriptions have unique UUIDs in OpenMRS schema (MEDIUM)
**Created:** 2023-12-01 | **Updated:** 2024-03-12

After #1683 (auto-assign UUIDs for concept names) was completed, this ticket adds validation to the OpenMRS schema to ensure external IDs are 36 chars and unique within a source.

**Why it matters:** Required for successful round-tripping between OCL and OpenMRS implementations.
**Status:** Depends on #1683 completion. No implementation started.

### #2023 -- Write boolean logic/pseudocode for mapping search (MEDIUM)
**Created:** 2024-11-25 | **Updated:** 2024-12-11 | **Assigned:** snyaggarwal

Document the search algorithm for the prototype `$match` mapping endpoint. Snyaggarwal provided a detailed comment describing the 7-step search algorithm using `match_phrase`, `wildcard`, and `fuzzy` queries with boost weights.

**Why it matters:** Transparency and documentation for the mapping/matching tool's search logic.
**Status:** Algorithm documented in comments. May need formalization in OCL Docs.

### #1396 -- Option not to auto-import mappings to retired concepts (MEDIUM)
**Created:** 2022-10-27 | **Updated:** 2024-03-12

When cascading, mappings to retired concepts are imported but the retired concepts themselves are not, creating orphan mappings. Users should control whether retired target concepts are cascaded.

**Why it matters:** Data quality issue affecting OpenMRS dictionary management.
**Status:** Linked to `$cascade` feature work (#1378). No implementation.

---

## 3.3 Mappings & Checksums (4 issues)

### #1746 -- Only create new version if resource has changed (HIGH)
**Created:** 2024-01-29 | **Updated:** 2024-04-29 | **Assigned:** paynejd, snyaggarwal

Use standard checksums to detect whether an update request actually changes a resource. If unchanged, return HTTP 208 instead of creating a new version. Implemented behind feature toggle `PREVENT_DUPLICATE_VERSION_TOGGLE` (enabled on QA/Dev only). Returns 208 status code with `unchanged` count in import summary.

**Why it matters:** Prevents version bloat during reimports (e.g., CIEL releases), which degrades performance and storage.
**Status:** Implementation complete. Blocked on real-world testing, user communication, and production deployment.

### #2153 -- Mappings should persist repo URLs as submitted by the user (HIGH)
**Created:** 2025-04-15 | **Updated:** 2025-04-15 | **Assigned:** snyaggarwal

When a user submits a canonical URL for `from_source` or `to_source`, it should be stored as-is. OCL may resolve it internally to a relative URL but must preserve the original. Impact analysis across oclapi2, oclweb2, oclweb3 is needed before proceeding.

**Why it matters:** Correctness and FHIR compliance for mapping provenance.
**Status:** Requirements defined. Impact analysis pending.

### #1867 -- Independent checksum script for concepts and mappings (MEDIUM)
**Created:** 2024-06-24 | **Updated:** 2024-12-02 | **Assigned:** snyaggarwal

Create a standalone Python/JS script to generate standard and smart checksums outside of OCL core services. Initial goal: enable @bmamlin to validate CIEL resources externally. Extensive comment thread (15+ comments) documents checksum matching progress -- 57,186 concept checksums matched. Issues with URL encoding in `to_concept_code` fields were identified and fixed.

**Why it matters:** Enables external validation of OCL content integrity, critical for CIEL release quality.
**Status:** Script exists in ocldev. Active refinement through Nov 2024. URL encoding edge cases resolved.

### #1357 -- Expose hard DELETE of concept/mapping for standard users (MEDIUM)
**Created:** 2022-10-04 | **Updated:** 2024-03-12

Hard delete was implemented for admins only (#564). Need to make available to standard users with appropriate safeguards. Question: was hard delete also implemented for concept/mapping versions?

**Why it matters:** Users currently cannot permanently remove erroneously created content.
**Status:** No implementation. Tracking ticket.

---

## 3.4 Locales/Names (3 issues)

### #757 -- Implement optional country code support for locales (HIGH)
**Created:** 2021-05-14 | **Updated:** 2024-03-12 | **Assigned:** paynejd

OCL's locale system does not recognize many valid Java/BCP 47 locales (e.g., `en_GB`, `in`/Indonesian). Extensive analysis by @bmamlin identified 117 missing Java locales. Initial fixes added `en-GB` and Indonesian (`in`/`id`). Broader locale support via CLDR data was discussed but deferred.

**Why it matters:** Blocks import of dictionaries (PIH, others) that use country-qualified locales.
**Status:** Partial fixes deployed. Full locale support remains open.

### #1666 -- Introduce "Synonym" name type and remove "None" name type (MEDIUM)
**Created:** 2023-09-14 | **Updated:** 2024-10-02

The `None` name type is confusing (difference from `null` is undefined). Proposal: purge `None`, add `Synonym` as a name type, treat `null` and `Synonym` identically. Eventually make name type required. Labeled `breaking-change`. @bmamlin provided screenshot showing the confusing UI display.

**Why it matters:** Data quality and interoperability with OpenMRS. Current state creates confusion for all users.
**Status:** Impact analysis done by @jamlung-ri (imports, forms, search, checksums, validation). No implementation.

### #1603 -- Dynamically populate display_name based on request header (MEDIUM)
**Created:** 2023-07-05 | **Updated:** 2024-03-26 | **Assigned:** snyaggarwal

Enable language preference in request headers to dynamically select which concept name is used as `display_name`. Detailed 6-step plan. Default behavior unchanged (safe to deploy). Foundational for multi-lingual capabilities.

**Why it matters:** Prerequisite for multi-lingual TermBrowser experience.
**Status:** No work started per snyaggarwal comment (March 2024).

---

## 3.5 Collections & Expansions (3 issues)

### #1327 -- Constrain repo version processing to be consistent within an expansion (HIGH)
**Created:** 2022-06-21 | **Updated:** 2024-03-12

When evaluating an expansion, resolved repo versions must be reused across all references to avoid inconsistency (e.g., some CIEL references resolving to v2023 and others to v2024 if a release happens mid-expansion).

**Why it matters:** Data integrity guarantee for collection expansions.
**Status:** Requirements defined. No implementation.

### #1962 -- Record repos+versions that did and did not resolve with an expansion (MEDIUM)
**Created:** 2024-10-23 | **Updated:** 2024-10-24 | **Assigned:** snyaggarwal

Track unresolved repo references alongside already-tracked resolved ones. Deployed to QA with `unresolved_repo_versions` field in expansion details response.

**Why it matters:** Debugging and transparency for expansion evaluation.
**Status:** Deployed on QA. Needs promotion and final review.

### #1194 -- Changing an ID for an org, source, collection, etc. (MEDIUM)
**Created:** 2022-01-31 | **Updated:** 2024-03-12 | **Assigned:** paynejd, snyaggarwal, jamlung-ri

No process exists for renaming an OCL resource ID (e.g., changing org `IHTSDO` to `SNOMED-International`). Currently requires creating a new org and reloading content, impacting downstream users.

**Why it matters:** Real-world need for organizations that rebrand or correct naming mistakes.
**Status:** Discussion needed. One comment from @jamlung-ri requesting architecture call.

---

## 3.6 Performance & Infrastructure (2 issues)

### #1944 -- Investigate slow DB responses (HIGH)
**Created:** 2024-10-16 | **Updated:** 2024-10-16 | **Assigned:** rkorytkowski

Occasional DB hiccups with long query response times. Suspected auto-vacuuming and IOPS limits. `log_temp_files` set to 10MB to investigate. Tagged `top-priority`.

**Why it matters:** Production reliability. Slow DB impacts all users.
**Status:** Investigation in progress by rkorytkowski. No resolution yet.

### #2039 -- Index Descriptions (HIGH)
**Created:** 2025-01-08 | **Updated:** 2025-01-09 | **Assigned:** snyaggarwal

Enable concept descriptions to be searchable in ElasticSearch, needed for the mapping tool and general search improvements. Discussed on Product Call 2025-01-08.

**Why it matters:** Search completeness -- descriptions contain valuable content not currently indexed.
**Status:** Approved. No implementation details in comments.

---

## 3.7 Enhancements (3 issues)

### #878 -- Name_type Standardization (MEDIUM)
**Created:** 2021-08-04 | **Updated:** 2023-09-26 | **Assigned:** paynejd, snyaggarwal

Inconsistent name_type formats across OCL (e.g., `Fully Specified` vs `FULLY_SPECIFIED` vs `Fully-Specified`). Implementation was completed on a branch but never merged. OpenMRS standard uses `FULLY_SPECIFIED`, `SHORT`, `INDEX_TERM`. The filter panel also displays name types differently than stored.

**Why it matters:** Affects exports, imports, OpenMRS interoperability, and user experience.
**Status:** Implementation exists on branch. Blocked on impact verification for integration scripts.

### #1723 -- Upgrade to Django 5 (MEDIUM)
**Created:** 2023-12-26 | **Updated:** 2024-03-12 | **Assigned:** snyaggarwal

Technical debt. Django 5 release notes linked. No body or discussion.

**Why it matters:** Security, performance, and staying on supported framework versions.
**Status:** No work started.

### #2231 -- Dynamic reference cascade should account for equivalence (MEDIUM)
**Created:** 2025-09-03 | **Updated:** 2026-03-20

When adding dynamic references to a collection with cascade, custom validation runs against un-deduplicated interim state, causing false duplicate name errors. Two solutions proposed: (1) add equivalency logic to validation, or (2) add equivalency checking to cascade processing. Detailed example with CIEL "Home electricity?" concept.

**Why it matters:** Users encounter false validation errors when building OpenMRS dictionaries from CIEL.
**Status:** Requirements and two solution approaches defined. No implementation.

---

## 3.8 Bug Fixes (2 issues)

### #1805 -- Repo Version Summary counts are often incorrect (HIGH)
**Created:** 2024-03-13 | **Updated:** 2024-05-21 | **Assigned:** snyaggarwal

After large imports or version export creation, summary counts show 0 or incorrect numbers, requiring manual Recalculate Summary. PIH user (Ellen) confirmed: "new source versions always show as 0 count."

**Why it matters:** Erodes user trust in the platform. Workaround exists but is tedious.
**Status:** Investigated. Described as quality-of-life issue by @jamlung-ri. No fix deployed.

### #2151 -- Error bulk importing mapping resource (HIGH)
**Created:** 2025-04-15 | **Updated:** 2025-04-21 | **Assigned:** snyaggarwal

Bulk import returns "Must specify a 'from_concept'" error when `from_concept_url` uses capital `C` in `/Concepts/`. Direct POST handles this case. Root cause: import API does not normalize URL casing. Discussion in comments about applying case-insensitive URL handling globally.

**Why it matters:** Breaks real-world import workflows where URLs have inconsistent casing.
**Status:** Root cause identified. Discussion about consistent fix approach.

---

## 3.9 API Documentation (2 issues)

### #1712 -- Update incorrect request fields in Swagger (LOW)
**Created:** 2023-12-08 | **Updated:** 2024-02-27 | **Assigned:** snyaggarwal

Swagger docs show fields in POST/PUT request bodies that cannot actually be provided (e.g., `is_latest_version`, `parent_id`, `url`). Affects mappings, concepts, and other resources.

**Why it matters:** Misleads API consumers.
**Status:** Not started.

### #1653 -- Track request source of a POST/PUT (LOW)
**Created:** 2023-08-30 | **Updated:** 2024-03-12

Record how a resource was created/updated (TermBrowser UI, bulk import, direct API, etc.). Priority is concept/mapping versions. No comments or work started.

**Why it matters:** Auditing and analytics for content provenance.
**Status:** Not started.

---

## 3.10 General (2 issues)

### #1740 -- Maintain original casing for facets in filter panel (LOW)
**Created:** 2024-01-16 | **Updated:** 2024-03-12 | **Assigned:** snyaggarwal

Facets in the filter panel and repo summary lose original casing during ES indexing. Snyaggarwal to document affected fields.

**Why it matters:** Display quality in TermBrowser.
**Status:** Documentation pending.

### #1310 -- Implement recursive real-time expansions (HIGH -- CLOSED)
**Created:** 2022-05-31 | **Updated:** 2026-03-24 | **State:** CLOSED

*Note:* This issue was classified as `keep` but was closed during the March 2026 FHIR backlog cleanup. The concept remains important and should be re-scoped when needed. When requesting an expansion that relies on other value sets, all should be evaluated in real-time with consistent parameters.

---

## Summary by Priority

| Priority | Count | Issue Numbers |
|---|---|---|
| High | 13 | #757, #1310, #1327, #1746, #1805, #1944, #2039, #2118, #2136, #2151, #2153, #2159, #2231 |
| Medium | 17 | #878, #957, #1194, #1357, #1396, #1508, #1596, #1603, #1657, #1665, #1666, #1705, #1723, #1782, #1867, #1868, #1962, #2023 |
| Low | 5 | #1653, #1712, #1740, #2152, #2231 |

## Summary by Subcategory

| Subcategory | Count | Issues |
|---|---|---|
| Import/Export | 9 | #957, #1396, #1508, #1596, #1657, #1782, #1868, #2118, #2136, #2152 |
| Search/Elasticsearch | 5 | #1665, #1705, #2023, #2159, #1396 |
| Mappings/Checksums | 4 | #1357, #1746, #1867, #2153 |
| Locales/Names | 3 | #757, #1603, #1666 |
| Collections | 3 | #1194, #1327, #1962 |
| Performance | 2 | #1944, #2039 |
| Bug | 2 | #1805, #2151 |
| Enhancement | 3 | #878, #1723, #2231 |
| API Documentation | 2 | #1653, #1712 |
| General | 2 | #1310, #1740 |

---

# Section 4: Open Issues -- Close/Review Candidates

**Scope:** 21 OPEN issues recommended for closure or review from the oclapi2 bucket
**Breakdown:** 11 close-stale, 8 review, 2 close-outdated
**Source:** `api2-raw-archive.json` and `api2-issue-classification.csv`

These issues are candidates for closure because they are stale (no meaningful activity in 1+ years with vague or superseded requirements), outdated (the underlying need has been addressed differently), or require review to determine current relevance.

---

## Overview Table

| # | Title | Disposition | Created | Last Updated | Subcategory | Rationale |
|---|---|---|---|---|---|---|
| 386 | Refactor lookup value schema for oclapi2 | close-stale | 2020-09-29 | 2021-05-06 | General | 5+ years old, never discussed on arch call |
| 426 | Make redoc load faster | close-stale | 2020-10-28 | 2021-05-06 | API Documentation | 5+ years old, empty body, redoc likely superseded |
| 471 | Case Sensitive Search with extras attribute | close-stale | 2020-11-16 | 2021-05-06 | Bug | 5+ years old, DATIM-specific, likely resolved |
| 588 | Org export | review | 2021-02-16 | 2021-05-06 | Import/Export | Aspirational feature, no activity in 5 years |
| 745 | Optimize search results using 'match_phrase' | close-stale | 2021-05-10 | 2021-08-17 | Search/ES | Research suggestion, never acted on |
| 753 | Add "DELETE_IF_EXISTS" action into bulk import | close-stale | 2021-05-12 | 2021-07-09 | Import/Export | 4+ years old, no implementation |
| 828 | Automatically generate changelog for OCL repos | close-outdated | 2021-07-02 | 2026-03-24 | FHIR | Superseded by #830 and #1814 |
| 1087 | OCL Connector Documentation | close-stale | 2021-11-08 | 2021-12-06 | API Documentation | OCL Connector concept may be superseded |
| 1286 | Retire APIs that use both repo version and resource version | close-outdated | 2022-04-29 | 2026-03-24 | Sources/Repos | API evolution has moved past this concern |
| 1336 | Speed up tests by getting rid of delete_all | close-stale | 2022-07-14 | 2022-07-14 | Performance | Already achieved partial results (4 to 3 min) |
| 1420 | Remove Flower dependency in OCLAPI | review | 2022-11-04 | 2022-11-04 | General | Empty body, 3+ years old, may still be relevant |
| 1431 | Implement maintenance page | close-stale | 2022-11-16 | 2026-03-24 | General | Infra concern, no implementation in 3+ years |
| 1475 | Update authentication documentation | close-stale | 2023-02-08 | 2024-03-12 | API Documentation | SSO/Keycloak has changed auth significantly |
| 1548 | Collection References bug -- "Unresolved" terminology | review | 2023-04-13 | 2023-04-14 | Search/ES | Semantic question, stalled after initial discussion |
| 1670 | Collection not displaying latest concept version | review | 2023-09-20 | 2023-11-17 | Concepts | Complex expansion behavior, may be by-design |
| 1671 | Rename `uuid` field to `id` for concept names/descriptions | review | 2023-09-29 | 2023-11-08 | Search/ES | Breaking change, impact assessed as small |
| 1730 | Upgrade to python3.12 | review | 2024-01-08 | 2024-01-10 | Enhancement | Blocked by kombu bug, may be superseded by 3.13+ |
| 1783 | Add missing GET params to swagger: Concepts and Mappings | close-stale | 2024-02-27 | 2024-02-27 | API Documentation | No assignee, no activity, one of three sibling tickets |
| 1784 | Add missing GET params to swagger: Sources and Collections | close-stale | 2024-02-27 | 2024-02-27 | Search/ES | No assignee, no activity, sibling of #1783 |
| 1785 | Add missing GET params to swagger: Orgs and Users | review | 2024-02-27 | 2024-09-21 | API Documentation | Assigned to WestOnyinsi, some activity |
| 1925 | Request: Automatically add self-map | review | 2024-09-11 | 2026-03-24 | Enhancement | Feature request, unsure if API or client responsibility |

---

## Detailed Narratives

### Close-Stale Issues (11)

**#386 -- Refactor lookup value schema for oclapi2**
Filed in September 2020 with the body "To discuss on future Architecture call." Two comments from @aprilcurrier and @paynejd in October 2020 indicate it was never discussed. No further activity. The lookup value schema has evolved significantly since 2020 with the introduction of repo types, properties, and filters (#2159). This issue is too vague and too old to act on. **Recommend close.**

**#426 -- [OCLAPI2] Make redoc load faster**
Filed October 2020 with an empty body. Redoc was the Swagger/API documentation rendering tool. The OCL API documentation infrastructure has changed since then, and Swagger improvements have been addressed in other tickets (#623, #1712). No activity in over 5 years. **Recommend close.**

**#471 -- Case Sensitive Search with extras attribute**
Filed November 2020, specific to DATIM/PEPFAR `extras` queries. The body references `ocl_datim` repo code. Extras search has been significantly improved since then (#1245, #1321 which specifically addressed hyphen handling in extras searches). This specific bug report is likely resolved. **Recommend close** after verifying that the referenced `extras__datim_moh_period` queries work correctly.

**#745 -- [OCLAPI2] Optimize search results using 'match_phrase'**
Filed May 2021 with an empty body. One comment from @jamlung-ri in July 2021: "This ticket is a suggestion, so we should dive into this more." No follow-up. OCL search has been extensively reworked since then, including match_phrase usage in the `$match` endpoint (#2023). **Recommend close** as superseded by broader search improvements.

**#753 -- Add "DELETE_IF_EXISTS" action into bulk import**
Filed May 2021. The feature would let the bulk importer handle existence checks for delete operations. No comments or implementation in 4+ years. Bulk import has been significantly enhanced (#1907 added Reference DELETE support, #1551 deprecated legacy endpoints). If still needed, it should be re-scoped. **Recommend close.**

**#1087 -- OCL Connector Documentation**
Filed November 2021. Snyaggarwal posted a list of API endpoints used by the "OCL Connector" in November 2021. One follow-up from @jamlung-ri in December 2021: "Will likely need this in 2022 to continue building out the connector framework." No further activity. The OCL Connector concept does not appear in recent project documentation or TBv3 planning. **Recommend close.**

**#1336 -- Speed up tests by getting rid of delete_all and relying on rollback**
Filed July 2022 by rkorytkowski. One comment: "Reduced tests execution time from 4 to 3 minutes." The improvement was achieved on the same day. No further activity or indication that more optimization is needed. **Recommend close** -- the achievable improvement was already made.

**#1431 -- Implement maintenance page**
Filed November 2022 by rkorytkowski. Describes a maintenance page served from CDN for API/web during major upgrades. Tagged `reviewed/keep` during the March 2026 review but classified as `close-stale` here because there has been no implementation progress in 3+ years, no comments, and the infrastructure has shifted (containerized deployments, potential Kubernetes migration). If still needed, should be re-filed with current infrastructure context. **Recommend close.**

**#1475 -- Update authentication documentation**
Filed February 2023 with three links to outdated OCL Docs pages about authentication. OCL's auth system has been significantly overhauled with Keycloak SSO (#1702, #1338, #2145). The linked documentation pages are likely already stale. If docs need updating, a new ticket scoped to current auth architecture would be more useful. **Recommend close.**

**#1783 -- Add missing GET request parameters to swagger: Concepts and Mappings**
Filed February 2024 with a simple one-line body. No assignee, no comments, no activity. Sibling of #1784 and #1785. The broader Swagger cleanup is tracked in #1712 (which is a `keep` issue). These individual tickets fragment the work unnecessarily. **Recommend close** in favor of #1712.

**#1784 -- Add missing GET request parameters to swagger: Sources and Collections**
Same as #1783 -- filed same day, same pattern, no assignee, no activity. **Recommend close** in favor of #1712.

### Close-Outdated Issues (2)

**#828 -- Automatically generate changelog for OCL primary repos**
Filed July 2021 with an empty body. Assigned to rkorytkowski and paynejd. One comment from @jamlung-ri in October 2021 asking for updates. Tagged `reviewed/keep` during March 2026 review. However, changelog generation was addressed separately: #830 (Script to generate changelog and release notes -- completed 2021) and #1814 (Generate changelog between 2 repo versions -- completed 2024). The automated, repo-level changelog described here has been superseded by these implementations. **Recommend close as outdated.**

**#1286 -- Retire any APIs/data that use both repo version and resource version**
Filed April 2022. Proposes invalidating URIs that specify both a repo version and a resource version (e.g., `/sources/MySource/v1/concepts/1984/6745/`). Tagged `reviewed/keep` in March 2026. However, the API has evolved significantly -- the preference for repo versions over resource versions is now well-established, and the dual-version URIs are rarely used in practice. No comments, no implementation in 4 years. If this remains a concern, it should be re-evaluated in the context of current API usage patterns. **Recommend close as outdated.**

### Review Issues (8)

**#588 -- Org export**
Filed February 2021. Proposes exporting all of an org's sources and collections in a single request. Aspirational feature with a well-written description covering multiple scoping levels (latest versions, matching versions, user-defined bundles). No comments or activity in 5 years. The feature remains potentially valuable but has never been prioritized. **Review recommendation:** Close if org-level export is not on the roadmap; keep if it is.

**#1420 -- Remove Flower dependency in OCLAPI**
Filed November 2022 with an empty body. Flower is the Celery monitoring tool. The OCL team forked Flower to fix compatibility issues (#1387, snyaggarwal comment). Removing the dependency could simplify the deployment. No comments or activity. **Review recommendation:** Check if Flower is still in use. If OCL has moved to PostgreSQL-based task management (#1777), the dependency may already be removable.

**#1548 -- Collection References bug -- "Unresolved" terminology**
Filed April 2023. Semantic discussion about when a reference should be called "unresolved" -- should it only mean "pointing to something that doesn't exist in OCL" (vs. "returned zero results")? Three comments with good technical analysis from snyaggarwal and jamlung-ri, but the conversation stalled after April 2023 without a decision. **Review recommendation:** Make the terminology decision and either implement or close. The discussion is still relevant but needs a product decision.

**#1670 -- Collection not displaying the latest version of the concept**
Filed September 2023 with extensive discussion (9 comments through October 2023). Root cause: dynamic references resolve to the latest *released* version, not HEAD. When a concept is updated in HEAD but no new source version is released, the collection shows the old version. The discussion revealed this is largely by-design (expansion semantics), but the user workflow is confusing. @paynejd provided a detailed workaround and feature ideas. **Review recommendation:** This may be a documentation/UX issue rather than a bug. Close if the current behavior is correct; convert to a feature request if auto-re-evaluation of HEAD references is desired.

**#1671 -- Rename `uuid` field to `id` for concept names and descriptions**
Filed September 2023. The `uuid` field name is a MongoDB-era artifact; the actual DB field is `id`. Impact analysis by snyaggarwal shows minimal internal impact. Labeled `breaking-change`. One comment from snyaggarwal explaining the history. **Review recommendation:** This is a small, well-understood breaking change. Either schedule it with the next batch of breaking changes or close if the v1-era naming is acceptable.

**#1730 -- Upgrade to python3.12**
Filed January 2024. Blocked by a kombu/Celery compatibility issue (linked GitHub issue). Python 3.12 was current at filing time; as of March 2026, Python 3.13 and 3.14 are available. **Review recommendation:** If upgrading Python is a priority, re-scope to the latest supported version (3.13+). The kombu blocker may have been resolved. Close this ticket and open a new one targeting the current Python version.

**#1785 -- Add missing GET request parameters to swagger: Orgs and Users**
Filed February 2024. Unlike its siblings (#1783, #1784), this one was assigned to WestOnyinsi and had an update in September 2024 (the `updatedAt` moved to 2024-09-21). No comments explaining what was done. **Review recommendation:** Check if WestOnyinsi made progress. If not, consolidate into #1712 and close.

**#1925 -- Request: Automatically add self-map**
Filed September 2024 by @jamlung-ri. Feature request: when a concept is created in a source, automatically create a SAME-AS mapping to itself. Proposed as a source-level setting (like Auto-assign ID). @paynejd's comment raises whether this belongs in the API or the OpenMRS OCL module. Tagged `reviewed/keep` in March 2026 review. **Review recommendation:** Determine the right implementation layer (API vs. client). If API, keep with clear requirements. If client, close and track in the OpenMRS module.

---

## Summary

| Disposition | Count | Recommended Action |
|---|---|---|
| close-stale | 11 | Close immediately -- these issues have been dormant for 1-5+ years with no path to implementation |
| close-outdated | 2 | Close -- the underlying needs have been addressed by other work |
| review | 8 | Triage individually: 3 likely closeable (#588, #1730, #1785), 3 need product decisions (#1548, #1670, #1925), 2 are small and could be scheduled (#1420, #1671) |

**Total cleanup potential:** 13 issues can likely be closed immediately, with 8 more requiring brief review.

---

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
