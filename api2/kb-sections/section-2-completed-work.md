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
