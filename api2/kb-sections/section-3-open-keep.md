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
