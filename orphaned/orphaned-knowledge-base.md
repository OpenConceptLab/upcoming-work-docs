# Orphaned Bucket: Executive Summary

**Generated:** 2026-03-27
**Scope:** 113 issues with no labels and no milestones from the [OpenConceptLab/ocl_issues](https://github.com/OpenConceptLab/ocl_issues) GitHub repository
**Source data:** `orphaned-raw-archive.json` (113 issues, 214 comments), `orphaned-issue-classification.csv` (113-row classification)

---

## 1.1 What This Bucket Is

The "Fully Orphaned" bucket contains issues that have **no labels and no milestones** on GitHub. These issues were not captured by the prior TBv3 or Backlog analyses because they lacked any categorization breadcrumbs -- no project board assignment, no label, no milestone. The original estimate was 80 issues; the actual count is 113, a 41% overshoot driven by unlabeled CIEL release tracking and mapper work that accumulated throughout 2025-2026.

Despite the name "orphaned," these issues are not abandoned or neglected work. The label is misleading. The vast majority represent **active, recent work that simply was never labeled** -- routine release tracking, mapper feature development, infrastructure tasks, and bug fixes that were filed, worked, and often resolved without anyone applying organizational metadata.

## 1.2 Issue Counts

| Dimension | Count |
|---|---|
| **Total issues** | 113 |
| **CLOSED** | 82 |
| **OPEN** | 31 |
| **Total comments** | 214 |

## 1.3 Era Distribution

The era breakdown is the most surprising finding in this analysis:

| Era | Count | Notes |
|---|---|---|
| **Current (2025-2026)** | 93 | 82% of the bucket |
| **V3 Maturation (2024)** | 20 | 18% of the bucket |
| **Legacy** | 0 | None |

There are zero legacy issues in this bucket. Every single issue was created in 2024 or later. This contrasts sharply with the TBv3 bucket (which contained issues dating back to 2020) and confirms that the "orphaned" problem is not about old zombies drifting unlabeled -- it is about the team's labeling discipline declining as work volume increased in the current era.

## 1.4 Theme Breakdown

Issues were classified into functional themes based on their content:

| Theme | Count | % |
|---|---|---|
| CIEL Release | 21 | 19% |
| Mapper | 21 | 19% |
| Import/Export | 10 | 9% |
| Collections | 7 | 6% |
| Infrastructure | 7 | 6% |
| General | 7 | 6% |
| FHIR | 5 | 4% |
| Concepts | 5 | 4% |
| Users/Auth | 5 | 4% |
| Sources | 5 | 4% |
| AI/ML | 4 | 4% |
| Mappings | 3 | 3% |
| Community | 3 | 3% |
| Documentation | 3 | 3% |
| Search | 3 | 3% |
| Performance | 2 | 2% |
| Events | 1 | 1% |
| Bug Fix | 1 | 1% |

The two dominant themes -- CIEL Release (21) and Mapper (21) -- account for 37% of the bucket. CIEL releases are a routine, recurring workflow managed entirely by @bmamlin with a consistent checklist pattern; none were ever labeled. Mapper issues reflect the rapid growth of the OCL Mapper product in 2025-2026, which accumulated feature requests, bug fixes, and proposals faster than labeling could keep up.

## 1.5 Disposition Summary

| Disposition | Count | % |
|---|---|---|
| **close-done** | 73 | 65% |
| **keep** | 35 | 31% |
| **close-stale** | 3 | 3% |
| **review** | 2 | 2% |

- **close-done (73):** Completed work. Includes all 21 CIEL releases, resolved mapper features, closed bug fixes, and finished infrastructure tasks. These need only a label applied before closing.
- **keep (35):** Open issues representing active or planned work. Predominantly mapper features (#2318, #2319, #2327, #2333, #2335, #2338, #2384, #2415), AI/ML capabilities (#2313, #2314, #2331, #2332), import/export improvements (#1917, #1923, #2035, #2042, #2043, #2137), and API bugs (#2425, #2166, #2393).
- **close-stale (3):** Issues filed in late 2024 with no follow-up: event feed card architecture (#1932), visual customization (#1933), and querying OpenMRS repos (#2032).
- **review (2):** Issues needing human judgment: Bamboo CI build failure (#2058, may be obsolete after GitHub Actions migration) and FHIR import validation process (#1961, closed but completeness unclear).

## 1.6 Contributors

Assignee data from the 113 issues reveals the active contributors:

| Contributor | Issues Assigned | Primary Themes |
|---|---|---|
| **@snyaggarwal** (Sunny Aggarwal) | 38 | Mapper, Sources, Collections, Infrastructure, Search, General |
| **@bmamlin** (Burke Mamlin) | 21 | CIEL Release (all 21) |
| **@filiperochalopes** (Filipe Lopes) | 7 | Mapper, AI/ML |
| **@paynejd** (Jonathan Payne) | 6 | Community, Documentation, AI/ML, Import/Export |
| **@rkorytkowski** (Rafal Korytkowski) | 7 | Import/Export, FHIR |
| **@jamlung-ri** (James Amlung) | 3 | Collections, Import/Export |
| Unassigned | 25 | Various |

Notable patterns:
- **@bmamlin** exclusively handles CIEL releases with a standardized checklist workflow. All 21 CIEL release issues follow an identical pattern and were all resolved without labels.
- **@snyaggarwal** carries the largest share of engineering work across the widest range of themes.
- **@filiperochalopes** is a newer contributor focused on the ICD-11 mapper integration and AI Assistant features, active from February 2026 onward.
- 25 issues (22%) have no assignee, predominantly feature proposals and bug reports filed without ownership.

## 1.7 Key Takeaway

This bucket does not represent neglected or forgotten work. It represents a **labeling gap** in an otherwise active project. The 113 issues here are overwhelmingly recent (93 from 2025-2026), overwhelmingly resolved (82 closed), and cover the same functional areas as the labeled TBv3 work. The cleanup action is straightforward: apply appropriate labels, confirm dispositions, and close the 73 "close-done" issues with proper metadata. The 35 "keep" issues should be labeled and triaged into the active backlog.

---

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

---

# Section 3: Open Issues

This section covers all 31 OPEN issues in the Fully Orphaned bucket. These issues have no project board, no milestone, and no labels, but remain open and represent active or pending work across the OCL platform.

---

## 3.1 Mapper / AI Features (12 issues)

These issues represent the most active area of current development: the OCL Mapper tool and its AI-powered capabilities.

### #2313 -- Evaluate re-ranker performance
**What:** Design an evaluation comparing OCL's default re-ranking language model against alternative LMs (including medically-trained models) using validation datasets. Key decision points include whether re-ranking should be enabled by default, whether users need toggle control, and whether a single LM suffices for all project types.
**Why it matters:** Re-ranking directly affects mapping quality. The evaluation will determine whether this capability is ready for general availability.
**Status:** Open since Feb 2026, unassigned. Requirements defined but no evaluation work started.

### #2314 -- AI Assistant responds to input dataset size, selected algos, and selected target repo
**What:** Make the AI Assistant context-aware so it adjusts its behavior based on the size of the input dataset, selected matching algorithms, and the target repository (e.g. LOINC vs CIEL vs ICD-11).
**Why it matters:** A smarter AI Assistant that adapts to context will provide more relevant recommendations and reduce user friction during mapping.
**Status:** Open since Feb 2026, assigned to @snyaggarwal. Continues from #2309.

### #2327 -- Implement word/acronym substitution list in OCL Mapper pre-processing step
**What:** An optional pre-processing step to handle common acronyms, synonyms, and misspellings before matching. Examples include kidney/renal, gynecological/gynaecological, and prostrate/prostate. Filipe proposed an approach based on a published article that achieved ~6% improvement using Qwen3-8B to generate CIEL-derived synonyms cached for each release.
**Why it matters:** Can measurably improve CIEL-as-bridge match performance with relatively low implementation cost.
**Status:** Open since Feb 2026, assigned to @filiperochalopes. Approach discussed in comments with concrete next steps.

### #2331 -- AI Assistant Concept QA Check
**What:** Implement an OCL AI Assistant prompt template that accepts a concept definition and returns a cleaned version with specific improvement suggestions (names, descriptions, mappings, properties) plus import-ready JSON. Filipe contributed a detailed preliminary prompt template covering 10 QA rules including typo detection, British/American locale handling, UCUM unit validation, retired SNOMED detection, and drug concept mapping completeness.
**Why it matters:** Automates quality assurance for clinical concept definitions, reducing human review burden.
**Status:** Open since Feb 2026, assigned to @paynejd and @filiperochalopes. Substantial prompt engineering work already done in comments.

### #2332 -- Improve error handling for AI Assistant
**What:** AI Assistant errors currently expose raw OpenRouter responses to the OCL Mapper UI, revealing implementation details (e.g. that OpenRouter is used). Errors appear inconsistently in different panels. The fix requires server-side error recording, parsed user-facing responses, and row-level error flags.
**Why it matters:** User experience and security -- raw error exposure is unprofessional and leaks infrastructure details.
**Status:** Open since Feb 2026, assigned to @snyaggarwal and @filiperochalopes. Related to #2391.

### #2333 -- OCL should consider AI Assistant response in auto-match mapping selection
**What:** Currently auto-match only considers unified score from retrieval, even when the AI Assistant is part of the pipeline. This ticket incorporates the AI Assistant's recommendation into the final mapping selection logic.
**Why it matters:** Without this, the AI Assistant's judgment is wasted during automated matching, defeating the purpose of including it in the pipeline.
**Status:** Open since Feb 2026, assigned to @snyaggarwal. Needs requirements.

### #2335 -- Support external mapping suggestion ingestion and curated batch updates in OCL Mapper
**What:** Enable importing externally-generated mapping suggestions (from CSV) into the Mapper for curator validation before applying. Must support two concrete workflows: ICD-11 batch triage (~32.5k terms) and periodic IMO partnership exchanges (SNOMED and ICD-10). CSV formats differ between sources.
**Why it matters:** Critical for CIEL maintenance workflows that currently happen outside OCL. Enables OCL Mapper to replace the legacy CIEL Lab V2 environment.
**Status:** Open since Feb 2026, unassigned. Well-specified with user stories, acceptance criteria, and sample data attached.

### #2338 -- Display ICD-11 concept details in context of hierarchy
**What:** Display ICD-11 concepts within their hierarchical context in the Mapper (and later TBv3). Open strategic questions around post-coordinated expressions, component-based lookup, and dynamic naming for post-coordination.
**Why it matters:** Understanding concept meaning in hierarchical terminologies requires seeing the concept in context. Fundamental for ICD-11 mapping work.
**Status:** Open since Feb 2026, assigned to @snyaggarwal and @filiperochalopes. Active discussion in comments with outstanding decisions needed from @paynejd.

### #2384 -- Download format: Full Mapping Project Export
**What:** Export the complete mapping project (everything saved to S3) as a downloadable file, primarily for debugging purposes.
**Why it matters:** Debugging and audit trail for mapping projects.
**Status:** Open since Feb 2026, unassigned. Brief description only.

### #2393 -- Validate external Match API configuration and lookup configuration and access
**What:** Fail-fast validation for external Match API configuration including: verifying lookup access and repository permissions, validating API existence and authentication, and preventing accidental writes to authoritative repos (e.g. WHO-ICD-11). Must handle 504/500 errors from external APIs gracefully.
**Why it matters:** Prevents silent misconfiguration that could write to wrong repositories or crash with cryptic messages. Safety-critical for production mapping work.
**Status:** Open since Feb 2026, assigned to @snyaggarwal. Well-specified with user story, requirements, and acceptance criteria.

### #2415 -- Recreate ICD-11 E2E demo showcase test environment and export results CSV
**What:** Recreate the ICD-11 demo environment to rerun the E2E scenario and generate fresh output CSV from OCL Mapper.
**Why it matters:** Provides updated export results for stakeholder review and validates that the demo environment is reproducible.
**Status:** Open since Mar 2026, assigned to @filiperochalopes. Mostly complete -- Filipe generated CSVs with AI Assistant disabled and then with CIEL Bridge enabled after vectorization. May be closable.

### #2425 -- Mapping search: concept query param silently ignored on repo-scoped endpoint
**What:** The `concept` query parameter on `GET /orgs/:org/sources/:source/mappings/` is silently ignored. Root cause identified: `concept` is not defined as a faceted field in `es_fields`, so it gets dropped during faceted filter processing. `fromConcept` and `toConcept` work correctly.
**Why it matters:** API behaves incorrectly and silently returns wrong results. Documented workaround exists but the bidirectional filter should work as expected.
**Status:** Open since Mar 2026, unassigned. Root cause fully identified in the issue body. Related documentation fix already closed (#2427).

---

## 3.2 AI/ML Infrastructure (2 issues)

These issues address hosting AI/ML services within OCL's infrastructure.

### #2318 -- Implement icd11 API and $match inside OCL Online environment
**What:** Host the ICD-11 API implementation (currently on Filipe's server, see #2306) within OCL Online's infrastructure.
**Why it matters:** Production reliability and operational control -- external dependencies on personal infrastructure are not sustainable.
**Status:** Open since Feb 2026, unassigned. Brief description.

### #2319 -- Host icd11 llm-as-terminologist in OCL Online infra
**What:** Host the ICD-11 LLM-as-terminologist service (currently on Filipe's infrastructure, see #2305) within OCL Online's infrastructure. Explicitly noted as "not ready for work yet."
**Why it matters:** Same rationale as #2318 -- bringing external AI services under OCL operational control.
**Status:** Open since Feb 2026, unassigned. Not ready for work.

---

## 3.3 Bulk Import (6 issues)

A cluster of issues related to the new bulk import system, primarily driven by FHIR NPM package import requirements.

### #1917 -- Add S3 storage support for new bulk import
**What:** S3 storage as a cache for NPM packages fetched from the registry and for user-uploaded import files. Provides back-end capability for file uploads via the API.
**Why it matters:** Required infrastructure for reliable large-scale imports.
**Status:** Open since Aug 2024, assigned to @rkorytkowski. Last activity Nov 2024 when @paynejd asked for an update. Oldest open issue in this bucket.

### #1923 -- Persist partial progress for new bulk import
**What:** Requesting progress on large imports (e.g. r4.core with many tasks) times out because progress calculation visits all tasks in the chain. Solution is to persist partial progress for completed groups.
**Why it matters:** Without this, users have no visibility into long-running imports.
**Status:** Open since Sep 2024, assigned to @rkorytkowski. Jan 2025 comment indicates performance was improved by saving subtask IDs for direct lookup.

### #2035 -- Fix new bulk import queuing
**What:** Importing the hl7.fhir.r4.core package enters an endless loop. Root cause: Celery does not handle well chains of multiple chords with many tasks. Rafal fixed all issues by limiting task count to under 1k and setting minimum 100 resources per task.
**Why it matters:** Blocks FHIR package imports, which are essential for the FHIR service.
**Status:** Open since Dec 2024, assigned to @rkorytkowski. Jan 2025 comment says "Finally fixed all issues!" but issue remains open -- may need formal verification and closure.

### #2042 -- Do not schedule all bulk import subtasks at once
**What:** Celery scheduling optimization: schedule one chord at a time with a callback task that schedules the next, instead of scheduling all chords in a chain upfront. This avoids Celery's known limitations with large task chains.
**Why it matters:** Reliability of bulk imports for large datasets.
**Status:** Open since Jan 2025, assigned to @rkorytkowski. No comments beyond the initial description.

### #2043 -- Test new bulk import for oclapi imports
**What:** Test the new bulk import system with standard oclapi imports and the most recent CIEL. Add a UI checkbox for users to select the new bulk import. Includes package streaming/celery sub-tasking for improved reliability and lower resource utilization.
**Why it matters:** Validation gate before the new import system can be used in production.
**Status:** Open since Jan 2025, assigned to @snyaggarwal. Jul 2025 comments show @paynejd prioritizing this and @rkorytkowski noting that deletion is not implemented in the new system.

### #2137 -- Collection Version via Bulk Import fails
**What:** Bulk importing a "Collection Version" line fails with "Version Head not found" error and a Python NoneType traceback in the importer code. Errbit error logged on staging.
**Why it matters:** Blocks automated collection versioning workflows via bulk import.
**Status:** Open since Mar 2025, assigned to @snyaggarwal. No comments.

---

## 3.4 General Platform (8 issues)

A mix of platform-wide improvements, bug fixes, and infrastructure work.

### #2032 -- Query OpenMRS repos in OCL prod
**What:** Run queries against production to understand OpenMRS community usage: repos with OpenMRS Validation Schema that have been updated in the last 6 months, plus ability to query export downloads by timeframe.
**Why it matters:** Usage data to understand community engagement and plan capacity.
**Status:** Open since Dec 2024, assigned to @snyaggarwal. Dec 2024 results provided (275 source versions, 386 collection versions updated since Jun 2024). May be closable if the data was sufficient.

### #2033 -- OCLv3 Mapping tool prototype
**What:** Build a simple Mapping UI prototype in TBv3 for power users to iterate on design and requirements. Detailed prototype requirements covering target source selection, spreadsheet loading, matching algorithm dropdown, tabular candidate display with scoring, and concept detail views.
**Why it matters:** This was the genesis of what became the OCL Mapper (oclmap). The prototype requirements shaped the current product.
**Status:** Open since Dec 2024, assigned to @snyaggarwal. This work has been largely superseded by the full OCL Mapper implementation and may be closable.

### #2058 -- API dev bambooCI build failing -- ES setup (and hence tests) failing
**What:** The oclapi2 dev build on OpenMRS Bamboo CI fails because Elasticsearch setup is broken. ES container is created but tagged as "error," yet reports as available, and all ES-dependent tests fail.
**Why it matters:** CI/CD pipeline reliability.
**Status:** Open since Feb 2025, assigned to @rkorytkowski. Note: OCL migrated from Bamboo to GitHub Actions in Oct 2025 (#2248, #2249), so this may be moot.

### #2134 -- Google CAPTCHA API JS is not available in China
**What:** Users in China cannot complete registration because Google CAPTCHA JS is blocked. Solution proposed: make Google CAPTCHA optional via environment variable.
**Why it matters:** Accessibility for users behind the Great Firewall of China.
**Status:** Open since Mar 2025, unassigned. Sunny provided a one-line solution direction.

### #2149 -- The first version's hierarchy different from the HEAD's
**What:** Creating the first version of a source produces a hierarchy display that differs from HEAD, even though content is unchanged. Confirmed as a genuine UI bug by @snyaggarwal.
**Why it matters:** User confusion and data integrity concerns when versioned hierarchy does not match HEAD.
**Status:** Open since Apr 2025, unassigned. Bug confirmed but no fix applied.

### #2166 -- Bad API call always returns some arbitrary results
**What:** Malformed API requests (e.g. `?mapcode="ICD-10-WHO:E14.9"` or `?foobarbaz`) return 200 with arbitrary concept results instead of a 40X error explaining the malformation.
**Why it matters:** Silent failures lead to confusion and potentially incorrect downstream decisions.
**Status:** Open since May 2025, unassigned. No comments.

### #2193 -- OCL Caching & Performance Spike
**What:** Multi-part performance initiative: (1) cache TBv2's first page of latest released repo version (partially done), (2) analyze common queries for caching opportunities, (3) analyze LOINC performance. First item partially complete (done for TBv2, needs TBv3 verification).
**Why it matters:** Performance is critical for large repos like LOINC and directly affects user experience.
**Status:** Open since Jun 2025, assigned to @snyaggarwal. Partially complete.

### #2194 -- Cannot update user email address
**What:** Saving an updated email address on the user profile shows a success message but the email reverts to the old value. Tested with ocladmin rights and still fails.
**Why it matters:** Basic user management functionality is broken. Users cannot maintain current contact information.
**Status:** Open since Jun 2025, unassigned. Well-documented reproduction steps provided by an external user.

### #2201 -- Collection reference filter on language translation
**What:** Support filtering collection references by concepts that have a translation in a specific language. Use case: dynamic reference for CIEL Diagnosis concepts with French translations (supporting DRC MoH). Bug was initially found and fixed by @snyaggarwal, but multiple issues surfaced during testing including: failed jobs, UI not showing async reference processing status, and cascade performance/correctness questions.
**Why it matters:** Directly supports the OpenMRS community's need for language-filtered collections. Grace Potma (DRC) is actively waiting on this.
**Status:** Open since Jul 2025, assigned to @snyaggarwal. Partially working -- the feature functions but cascade filter ordering (filter-then-cascade vs cascade-then-filter) needs design resolution. Next step: @paynejd to create a concept/mapping diagram illustrating the 3 cascade options.

---

## 3.5 Close-Stale (3 issues)

These issues are recommended for closure due to staleness and lack of substantive content.

### #1932 -- Event feed: Card architecture
**What:** Empty issue body, title only. Created Sep 2024.
**Why it matters:** Was likely a placeholder for TBv3 event feed UI design. No description, no assignee, no activity since creation.
**Recommendation:** Close as stale. If event feed work is still desired, create a new ticket with proper requirements.

### #1933 -- Visual customization
**What:** Empty issue body, title only. Created Sep 2024.
**Why it matters:** Was likely a placeholder for TBv3 visual customization features. No description, no assignee, no activity since creation.
**Recommendation:** Close as stale. If visual customization work is needed, create a new ticket with requirements.

### #2032 -- Query OpenMRS repos in OCL prod
**What:** Ad hoc query request that was answered in Dec 2024. The data was provided in comments.
**Recommendation:** Close as stale. The query was answered. If periodic usage monitoring is needed, create an infrastructure ticket.

---

## 3.6 Review (2 issues)

These issues need human review to determine disposition.

### #2058 -- API dev bambooCI build failing
**What:** Bamboo CI build failures for oclapi2.
**Recommendation:** Review whether this is moot now that OCL migrated to GitHub Actions (#2248, #2249 closed Oct 2025). If so, close with a note referencing the migration.

### #2033 -- OCLv3 Mapping tool prototype
**What:** Original prototype requirements for what became OCL Mapper.
**Recommendation:** Review whether this has been superseded by the full OCL Mapper implementation. If so, close with a note that the work was completed in the oclmap codebase.

---

# Section 4: Appendices

---

## Appendix A: Issue Index

All 113 issues in the Fully Orphaned bucket, sorted by state (OPEN first) then by issue number within each group.

### OPEN Issues (31)

| # | Title | Disposition | Theme | Section |
|---|---|---|---|---|
| 1917 | Add S3 storage support for new bulk import | keep | Import/Export | 3.3 |
| 1923 | Persist partial progress for new bulk import | keep | Import/Export | 3.3 |
| 1932 | Event feed: Card architecture | close-stale | Events | 3.5 |
| 1933 | Visual customization | close-stale | General | 3.5 |
| 2032 | Query OpenMRS repos in OCL prod | close-stale | Search | 3.5 |
| 2033 | OCLv3 Mapping tool prototype | keep | Mappings | 3.6 |
| 2035 | Fix new bulk import queuing | keep | Import/Export | 3.3 |
| 2042 | Do not schedule all bulk import subtasks at once | keep | Import/Export | 3.3 |
| 2043 | Test new bulk import for oclapi imports | keep | Import/Export | 3.3 |
| 2058 | API dev bambooCI build failing -- ES setup failing | review | Infrastructure | 3.6 |
| 2134 | Google CAPTCHA API JS is not available here (cn) | keep | Users/Auth | 3.4 |
| 2137 | Collection Version via Bulk Import fails | keep | Import/Export | 3.3 |
| 2149 | The first version's hierarchy different from the HEAD's | keep | Concepts | 3.4 |
| 2166 | Bad API call always returns some arbitrary results | keep | General | 3.4 |
| 2193 | OCL Caching & Performance Spike | keep | Performance | 3.4 |
| 2194 | Cannot update user email address | keep | Users/Auth | 3.4 |
| 2201 | Collection reference filter on language translation | keep | Collections | 3.4 |
| 2313 | Evaluate re-ranker performance | keep | AI/ML | 3.1 |
| 2314 | AI Assistant responds to input dataset size, selected algos, and selected target repo | keep | AI/ML | 3.1 |
| 2318 | Implement icd11 API and $match inside OCL Online environment | keep | Mapper | 3.2 |
| 2319 | Host icd11 llm-as-terminologist in OCL Online infra | keep | Mapper | 3.2 |
| 2327 | Implement word/acronym substitution list in OCL Mapper pre-processing step | keep | Mapper | 3.1 |
| 2331 | AI Assistant Concept QA Check | keep | AI/ML | 3.1 |
| 2332 | Improve error handling for AI Assistant | keep | AI/ML | 3.1 |
| 2333 | OCL should consider AI Assistant response in auto-match mapping selection | keep | Mapper | 3.1 |
| 2335 | Support external mapping suggestion ingestion and curated batch updates in OCL Mapper | keep | Mapper | 3.1 |
| 2338 | Display ICD-11 concept details in context of hierarchy | keep | Mapper | 3.1 |
| 2384 | Download format - Full Mapping Project Export | keep | Mapper | 3.1 |
| 2393 | Validate external Match API configuration and lookup configuration and access | keep | Bug Fix | 3.1 |
| 2415 | Recreate ICD-11 E2E demo showcase test environment and export results CSV | keep | Mapper | 3.1 |
| 2425 | Mapping search: concept query param silently ignored on repo-scoped endpoint | keep | Search | 3.1 |

### CLOSED Issues (82)

| # | Title | Disposition | Theme | Section |
|---|---|---|---|---|
| 1919 | Support ConceptMap and CodeSystem with the same ID | keep | FHIR | 2 |
| 1920 | CIEL v2024-09-04 release | close-done | CIEL Release | 2 |
| 1922 | Fix overwriting ConceptMap version | keep | Concepts | 2 |
| 1924 | Import r4.core dependency once | keep | Import/Export | 2 |
| 1926 | Speed up IMAP import to under 2min | close-done | Import/Export | 2 |
| 1938 | CIEL v2024-10-04 release | close-done | CIEL Release | 2 |
| 1954 | Unable to convert FHIR API response to XML | close-done | FHIR | 2 |
| 1956 | CIEL v2024-10-18 release | close-done | CIEL Release | 2 |
| 1957 | Test load baseline content via NPM import | keep | FHIR | 2 |
| 1961 | Implement FHIR import validation/comparison process | review | FHIR | 2 |
| 1976 | CIEL v2024-11-25 release | close-done | CIEL Release | 2 |
| 2010 | CTA / Reference / Set as default | close-done | Collections | 2 |
| 2036 | CIEL v2024-12-20 release | close-done | CIEL Release | 2 |
| 2041 | Do not import npm hl7.fhir.r4.core if listed in dependencies | keep | FHIR | 2 |
| 2044 | CIEL v2025-01-24 release | close-done | CIEL Release | 2 |
| 2067 | CIEL v2025-02-15 release | close-done | CIEL Release | 2 |
| 2115 | Deploy wellKnown funding manifest at openconceptlab.org | close-done | Infrastructure | 2 |
| 2116 | Submit FLOSS funding manifest for OCL | close-done | Community | 2 |
| 2117 | Validate and Submit FLOSS funding manifest for OCL | close-done | Community | 2 |
| 2130 | CIEL v2025-03-17 release | close-done | CIEL Release | 2 |
| 2135 | Review ES scoring explanation api | close-done | General | 2 |
| 2146 | Reload LOINC on OCL dev | close-done | Performance | 2 |
| 2148 | CIEL v2025-04-07 release | close-done | CIEL Release | 2 |
| 2160 | CIEL v2025-05-12 release | close-done | CIEL Release | 2 |
| 2167 | Filtering by multiple concept classes doesn't work | close-done | Concepts | 2 |
| 2168 | RELMA gap analysis | close-done | General | 2 |
| 2169 | $match Error handling for invalid submission | close-done | Mapper | 2 |
| 2171 | Research and propose methods to improve LOINC performance | close-done | Mapper | 2 |
| 2172 | LOINC (v2.80 or 2.81) Content Importing into OCL Online | keep | Import/Export | 2 |
| 2173 | CRUD for source properties and filters | close-done | Sources | 2 |
| 2177 | Bulk import CSV doesn't create any concepts | close-done | Import/Export | 2 |
| 2179 | Fix source column for hierarchical associations | close-done | Infrastructure | 2 |
| 2180 | Method POST not allowed for concept name | close-done | Concepts | 2 |
| 2182 | Fix hierarchy and orphaned resource handling | close-done | Concepts | 2 |
| 2191 | CIEL v2025-06-13 release | close-done | CIEL Release | 2 |
| 2195 | Upgrade dev instance to t3.small | close-done | General | 2 |
| 2196 | Implement new Mapping: Code and Mapping: List algorithms | close-done | Mappings | 2 |
| 2198 | CIEL v2025-07-15 release | close-done | CIEL Release | 2 |
| 2202 | Issue with non-versioned mapping resolution | close-done | Mappings | 2 |
| 2204 | Filtering of target repo | keep | Sources | 2 |
| 2205 | Add external $match APIs to OCL Mapper | keep | Mapper | 2 |
| 2206 | Implement default filter for a repo in TBv3/Mapper | close-done | Mapper | 2 |
| 2207 | OCL Swagger Documentation | close-done | Documentation | 2 |
| 2208 | CIEL v2025-08-11 release | close-done | CIEL Release | 2 |
| 2210 | Unable to add user to org in TBv2 (and TBv3) | close-done | Users/Auth | 2 |
| 2212 | OCL Collection Reference Un-versioning | close-done | Collections | 2 |
| 2215 | Fix bottom whitespace in Mapping Decisions header | close-done | Infrastructure | 2 |
| 2220 | Implement "allVersions" param for repos endpoints | close-done | Sources | 2 |
| 2221 | Implement source.target_repo filter parameter | close-done | Sources | 2 |
| 2225 | $match API settings do not persist after page reload | close-done | Mapper | 2 |
| 2226 | Source name in Map Project appears as undefined | close-done | Mapper | 2 |
| 2227 | Redundant API calls when opening rows after Auto-Match | close-done | Mapper | 2 |
| 2229 | Proposal: Support map_type in $match response schema | close-done | Mapper | 2 |
| 2230 | Proposal: Introduce ciel_results in $match response | close-done | Mapper | 2 |
| 2233 | CIEL v2025-09-05 release | close-done | CIEL Release | 2 |
| 2234 | Org listing broken on v2 and v3 | close-done | Users/Auth | 2 |
| 2235 | Update validation schema to silently skip identical resource versions | close-done | Sources | 2 |
| 2238 | Auto-match should pre-load 10 candidates and save with project | close-done | Mapper | 2 |
| 2241 | Implement validation on new usernames that prevents whitespaces | close-done | Users/Auth | 2 |
| 2243 | CIEL v2025-09-23 release | close-done | CIEL Release | 2 |
| 2248 | Move oclapi2 from OpenMRS bamboo CI to github actions | close-done | Infrastructure | 2 |
| 2249 | Move TBv2 from OpenMRS bamboo CI to github actions | close-done | Infrastructure | 2 |
| 2251 | CIEL v2025-10-19 release | close-done | CIEL Release | 2 |
| 2254 | OCL Administrative | close-done | General | 2 |
| 2255 | OCL Community Site | close-done | Community | 2 |
| 2260 | CIEL v2025-11-20 release | close-done | CIEL Release | 2 |
| 2265 | Add AGENTS.md to the repo | close-done | Documentation | 2 |
| 2270 | Save project-level events with Mapping Project | close-done | Mapper | 2 |
| 2271 | Remove "Pre-load candidates" checkbox from Auto-match dialog | close-done | Mapper | 2 |
| 2276 | Flag all Legacy Expansions with an Indicator | close-done | Collections | 2 |
| 2277 | Implement "Rebuild expansion" Actions | close-done | Collections | 2 |
| 2279 | Add notification text about new expansion evaluation logic | close-done | Collections | 2 |
| 2283 | Fix: Features and fixes for OCL API + CIEL Lab integration | close-done | Infrastructure | 2 |
| 2285 | Fix GraphQL concepts search for HEAD sources | close-done | Search | 2 |
| 2286 | CIEL v2025-12-24 release | close-done | CIEL Release | 2 |
| 2287 | Expose $match in TBv3 spotlight for compatible repo versions | close-done | Mapper | 2 |
| 2289 | Only save composed expansion params | close-done | Collections | 2 |
| 2293 | Add action button to refresh candidates | close-done | General | 2 |
| 2296 | CIEL v2026-01-25 release | close-done | CIEL Release | 2 |
| 2390 | CIEL v2026-02-26 release | close-done | CIEL Release | 2 |
| 2411 | CIEL v2026-03-23 release | close-done | CIEL Release | 2 |
| 2427 | ocl-docs: Add missing mapping search parameters to API reference | close-done | Documentation | 2 |

---

## Appendix B: Contributor Map

Contributors across all 113 issues, with issue counts, primary themes, and notable issues.

| Contributor | Issues Assigned | Primary Themes | Notable Issues |
|---|---|---|---|
| **@snyaggarwal** (Sunny Aggarwal) | 42 | Mapper, Sources, Collections, Users/Auth, Performance | #2333 auto-match AI, #2314 AI Assistant, #2201 language filter, #2193 caching spike, #2238 auto-match candidates |
| **@bmamlin** (Burke Mamlin) | 18 | CIEL Release | All 18 CIEL release issues (#1920 through #2411). Meticulous release notes with mapping counts and failure analysis |
| **@rkorytkowski** (Rafal Korytkowski) | 8 | Import/Export, FHIR | #1917 S3 support, #1923 partial progress, #2035 queuing fix, #2042 subtask scheduling |
| **@paynejd** (Jonathan Payne) | 5 | Documentation, Community, AI/ML | #2331 AI QA Check, #2168 RELMA gap analysis, #2115-#2117 FLOSS funding |
| **@filiperochalopes** (Filipe Lopes) | 4 | Mapper, AI/ML | #2415 ICD-11 demo, #2327 word substitution, #2338 ICD-11 hierarchy (co-assigned) |
| **@jamlung-ri** (James Amlung) | 2 | Collections, Import/Export | #2212 collection un-versioning, #2172 LOINC importing (co-assigned) |
| **@swagers** (Steven Wagers) | 1 | Import/Export | #2172 LOINC importing (co-assigned) |
| *Unassigned* | 33 | Mixed | #2313 re-ranker, #2335 external mapping, #2166 bad API call, #2134 CAPTCHA China |

### Contributor Patterns

- **@snyaggarwal** is the primary implementer across nearly all OCL subsystems and handles the bulk of Mapper, API, and frontend work
- **@bmamlin** operates independently on CIEL releases with a consistent, well-documented process
- **@rkorytkowski** owns the new bulk import subsystem, with all 4 open bulk import infrastructure issues assigned to him
- **@filiperochalopes** is the primary contributor for ICD-11 and AI-related Mapper features, often co-assigned with @snyaggarwal
- 33 issues (29%) are unassigned, concentrated in recent Mapper/AI tickets and community-reported bugs

---

## Appendix C: Labeling Recommendations

All 113 issues in this bucket are completely unlabeled. Below are recommended labels to apply, grouped by suggested label. Labels follow the convention used in other OCL project boards.

### By Component Label

**`api2`** (OCL API / oclapi2) -- 29 issues
- #1917, #1919, #1922, #1923, #1924, #2035, #2041, #2042, #2043, #2058, #2134, #2137, #2149, #2166, #2167, #2180, #2182, #2193, #2194, #2201, #2220, #2221, #2225, #2234, #2235, #2241, #2248, #2285, #2425

**`mapper`** (OCL Mapper / oclmap) -- 24 issues
- #2169, #2171, #2196, #2204, #2205, #2206, #2215, #2225, #2226, #2227, #2229, #2230, #2238, #2270, #2271, #2287, #2293, #2313, #2314, #2327, #2333, #2335, #2338, #2384

**`web3`** (TermBrowser v3 / oclweb3) -- 8 issues
- #1932, #1933, #2033, #2149, #2193, #2234, #2276, #2279

**`ciel`** (CIEL releases) -- 18 issues
- #1920, #1938, #1956, #1976, #2036, #2044, #2067, #2130, #2148, #2160, #2191, #2198, #2208, #2233, #2243, #2251, #2260, #2286, #2296, #2390, #2411

**`infra`** (Infrastructure / DevOps) -- 7 issues
- #2058, #2115, #2179, #2195, #2248, #2249, #2283

**`fhir`** (FHIR service) -- 5 issues
- #1919, #1922, #1954, #1957, #1961

**`docs`** (Documentation) -- 3 issues
- #2207, #2265, #2427

**`ai`** (AI/ML features) -- 8 issues
- #2313, #2314, #2318, #2319, #2327, #2331, #2332, #2333

### By Work Type Label

**`bug`** -- 14 issues
- #2134, #2137, #2149, #2166, #2167, #2180, #2194, #2210, #2225, #2226, #2227, #2234, #2285, #2425

**`feature`** -- 32 issues
- #1917, #1932, #1933, #2033, #2193, #2196, #2201, #2204, #2205, #2206, #2220, #2221, #2229, #2230, #2238, #2270, #2271, #2276, #2277, #2279, #2287, #2289, #2293, #2313, #2314, #2327, #2331, #2333, #2335, #2338, #2384, #2393

**`enhancement`** -- 12 issues
- #1923, #1926, #2035, #2042, #2043, #2058, #2182, #2215, #2235, #2241, #2332, #2415

**`release`** -- 18 issues (all CIEL releases)
- #1920, #1938, #1956, #1976, #2036, #2044, #2067, #2130, #2148, #2160, #2191, #2198, #2208, #2233, #2243, #2251, #2260, #2286, #2296, #2390, #2411

### By Era Label

**`V3`** -- 11 issues (created before Jan 2025, "V3 Maturation" era)
- #1917, #1919, #1920, #1922, #1923, #1924, #1926, #1932, #1933, #1938, #1954

**`Current`** -- 102 issues (created Jan 2025 or later)
- All remaining issues

### Priority Recommendations for Open Issues

**High priority** (actively blocking or directly affecting users):
- #2393 -- Validate external Match API (safety-critical)
- #2332 -- AI Assistant error handling (user-facing)
- #2425 -- Mapping search bug (incorrect results)
- #2194 -- Cannot update email (basic functionality broken)

**Medium priority** (important for upcoming work):
- #2313, #2314, #2331, #2333 -- AI/ML feature cluster
- #2335, #2338 -- ICD-11 mapping workflow
- #2201 -- Language filter (community waiting)
- #2193 -- Caching & performance

**Low priority** (infrastructure or deferred):
- #1917, #1923, #2035, #2042, #2043 -- Bulk import cluster (may be partially complete)
- #2318, #2319 -- Infrastructure hosting (explicitly "not ready")
- #2058 -- Bamboo CI (likely moot after GitHub Actions migration)
