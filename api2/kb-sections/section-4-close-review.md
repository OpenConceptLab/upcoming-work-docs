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
