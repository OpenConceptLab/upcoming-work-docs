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
