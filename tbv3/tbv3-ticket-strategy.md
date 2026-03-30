# TBv3 Ticket Strategy

_Generated: 2026-03-30. Based on analysis of 209 issues in `tbv3-issue-classification.csv` and KB spec at that date._

This document defines the recommended approach for aligning the `ocl_issues` backlog with the TBv3 knowledge base — what to close, how to structure Epics, what to consolidate, and what new tickets are needed.

---

## 1. Issues to Close

### Close-stale / Close-outdated / Close-superseded

These predate v3 planning and are either fully superseded by the current KB spec or track v2-only work. Close with a note pointing to the KB capability that covers the intent.

| Issue | Title | Close Reason |
|---|---|---|
| #12 | Ability to check if new versions of references are available | close-stale; covered by `update-collection-source-version.md` |
| #13 | Ability to update collection references to latest version | close-stale; covered by `manage-references.md` |
| #233 | TermBrowser (general) | close-outdated; no specific content |
| #793 | OCL TermBrowser Mapping Revamp | close-outdated; superseded by v3 mapping spec |
| #808 | Custom View Configuration in TermBrowser | close-outdated; superseded |
| #865 | FHIR UI in TermBrowser | close-stale; FHIR templates now explicitly post-v3 |
| #888 | OCL Resource Comparison | close-stale; covered by `compare-resources.md` |
| #909 | Concept Modification/Expansion Support | close-superseded; covered by author-concept + manage-versions spec |
| #913 | Configuration Sandbox / Custom Domain | close-stale; not in v3 scope |
| #958 | Compare UI validation/restrictions to API | close-outdated; superseded |
| #985 | Add async counts into org tabs | close-outdated; oclweb2 only |
| #1592 | Switch hierarchy view to use cascade | close-outdated; oclweb2 only |
| #1673 | Datatype Dropdown bug | close-outdated; oclweb2 only |
| #1681 | Search for some locales is broken | close-outdated; oclweb2 only |
| #1684 | Add Expression workflow appears invalid | close-outdated; oclweb2 only |
| #2040 | Issue import task state update | close-outdated; oclweb2 only |

### Closed-after-review

These are already marked for closure in the CSV. All have no code activity, are not on the v3 board, and predate v3. Execute closure in bulk.

#530, #534, #535, #536, #591, #667, #669, #672, #788, #816, #863, #882, #900, #962, #1003, #1022, #1079, #1113, #1160, #1185, #1202, #1281, #1297, #1322, #1355, #1361, #1373, #1375, #1491, #1770, #1906, #1918, #1937, #2131

_(35 issues)_

### Close-duplicate

| Issue | Duplicate of |
|---|---|
| #2011 CTA / Reference / Delete | #2008 CTA / Reference / Delete |

---

## 2. Epic → Ticket Structure

The existing `Author: X` / `CTA / X / Action` / `Consumer: X` naming pattern is working and should be continued for new tickets. Here is how each KB capability maps to the current ticket structure and where gaps exist.

### Well-covered areas (no action needed)

| KB Capability | Anchoring Epic | CTA Coverage |
|---|---|---|
| Author Concept | #1989 Author: Concept | #1990–#1997 (Create, Edit, Clone, Add to repo, Create similar, Add mapping, Create mapped concept, Retire) |
| Author Mapping | #1999 Author: Mapping | #2000–#2004 (Create, Edit, Create similar, Retire, Delete) |
| Configure Repository | #1977 Author: Repository | #1978–#1982 (Create, Edit, Create version, Release version, Make a copy) |
| Manage Versions + Expansions | #1983 Author: Expansion | #1984–#1988 (Create, Set as default, Delete, Update metadata, Rebuild) |
| Compare Resources | #1623, #1853, #2181 | Adequate; no Epic needed |
| Browse Repository | #1625 Consumer: Repository | Individual surface tickets cover this |

### Gaps requiring action

**Manage References — rename and anchor #2005**

Issue #2005 "Add References within Collection" should be renamed to **"Author: References"** to serve as the anchoring Epic for the Manage References capability. The existing reference CTA tickets (#1618, #1854, #2007–#2009, #2012) should reference this Epic as their parent. New CTA tickets listed in Section 4 should also be filed under it.

**Concept Proposals — new Epic needed**

Concept Proposals is in scope for v3 (ADR-006). Only two thin tickets exist (#1614, #1622). A new `Author: Concept Proposals` Epic should be created to anchor the full workflow spec. See Section 4 for new CTA tickets to file under it.

---

## 3. Consolidation

### Close as superseded (content rolled into KB)

| Issue | Disposition | Reason |
|---|---|---|
| #1374 Display/Interpretation of Collection References | Close-superseded | Content covered by `manage-references.md` and `01_objects/reference.md` |
| #1607 Advanced search MVP | Close-superseded | Intent rolled into #2031 Author: Searchlight |
| #1624 Operations panel | Close or mark post-v3 | No code activity; not on v3 board; post-v3 scope |

### Fold into parent ticket scope (do not file as standalone)

| Issue | Recommended action |
|---|---|
| #1537 Copy/download results from adding references | Fold into #2005 Author: References scope; not a standalone ticket |
| #1538 Resolve references in add references results page | Fold into #2005 Author: References scope; not a standalone ticket |

---

## 4. New Tickets Needed

These KB-specified features have no corresponding actionable ticket. File these against the Epics identified above.

### Under Author: References (#2005 renamed)

| New Ticket Title | KB Source | Priority |
|---|---|---|
| CTA / Reference / Add (from outside — full Add References dialog with preview) | `manage-references.md` §Add from Outside Source | P1 |
| Consumer: Reference Detail (drawer view, two-tab panel, resolved resource display) | `manage-references.md` §Reference Detail | P1 |
| CTA / Reference / Transform (bulk transform, expression rewrite) | `manage-references.md` §Transforms | P1 |

### Under Author: Concept Proposals (new Epic)

| New Ticket Title | KB Source | Priority |
|---|---|---|
| Author: Concept Proposals (Epic) | `manage-concept-proposals.md` | P1 |
| CTA / Concept Proposal / Submit | `manage-concept-proposals-workflow.md` | P1 |
| CTA / Concept Proposal / Admin Review + Approve / Reject | `manage-concept-proposals-workflow.md` | P1 |
| Consumer: Concept Proposal (proposal detail view for proposer) | `manage-concept-proposals.md` | P2 |

### Other gaps

| New Ticket Title | KB Source | Priority |
|---|---|---|
| Surface / Versions + Expansions Tab | `04_surfaces/versions-expansions-tab.md` | P2 |
| Version Consistency Warning UI (mismatch pathway for collection updates) | SESSION in `TODO.md`, ocl_issues #2236, #2312 | P2 |
| #1744 Permissions for registries and $resolveReference behavior | Already exists — move to active v3 backlog | P2 |

---

## 5. Resolved Tensions

### FHIR Repository Templates (#2027, #2028, #2029) — Move to Post-v3

Issues #2027 (ValueSet template), #2028 (CodeSystem template), and #2029 (ConceptMap template) are currently on the TermBrowser v3 MVP milestone. After review, FHIR-specific repository creation templates and the underlying FHIR subtype architecture are **explicitly post-v3**. The architecture questions (ConceptMap as Source vs. Collection subtype; CodeSystem as distinct type vs. Source subtype) must be resolved before these can be built correctly.

**Action:** Move #2027, #2028, #2029 off the MVP milestone and into the post-v3 backlog. Add a note referencing `tbv3-deferred-features.md §FHIR Repository Templates and Subtypes`.

### #1744 Permissions for Registries and $resolveReference — Keep and Action

This is on the v3 board with no code activity. The Canonical URL Registry spec in `configure-repository.md` covers the user-facing flow but does not address backend permission rules for $resolveReference. This is a real gap. Keep this ticket and scope it as: "Define and implement the permission model for who can resolve canonical URLs across org namespaces."

---

## Action Summary

| Action | Count |
|---|---|
| Close (stale / outdated / superseded) | 16 |
| Close (closed-after-review batch) | 35 |
| Close (duplicate) | 1 |
| Close or consolidate | 5 |
| Rename existing ticket (#2005) | 1 |
| New Epic to create | 1 (Author: Concept Proposals) |
| New CTA / surface tickets to file | 8 |
| Move off MVP milestone (#2027–2029) | 3 |
| Keep and action (#1744) | 1 |
| **Total issues affected** | **~71** |
