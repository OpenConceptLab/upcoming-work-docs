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
