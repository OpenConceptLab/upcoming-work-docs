# Workflow: Author a Collection with a Linked (HEAD) Source

## Purpose

A Terminology Implementer owns both a source and a collection — for example, the PIH source and the PIH dictionary collection. They are actively developing content: adding new concepts to the source and adding references to those concepts in the collection. The problem today is that new concepts added to a source's HEAD are invisible in the collection until the source is versioned and released, which makes the authoring loop feel broken.

This workflow describes how a **HEAD-link flag** on the collection's source relationship allows the collection HEAD to resolve references against the source's HEAD during development, and how the lock transitions cleanly to a released version upon publishing.

> **Relationship to the Update Collection workflow:** This workflow is for implementers who *own* the source they are developing content in (e.g., their own PIH source). If you are instead tracking updates from an external source you don't own (e.g., a new CIEL release), see [Update Collection to Latest Source Version](update-collection-source-version.md).

---

## SOW Coverage

- Linked source: Workflow to resolve references to HEAD when appropriate (during authoring) and transition to released repos upon version creation/release [Tracker: 60]

---

## Roles

- **Primary actor**: Terminology Implementer (owner of the collection; does not need to own the source)
- **Supporting actors**: System (auto-expansion, resolve reference, release orchestration)

---

## Entry Conditions

- User is authenticated and owns (or has edit access to) a collection
- The collection references the source (or will)
- The source has `allow_head_as_linked_source = true` enabled in its repository settings

---

## Core Concept: The HEAD-Link Flag

Normally, when a collection resolves its references against a source, it resolves against a **locked released version** of that source. HEAD content is not visible — it has not been published.

A **HEAD-link** is a flag on the collection's relationship to a specific source that says:

> "While I am working in HEAD of this collection, resolve references to this source against HEAD of that source."

This is not a new entity or a separate data structure. It is a property of a collection-to-source linkage. It uses the existing resolve reference operation and locking behavior, just with an additional mode for authoring.

**Key design decisions:**

| Decision                         | Choice                                                                                                  | Rationale                                                                                                                                                   |
| -------------------------------- | ------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Where is the flag configured?    | **Collection level** — per source relationship, and **source level** — source must opt in | The collection configures which version to resolve against; the source controls whether HEAD is available as a target at all                                |
| Authorization basis              | **Source-level opt-in** (`allow_head_as_linked_source = true`)                                  | Any collection may link to a source's HEAD provided the source has enabled it; ownership of the source is not required                                      |
| Does the reference text change?  | **No** — references are unchanged                                                                | The reference expression remains the same; only the resolution behavior differs based on whether you are in HEAD of the collection or in a released version |
| What other sources are affected? | **Only the HEAD-linked source**                                                                   | Other sources (e.g., CIEL) remain locked to their pinned released version                                                                                   |

---

## Workflow

### Phase 1: Authoring (Working in HEAD)

The user adds new content to their source and collection simultaneously. The HEAD-link ensures that new source content is immediately visible in the collection without requiring a release cycle.

```
AUTHORING PHASE — working in HEAD of both source and collection
═══════════════════════════════════════════════════════════════════

  PIH Collection [HEAD]
  ┌──────────────────────────────────────────────────────────────┐
  │  ref: /PIH/sources/PIH/concepts/123/   ─────────────────┐   │
  │  ref: /PIH/sources/PIH/concepts/124/   ─────────────────┤   │
  │  ref: /CIEL/sources/CIEL/concepts/5089/ ───────────────┐ │   │
  └───────────────────────────────────────────────────────────────┘
                 │ HEAD-link flag active                    │   │
                 ▼                                          │   │
  PIH Source [HEAD]  ◄────────────────────────────────────────┘
  ┌────────────────────────┐
  │ concept/123  ← new!   │   resolved immediately ✓
  │ concept/124  ← new!   │   user sees these in collection
  └────────────────────────┘
                                                            │
                                                            ▼
                                               CIEL [v2026-01]  ← locked, unchanged
                                               ┌──────────────────────┐
                                               │ concept/5089         │
                                               └──────────────────────┘
```

**What the user experiences:**

1. User creates a new concept in PIH Source → concept lands in PIH Source HEAD
2. System adds a reference to the collection HEAD (or user adds it manually)
3. Auto-expansion resolves the reference → resolves to PIH Source HEAD via the HEAD-link
4. User navigates to the collection → sees the new concept immediately
5. Repeat for each new concept — no release required to see the work

**What happens under the hood:**

- Resolve reference is called with a flag to use HEAD of the linked source
- The reference expression itself is unversioned (e.g., `/PIH/sources/PIH/concepts/123/`) — this same expression is what will appear in the released version
- Other sources (CIEL) are not affected; they resolve against their locked released version as usual

---

### Phase 2: Releasing (Batch Release)

When the user is ready to publish a new version of their dictionary, two things must happen in order:

1. **Release the source** — unpublished (HEAD) content must be versioned so the collection can point to it
2. **Release the collection** — the HEAD-link switches from HEAD to the newly released source version

```
RELEASE PHASE — batch release of source then collection
═══════════════════════════════════════════════════════════════════

STEP 1: Release PIH Source

  PIH Source [HEAD]
  ┌────────────────────┐
  │ concept/123        │  ──publish──►  PIH Source [v19.3]
  │ concept/124        │                ┌────────────────────┐
  └────────────────────┘                │ concept/123  ✓     │
                                        │ concept/124  ✓     │
                                        └────────────────────┘

STEP 2: Release Collection

  PIH Collection [HEAD]  ──publish──►  PIH Collection [v3.0]

  The HEAD-link switches on release:
  ┌──────────────────────────────────────────────────────────────┐
  │  BEFORE  (HEAD):   resolve PIH refs → PIH Source HEAD        │
  │  AFTER   (v3.0):   resolve PIH refs → PIH Source v19.3  ✓   │
  └──────────────────────────────────────────────────────────────┘

RESULT: PIH Collection v3.0
  ┌──────────────────────────────────────────────────────────────┐
  │  ref: /PIH/sources/PIH/concepts/123/  →  PIH v19.3  ✓       │
  │  ref: /PIH/sources/PIH/concepts/124/  →  PIH v19.3  ✓       │
  │  ref: /CIEL/sources/CIEL/concepts/5089/ → CIEL v2026-01 ✓   │
  └──────────────────────────────────────────────────────────────┘
  All references resolve. HEAD-link is no longer active in v3.0.
```

**Happy path steps:**

1. User decides to publish a new version of the dictionary
2. System checks whether the HEAD-linked source has any unreleased content referenced by the collection
3. **If yes:** user is prompted — "Your collection references content that has not been released in PIH Source. Release PIH Source first." (See [Unreleased Content Warning](#unreleased-content-warning) below)
4. User releases PIH Source (e.g., as v19.3)
5. User releases the collection — system re-evaluates references, switching HEAD resolution to v19.3
6. Collection version is published

---

## Unreleased Content Warning

If the user attempts to release the collection before releasing the source, the system surfaces a warning rather than a hard block:

> ⚠️ **Heads up:** Your collection references content in PIH Source that has not been published yet (N concepts in HEAD). If you release the collection now, those references will not resolve in the published version.
>
> **Recommended:** Release PIH Source first, then return to release the collection.
>
> [Release PIH Source →]  [Continue Anyway]

This is a warning, not a blocker. The user can proceed, but should understand the consequence: any references pointing to unreleased source content will return no result in the published collection version.

---

## What Stays Locked During Authoring

Not all source relationships become HEAD-links. The HEAD-link is opt-in, per source, at the collection level. A typical setup might look like:

| Source                  | Relationship type  | Behavior during authoring HEAD        | Behavior on release                               |
| ----------------------- | ------------------ | ------------------------------------- | ------------------------------------------------- |
| PIH Source (own source) | HEAD-linked        | Resolves to PIH Source HEAD           | Transitions to latest released PIH Source version |
| CIEL                    | Locked to v2026-01 | Resolves to CIEL v2026-01 (unchanged) | Stays at v2026-01 unless explicitly updated       |

CIEL stays on its pinned version throughout. Only the source explicitly configured as HEAD-linked gets the HEAD resolution behavior.

---

## Implementation Notes

**What already exists in OCL:**

- The resolve reference operation already supports a HEAD parameter and handles the case where a source has no released version (falls back to HEAD)
- Source version locking on collection release already exists
- Namespace-based URL registry (for multi-org resolution) already exists

**What needs to be built:**

- Source-level repository setting: `allow_head_as_linked_source` boolean (default `false`), configurable in the source's Settings tab under "Advanced"
- UI to configure a source relationship as HEAD-linked in the collection (Collection → Settings → "Linked Sources" section), gated on the source having opted in
- Business logic layer in auto-expansion to resolve unversioned references against source HEAD when the linked source is configured to HEAD
- Re-evaluation step on collection release — currently OCL copies the HEAD auto-expansion on version creation rather than re-evaluating; for HEAD-link to work, the release step must re-evaluate references and lock to the source version current at release time

---

## Open Issues

| Issue                                      | Description                                                                                                                                                                                                                                                                                                                                                                |
| ------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Auto-expansion re-evaluation on release    | When creating a released collection version, OCL currently copies the HEAD auto-expansion. For the HEAD-link transition (HEAD → released version) to work correctly on publish, the release step must re-evaluate references rather than copy them. This is a behavior change in the current release flow.                                                                |
| Dirty reference detection                  | If a user edits or deletes a concept in the source HEAD, the collection HEAD does not automatically know to refresh. Re-running all references on every source change is too slow at scale. A smarter invalidation mechanism (e.g., source-level change timestamps compared to expansion timestamps) is needed. For the MVP, users may need to manually trigger a refresh. |
| Multi-org namespaces (e.g., MSF + MSF OCB) | If a user's source and collection live in different orgs, the namespace-based authorization will not automatically grant HEAD access. The URL registry can be used to map cross-org canonical URLs. Needs validation with MSF as a reference implementation.                                                                                                               |

---

## Related

- [Build a Concept Dictionary](build-concept-dictionary.md) — initial collection setup
- [Update Collection to Latest Source Version](update-collection-source-version.md) — tracking external source updates (e.g., new CIEL version)
- [Object: Version](../01_objects/version.md) — HEAD vs. released version lifecycle
- [Object: Reference](../01_objects/reference.md) — how references are resolved and locked
- [Capability: Manage Versions and Expansions](../02_capabilities/manage-versions-and-expansions.md) — release controls and auto-expansion behavior
