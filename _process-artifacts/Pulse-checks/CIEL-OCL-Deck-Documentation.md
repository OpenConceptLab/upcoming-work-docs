# CIEL-OCL Midpoint Pulse Check — Deck Documentation

**Deck file:** `CIEL-OCL-Progress-v3.pptx`  
**As of:** April 29, 2026 (Week 13 of 26)  
**Audience:** Internal OCL team

---

## Purpose

This deck is a collaborative alignment tool for the OCL team, not a funder-facing deliverable. Its goal is to give every team member a shared view of where the project stands at the halfway point — what's shipped, what's slipping, and what decisions need to be made before the second half begins. It also captures a brief section on indirect wins and AI leverage that is relevant context for any funder summary.

---

## Slide Structure

| Slide | Title | Purpose |
|-------|-------|---------|
| 1 | Title | Context-setter: project name, date, week-of-project indicator |
| 2 | What We Set Out to Do | SOW recap — the four objectives and their % allocations |
| 3 | Milestone Tracker | Per-milestone status grid, sourced from GitHub |
| 4 | SOW Timeline by Project | Swim-lane Gantt showing phases + milestone positions across Feb–Jul |
| 5 | CIEL Bridge | Detail slide: completed items vs. in-progress/open |
| 6 | CIEL Source Management | Detail slide: completed items vs. in-progress/open |
| 7 | CIEL + OpenMRS Implementers | Detail slide: TBv3 and Mapper sub-streams |
| 8 | CIEL Content Curation | Detail slide: QA pipeline progress |
| 9 | Risks & Decisions Needed | Flagged items requiring team action, ranked by urgency |
| 10 | Indirect Wins & AI Leverage | Process improvements and lessons learned beyond the core SOW |
| 11 | What's Next | Three-column priority view: Immediate / Core Delivery / Stretch |
| 12 | Closing | Summary stats and discussion prompt |

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

**Milestones tracked (18 total):**

| # | Status | Bucket | Title | % | Due | Issues |
|---|--------|--------|-------|---|-----|--------|
| 41 | ✅ Closed | [CIEL Bridge] | ICD11 Technical Demo E2E Workflow | 100% | Feb 26 | 20/20 |
| 42 | 🔄 In Progress | [CIEL Implementers] | Collection & Reference Creation E2E | 53% | Apr 30 | 14c/12o |
| 43 | ⬜ Upcoming | [CIEL Implementers] | Team-based Mapping & Left Panel E2E | ? | TBD | — |
| 44 | ⬜ Upcoming | [CIEL Implementers] | Collection Maintenance E2E (+ CIEL Release) | ? | TBD | — |
| 45 | ⬜ Upcoming | [CIEL Implementers] | Concept Proposals E2E Workflow | 0% | May 29 | 0c/4o |
| 46 | ⬜ Upcoming | [CIEL Implementers] | Mapping Decision Memory Showcase | 0% | Jun 26 | 0c/3o |
| 47 | ⬜ Upcoming | *(Mapper)* | Mapper Public Showcase — Wrap-up & Release Prep | ? | Jul | — |
| 48 | ✅ Closed | [CIEL Source Mgmt] | CIEL Lab v2 Concept Manager — Filipe | 100% | Mar 5 | 5/5 |
| 49 | ✅ Closed | [CIEL Source Mgmt] | CIEL Lab v2 Mock E2E — Andy | 95% | Mar 19 | 22/23 |
| 51 | 🔴 Overdue | [CIEL Bridge] | ICD11 E2E on pre-publication dataset | 0% | Apr 2 | 0c/13o |
| 52 | 🔴 Overdue | [CIEL Content] | Showcase CIEL Content E2E Technical Workflow | 0% | Apr 9 | 0c/3o |
| 53 | 🔴 Overdue | [CIEL Source Mgmt] | CIEL Source Mgmt QA Workflows | 0% | Apr 2 | 0c/5o |
| 54 | 🔄 In Progress | [CIEL Source Mgmt] | CIEL Release E2E Workflow — Filipe leads | ? | Apr 30 | ? |
| 55 | 🔄 In Progress | [CIEL Bridge] | ICD11 E2E evaluation on country dataset | 50% | May 28 | 1c/1o |
| 56 | ⬜ Upcoming | [CIEL Source Mgmt] | Real-life CIEL Release using CIEL Labs v2 | ? | Jun 11 | — |
| 57 | ⬜ Upcoming | [CIEL Bridge] | CIEL Bridge Showcase (all target repos) | ? | Jun 11 | 1o |
| 58 | ⬜ Upcoming | [CIEL Content] | Showcase Completed CIEL Content Curation | 0% | Jun 25 | — |
| 59 | 🔄 In Progress | [CIEL Bridge] | ICD11 E2E on evaluation dataset | 25% | May 7 | 1c/3o |

*Note: #50 is omitted — it was closed/merged into #41. Cells marked ? could not be confirmed from the fetches and should be verified against the live milestones page.*

### 3. GitHub Project Board
**URL:** https://github.com/orgs/OpenConceptLab/projects/11

Used for general situational awareness of issue-level activity (recently closed tickets, in-flight work, labels). Not used as a direct structured data source — milestone pages were used instead, as they map more cleanly to SOW objectives.

### 4. Human Judgment / Team Knowledge
The detail slides (Slides 5–8) and the Indirect Wins slide (Slide 10) incorporate qualitative knowledge that cannot be derived from GitHub alone:
- Whether an issue represents a meaningful deliverable vs. a minor fix
- Whether work is "in spirit" part of a SOW objective even if not milestone-linked
- Known blockers, pending decisions, and risks that exist in team conversation but not yet as GitHub issues

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

The summary bar at the bottom shows aggregate counts across all 18 milestones.

---

## How the SOW Timeline (Slide 4) Works

The timeline is a swim-lane Gantt with one row per SOW bucket. Each row contains:

- **Phase bars** — horizontal bars representing major work streams from the SOW, sized to their rough start and end months. Bar fill (darker color) represents approximate progress. These are derived from the SOW scope description, not from GitHub issue counts.
- **Milestone diamonds** — positioned at their GitHub due date, colored by status (green/amber/red/gray). Labels show the milestone number and status icon.
- **TODAY marker** — a vertical dashed red line at April 29, 2026.

Phase bar progress fills are estimates based on milestone completion percentages and team knowledge — they are intentionally approximate and meant for directional orientation, not precise measurement.

---

## Limitations and Caveats

- **Milestone % is GitHub's calculation** (closed issues ÷ total issues), which is a proxy for progress, not a direct measure of effort or feature completeness. A single large open issue can make a milestone look 0% complete even if substantial work has happened.
- **Several milestones have no issues linked** (e.g., #43, #44, #56), making their true status opaque from GitHub alone.
- **The "In Progress" status** on the milestone tracker is inferred — GitHub does not have a native "in progress" state for milestones. A milestone is classified as in-progress here if it is open and has at least one closed issue.
- **Phase bar fills on the timeline** are editorial estimates and should be treated as directional, not precise.
- **Data freshness:** Milestone data was fetched on April 29, 2026. The deck should be refreshed before each team review.
