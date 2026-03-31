# OCL Issues: Phase 1 Post-Review Summary

**Date:** 2026-03-20 (updated 2026-03-24)
**Repository:** `OpenConceptLab/ocl_issues`

## What Happened

Phase 1 of the OCL issues cleanup produced two reports: a historical backlog synthesis (510 issues) and an active review list (48 issues). Jonathan reviewed the 48 active review issues, then performed a FHIR Service thematic analysis (59 issues) with further closures.

### Active Review (48 issues)

| Action | Count |
|--------|-------|
| Kept open with `reviewed/keep` label | 25 |
| Moved to Active (CIEL-OCL 2026 Part 1 project) | 3 |
| Moved to Historical Backlog (synthesis report) | 1 |
| Closed | 19 |
| **Total reviewed** | **48** |

### FHIR Service Cleanup (59 issues)

| Action | Count |
|--------|-------|
| Keep (#828, renamed + reassigned) | 1 |
| Closed (standard) | 40 |
| Closed (future ideas, highlighted in synthesis) | 8 |
| Applied `reviewed/keep` (canonical URL / $resolveReference group) | 5 |
| Applied `reviewed/keep` (TBv3 defer) | 4 |
| Already closed (#1695) | 1 |
| **Total reviewed** | **59** |

## Current State of `ocl_issues`

**Total open issues:** ~566 (was 633; ~67 closed during cleanup)

| Bucket | Count | Criteria |
|--------|-------|----------|
| **Active** | 78 | Member of "CIEL-OCL 2026 Part 1" GitHub Project |
| **Reviewed/Keep** | ~34 | Labeled `reviewed/keep` — confirmed relevant, not yet in a project |
| **Historical backlog** | ~454 | Remaining backlog issues awaiting thematic analysis |
| **Total open** | **~566** | |

---

## Bucket Details

### Active (78 issues)

**Inclusion criteria:** The issue is a member of the **"CIEL-OCL 2026 Part 1" GitHub Project** ([project board](https://github.com/orgs/OpenConceptLab/projects/11/)), regardless of when it was created or last updated.

These issues are actively being worked on across multiple CIEL milestones (CIEL Bridge, CIEL Implementers, CIEL Source Management, CIEL Content Curation, etc.). No cleanup action needed.

*3 issues added during this review: #2242, #2380, #2402*

### Reviewed/Keep (25 issues)

These issues were reviewed during the Phase 1 active review and confirmed as relevant. They are labeled `reviewed/keep` on GitHub. They are not part of the CIEL project but represent valuable work that should remain open.

- **#2407**: Move OIDC client secret from frontend to backend (oclweb3 + oclapi2)
- **#2294**: $match API performance optimization (labels: performance)
- **#2292**: Atomic “All-or-None” GraphQL mutation for multi-step Concept create/update (timeouts + partial writes)
- **#2291**: Implement hierarchy view in TBv3 search results (assigned: snyaggarwal)
- **#2290**: Implement history for concept & mapping details in TBv3 (assigned: snyaggarwal, milestone: TermBrowser v3 MVP, labels: web3)
- **#2284**: Restore/Revert Collection HEAD to Previous Version (assigned: snyaggarwal)
- **#2282**: Clean Up Collection References with Cascade Options (assigned: snyaggarwal)
- **#2281**: Proposal to support download of a concept's mappings as a valueset
- **#2280**: Automated migration script for resource version reference transformation (assigned: paynejd, snyaggarwal, jamlung-ri)
- **#2278**: Expansion Comparison MVP: Detailed Differences (assigned: snyaggarwal)
- **#2274**: Add checkbox-based actions for references with simple transformation options (assigned: snyaggarwal)
- **#2268**: Remove all possible pathways to creating new resource versioned references (assigned: snyaggarwal)
- **#2267**: Implement rebuild index feature for a repo version in TBv2/v3 (assigned: snyaggarwal)
- **#2266**: Simplified CSV output that combines concepts and mappings
- **#2264**: oclapi2 uses broken docker redis tag as dependency
- **#2263**: Extend Canonical URL Registry to support external server delegation
- **#2262**: Expose OCL source.properties & source.filters through FHIR CodeSystem.property, CodeSystem.filter, and CodeSystem.concept.property (assigned: snyaggarwal, milestone: OCL FHIR Service MVP Launch)
- **#2261**: Use $resolveReference to resolve canonical URL to OCL repo version (assigned: italomacedo, milestone: OCL FHIR Service MVP Launch)
- **#2257**: Deleting Auto-expand HEAD for a collection (assigned: snyaggarwal)
- **#2256**: “Add Reference” UI cascade options need to catch up with rest of TB (assigned: snyaggarwal, labels: web2)
- **#2246**: Implement hierarchy view as the standard view in the Associations panel -- TBv3 (assigned: snyaggarwal, milestone: TermBrowser v3 MVP)
- **#2239**: Add canonical_url support to source.target_repo filter approach (assigned: snyaggarwal, milestone: TermBrowser v3 MVP)
- **#2237**: Clean existing references/expansions
- **#2231**: Dynamic reference cascade should account for equivalence to avoid false validation errors (labels: api2)
- **#2224**: Auto-Match button does not trigger on second click

### Moved to Historical Backlog (1 issue)

- **#2253**: OCL FHIR Core 2025 — large FHIR roadmap epic with 14 sub-issues (13 open, all already in backlog). Moved for inclusion in the synthesis report.

### Closed During Review (19 issues)

These issues were closed as part of the review — either completed, superseded, or no longer relevant.

- **#2289**: Only save composed expansion params
- **#2279**: Add notification text about new expansion evaluation logic to collection pages
- **#2277**: Implement “Rebuild expansion” Actions
- **#2276**: Flag all Legacy Expansions with an Indicator (in database and UI)
- **#2275**: Move repo version metadata to the header and expansions table
- **#2272**: Collection's all Expansions API
- **#2265**: Add AGENTS.md to the repo
- **#2255**: OCL Community Site
- **#2252**: Repo Type Filter in Repos
- **#2247**: Default filter bug plus “Clear” behavior - cannot remove it to see other concept classes
- **#2244**: Add filter panel to Candidates tab
- **#2238**: Auto-match should pre-load 10 candidates (instead of 1) and save with project
- **#2235**: Update validation schema to silently skip identical resource versions during cascade due to conflicting names
- **#2232**: Cascade `sourcemappings` works but also adds versioned mappings references
- **#2227**: Redundant API calls when opening rows after Auto-Match in Map Project
- **#2220**: Implement “allVersions” param for repos endpoints
- **#2214**: Improve resizing of org overview with pinned repos
- **#2213**: Add support for repo properties to $match operation
- **#2211**: Make source props and filters useful

### Historical Backlog (511 issues)

**Inclusion criteria:** Created before August 1, 2025 AND not a member of the CIEL-OCL 2026 Part 1 project. Plus #2253 (moved from active review).

These issues have been categorized in the [synthesis report](ocl-issues-synthesis-2026-03.md) with disposition recommendations:

| Disposition | Count |
|------------|-------|
| keep | 303 |
| close-stale | 103 |
| review | 60 |
| close-outdated | 40 |
| close-superseded | 3 |
| close-duplicate | 2 |

**Next step:** Share synthesis report with community (Phase 2.5), then execute approved closures (Phase 3).

---

## Related Files

| File | Description |
|------|-------------|
| [ocl-issues-output.md](ocl-issues-output.md) | Original bucketing criteria |
| [ocl-issues-synthesis-2026-03.md](ocl-issues-synthesis-2026-03.md) | Historical backlog synthesis (511 issues) |
| [ocl-issues-active-review-2026-03.md](ocl-issues-active-review-2026-03.md) | Original active review list (48 issues, pre-review) |
| [ocl-issues-active-review-2026-03.csv](ocl-issues-active-review-2026-03.csv) | CSV version of active review (pre-review) |