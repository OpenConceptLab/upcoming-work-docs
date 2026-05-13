# Concept Proposals MVP

## Overview

CIEL and other canonical terminology sources are maintained by a small team, but thousands of implementers worldwide depend on them. When an implementer encounters a missing concept, an incorrect name, or a stale mapping, there is currently no structured way to surface that feedback to the source maintainers — it happens ad hoc via email or GitHub issues. Concept Proposals introduces a formal, trackable workflow: any authenticated user can submit a proposal to an enabled source; source administrators receive it, discuss it, and approve or reject it from a managed queue. Approved proposals automatically create or update the concept in the source.

The MVP covers proposals submitted from TBv3 and from OCL Mapper, both landing in the same queue. The public/community model (open upvoting, anonymous submissions, public proposal feeds) is deferred.

## MVP Workflow

**Submit a proposal.** A Terminology Implementer browsing CIEL cannot find the concept they need. From the "No results" state in global search, they see a "Propose this concept to CIEL" call to action. Alternatively, they navigate to CIEL's source page and click "Propose New Concept." A form opens — identical to the concept creation form — where they specify concept class, datatype, names, and optionally supporting mappings (e.g., a SAME-AS link to SNOMED they found elsewhere) and a free-text rationale. They submit, and the proposal enters the CIEL admin queue in Submitted status. The implementer receives a link to track it.

For existing concepts, the workflow starts from the concept detail view: "Propose Edit" opens a form showing the current values alongside editable fields — the implementer changes only what needs changing (patch model; unchanged fields are clearly indicated) and provides a required reason. "Propose Retirement" shows impact (which collections reference the concept) and requires a rationale.

Proposals can also originate from OCL Mapper: when a mapper user cannot find a CIEL match, they submit a proposal directly from the Mapper UI. It appears in the same TBv3 queue with an "Origin: Mapper" label.

**Track a submitted proposal.** The proposer's profile exposes a "My Concept Proposals" tab listing all their submissions with status badges. Each proposal shows a status tracker (Submitted → In Review → Approved / Rejected), the proposed concept content, a threaded comment history, and a Withdraw action (available until the proposal is acted on).

**Manage the queue (admin side).** Source administrators see a Concept Proposals tab on their source repository with a badge showing the count of pending items. The list is filterable by status, type, origin, and submitter. Clicking a proposal opens the detail view:

- For **new concept proposals**: the full proposed concept in structured form, the proposer's rationale, and action buttons (Mark In Review, Approve, Reject). Approve triggers async concept creation in source HEAD and notifies the proposer.
- For **edit proposals**: a side-by-side diff of current vs. proposed values. The admin can modify the proposed values before approving (the accepted version is what gets committed; the proposer is notified "approved with edits").
- For **retire proposals**: an impact summary (N collections referencing the concept) before the admin confirms.

Comments can be added at any point by either party. Rejection requires a written reason, which appears in the proposal thread.

## Mockup — Admin Review Queue + Proposal Detail

```
CIEL Source  /  Concept Proposals                  [+ Propose New Concept]
──────────────────────────────────────────────────────────────────────────

Filter: [All Types ▼]  [Pending ▼]  [All Origins ▼]           3 pending

  ID      Type           Submitter      Submitted      Status       Origin
  ──────  ─────────────  ─────────────  ─────────────  ───────────  ──────
  #1042   New Concept    @kmugo         2 days ago     Submitted    TBv3
  #1041   Edit Concept   @jsmith        3 days ago     In Review    Mapper
  #1039   New Concept    @ldiallo       1 week ago     Submitted    TBv3

──────────────────────────────────────────────────────────────────────────

  Proposal #1042 — New Concept                              Submitted  ●

  Proposed Concept
  ────────────────────────────────────────────────
  Concept Class:   Diagnosis
  Datatype:        N/A
  Names:           Typhoid fever with complications (FSN, en)
                   Fièvre typhoïde avec complications (FSN, fr)
  Supp. Mappings:  SAME-AS  ICD-10: A01.09
                   SAME-AS  SNOMED: 4834000
  Rationale:       "We need this for PHIA survey mapping — ICD-10 A01.09
                    is in our reporting set but no CIEL equivalent exists."

  Similar concepts found: Typhoid fever (CIEL 141), Typhoid fever, NOS (CIEL 113)

  Discussion
  ────────────────────────────────────────────────
  @kmugo  (2 days ago):  See rationale above.
  [ Add a comment... ]

  [ Mark In Review ]    [ Reject ]    [ Approve → ]
```
