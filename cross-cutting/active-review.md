# OCL Active Issues Review List

**Generated:** 2026-03-19 (updated 2026-03-20)
**Scope:** Issues created August 2025 or later, excluding CIEL-OCL 2026 Part 1 project
**Total issues:** 48

## Summary

These 48 issues represent recent activity (Aug 2025 -- Mar 2026) that is NOT part of the CIEL-OCL 2026 Part 1 project. They need human review to determine:

- Should they be added to an active milestone/project?
- Should they be folded into the synthesis report (historical backlog)?
- Should they remain as-is (untracked recent work)?

### Breakdown


| Component             | Count |
| --------------------- | ----- |
| TermBrowser / oclweb3 | 23    |
| API / oclapi2         | 11    |
| Mapper / oclmap       | 7     |
| FHIR                  | 3     |
| Documentation         | 1     |
| Community             | 1     |
| Cross-cutting         | 2     |



| Milestone                   | Count |
| --------------------------- | ----- |
| No milestone                | 37    |
| TermBrowser v3 MVP          | 5     |
| OCL Mapper MVP              | 4     |
| OCL FHIR Service MVP Launch | 2     |


---

## Issues by Component

### TermBrowser / oclweb3 (23 issues)

- **#2402**: TBv3 OCL `extras` JSON pretty display - Improve advanced `extras` description attributes schema and display
  - Labels: discussion-needed | Assigned: paynejd, jamlung-ri | Created: 2026-03-06
- **#2292**: Atomic “All-or-None” GraphQL mutation for multi-step Concept create/update (timeouts + partial writes)
  - Labels: none | Assigned: unassigned | Created: 2026-01-10
- **#2291**: Implement hierarchy view in TBv3 search results
  - Labels: none | Assigned: snyaggarwal | Created: 2026-01-07
- **#2290**: Implement history for concept & mapping details in TBv3
  - Labels: web3 | Assigned: snyaggarwal | milestone: TermBrowser v3 MVP | Created: 2026-01-07
- **#2289**: Only save composed expansion params
  - Labels: none | Assigned: snyaggarwal | Created: 2026-01-06
- **#2284**: Restore/Revert Collection HEAD to Previous Version
  - Labels: none | Assigned: snyaggarwal | Created: 2025-12-19
- **#2280**: Automated migration script for resource version reference transformation
  - Labels: none | Assigned: paynejd, snyaggarwal, jamlung-ri | Created: 2025-12-17
- **#2279**: Add notification text about new expansion evaluation logic to collection pages
  - Labels: none | Assigned: snyaggarwal, jamlung-ri | Created: 2025-12-17
- **#2278**: Expansion Comparison MVP: Detailed Differences
  - Labels: none | Assigned: snyaggarwal | Created: 2025-12-17
- **#2277**: Implement "Rebuild expansion" Actions
  - Labels: none | Assigned: snyaggarwal | Created: 2025-12-17
- **#2276**: Flag all Legacy Expansions with an Indicator (in database and UI)
  - Labels: none | Assigned: snyaggarwal | Created: 2025-12-17
- **#2275**: Move repo version metadata to the header and expansions table
  - Labels: none | Assigned: snyaggarwal | Created: 2025-12-17
- **#2274**: Add checkbox-based actions for references with simple transformation options
  - Labels: none | Assigned: snyaggarwal | Created: 2025-12-17
- **#2268**: Remove all possible pathways to creating new resource versioned references
  - Labels: none | Assigned: snyaggarwal | Created: 2025-12-09
- **#2267**: Implement rebuild index feature for a repo version in TBv2/v3
  - Labels: none | Assigned: snyaggarwal | Created: 2025-12-09
- **#2261**: Use $resolveReference to resolve canonical URL to OCL repo version
  - Labels: none | Assigned: italomacedo | milestone: OCL FHIR Service MVP Launch | Created: 2025-11-20
- **#2257**: Deleting Auto-expand HEAD for a collection
  - Labels: none | Assigned: snyaggarwal | Created: 2025-10-24
- **#2247**: Default filter bug plus "Clear" behavior - cannot remove it to see other concept classes
  - Labels: bug | Assigned: snyaggarwal | Created: 2025-10-01
- **#2246**: Implement hierarchy view as the standard view in the Associations panel -- TBv3
  - Labels: none | Assigned: snyaggarwal | milestone: TermBrowser v3 MVP | Created: 2025-09-23
- **#2239**: Add canonical_url support to source.target_repo filter approach
  - Labels: none | Assigned: snyaggarwal | milestone: TermBrowser v3 MVP | Created: 2025-09-11
- **#2237**: Clean existing references/expansions
  - Labels: none | Assigned: unassigned | Created: 2025-09-10
- **#2214**: Improve resizing of org overview with pinned repos
  - Labels: web3 | Assigned: snyaggarwal | milestone: TermBrowser v3 MVP | Created: 2025-08-20
- **#2211**: Make source props and filters useful
  - Labels: none | Assigned: snyaggarwal | milestone: OCL Mapper MVP | Created: 2025-08-20

### API / oclapi2 (11 issues)

- **#2407**: Move OIDC client secret from frontend to backend (oclweb3 + oclapi2)
  - Labels: none | Assigned: unassigned | Created: 2026-03-13
- **#2282**: Clean Up Collection References with Cascade Options
  - Labels: none | Assigned: snyaggarwal | Created: 2025-12-19
- **#2272**: Collection's all Expansions API
  - Labels: api2 | Assigned: snyaggarwal | Created: 2025-12-17
- **#2266**: Simplified CSV output that combines concepts and mappings
  - Labels: none | Assigned: unassigned | Created: 2025-11-25
- **#2264**: oclapi2 uses broken docker redis tag as dependency
  - Labels: none | Assigned: unassigned | Created: 2025-11-24
- **#2256**: "Add Reference" UI cascade options need to catch up with rest of TB
  - Labels: web2 | Assigned: snyaggarwal | Created: 2025-10-24
- **#2252**: Repo Type Filter in Repos
  - Labels: api2, web3, requires-es-index | Assigned: snyaggarwal | milestone: TermBrowser v3 MVP | Created: 2025-10-21
- **#2235**: Update validation schema to silently skip identical resource versions during cascade due to conflicting names
  - Labels: none | Assigned: snyaggarwal | Created: 2025-09-10
- **#2232**: Cascade `sourcemappings` works but also adds versioned mappings references
  - Labels: bug, web2 | Assigned: snyaggarwal | Created: 2025-09-03
- **#2231**: Dynamic reference cascade should account for equivalence to avoid false validation errors
  - Labels: api2 | Assigned: unassigned | Created: 2025-09-03
- **#2220**: Implement "allVersions" param for repos endpoints
  - Labels: none | Assigned: snyaggarwal | Created: 2025-08-26

### Mapper / oclmap (7 issues)

- **#2294**: $match API performance optimization
  - Labels: performance | Assigned: unassigned | Created: 2026-01-19
- **#2244**: Add filter panel to Candidates tab
  - Labels: none | Assigned: snyaggarwal | milestone: OCL Mapper MVP | Created: 2025-09-22
- **#2242**: Enable filtering of match operations by locale
  - Labels: none | Assigned: snyaggarwal | milestone: OCL Mapper MVP | Created: 2025-09-18
- **#2238**: Auto-match should pre-load 10 candidates (instead of 1) and save with project
  - Labels: none | Assigned: snyaggarwal | Created: 2025-09-11
- **#2227**: Redundant API calls when opening rows after Auto-Match in Map Project
  - Labels: none | Assigned: unassigned | Created: 2025-08-29
- **#2224**: Auto-Match button does not trigger on second click
  - Labels: none | Assigned: unassigned | Created: 2025-08-29
- **#2213**: Add support for repo properties to $match operation
  - Labels: none | Assigned: snyaggarwal | milestone: OCL Mapper MVP | Created: 2025-08-20

### FHIR (3 issues)

- **#2281**: Proposal to support download of a concept's mappings as a valueset
  - Labels: none | Assigned: unassigned | Created: 2025-12-18
- **#2262**: Expose OCL source.properties & source.filters through FHIR CodeSystem.property, CodeSystem.filter, and CodeSystem.concept.property
  - Labels: none | Assigned: snyaggarwal | milestone: OCL FHIR Service MVP Launch | Created: 2025-11-21
- **#2253**: OCL FHIR Core 2025
  - Labels: none | Assigned: unassigned | Created: 2025-10-23

### Documentation (1 issues)

- **#2380**: Normalize synonymous ICD-11 expression codes for consistent searching
  - Labels: documentation | Assigned: filiperochalopes | Created: 2026-02-17

### Community (1 issues)

- **#2255**: OCL Community Site
  - Labels: none | Assigned: unassigned | Created: 2025-10-23

### Cross-cutting (2 issues)

- **#2265**: Add AGENTS.md to the repo
  - Labels: none | Assigned: unassigned | Created: 2025-11-24
- **#2263**: Extend Canonical URL Registry to support external server delegation
  - Labels: none | Assigned: unassigned | Created: 2025-11-22

---

## Recommended Actions

### Issues already in a milestone (11)

- **#2290**: Implement history for concept & mapping details in TBv3 (milestone: TermBrowser v3 MVP)
- **#2262**: Expose OCL source.properties & source.filters through FHIR CodeSystem.property, CodeSystem.filter, and CodeSystem.concept.property (milestone: OCL FHIR Service MVP Launch)
- **#2261**: Use $resolveReference to resolve canonical URL to OCL repo version (milestone: OCL FHIR Service MVP Launch)
- **#2252**: Repo Type Filter in Repos (milestone: TermBrowser v3 MVP)
- **#2246**: Implement hierarchy view as the standard view in the Associations panel -- TBv3 (milestone: TermBrowser v3 MVP)
- **#2244**: Add filter panel to Candidates tab (milestone: OCL Mapper MVP)
- **#2242**: Enable filtering of match operations by locale (milestone: OCL Mapper MVP)
- **#2239**: Add canonical_url support to source.target_repo filter approach (milestone: TermBrowser v3 MVP)
- **#2214**: Improve resizing of org overview with pinned repos (milestone: TermBrowser v3 MVP)
- **#2213**: Add support for repo properties to $match operation (milestone: OCL Mapper MVP)
- **#2211**: Make source props and filters useful (milestone: OCL Mapper MVP)

### Issues with no milestone or assignee -- needs routing (14)

- **#2407**: Move OIDC client secret from frontend to backend (oclweb3 + oclapi2) (created: 2026-03-13)
- **#2294**: $match API performance optimization (created: 2026-01-19)
- **#2292**: Atomic “All-or-None” GraphQL mutation for multi-step Concept create/update (timeouts + partial writes) (created: 2026-01-10)
- **#2281**: Proposal to support download of a concept's mappings as a valueset (created: 2025-12-18)
- **#2266**: Simplified CSV output that combines concepts and mappings (created: 2025-11-25)
- **#2265**: Add AGENTS.md to the repo (created: 2025-11-24)
- **#2264**: oclapi2 uses broken docker redis tag as dependency (created: 2025-11-24)
- **#2263**: Extend Canonical URL Registry to support external server delegation (created: 2025-11-22)
- **#2255**: OCL Community Site (created: 2025-10-23)
- **#2253**: OCL FHIR Core 2025 (created: 2025-10-23)
- **#2237**: Clean existing references/expansions (created: 2025-09-10)
- **#2231**: Dynamic reference cascade should account for equivalence to avoid false validation errors (created: 2025-09-03)
- **#2227**: Redundant API calls when opening rows after Auto-Match in Map Project (created: 2025-08-29)
- **#2224**: Auto-Match button does not trigger on second click (created: 2025-08-29)

### Issues assigned but no milestone (23)

- **#2402**: TBv3 OCL `extras` JSON pretty display - Improve advanced `extras` description attributes schema and display (assigned: paynejd, jamlung-ri, created: 2026-03-06)
- **#2380**: Normalize synonymous ICD-11 expression codes for consistent searching (assigned: filiperochalopes, created: 2026-02-17)
- **#2291**: Implement hierarchy view in TBv3 search results (assigned: snyaggarwal, created: 2026-01-07)
- **#2289**: Only save composed expansion params (assigned: snyaggarwal, created: 2026-01-06)
- **#2284**: Restore/Revert Collection HEAD to Previous Version (assigned: snyaggarwal, created: 2025-12-19)
- **#2282**: Clean Up Collection References with Cascade Options (assigned: snyaggarwal, created: 2025-12-19)
- **#2280**: Automated migration script for resource version reference transformation (assigned: paynejd, snyaggarwal, jamlung-ri, created: 2025-12-17)
- **#2279**: Add notification text about new expansion evaluation logic to collection pages (assigned: snyaggarwal, jamlung-ri, created: 2025-12-17)
- **#2278**: Expansion Comparison MVP: Detailed Differences (assigned: snyaggarwal, created: 2025-12-17)
- **#2277**: Implement "Rebuild expansion" Actions (assigned: snyaggarwal, created: 2025-12-17)
- **#2276**: Flag all Legacy Expansions with an Indicator (in database and UI) (assigned: snyaggarwal, created: 2025-12-17)
- **#2275**: Move repo version metadata to the header and expansions table (assigned: snyaggarwal, created: 2025-12-17)
- **#2274**: Add checkbox-based actions for references with simple transformation options (assigned: snyaggarwal, created: 2025-12-17)
- **#2272**: Collection's all Expansions API (assigned: snyaggarwal, created: 2025-12-17)
- **#2268**: Remove all possible pathways to creating new resource versioned references (assigned: snyaggarwal, created: 2025-12-09)
- **#2267**: Implement rebuild index feature for a repo version in TBv2/v3 (assigned: snyaggarwal, created: 2025-12-09)
- **#2257**: Deleting Auto-expand HEAD for a collection (assigned: snyaggarwal, created: 2025-10-24)
- **#2256**: "Add Reference" UI cascade options need to catch up with rest of TB (assigned: snyaggarwal, created: 2025-10-24)
- **#2247**: Default filter bug plus "Clear" behavior - cannot remove it to see other concept classes (assigned: snyaggarwal, created: 2025-10-01)
- **#2238**: Auto-match should pre-load 10 candidates (instead of 1) and save with project (assigned: snyaggarwal, created: 2025-09-11)
- **#2235**: Update validation schema to silently skip identical resource versions during cascade due to conflicting names (assigned: snyaggarwal, created: 2025-09-10)
- **#2232**: Cascade `sourcemappings` works but also adds versioned mappings references (assigned: snyaggarwal, created: 2025-09-03)
- **#2220**: Implement "allVersions" param for repos endpoints (assigned: snyaggarwal, created: 2025-08-26)

