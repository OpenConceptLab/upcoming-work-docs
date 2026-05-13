# Concept Proposals MVP

When an implementer encounters a missing concept, wrong name, or stale mapping in CIEL, there's currently no structured channel to surface it. Concept Proposals introduces a formal, trackable workflow: implementers submit proposals from TBv3 or OCL Mapper; CIEL admins review and act from a managed queue; approved proposals automatically create or update concepts in the source.

---

## Workflow Overview

```
  PROPOSER                                    CIEL ADMIN
  ───────────────────────────────────────     ──────────────────────────────────────

  Can't find a concept in CIEL               Notification: new proposal in queue
          │                                            │
          ▼                                            ▼
  "Propose New Concept to CIEL"              Open Proposals tab → filter Pending
          │                                            │
          ▼                                            ▼
  Fill out proposal form                     Review proposed concept
  (class, datatype, names,                   Check for similar existing concepts
   supporting mappings, rationale)                     │
          │                               ┌────────────┴─────────────┐
          ▼                               ▼                           ▼
  Submitted → notification sent      Add comment /            Approve  or  Reject
  to CIEL admins                     mark In Review                │          │
          │                                                         ▼          ▼
          ▼                                              Concept created   Reason
  Track in "My Proposals"                                in CIEL HEAD      required
  (status tracker + comment thread)                               │
          │                                                        ▼
          ▼                                              Proposer notified
  Receive notification on                                with link to new concept
  status change
```

*Also works from OCL Mapper: "Propose to CIEL" from a Mapper row → appears in same queue with Origin: Mapper badge.*

---

## Screen 1 — Proposal Submission Form

*Accessed from global search "no results" state, the CIEL source page, or (for edits) the concept detail action menu.*

```
┌────────────────────────────────────────────────────────────────────────┐
│  Propose New Concept to CIEL                                           │
│  ─────────────────────────────────────────────────────────────────     │
│                                                                        │
│  Concept Class    [ Diagnosis                          ▼ ]             │
│  Datatype         [ N/A                                ▼ ]             │
│                                                                        │
│  Names            + Add Name                                           │
│  ┌─────────────────────────────────────────────────────────────┐      │
│  │  Typhoid fever with complications        FSN  [ en ▼ ]  ✕  │      │
│  │  Fièvre typhoïde avec complications      FSN  [ fr ▼ ]  ✕  │      │
│  └─────────────────────────────────────────────────────────────┘      │
│                                                                        │
│  Supporting Mappings (informational)       + Add Mapping               │
│  ┌─────────────────────────────────────────────────────────────┐      │
│  │  SAME-AS   ICD-10-WHO   A01.09                           ✕  │      │
│  │  SAME-AS   SNOMED CT    4834000                           ✕  │      │
│  └─────────────────────────────────────────────────────────────┘      │
│                                                                        │
│  Rationale (recommended)                                               │
│  ┌─────────────────────────────────────────────────────────────┐      │
│  │  We need this for PHIA survey mapping — ICD-10 A01.09 is   │      │
│  │  in our reporting set but no CIEL equivalent exists.        │      │
│  └─────────────────────────────────────────────────────────────┘      │
│                                                                        │
│               [ Cancel ]                 [ Submit Proposal ]           │
└────────────────────────────────────────────────────────────────────────┘
```

---

## Screen 2 — Proposer Tracking View

*"My Concept Proposals" from the user profile. Each proposal is a trackable ticket with status, thread, and withdraw action.*

```
┌────────────────────────────────────────────────────────────────────────┐
│  My Concept Proposals                                                  │
│  ─────────────────────────────────────────────────────────────────     │
│                                                                        │
│  #1042  New Concept → CIEL             Submitted  2 days ago           │
│  ─────────────────────────────────────────────────────────────────     │
│                                                                        │
│  Submitted ──●── In Review ──○── Approved / Rejected                  │
│                                                                        │
│  Proposed:  Typhoid fever with complications  (Diagnosis, N/A)        │
│             SAME-AS ICD-10: A01.09 · SAME-AS SNOMED: 4834000          │
│                                                                        │
│  Discussion                                                            │
│  @kmugo  (2 days ago)                                                  │
│  See rationale in proposal form.                                       │
│                                                                        │
│  [ Add a comment... ]                                  [ Withdraw ]   │
│                                                                        │
│  ─────────────────────────────────────────────────────────────────     │
│  #1038  Edit Concept → CIEL            ✅ Approved  3 weeks ago        │
│  #1031  New Concept → CIEL             ❌ Rejected  6 weeks ago        │
└────────────────────────────────────────────────────────────────────────┘
```

---

## Screen 3 — Admin Review Queue + Proposal Detail

*Source admins access proposals from the Concept Proposals tab on their source page. Edit proposals show a side-by-side diff of current vs. proposed.*

```
CIEL  ›  Concept Proposals  [3 pending]            [+ Propose New Concept]
────────────────────────────────────────────────────────────────────────────

  Filter: [ All Types ▼ ]  [ Pending ▼ ]  [ All Origins ▼ ]

  ID      Type          Submitter    Submitted     Status       Origin
  ──────  ────────────  ───────────  ────────────  ───────────  ───────
  #1042   New Concept   @kmugo       2 days ago    Submitted    TBv3
  #1041   Edit Concept  @jsmith      3 days ago    In Review    Mapper
  #1039   New Concept   @ldiallo     1 week ago    Submitted    TBv3

────────────────────────────────────────────────────────────────────────────

  Proposal #1041 — Edit Concept                             In Review  ●

  CURRENT                            PROPOSED
  ─────────────────────────────────  ─────────────────────────────────
  Class:    Diagnosis                Class:    Diagnosis
  Datatype: Boolean              →   Datatype: N/A                ← changed
  Name:     Malaria test result      Name:     Malaria test result
  FSN en    (Fully Specified)        FSN en    (Fully Specified)
                                 →   + Malaria test result  FSN fr  ← added

  Rationale:  "The Boolean datatype is incorrect for this class — it should
               be N/A. Also adding French FSN used in our PIH deployment."

  Discussion
  @jsmith  (3 days ago):   See rationale.
  @admin   (1 day ago):    Confirmed — Boolean was a data entry error. Will approve.
  [ Add a comment... ]

  [ Reject ]    [ Mark In Review ]    [ Approve → ]
```
