# Orphaned Bucket: Completed Work

**Scope:** 82 CLOSED issues from the orphaned bucket, organized by theme
**Source data:** `orphaned-raw-archive.json`, `orphaned-issue-classification.csv`

---

## 2.1 Overview

Of the 113 orphaned issues, 82 are CLOSED. Of those, 73 are classified as **close-done** (definitively completed) and 9 are CLOSED issues classified as **keep** (completed but with ongoing relevance for reference or follow-up work). This section catalogs the completed work by functional theme.

---

## 2.2 CIEL Releases (21 issues)

The single largest cluster of completed work. All 21 issues follow an identical checklist pattern managed by @bmamlin: validate on cieladmin, generate zip, upload to liquibaserunner, convert to JSON, create diff, retire deleted mappings, bulk import, validate, and release. None were ever labeled.

| Issue | Title | Date |
|---|---|---|
| #1920 | CIEL v2024-09-04 release | 2024-09 |
| #1938 | CIEL v2024-10-04 release | 2024-10 |
| #1956 | CIEL v2024-10-18 release | 2024-10 |
| #1976 | CIEL v2024-11-25 release | 2024-11 |
| #2036 | CIEL v2024-12-20 release | 2024-12 |
| #2044 | CIEL v2025-01-24 release | 2025-01 |
| #2067 | CIEL v2025-02-15 release | 2025-02 |
| #2130 | CIEL v2025-03-17 release | 2025-03 |
| #2148 | CIEL v2025-04-07 release | 2025-04 |
| #2160 | CIEL v2025-05-12 release | 2025-05 |
| #2191 | CIEL v2025-06-13 release | 2025-06 |
| #2198 | CIEL v2025-07-15 release | 2025-07 |
| #2208 | CIEL v2025-08-11 release | 2025-08 |
| #2233 | CIEL v2025-09-05 release | 2025-09 |
| #2243 | CIEL v2025-09-23 release | 2025-09 |
| #2251 | CIEL v2025-10-19 release | 2025-10 |
| #2260 | CIEL v2025-11-20 release | 2025-11 |
| #2286 | CIEL v2025-12-24 release | 2025-12 |
| #2296 | CIEL v2026-01-25 release | 2026-01 |
| #2390 | CIEL v2026-02-26 release | 2026-02 |
| #2411 | CIEL v2026-03-23 release | 2026-03 |

**Pattern:** CIEL releases occur approximately every 2-4 weeks. Comments from @bmamlin typically note mapping change counts (e.g., "181 added, 1 retired" for v2026-03-23) and confirmation of production release. This is a mature, repeatable process that would benefit from a GitHub issue template and automatic labeling.

---

## 2.3 Mapper Features (14 closed issues)

The Mapper theme has 21 total issues, 14 of which are closed. These track the rapid evolution of OCL Mapper from mid-2025 through early 2026, covering the $match API, auto-match pipeline, mapping decisions UX, and ICD-11 integration.

### $match API and Auto-Match Pipeline
- **#2169** -- $match error handling for invalid submissions (e.g., no recognized columns). Closed 2026-01.
- **#2225** -- $match API settings not persisting after page reload. Fixed 2025-09.
- **#2229** -- Support `map_type` in $match response schema to enhance automation. Closed 2025-09.
- **#2230** -- Introduce `ciel_results` in $match response to showcase interface terminology candidates. Closed 2025-11.
- **#2238** -- Auto-match pre-loads 10 candidates (instead of 1) and saves with project. Closed 2026-03.
- **#2287** -- Expose $match in TBv3 spotlight for compatible repo versions. Closed 2026-01.

### Mapper UX and Configuration
- **#2206** -- Implement default filter for a repo in TBv3/Mapper. Closed 2025-09.
- **#2226** -- Source name in Map Project appears as `undefined` instead of being derived from URL. Closed 2025-09.
- **#2227** -- Redundant API calls when opening rows after Auto-Match. Closed 2026-03.
- **#2270** -- Save project-level events with Mapping Project. Closed 2026-01.
- **#2271** -- Remove "Pre-load candidates" checkbox from Auto-match dialog. Closed 2026-01.

### Research and Performance
- **#2171** -- Research and propose methods to improve LOINC performance in API, TB, Mapper. Closed 2025-10 after investigation by @snyaggarwal.

### Mappings (related)
- **#2196** -- Implement new Mapping: Code and Mapping: List algorithms. Closed 2025-07.
- **#2202** -- Issue with non-versioned mapping resolution. Closed 2025-09.

---

## 2.4 FHIR Improvements (4 closed issues)

FHIR work in this bucket focuses on import/export compatibility and XML support:

- **#1919** -- Support ConceptMap and CodeSystem with the same ID. Closed 2026-03 (long-lived, created 2024-09). @rkorytkowski.
- **#1954** -- Unable to convert FHIR API response to XML. Fixed 2024-10. @rkorytkowski.
- **#2041** -- Do not import npm `hl7.fhir.r4.core` 4.0.1 if listed in dependencies. Closed 2026-03. @rkorytkowski.
- **#1957** -- Test load baseline content via NPM import. Closed 2026-03 (long-lived). @rkorytkowski.

All four FHIR issues were handled by @rkorytkowski, confirming his role as the FHIR infrastructure specialist.

---

## 2.5 Infrastructure (7 closed issues)

Infrastructure work spans CI migration, deployment fixes, and operational improvements:

### CI Migration (Bamboo to GitHub Actions)
- **#2248** -- Move oclapi2 from OpenMRS Bamboo CI to GitHub Actions. Closed 2025-10. @snyaggarwal.
- **#2249** -- Move TBv2 from OpenMRS Bamboo CI to GitHub Actions. Closed 2025-10. @snyaggarwal.

These two issues represent a significant infrastructure milestone: migrating OCL's CI/CD pipeline away from the OpenMRS-hosted Bamboo instance to GitHub Actions, giving the project direct control over its build pipeline.

### Operational Fixes
- **#2115** -- Deploy wellKnown funding manifest at openconceptlab.org. Closed 2025-02. @paynejd, @snyaggarwal.
- **#2179** -- Fix source column for hierarchical associations. Closed 2025-05. @snyaggarwal.
- **#2215** -- Fix bottom whitespace in Mapping Decisions header. Closed 2025-09. @snyaggarwal.
- **#2283** -- Fix features and fixes needed for OCL API + CIEL Lab Concept Manager integration. Closed 2026-01.

---

## 2.6 Collections and Expansions (7 closed issues)

Collection and expansion management saw significant work in late 2025, particularly around legacy expansion handling:

- **#2010** -- CTA / Reference / Set as default. Closed 2025-02.
- **#2212** -- OCL Collection Reference Un-versioning. Closed 2025-10. @jamlung-ri.
- **#2276** -- Flag all Legacy Expansions with an indicator (in database and UI). Closed 2026-03. @snyaggarwal.
- **#2277** -- Implement "Rebuild expansion" actions. Closed 2026-03. @snyaggarwal.
- **#2279** -- Add notification text about new expansion evaluation logic to collection pages. Closed 2026-03. @snyaggarwal, @jamlung-ri.
- **#2289** -- Only save composed expansion params. Closed 2026-03. @snyaggarwal.

The #2276/#2277/#2279 cluster represents a coordinated effort to modernize collection expansion handling -- flagging legacy expansions, providing rebuild actions, and communicating the new logic to users.

---

## 2.7 Import/Export (3 closed issues)

Three import/export issues were completed in this bucket:

- **#1926** -- Speed up IMAP import to under 2 minutes. Closed 2025-07. @rkorytkowski, @paynejd, @snyaggarwal. A multi-contributor performance optimization.
- **#2177** -- Bulk import CSV doesn't create any concepts. Bug fix, closed 2025-05.
- **#1924** -- Import r4.core dependency once. Closed 2026-03. @rkorytkowski.

The remaining 7 import/export issues are open and classified as "keep" -- they represent in-progress improvements to the new bulk import system.

---

## 2.8 Concepts (4 closed issues)

- **#1922** -- Fix overwriting ConceptMap version. Closed 2026-03. @rkorytkowski.
- **#2167** -- Filtering by multiple concept classes doesn't work. Bug fix, closed 2025-05.
- **#2180** -- Method POST not allowed for concept name. Bug fix, closed 2025-05.
- **#2182** -- Fix hierarchy and orphaned resource handling. Closed 2025-05. @snyaggarwal.

---

## 2.9 Sources (4 closed issues)

- **#2173** -- CRUD for source properties and filters. Closed 2025-08. @snyaggarwal.
- **#2220** -- Implement "allVersions" param for repos endpoints. Closed 2026-03. @snyaggarwal.
- **#2221** -- Implement source.target_repo filter parameter. Closed 2025-09. @snyaggarwal.
- **#2235** -- Update validation schema to silently skip identical resource versions during cascade. Closed 2026-03. @snyaggarwal.

---

## 2.10 Users and Authentication (3 closed issues)

- **#2210** -- Unable to add user to org in TBv2 (and TBv3). Closed 2025-08. @snyaggarwal.
- **#2234** -- Org listing broken on v2 and v3. Closed 2025-09. @snyaggarwal.
- **#2241** -- Implement validation on new usernames that prevents whitespaces. Closed 2025-11. @snyaggarwal.

---

## 2.11 Community and Funding (3 closed issues)

A small but notable cluster related to OCL's participation in open-source funding mechanisms:

- **#2115** -- Deploy wellKnown funding manifest at openconceptlab.org. Closed 2025-02.
- **#2116** -- Submit FLOSS funding manifest for OCL. Closed 2025-02. @paynejd.
- **#2117** -- Validate and Submit FLOSS funding manifest for OCL. Closed 2025-02. @paynejd.

These three issues (#2115, #2116, #2117) were filed and resolved within a 4-day window in February 2025, representing a coordinated push to register OCL in the FLOSS funding ecosystem.

---

## 2.12 Documentation (2 closed issues)

- **#2207** -- OCL Swagger Documentation. Closed 2025-09.
- **#2265** -- Add AGENTS.md to the repo. Closed 2026-03. @paynejd.
- **#2427** -- ocl-docs: Add missing mapping search parameters to API reference. Closed 2026-03.

---

## 2.13 Search and Performance (3 closed issues)

- **#2135** -- Review ES scoring explanation API. Closed 2025-05. @snyaggarwal.
- **#2285** -- Fix GraphQL concepts search for HEAD sources. Closed 2025-12.
- **#2146** -- Reload LOINC on OCL dev. Closed 2025-04. @snyaggarwal.

---

## 2.14 General and Administrative (4 closed issues)

- **#2195** -- Upgrade dev instance to t3.small. Closed 2025-07. @snyaggarwal.
- **#2254** -- OCL Administrative. Closed 2025-10.
- **#2255** -- OCL Community Site. Closed 2026-03.
- **#2168** -- RELMA gap analysis. Closed 2025-07. @paynejd.
- **#2293** -- Add action button to refresh candidates. Closed 2026-01. @snyaggarwal.

---

## 2.15 Summary of Completed Work Patterns

The 82 closed issues reveal several patterns about how unlabeled work accumulated:

1. **Routine workflows escaped labeling.** The 21 CIEL releases are the clearest example -- a recurring, well-understood process that never got templated or labeled.

2. **Fast-turnaround bug fixes skipped metadata.** Issues like #2167, #2177, and #2180 were filed and fixed within 1-2 days. The speed of resolution worked against labeling discipline.

3. **Multi-issue efforts were partially labeled.** The collections/expansions cluster (#2276, #2277, #2279) was a coordinated effort, but none of the issues received labels despite being related to labeled TBv3 work.

4. **Infrastructure milestones went unrecorded.** The Bamboo-to-GitHub-Actions CI migration (#2248, #2249) is a significant operational change that was completed without any labeling or milestone tracking.

5. **@snyaggarwal's throughput outpaced labeling.** With 38 assigned issues across the broadest range of themes, the volume of engineering output simply exceeded the team's metadata hygiene capacity.
