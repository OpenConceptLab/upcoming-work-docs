# CIEL-OCL Midpoint Pulse Check — Deck Documentation

**Deck file:** `CIEL-OCL-Progress-v3.pptx`  
**As of:** May 7, 2026 (Week 13 of 26) — updated during team review  
**Audience:** Internal OCL team

---

## Purpose

This deck is a collaborative alignment tool for the OCL team, not a funder-facing deliverable. Its goal is to give every team member a shared view of where the project stands at the halfway point — what's shipped, what's slipping, and what decisions need to be made before the second half begins. It also captures indirect wins and AI leverage that is relevant context for any funder summary.

---

## Slide Structure

| Slide | Title | Purpose |
|-------|-------|---------|
| 1 | Title | Context-setter: project name, date, week-of-project indicator |
| 2 | What We Set Out to Do | SOW recap — the four objectives and their % allocations |
| 3 | Milestone Tracker | Per-milestone status grid, sourced from GitHub |
| 4 | Cheat Sheet | Flat table view of all milestones with status, %, due date, issue counts |
| 5 | SOW Timeline by Project | Swim-lane Gantt showing phases + milestone positions across Feb–Jul |
| 6 | CIEL Bridge | Detail slide: completed items vs. in-progress/open |
| 7 | CIEL Source Management | Detail slide: completed items vs. in-progress/open |
| 8 | CIEL + OpenMRS Implementers | Detail slide: TBv3 and Mapper sub-streams |
| 9 | CIEL Content Curation | Detail slide: QA pipeline progress |
| 10 | Risks & Decisions Needed | Flagged items requiring team action, ranked by urgency |
| 11 | Indirect Wins & Sneaky Goals | Process improvements and lessons learned beyond the core SOW |
| 12 | What's Next | Three-column priority view: Immediate / Core Delivery / Stretch |
| 13 | Closing | Summary stats and discussion prompt |

---

## Data Sources

### 1. SOW Document
**File:** `CIEL-OCL-Madiro_SOW_Draft_2026-01-08.docx`

Used for:
- The four objective buckets and their percentage allocations (15% Bridge, 30% Source Mgmt, 45% Implementers, 10% Content Curation)
- The scope items listed under each objective (SOW Tracker numbers #1–#71)
- The Future State workflow table (used to structure the Source Management phases on the timeline)
- The roles and responsibilities table

### 2. GitHub Milestones
**Repository:** `OpenConceptLab/ocl_issues`  
**URL:** https://github.com/OpenConceptLab/ocl_issues/milestones

Each milestone in this repo with a `[CIEL ...]` prefix represents a showcase demo — a defined end-to-end workflow that proves a capability is working. Milestone data was fetched directly from individual milestone pages (e.g., `/milestone/42`) to retrieve:
- Title and description
- Due date
- Completion percentage
- Open and closed issue counts
- State (open/closed)

**Milestones tracked (18 + 1 pending creation):**

| # | Status | Bucket | Title | % | Due | Issues |
|---|--------|--------|-------|---|-----|--------|
| 41 | ✅ Closed | [CIEL Bridge] | ICD11 Technical Demo E2E Workflow | 100% | Feb 26 | 20/20 |
| 42 | 🔄 In Progress | [CIEL Implementers] | Collection & Reference Creation E2E | 53% | May 7 | 14c/12o |
| 43 | ⬜ Upcoming | [CIEL Implementers] | Team-based Mapping & Left Panel E2E | ? | TBD | — |
| 44 | ⬜ Upcoming | [CIEL Implementers] | Collection Maintenance E2E (+ CIEL Release) | ? | TBD | — |
| 45 | ⬜ Upcoming | [CIEL Implementers] | Concept Proposals E2E Workflow | 0% | May 29 | 0c/4o |
| 46 | ⬜ Upcoming | [CIEL Implementers] | Mapping Decision Memory Showcase | 0% | Jun 26 | 0c/3o |
| 47 | ⬜ Upcoming | *(Mapper)* | Mapper Public Showcase — Wrap-up & Release Prep | ? | Jul | — |
| 48 | ✅ Closed | [CIEL Source Mgmt] | CIEL Lab v2 Concept Manager — Filipe | 100% | Mar 5 | 5/5 |
| 49 | ✅ Closed | [CIEL Source Mgmt] | CIEL Lab v2 Mock E2E — Andy | 95% | Mar 19 | 22/23 |
| 51 | 🔴 Overdue | [CIEL Bridge] | ICD11 E2E on pre-publication dataset | 0% | Apr 2 | 0c/13o |
| 52 | ✅ Closed | [CIEL Content] | Showcase CIEL Content E2E Technical Workflow | — | Apr 9 | — |
| 53 | ✅ Closed | [CIEL Source Mgmt] | CIEL Source Mgmt QA Workflows | 2/2 | Apr 2 | — |
| 54 | 🔄 In Progress | [CIEL Source Mgmt] | CIEL Release E2E Workflow — Filipe leads | 0% | May 7 | 5o |
| 55 | 🔄 In Progress | [CIEL Bridge] | ICD11 E2E evaluation on country dataset | 50% | May 28 | 1c/1o |
| 56 | ⬜ Upcoming | [CIEL Source Mgmt] | Real-life CIEL Release using CIEL Labs v2 | ? | Jun 11 | — |
| 57 | ⬜ Upcoming | [CIEL Bridge] | CIEL Bridge Showcase (all target repos) | ? | Jun 11 | 1o |
| 58 | ⬜ Upcoming | [CIEL Content] | Showcase Completed CIEL Content Curation | 0% | Jun 25 | — |
| 59 | 🔄 In Progress | [CIEL Bridge] | ICD11 E2E on evaluation dataset | 25% | May 7 | 1c/3o |
| TBD | ⬜ To Be Created | [CIEL Bridge] | ICD-11 Geneva Connectathon Prep | — | ~May 28 | — |

**Summary (as of May 7 review):** 5 closed · 1 overdue · 4 in progress · 8 upcoming · 1 to be created

*Note: #50 is omitted — it was closed/merged into #41. The initial deck (April 29) incorrectly showed #52 and #53 as overdue; both are confirmed closed as of May 7. See team review notes below.*

### 3. GitHub Project Board
**URL:** https://github.com/orgs/OpenConceptLab/projects/11

Used for general situational awareness of issue-level activity (recently closed tickets, in-flight work, labels). Not used as a direct structured data source — milestone pages were used instead, as they map more cleanly to SOW objectives.

### 4. Human Judgment / Team Knowledge
The detail slides and the Indirect Wins slide incorporate qualitative knowledge that cannot be derived from GitHub alone:
- Whether an issue represents a meaningful deliverable vs. a minor fix
- Whether work is "in spirit" part of a SOW objective even if not milestone-linked
- Known blockers, pending decisions, and risks that exist in team conversation but not yet as GitHub issues

---

## May 7 Team Review — Key Discussion Points

The following captures decisions, corrections, and context from the May 7, 2026 midpoint review call.

### Milestone corrections
- **#52 (CIEL Content E2E)** — confirmed closed by Filipe and Joe during the call. The April 29 deck incorrectly showed it as overdue. The deck should be updated to green.
- **#53 (CIEL Source Mgmt QA Workflows)** — confirmed complete; the detail slide (Source Management) lists it under completed with 2/2 issues resolved, contradicting the milestone tracker which still showed it as overdue (0%). Treat as closed.

### CIEL Bridge
- Jon raised the Geneva ICD-11 Connectathon as a separate, urgent timeline running parallel to the bridge milestones. A new milestone should be created to track this. The Connectathon is approximately 3 weeks out from May 7.
- ICD-11 hierarchy bug (#2462): `parent_concept_urls` are lost after bulk import. This breaks the bridge pipeline and **must be resolved before the Geneva Connectathon**.
- The mapper information model refactoring (canonical URL / FHIR identity normalization) is the key blocker for closing out MS#51. A large PR is in review; Sunny committed to completing the review by the morning of May 8.
- **Bridge is now generic** — it can be run against any mapped source, not just CIEL (Sunny). This is a significant capability expansion not fully reflected in milestone titles.
- **Multiple reranker models** are now configurable (Sunny).
- **Prompt template selection** — PR almost merged as of the May 7 call (Sunny).

### CIEL Source Management
- v2026-04-28 CIEL release shipped on schedule.
- Andy used CIEL Lab v2 pages to push the April release to production while Filipe was unavailable — confirming the lab is actually production-capable. This was called out as a notable win.
- Key gap: QA validation now shows issues well, but there is no bulk-editing path that acts on QA findings. Andy and Filipe need to align on how to bring detection and remediation together in CIEL Lab.
- Staging pollution (#2490, #2491): automated imports diverged staging from production; duplicate retired mappings are causing import crashes. This makes CIEL release QA unreliable until resolved.
- CIEL Admin retirement decision is still pending (Dropbox continuation, mysqldump script ownership). Blocks MS#54.
- Filipe noted a new bulk import performance issue when JSON objects are not ordered (concepts before mappings). He is preparing a PR to add pre-sorting before import.

### CIEL + OpenMRS Implementers
- Jon noted that milestones progress reflects Joe's closer involvement — milestones with stronger PM ownership close faster. Suggestion: spend focused time in coming weeks pulling open tickets across all milestones to close them.
- **Collection maintenance** is the next major TBv3 priority after current reference work wraps. This directly connects to the upcoming CIEL release workflow.
- **Concept proposals MVP** — Joe flagged concern about development bandwidth to deliver this before EOO. Collection maintenance takes priority.
- Mapper is not yet open to broader community due to inability to cover or charge for AI/compute costs per user. The access model and pricing plan are a real gap before wider rollout. Sunny and Jon confirmed this is the primary constraint.
- Community interest: a developer reached out over the weekend asking to contribute to OCL Mapper. Direction: ask them to set up locally and join the community process.

### CIEL Content Curation
- The bulk QA validation tool surfaced a new category of issues: non-English locale casing problems. This has significantly expanded the apparent backlog.
- Strategy: triage for automation potential (some locale casing issues may be fixable programmatically), then cut-and-run on the remainder, shifting ongoing curation into OCL directly.
- ~10–15% of the ~15k concept QA target is complete.

### Indirect wins called out during review
- **Jon's performance PRs**: multiple shoutouts from both Sunny and Andy for performance improvements to infrastructure and application code that go beyond the SOW scope but directly benefit users.
- **OCL Knowledge Base (ocl-kb)**: Joe noted that spec-first development via the KB has significantly reduced back-and-forth on TBv3 tickets and enabled more autonomous development.
- **OCL Design System v1**: shipped and live; reducing design review cycles.
- **AI ticket triage pipeline**: scaling across the org (1,073 issues migrated, 36 repos, label taxonomy).
- **Governance infrastructure**: CONTRIBUTING.md, PR/release/ticket policies, label taxonomy making sustainable community contribution more realistic.

---

## ICD-11 Usage Report Findings (May 7)

Jon presented a usage report on ICD-11 content inside OCL as context for Geneva and the broader licensing discussion. Key figures:

| Metric | Value |
|--------|-------|
| CIEL → ICD-11 mappings in OCL | ~26,000 |
| Collections containing CIEL ICD-11 mappings | 295 across 83 owners |
| Sources that have cloned ICD-11 content | ~70 |
| Non-CIEL sources with ICD-11 content | 4 (2 known-legitimate: WHO Crosswalk, CL-boosted source) |
| Authenticated downloads tracked (since Jan 2026) | 304 by 36 users |
| Anonymous downloads before blocking | ~60 (Jan 2026, while tracking was active) |

Anonymous exports were blocked at end of January 2026; all exports now require authentication and are tracked. Jon will share the updated report with Andy.

---

## What's Next — Second Half Priorities

### Immediate (May)
- Fix ICD-11 hierarchy bug + staging environment (#2462, #2490, #2491)
- Create Geneva Connectathon milestone; track tickets for WHO ICD-11 automatch
- Deliver MS#51: ICD11 E2E pre-pub dataset showcase
- Agree on CIEL Admin retirement plan (unblocks MS#54)
- Bulk import performance PR from Filipe (pre-sort before import)
- Merge mapper information model refactoring PR (after Sunny review)

### Core Delivery (May–Jun)
- MS#55: ICD11 E2E on country dataset (May 28)
- CIEL Lab v2 release pipeline (#2474) → MS#56
- Collection maintenance E2E (TBv3) → MS#44
- Add References within Collection (#2431) → close MS#42
- Concept Proposals MVP (#SOW-27) → MS#45
- Save to Collection in Mapper (#SOW-40)

### Stretch / Strategic (Jun–Jul)
- MS#57: CIEL Bridge full showcase (Jun 11)
- MS#58: Completed CIEL curation showcase (Jun 25)
- Team-based Mapper workflows scoped to fit (MS#43, #46)
- Mapper community access / cost model plan
- MS#47: Mapper Public Showcase wrap-up
- Add mid-project Implementer showcase milestone

**Open team question:** Do we formally reschedule the 5 originally-overdue milestones (#51, #54, #59, and previously #52/#53), or descope them? Who owns each showcase?

---

## How the Milestone Tracker (Slide 3) Works

The tracker is a 4-column grid, one column per SOW bucket. Each cell represents one milestone. Color coding:

| Color | Meaning |
|-------|---------|
| Green | Closed — showcase delivered |
| Amber | In progress — some issues closed, work ongoing |
| Red border | Overdue — past due date, 0% complete |
| Gray | Upcoming — not yet started or no due date |

Each cell shows: milestone number, short title, completion %, due date, and open/closed issue count.

The summary bar at the bottom shows aggregate counts across all tracked milestones.

---

## How the SOW Timeline (Slide 5) Works

The timeline is a swim-lane Gantt with one row per SOW bucket. Each row contains:

- **Phase bars** — horizontal bars representing major work streams from the SOW, sized to their rough start and end months. Bar fill (darker color) represents approximate progress. These are derived from the SOW scope description, not from GitHub issue counts.
- **Milestone diamonds** — positioned at their GitHub due date, colored by status (green/amber/red/gray). Labels show the milestone number and status icon.
- **TODAY marker** — a vertical dashed red line. The original deck shows this at April 29; the May 7 version should update this marker.

Phase bar progress fills are estimates based on milestone completion percentages and team knowledge — they are intentionally approximate and meant for directional orientation, not precise measurement.

---

## Limitations and Caveats

- **Milestone % is GitHub's calculation** (closed issues ÷ total issues), which is a proxy for progress, not a direct measure of effort or feature completeness. A single large open issue can make a milestone look 0% complete even if substantial work has happened.
- **Several milestones have no issues linked** (e.g., #43, #44, #56), making their true status opaque from GitHub alone.
- **The "In Progress" status** on the milestone tracker is inferred — GitHub does not have a native "in progress" state for milestones. A milestone is classified as in-progress here if it is open and has at least one closed issue.
- **Phase bar fills on the timeline** are editorial estimates and should be treated as directional, not precise.
- **Deck vs. reality lag:** The April 29 deck was reviewed on May 7 and found to be out of date in several places. Most notably, #52 and #53 were confirmed closed during the review despite showing as overdue in the tracker. The milestone tracker slide should always be regenerated from live GitHub data immediately before a team review.
- **Data freshness:** Milestone data in the original deck was fetched on April 29, 2026. This document reflects corrections and additions made during the May 7 team review.
