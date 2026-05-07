# CIEL-OCL Deck Update Instructions — May 7, 2026

**File to edit:** `CIEL-OCL-Progress-v3_MidpointCheckin-v1.pptx`  
**Data source:** GitHub API refresh against `OpenConceptLab/ocl_issues`, May 7, 2026  
**Prepared by:** Joe Amlung post-team review

These instructions assume you have the PowerPoint file open and can edit text, change shape fill/border colors, add shapes, and insert table rows. Execute changes slide by slide in priority order. Changes marked **[REQUIRED]** are data corrections; **[NICE-TO-HAVE]** are content additions from the May 7 team discussion.

---

## Slide 1 — Title

No changes needed. Date, title, and week indicator (Week 13 of 26) are already correct.

---

## Slide 2 — What We Set Out to Do

No changes needed.

---

## Slide 3 — Milestone Tracker **[REQUIRED — most changes here]**

This is the 4-column grid. Work column by column.

### Column 1: CIEL Bridge

**Cell #41** — No change.

**Cell #51** (currently red/overdue border, labeled "Apr 2"):
- Change border/fill color from **red** to **amber/orange** (in-progress style)
- Change date label from `Apr 2 🔴` to `May 7`
- Change body text from `0% · 0c/13o` to `67% · 10c/5o`

**Cell #59** (amber/in-progress):
- Change body text from `25% · 1c/3o` to `33% · 2c/4o`
- No color change needed

**Cell #55** — No change (50% · 1c/1o · May 28 is correct).

**NEW — Add Cell #60** between #55 and #57:
- Style: **gray** (upcoming)
- Date label: `May 18`
- Title: `Mini-event: Research`
- Second title line: `Presentation to DBMI (#60)`
- Body: `No issues yet`

**Cell #57** — Change body from `1 open` to `No issues yet` (API shows 0c/0o as of May 7).

### Column 2: CIEL Source Management

**Cell #48** — No change.

**Cell #49** — No change.

**Cell #53** (currently red/overdue border, labeled "Apr 2"):
- Change border/fill from **red** to **green** (closed style)
- Add green checkmark ✅ next to date label
- Change body text from `0% · 0c/5o` to `2/2 closed`

**Cell #54** (currently amber/in-progress, labeled "May 7"):
- Change border/fill from **amber** to **red** (overdue — 0% with 8 issues, past Apr 30)
- Change date label from `May 7` to `Apr 30 🔴`
- Change body text from `Due today` to `0% · 0c/8o`

**Cell #56** — No change.

### Column 3: CIEL Implementers

**Cell #42** (currently amber, labeled "May 7"):
- Keep **amber** border (has substantial progress, should not be red)
- Change date label from `May 7` to `Apr 30` (correct due date per GitHub)
- Change body text from `53% · 14c/12o – Due today` to `67% · 20c/10o – Overdue`

**Cell #43** (currently gray/upcoming, labeled "May 15 / Not yet scheduled"):
- Change border/fill from **gray** to **amber/orange** (now in progress)
- Keep date label `May 15`
- Change body text from `Not yet scheduled` to `13% · 1c/7o`

**Cell #44** (currently gray/upcoming, labeled "May 15 / Not yet scheduled"):
- Change border/fill from **gray** to **amber/orange** (now in progress)
- Keep date label `May 15`
- Change body text from `Not yet scheduled` to `20% · 3c/12o`

**Cells #45 and #46** — No changes.

### Column 4: CIEL Content

**Cell #52** (currently red/overdue border, labeled "Apr 9"):
- Change border/fill from **red** to **green** (closed style)
- Add green checkmark ✅ next to date label
- Change body text from `0% · 0c/3o` to `4/4 closed`

**Cell #58** — No change.

### Summary Bar (bottom of slide)

Replace all four counts:
- `✅ 3 closed` → `✅ 5 closed`
- `❌ 3 overdue (Apr 2–9)` → `❌ 1 overdue (Apr 30)`
- `🔄 3 in progress` → `🔄 6 in progress (2 due today)`
- `⬜ 8 upcoming` → `⬜ 7 upcoming`

---

## Slide 4 — Cheat Sheet **[REQUIRED]**

This is a flat table. Update the following rows. Find each row by the `#` column.

| # | Change field | Old value | New value |
|---|---|---|---|
| 42 | Status | In Progress | In Progress (Overdue) |
| 42 | % | 53% | 67% |
| 42 | Issues | 14c/12o | 20c/10o |
| 43 | Status | Upcoming | In Progress |
| 43 | % | ? | 13% |
| 43 | Due | TBD | May 15 |
| 43 | Issues | — | 1c/7o |
| 44 | Status | Upcoming | In Progress |
| 44 | % | ? | 20% |
| 44 | Due | TBD | May 15 |
| 44 | Issues | — | 3c/12o |
| 47 | % | ? | 0% |
| 47 | Due | Jul | Jul 8 |
| 47 | Issues | — | 0c/5o |
| 51 | Status | Overdue | In Progress |
| 51 | % | 0% | 67% |
| 51 | Due | Apr 2 | May 7 |
| 51 | Issues | 0c/13o | 10c/5o |
| 52 | Status | Overdue | ✅ Closed |
| 52 | % | 0% | 100% |
| 52 | Issues | 0c/3o | 4c/0o |
| 53 | Status | Overdue | ✅ Closed |
| 53 | % | 0% | 100% |
| 53 | Issues | 0c/5o | 2c/0o |
| 54 | Status | In Progress | Overdue |
| 54 | % | ? | 0% |
| 54 | Issues | ? | 0c/8o |
| 57 | Issues | 1o | 0c/0o |
| 59 | % | 25% | 33% |
| 59 | Issues | 1c/3o | 2c/4o |

**Add a new row** for #60 (insert between #59 and the note at the bottom, or in numerical order):

| # | Status | Bucket | Title | % | Due | Issues |
| 60 | ⬜ Upcoming | [CIEL Bridge] | Mini-event: Research Presentation to DBMI | — | May 18 | 0c/0o |

**Remove or update the footnote** that reads: `Cells marked ? couldn't be confirmed from the fetches — worth a quick check on #43, #44, #47, #54, #56, #57.`
Replace with: `Data refreshed from GitHub API, May 7, 2026. All ? values resolved.`

---

## Slide 5 — SOW Timeline **[REQUIRED]**

**TODAY marker:**
- Find the vertical dashed red line labeled `▲ TODAY` and the subtitle `▲ = TODAY (Apr 29)`
- Change subtitle text from `▲ = TODAY (Apr 29)` to `▲ = TODAY (May 7)`
- Shift the vertical dashed line very slightly to the right (Apr 29 → May 7 is about 8 days; on a Feb–Jul axis this is a minor visual adjustment — move it just perceptibly rightward if your tool supports positioning)

**CIEL Bridge row — milestone diamonds:**
- #51 diamond: Change color from **red** to **amber** (in progress)
- Add new **gray** diamond for **#60** at the May 18 position in the CIEL Bridge row, labeled `#60`

**CIEL Source Management row:**
- #53 diamond: Change color from **red** to **green** (closed)

**Content Curation row:**
- #52 diamond: Change color from **red** to **green** (closed)

---

## Slide 6 — CIEL Bridge **[REQUIRED + NICE-TO-HAVE]**

### COMPLETED column — add two new bullets **[NICE-TO-HAVE]**

After the existing bullet `Configurable reranker + sentence-transformers v5.4 upgrade`, add:
- `Multiple reranker models now configurable`
- `Prompt template selection (PR almost merged)`

### OVERDUE/RIGHT column — update #51 **[REQUIRED]**

Find: `MS#51 — ICD11 E2E on pre-publication dataset (13 open issues)`
Replace with: `MS#51 — ICD11 E2E on pre-publication dataset (67% · 10c/5o)`

Update the sub-bullet arrow under #51:
Find: `→ Validation dataset, WHO automatch, LLM-terminologist, evaluation`
Replace with: `→ Mapper info model refactor PR in review (Sunny) — expected close May 8`

### OVERDUE/RIGHT column — update #59 **[REQUIRED]**

Find: `MS#59 — ICD11 E2E on evaluation dataset (3 open issues)`
Replace with: `MS#59 — ICD11 E2E on evaluation dataset (33% · 2c/4o)`

### Callout banner at bottom **[NICE-TO-HAVE]**

The existing text reads: `May ICD-11 Connectathon in Geneva is 3 weeks away.`
Update to: `ICD-11 Connectathon in Geneva is ~3 weeks away (week of May 28). New milestone to be created.`

---

## Slide 7 — CIEL Source Management **[REQUIRED]**

### OVERDUE/RIGHT column — update #54 **[REQUIRED]**

Find: `MS#54 — CIEL Release E2E (Filipe) — 0%, due May 7 (5 open)`
Replace with: `MS#54 — CIEL Release E2E (Filipe) — 0% · 0c/8o · Overdue (Apr 30)`

### COMPLETED column — add one bullet **[NICE-TO-HAVE]**

After the bullet `CIEL Lab used to push CIEL changes to Prod (mini win!)`, add:
- `Bulk import pre-sort performance fix — Filipe PR in progress`

---

## Slide 8 — CIEL + OpenMRS Implementers **[NICE-TO-HAVE]**

### OCL Mapper column — add two bullets to the in-progress (🔄) section

After `'Save to Collection' feature (#SOW-40)`, add:
- `Prompt template selection (PR almost merged)`

### OCL Mapper column — add one bullet to the completed (✅) section

After `Multi-algo score details panel (#2315)`, confirm or add:
- `Bridge generic — runs against any mapped source (not just CIEL)`
- `Multiple reranker models configurable`

(These may already exist in the completed column — check before adding.)

### Callout banner at bottom **[NICE-TO-HAVE]**

Find: `Lots of progress made, but we need to prepare for community use. Need to open this up more to the community, not just the core team!`
Replace with: `Lots of progress made, but we need to prepare for community use. Access/cost model needed before broader rollout — community contributor interest already received.`

---

## Slide 9 — CIEL Content Curation **[REQUIRED]**

### OVERDUE+OPEN column — update #52 **[REQUIRED]**

Find: `MS#52 — Showcase CIEL Content E2E Workflow — 0%, due Apr 2`
And the sub-bullet: `→ 2 open issues – nearly ready to close?`

Replace both with a single line moved to (or noted as) COMPLETED:
`MS#52 — Showcase CIEL Content E2E Workflow — ✅ CLOSED (4/4 issues)`

If the layout has distinct COMPLETED / OVERDUE sections on this slide, move the #52 item from the overdue section to the completed section, formatted consistently with other completed items.

---

## Slide 10 — Risks & Decisions Needed **[REQUIRED]**

### HIGH risk — "5 showcase milestones are overdue" **[REQUIRED]**

Find: `5 showcase milestones are overdue (Apr 2–16)`
Replace with: `MS#54 stalled (0% · 8 open · overdue Apr 30); MS#51 and #59 due today but in progress`

Find the body text: `MS#51, #52, #53, #54, #59 all past due. Combined: 21 open issues + 2 showcases with zero issues linked. Need triage: reschedule, scope down, or reassign.`
Replace with: `MS#52 and #53 confirmed closed. MS#51 at 67% (5 issues remain). MS#59 at 33% (4 issues remain). MS#54 is the only stalled overdue milestone (0%, 8 open). Triage needed for MS#54.`

Consider downgrading this risk from **HIGH** to **MED** given #52/#53 are resolved and #51 is at 67%.

### HIGH risk — "ICD-11 hierarchy import bug" **[REQUIRED]**

Find: `connectathon in 4 weeks`
Replace with: `connectathon in ~3 weeks (week of May 28)`

### MED risk — "5 CIEL Implementer milestones are upcoming but behind" **[NICE-TO-HAVE]**

Find the body text: `MS#42–46 cover Collection workflows, Team-based Mapping, Collection Maintenance, Concept Proposals, and Decision Memory. Need more support for building out requirements, designs, workflows, etc.`

Add to end of body: `#43 (May 15, 13%) and #44 (May 15, 20%) are now active. #42 is overdue at 67%.`

---

## Slide 11 — Indirect Wins & Sneaky Goals

No required changes. Optionally, in the **Performance Improvements Beyond SOW** box, add:
- `Bulk import ordering performance fix (Filipe, in progress)`

---

## Slide 12 — What's Next **[NICE-TO-HAVE]**

### Immediate (May) column — add one item

After `Bulk Import Performance Improvements`, add:
- `Merge mapper information model refactor (Sunny review → May 8)`

Add a new item near the top:
- `DBMI research presentation prep (MS#60 · May 18)`

### Core Delivery (May–Jun) column — update two items

Find: `Add References within Collection (#2431)` — keep as is.

Find: `Concept Proposals MVP (#SOW-27)` — keep as is.

**Add two new items** (these were previously "TBD" and are now scheduled):
- `MS#43: Team-based Mapping & Left Panel (May 15)`
- `MS#44: Collection Maintenance E2E (May 15)`

---

## Slide 13 — Closing (Summary Stats) **[REQUIRED]**

Three large stat boxes. Update two of them:

| Stat box | Current | New |
|---|---|---|
| Top-left (green) | `3` / Milestones closed | `5` / Milestones closed |
| Top-center (red) | `5` / Milestones overdue | `1` / Milestone overdue |
| Top-right (teal) | `13` / Weeks remaining | `13` / Weeks remaining — **no change** |

The subtitle text below the stats reads:
`3 milestones closed. 5 overdue and need triage.`
Replace with:
`5 milestones closed. 1 overdue. 2 due today.`

---

## Change Priority Summary

| Priority | Slides | Notes |
|---|---|---|
| Do first | 3, 4, 13 | Data corrections — tracker grid, cheat sheet, closing stats |
| Do second | 5, 10 | Timeline TODAY marker + color corrections; risks update |
| Do third | 6, 7, 9 | Detail slide corrections (#51, #54, #52 references) |
| Optional | 8, 11, 12 | Content additions from May 7 team discussion |
