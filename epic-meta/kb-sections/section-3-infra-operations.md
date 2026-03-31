# Section 3: Infrastructure & Operations

This section covers infrastructure, CI/CD, deployment, and performance-related epics. Most are stale placeholders from the 2021 epic-creation sprint that never accumulated actionable detail.

## 3.1 CI/CD & Tooling

### What It Is
Epics related to build pipelines, testing infrastructure, administrative tooling, and operational processes. Three of the four are empty-body placeholders from 2020-2021 that were never developed. The fourth is an active 2025 epic that has already been closed with context preserved.

### Issues

- **OCL Administrative (#344 -- close-stale).** Empty body, no comments. Created Sep 2020, last updated Aug 2021. Labeled "Project-level Epic" but never populated with sub-issues or requirements. No indication of what "administrative" scope was intended to cover. Close as abandoned placeholder.

- **Infrastructure (#858 -- close-stale).** Body is a single sentence: "Ticket to capture infrastructure enhancements." Created Jul 2021, last updated Aug 2021. Labeled "Project-level Epic" but served only as a category header with no actionable content. Close as stale.

- **Performance Testing on Production (#952 -- close-stale).** Empty body, no comments. Created Aug 2021, never updated. No test plans, tooling decisions, or linked work. If production perf testing becomes a priority, a fresh ticket with specific scope would be needed. Close as stale.

- **Automated FHIR Testing Pipeline (#2046 -- keep).** Created Jan 2025, assigned to rkorytkowski and jamlung-ri. Already closed Mar 2026 as part of the FHIR backlog cleanup. Closing comment notes the idea "remains important for the future" and context is preserved in the FHIR Service Knowledge Base. No action needed -- already resolved.

## 3.2 Infrastructure & Operations

### What It Is
Epics covering API maintenance, operational reporting, and queue/task management. All three are closeable -- two are stale from 2020-2021 and one is functionally complete.

### Issues

- **oclapi2 Maintenance (#311 -- close-stale).** Body: "Miscellaneous bug fixes that do not fall into other Epics." Created Sep 2020, last updated Aug 2021. This was a catch-all bucket rather than a scoped epic. Any ongoing maintenance work should be tracked as individual tickets, not under a vague umbrella. Close as stale.

- **API-level Reporting (#905 -- close-stale).** Empty body, no comments. Created Aug 2021, never updated. No requirements, no linked issues. If API reporting/observability becomes a priority, it should be scoped fresh. Close as stale.

- **Queue Management Service (#1773 -- close-superseded).** Body lists four goals (remove Flower dependency, longer task persistence, reliable in-progress events, clear user task tagging) -- all four are checked off as complete. Created Feb 2024, last updated Mar 2024. Tagged V3/v3-foundation. The work described here has been done; the issue was never formally closed. Close as superseded by completed implementation.

## 3.3 Deployment & Environments

### What It Is
A single epic covering the OCL demo environment, with concrete requirements that remain relevant.

### Issues

- **Demo environment (#1846 -- keep).** Created Jun 2024. Has a substantive body outlining three requirement areas: (1) account management -- SSO vs standalone auth for demo, onboarding considerations; (2) starter content -- CIEL, ICD10, LOINC, SNOMED GPS preloaded, locked admin features; (3) auto-reset -- weekly reset schedule with user-facing countdown messaging. This is a well-scoped operational need that has not been addressed. Keep open.

## 3.4 Search & Performance

### What It Is
Epics related to API search behavior and performance optimization. Both are from Aug 2021 with empty bodies.

### Issues

- **API Performance Improvement (#876 -- review).** Empty body, no comments. Created Aug 2021, never updated. Performance work has since been scoped more concretely in other tickets (e.g., Import Performance #1847). This could serve as a broad umbrella if desired, but has no actionable content of its own. Recommend closing as stale unless there is intent to use it as a tracking epic for non-import performance work.

- **API Search Results (#886 -- close-stale).** Empty body, no comments. Created Aug 2021, never updated. Search functionality has evolved significantly since 2021 without reference to this epic. Close as stale.
