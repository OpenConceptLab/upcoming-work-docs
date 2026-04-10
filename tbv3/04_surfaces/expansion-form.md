# Surface: Expansion Form (Create / Edit)

## Scope

The form for creating a new expansion or editing an existing expansion's metadata. Rendered as a **right-side drawer** (consistent with other create/edit forms in TBv3).

---

## When It Appears

| Trigger                                        | Mode                                                  |
| ---------------------------------------------- | ----------------------------------------------------- |
| Versions + Expansions tab → "+ New Expansion" | Create                                                |
| Expansion row (⋮) → "Create Similar"         | Create, pre-filled with source expansion's parameters |
| Expansion row (⋮) → "Edit"                   | Edit (canonical URL only)                             |

---

## Create Mode

### Layout Diagram

```
┌─────────────────────────────────────────────────────────┐
│  New Expansion: BA-team-demo / v2024-11-01          [×]  │
├──────────────────────────────────────────────────────────┤
│                                                          │
│  Expansion ID *                                          │
│  ┌────────────────────────────────────────────────────┐  │
│  │ e.g. my-expansion-2024                              │  │
│  └────────────────────────────────────────────────────┘  │
│  Alphanumeric, @, hyphens, periods, underscores          │
│                                                          │
│  Canonical URL                                           │
│  ┌────────────────────────────────────────────────────┐  │
│  │                                                     │  │
│  └────────────────────────────────────────────────────┘  │
│                                                          │
│  Parameters ─────────────────────────────────────────── │
│                                                          │
│  Active Only                                  ●───  On   │
│                                                          │
│  Source Version Overrides                                │
│  ┌─────────────────────────── ──────────────────────┐   │
│  │  Source                    Version               │   │
│  │  ─────────────────────── ──────────────────────  │   │
│  │  [CIEL/sources/CIEL ×]   [v2024-08-01       ▾]   │   │
│  │  [+ Add source]                                  │   │
│  └──────────────────────────────────────────────────┘   │
│                                                          │
│  Date                                                    │
│  ┌────────────────────────────────────────────────────┐  │
│  │ YYYY-MM-DD                                          │  │
│  └────────────────────────────────────────────────────┘  │
│                                                          │
│  [Show advanced ▾]                                       │
│                                                          │
│  ── ── ── ── ── ── ── ── ── ── ── ── ── ── ── ── ── ──  │
│  ☐  Set as default expansion                             │
│                                                          │
│        [      Create      ]    [    Cancel    ]          │
└──────────────────────────────────────────────────────────┘
```

### Header

```
New Expansion: [collection short_code] / [version ID]
```

Version context is shown in the header — there is **no version selector** in the form. The form always operates on the version that was selected in the left panel when the button was clicked.

### Fields

#### Identity

| Field                   | Type | Required | Notes                                                                     |
| ----------------------- | ---- | -------- | ------------------------------------------------------------------------- |
| **Expansion ID**  | Text | Yes      | Alphanumeric, hyphens, periods, underscores, @. Immutable after creation. |
| **Canonical URL** | URL  | No       | Optional stable external URL for this expansion                           |

#### Parameters

Parameters are grouped into two sections: **Common** (always visible) and **Advanced** (collapsed by default, expandable).

**Common parameters:**

| Parameter                          | Control     | Default | Notes                                                                                   |
| ---------------------------------- | ----------- | ------- | --------------------------------------------------------------------------------------- |
| **Active Only**              | Toggle      | On      | Include only unretired concepts and mappings                                            |
| **Source Version Overrides** | Table       | Empty   | Per-source version pinning (see below)                                                  |
| **Date**                     | Date picker | Empty   | Use source versions released as of this date; alternative to explicit version overrides |

**Source Version Overrides table:**

```
Source                  Version
─────────────────────   ──────────────────────
[source chip]           [version selector ▾]
[+ Add source]
```

- Each row: a source chip (org/source name) + a version dropdown for that source
- If empty: the expansion uses the collection's canonical source versions (default behavior)
- "Add source" opens a source search to add a new override row
- A row can be removed with ✕

**Advanced parameters** (collapsed by default, "Show advanced ▾" toggle):

| Parameter                | Control | Default | Notes                                                          |
| ------------------------ | ------- | ------- | -------------------------------------------------------------- |
| **Exclude System** | Text    | Empty   | Exclude a specific code system from results. Format: `[system] |
| **System Version** | Text    | Empty   | Force a specific system version. Format: `[system]             |
| **Filter**         | Text    | Empty   | Additional search/filter criteria                              |

> Parameters that are not yet supported by the API (Include Designations, Exclude Nested, Include Definition, Exclude Post Coordinated, Count, Offset, Check System Version, Force System Version) are **not shown** in TBv3. They were displayed in v2 but grayed out; omitting them reduces noise.

#### Set as Default

| Field                              | Control  | Default |
| ---------------------------------- | -------- | ------- |
| **Set as default expansion** | Checkbox | Off     |

Shown at the bottom of the form. Checking this replaces the current default expansion for this version on save.

### Validation

- Expansion ID is required and must match `[a-zA-Z0-9-._@]+`
- Expansion ID must be unique within the version (validated on submit; inline error if duplicate)
- Date field must be a valid date if provided (YYYY-MM-DD)
- Exclude System / System Version must match `[system]|[version]` format if provided

### Actions

```
[Create]  [Cancel]
```

- **Create**: submits `POST /:owner/collections/:collection/:version/expansions/`
- **Cancel**: closes the drawer; no changes saved
- "Create" is disabled until the Expansion ID field has a valid value

### "Create Similar" Pre-fill

When opened via "Create Similar", all fields are pre-filled from the source expansion:

- Canonical URL is cleared (not copied — the new expansion should have its own or none)
- All parameters are copied as-is
- "Set as default" defaults to off
- A banner at the top: `"Copied from: [source expansion ID]"`

---

## Edit Mode

### Header

```
Edit Expansion: [expansion ID]
```

### Fields

Only **Canonical URL** is editable. All other fields are shown as read-only context.

```
Expansion ID     [expansion-id]         (read-only)
Canonical URL    [____________________] (editable)
Parameters       Active Only: On  |  Date: —  |  Source Overrides: 2
                 (read-only summary; link "View full parameters" opens detail panel)
```

### Actions

```
[Save]  [Cancel]
```

- **Save**: submits `PUT /:owner/collections/:collection/:version/expansions/:expansion/` with `{ canonical_url }`
- Does not trigger re-evaluation

---

## Relationship to Other Files

- `02_capabilities/manage-versions-and-expansions.md` — business rules for all expansion actions (Create, Set Default, Rebuild, Update Metadata, Delete)
- `04_surfaces/versions-expansions-tab.md` — parent tab that hosts the "+ New Expansion" button and expansion rows
- `01_objects/expansion.md` — expansion schema and parameter definitions
