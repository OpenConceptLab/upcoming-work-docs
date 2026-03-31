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
