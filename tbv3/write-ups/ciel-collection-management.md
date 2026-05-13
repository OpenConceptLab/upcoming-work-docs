# CIEL-Based Collection Management in OCL TBv3

Terminology Implementers (e.g. the OpenMRS community) need to build and maintain concept dictionaries that reference CIEL — and keep them current as CIEL evolves. Today this requires significant technical expertise. TBv3 makes it a first-class browser workflow across two phases: building the collection, and staying up to date over time.

---

## Workflow Overview

```
  ┌──────────────────────────────────────────────────────────────────────────┐
  │  PHASE 1: Build                                                          │
  │                                                                          │
  │  Browse / Search CIEL  ──►  Open Concept Detail  ──►  Add to Collection │
  │                                                         (choose cascade) │
  │                                                              │           │
  │  Bulk Add by ID list   ──────────────────────────────────────┤           │
  │                                                              ▼           │
  │                                                    Preview results       │
  │                                                    (new / existing /     │
  │                                                     version warnings)    │
  │                                                              │           │
  │                                                              ▼           │
  │                                                    Expansion rebuilds    │
  │                                                              │           │
  │                                                              ▼           │
  │                                                    Release named version │
  │                                                    (immutable, FHIR-     │
  │                                                     accessible)          │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │  PHASE 2: Maintain (repeats each time CIEL releases a new version)       │
  │                                                                          │
  │  CIEL releases new version                                               │
  │           │                                                              │
  │           ▼                                                              │
  │  Notification → "CIEL v2025-01 available, you're on v2024-08-01"        │
  │           │                                                              │
  │           ▼                                                              │
  │  Review diff — scoped to YOUR collection:                                │
  │     · Which concepts in your collection changed?                         │
  │     · Which were retired?                                                │
  │     · What new content is now available?                                 │
  │           │                                                              │
  │     ┌─────┴──────────┐                                                  │
  │     ▼                ▼                                                   │
  │  Accept update    Stay on current version                                │
  │  → advance CIEL      (no changes, no risk)                               │
  │    version lock                                                          │
  │  → rebuild expansion                                                     │
  │  → release new version                                                   │
  └──────────────────────────────────────────────────────────────────────────┘
```

---

## Screen 1 — Adding a Concept from CIEL

*The implementer finds a concept in CIEL search or browse, opens the detail panel, and adds it to their collection with cascade configured for OpenMRS Q-AND-A structures.*

```
┌─────────────────────────────────────────────────────────────────────┐
│  CIEL  ›  Malaria, confirmed                               [ × ]   │
│  ─────────────────────────────────────────────────────────────────  │
│  Class: Diagnosis   Datatype: N/A   ID: 167840                      │
│                                                                     │
│  NAMES                              MAPPINGS                        │
│  Malaria, confirmed    FSN  en      SAME-AS   ICD-10-WHO   B54      │
│  Malaria confirmée     FSN  fr      SAME-AS   SNOMED CT    61462000 │
│  Malaria iliyothibitishwa  FSN  sw  NARROWER  ICD-11       1F40     │
│                                                                     │
│  ┌─────────────────────────────────────────────────────────────┐   │
│  │  Add to Collection                                    ✕     │   │
│  │                                                             │   │
│  │  Collection   [ PIH Haiti Dictionary 2024        ▼ ]       │   │
│  │               ↳ Locked to CIEL v2024-08-01                  │   │
│  │                                                             │   │
│  │  Cascade      ○ None                                        │   │
│  │               ○ Source Mappings                             │   │
│  │               ● Source to Concepts  (OpenMRS)  ← recommended│   │
│  │               ○ Custom                                      │   │
│  │                                                             │   │
│  │  Preview      ✅ +1 concept   ✅ +5 mappings                │   │
│  │               ⚠️  0 already in collection                   │   │
│  │                                                             │   │
│  │               [ Cancel ]      [ Add to Collection ]         │   │
│  └─────────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Screen 2 — Collection References Tab

*All references defining the collection's content live here — both specific concept IDs (extensional) and query-based rules (intensional). Version consistency is tracked per source.*

```
┌────────────────────────────────────────────────────────────────────────────┐
│  PIH Haiti Dictionary 2024  [HEAD]                                         │
│  Overview   Concepts   Mappings   References   Versions + Expansions       │
│  ─────────────────────────────────────────────────────────────────────     │
│                                          [ + Add References ]  [ Rebuild ] │
│                                                                            │
│  ☐  Expression                                        Type       Status    │
│  ─  ─────────────────────────────────────────────── ─────────── ────────  │
│  ☐  /orgs/CIEL/sources/CIEL/concepts/167840/          Concept    ✅ OK     │
│  ☐  /orgs/CIEL/sources/CIEL/concepts/1284/            Concept    ✅ OK     │
│  ☐  /orgs/CIEL/sources/CIEL/concepts/?conceptClass=   Concept    ✅ OK     │
│       Diagnosis&q=malaria                              Intensional         │
│  ☐  /orgs/PIH/sources/PIH/concepts/10045/             Concept    ✅ OK     │
│  ☐  /orgs/CIEL/sources/CIEL/concepts/1234/6789/       Concept    ⚠️ Pinned │
│                                                                            │
│  3 selected  [ Remove ]  [ Transform ▼ ]                                   │
│                                                                            │
│  Canonical source versions:  CIEL → v2024-08-01   PIH → HEAD (linked)     │
│  Expansion:  1,847 concepts · 4,203 mappings  ·  Last built 2h ago        │
└────────────────────────────────────────────────────────────────────────────┘
```

---

## Screens 3 & 4 — CIEL Version Update: Notification → Diff Review

*When CIEL publishes a new release, collection owners are notified with a summary scoped to their specific collection content — not CIEL as a whole.*

```
┌────────────────────────────────────────────────────────────────────────┐
│  🔔  CIEL Update Available                                             │
│  ─────────────────────────────────────────────────────────────────     │
│  CIEL v2025-01 has been released.                                      │
│  Your collection is pinned to CIEL v2024-08-01.                       │
│                                                                        │
│  Impact on PIH Haiti Dictionary 2024                                   │
│  ──────────────────────────────────────────────────────               │
│   ✅  12 concepts now available that match your references             │
│   ⚠️   3 concepts in your collection were retired in CIEL              │
│   📝  47 concepts have content changes (names, mappings, etc.)         │
│                                                                        │
│  [ View detailed diff ]                                                │
│                                                                        │
│  ─────────────────────────────────────────────────────────────────     │
│  [ Stay on v2024-08-01 ]          [ Update to v2025-01 → ]            │
└────────────────────────────────────────────────────────────────────────┘
```

*Clicking "View detailed diff" opens a filterable table of every concept in the collection that is affected by the new CIEL version — retired concepts require the most attention.*

```
┌──────────────────────────────────────────────────────────────────────────────┐
│  PIH Haiti Dictionary 2024  ›  CIEL v2024-08-01 → v2025-01 diff             │
│  ──────────────────────────────────────────────────────────────────────────  │
│  Filter:  [ All changes ▼ ]    [ All classes ▼ ]     62 concepts affected   │
│                                                                              │
│  ID       Concept Name                   Class        Change                 │
│  ───────  ─────────────────────────────  ───────────  ───────────────────── │
│  167840   Malaria, confirmed             Diagnosis    📝 Name added (sw)     │
│  1284     Cholera                        Diagnosis    📝 Mapping updated     │
│  141      Typhoid fever                  Diagnosis    📝 Mapping updated     │
│  5089     COUGH                          Finding      ⚠️  Retired            │
│  1740     SHORTNESS OF BREATH            Finding      ⚠️  Retired            │
│  113      Typhoid fever, NOS             Diagnosis    ⚠️  Retired            │
│  80       WEIGHT (KG)                    Misc         ✅ Now available       │
│  ...      ...                            ...          ...                    │
│                                                                              │
│  ⚠️  3 retired concepts need attention — they remain in your collection but  │
│     will not resolve in a new expansion. Review before updating.             │
│                                                                              │
│  [ Cancel ]    [ Stay on v2024-08-01 ]    [ Accept & Update to v2025-01 → ] │
└──────────────────────────────────────────────────────────────────────────────┘
```
