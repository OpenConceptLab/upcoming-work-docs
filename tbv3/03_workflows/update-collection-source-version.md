# Workflow: Update Collection to Latest Source Version

## Purpose

A Terminology Implementer has an existing concept dictionary (collection) built on CIEL. CIEL has released a new version. The TI wants to review what changed, decide what to accept, and update their dictionary to use the new CIEL version — without breaking their system or silently including unwanted changes.

**This is the primary version locking / collection update use case in the SOW.**

---

## SOW Coverage

This workflow directly implements:
- Notifications of changes of dependencies [Tracker: 62]
- Workflow for reviewing and accepting updates, possibly including Before/after comparison [Tracker: 63]
- Intuitive controls for collection version locking (Rebuild, Create similar expansion) [Tracker: 1]
- Linked source: Workflow to resolve references to HEAD when appropriate (during updates) and transition to released repos upon version creation/release [Tracker: 60]

---

## Roles

- **Primary actor**: Terminology Implementer (collection owner)
- **Supporting actors**: System (notifications, version resolution, expansion computation)

---

## Entry Conditions

- User owns or edits a collection that references CIEL (or another source)
- CIEL has released a new version since the collection's canonical source version was last set

---

## Trigger

**Notification:** When CIEL releases a new version, TBv3 sends an in-app notification (and optionally email) to owners of collections that reference CIEL.

Notification content:
- "[CIEL] released a new version: v2025-01-15"
- "Your collection [name] references CIEL. Review what changed and update your collection."
- [Review Updates →] CTA button

---

## Steps

### 1. Review the Notification

1. User sees notification bell badge in the app header
2. Opens notification center
3. Sees the CIEL new version notification
4. Clicks "Review Updates →" — navigates to the collection's update review flow

---

### 2. Version Comparison (What Changed in CIEL?)

**Entry point:** Notification CTA, or Collection → Versions + Expansions tab → "Review Source Updates" banner

**The comparison view shows:**
- **Left**: Collection's current canonical CIEL version (e.g., v2024-08-01)
- **Right**: New CIEL version (e.g., v2025-01-15)

**Summary statistics:**
- Concepts in current version: [N]
- Concepts in new version: [N]
- Concepts added since current version: [+N] — shown as a browsable list
- Concepts retired since current version: [-N] — shown as a browsable list
- Concepts with changed names or mappings: [~N] — shown as a browsable list

**Browsable diff list:**
- Each row: Concept chip (name + ID) | Change type (Added / Retired / Modified)
- "Added" concepts: checkboxes (user can deselect concepts they do NOT want to accept)
- "Retired" concepts: warnings (user decides how to handle — remove from collection or retain as-is)
- "Modified" concepts: side-by-side diff of what changed (names, mappings, class, datatype)

**Key design principle:** The user must feel in control. They are not blindly accepting everything — they are reviewing and making informed decisions.

---

### 3. Decide Whether to Accept the Update

The update decision is **binary at the version level** — the user either accepts the new CIEL version entirely or does not. There is no guided per-concept accept/reject UI in the current scope (see `tbv3-deferred-features.md` → "Facilitated Per-Concept Accept/Reject").

**Option A — Accept the update (rebuild to new version):**
- User reviews the diff summary (Step 2) and is satisfied accepting the changes as a whole
- Clicks "Accept Update" / "Rebuild to [new version]"
- System rebuilds the auto-expansion pointed at the new CIEL version, running alongside the current expansion
- Diff between pre- and post-rebuild is shown for review (see Step 5)

**Option B — Keep the current locked source version (no change):**
- User dismisses the workflow without acting
- Notification persists in the notification center; banner remains on the collection page
- The auto-expansion continues to resolve against the existing locked source version

**Option C — Go to authoring/reference management mode:**
- If the user wants to pick and choose which new content to include (e.g., add only specific new CIEL concepts, or exclude specific new content), they must exit this workflow and edit their references directly
- This is not a facilitated workflow; the user navigates to the References tab and makes changes manually, then returns here to rebuild

> **Design note — avoid encouraging exclusions or version-pinning as the default response:** Exclusion references and per-reference version pinning make future management harder — users can silently stop receiving updates without realizing it. The happy path must be "accept all and rebuild." Granular reference editing is available but is explicitly a power-user / authoring activity.

> **Open question — Retired concepts:** When the new CIEL version retires a concept, that concept will still appear in the collection expansion (the reference is unchanged) but it will be tagged as "Retired." This may be desirable from a governance standpoint (implementers should know the concept is deprecated) but may cause problems for downstream systems (e.g., OpenMRS export). The alternative — pinning the reference to the pre-retirement version — suppresses the deprecated metadata but preserves the non-retired status. **Needs input from Andy Kanter (governance perspective) and Burke (OpenMRS impact) — flagged for Wednesday OCL squad call.**

---

### 4. Rebuild the Auto-Expansion

1. User clicks "Accept Update" / "Rebuild to [new CIEL version]"
2. Confirmation dialog:
   - "This will rebuild your auto-expansion pointing to CIEL [new version]. The current expansion will be preserved for comparison."
   - "Rebuild" | "Cancel"
3. System:
   - Queues a new auto-expansion rebuild, resolving all unversioned references against the new CIEL version
   - The rebuild runs **alongside** the current expansion — it does not overwrite in place
   - The auto-expansion's locked source version is updated to the new CIEL version
4. Rebuild processes asynchronously; status shows as "Processing" in the Versions + Expansions tab

---

### 5. Review the Diff and Confirm

Once the rebuild completes:

1. System shows a diff between the pre-rebuild and post-rebuild expansions (GitHub-merge metaphor):
   - Summary: "N concepts added, N retired, N modified"
   - Where possible: a system recommendation — e.g., "Looks like synonyms added only — low clinical impact"
   - Browsable diff list: Added / Retired / Modified concepts
2. User reviews the diff
3. **Confirm** — new auto-expansion becomes the active auto-expansion; old expansion is retained for a period or can be explicitly deleted
4. **Reject** — rebuild is discarded; expansion reverts to the previous auto-expansion; locked source version reverts to the previous CIEL version
5. If the user wants to make reference changes before finalizing (e.g., exclude specific new content), they exit to the References tab, make changes, and re-trigger the rebuild

---

### 6. Create a New Collection Version

When satisfied:
1. Versions + Expansions tab → "New Version"
2. Enter version ID (e.g., "v2025-01-15")
3. On version creation:
   - All unversioned CIEL references transition to the new CIEL released version (v2025-01-15) in the expansion parameters
   - New auto-expansion computed
4. Release the version

---

## Post-Completion State

- Collection has a new released version based on the updated CIEL version
- Old version is still accessible and unchanged
- Notification is dismissed
- Pre-rebuild expansion is retained temporarily for comparison

---

## Error and Edge Cases

| Situation | Behavior |
|---|---|
| CIEL new version has no changes relevant to this collection | Notification is shown with "No content in your collection changed in the new CIEL version. You may still update your locked source version." |
| User dismisses notification without acting | Notification persists in notification center; banner remains on collection page |
| Expansion computation fails after applying changes | Error shown; Rebuild button available; does not roll back the reference changes |
| Multiple source updates pending | Each source is shown as a separate update flow; the collection may batch all into one new version at the end. **Version skipping is supported:** when a source has gone v1 → v2 → v3 → v4, the user may go directly from their current version (v1) to the latest (v4) without stepping through each intermediate version. |
