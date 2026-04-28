# CIEL ICD-11 Separation: Short-Term Plan

This short-term plan delivers a license-compliant CIEL distribution and a private CIEL-to-ICD11 map repository by introducing a publish-time repository split, while keeping the existing single-repo authoring and management model intact (using a private CIEL repository with all content in one place).

- Unblocks UI, API, and tooling by delivering correctly partitioned content to downstream systems
- No immediate runtime changes: TermBrowser, Mapper, API, and CLI/MCP consume published outputs only — no cross-repo logic required
- Minimal disruption: Existing authoring workflows remain unchanged -- just point CIEL Lab to a new private repo
- Isolated complexity: All content separation handled at publish time
- Parallel cleanup: Enables removal of ICD-11 mappings from the public repo without blocking progress
- Low risk, fast delivery: Reduces dependency on long-term architecture while enabling immediate progress

---

## Proposed Plan

### Phase 0: Analysis and Risk Assessment

Before making any changes, establish the scope and blast radius of the separation.

- **Step 1 -- Determine historical scope**:
  - When were ICD-11 maps first introduced into CIEL? When did the bulk of the ICD-11 mapping work with Filipe begin?
  - How many CIEL versions contain ICD-11 mappings? How many ICD-11 mappings per version?
  - Based on this, decide how far back the cleanup needs to go. There may be a cutoff point before which the volume is small enough that some level of historical ICD-11 map leakage is acceptable.
- **Step 2 -- Referential integrity and leakage assessment**:
  - How many resources across OCL resolve to, reference, or derive from CIEL ICD-11 mappings? Specifically:
    - Collections or expansions that include CIEL ICD-11 mappings via direct references
    - User repos that contain cloned copies of CIEL ICD-11 mappings (via cascade or clone operations)
    - Mappings in other repos that reference CIEL ICD-11 mapping targets
  - Determine whether OCL handles dangling references gracefully (mappings that point to content that no longer exists in the source)
  - Assess scope: is this a handful of repos or widespread? The answer shapes whether cleanup is feasible, best-effort, or not worth pursuing.
  - **Output**: A report quantifying the exposure -- number of affected versions, repos, collections, and cloned mappings. This informs the cleanup approach in Phase 3 and the remediation decisions in Phase 4.

### Phase 1: Private CIEL Repo Setup

- **Step 3 -- Create new private CIEL repo**: Create a new private repository under the CIEL org in OCL. This becomes the single source of truth for CIEL management (concepts + all mappings, including ICD-11).
- **Step 4 -- Populate with historical releases**:
  - Copy existing CIEL content into the new private repo. Scope:
    - **Minimum**: all releases from the current year
    - **Ideal**: all releases going back to when ICD-11 maps were first introduced (informed by Phase 0 analysis)
  - Use the "only create new resource version if content has changed" approach. Use the diff and changelog functionality to verify correctness between this new repo and the original public CIEL. Fix any issues surfaced during this validation (we may need to perform this import process more than once).
- **Step 5 -- Redirect CIEL Lab management interface**: Point CIEL Lab to the new private repo. Andy's workflow stays nearly identical -- same tools, same process, just a different target repo. This is deliberately low/no-disruption.

### Phase 2: Mapping Repo and Publish Workflow

- **Step 6 -- Create the ICD-11 mapping repo**: Create a second private repository under the CIEL org, dedicated to ICD-11 reference maps.
- **Step 7 -- Build the publish-time split workflow**:
  - When the private CIEL repo is released, an automated workflow (an "OCL Action") runs:
    - 1. Grabs the export from the private repo release
    - 1. Sends ICD-11 mappings to the mapping repo
    - 1. Sends everything else (concepts, non-ICD-11 mappings, metadata) to the public CIEL release
  - This is the key mechanism: management stays unified in one place, but distribution is split at publish time.
  - **Version coordination:** When the workflow splits a release, all three repos (private CIEL, public CIEL, ICD-11 mapping repo) should receive the same version identifier. This makes it trivial to answer "which ICD-11 map version goes with CIEL v2.5?" The private repo version is the authoritative one; the public and mapping repo versions are derived artifacts tagged with the same identifier.
  - **Guardrails:**
    - Ideally, the public CIEL repo is write-protected so only the publish workflow can import into it, to ensure that we don't inadvertantly leak ICD-11 maps.
    - The workflow must include a validation step: assert that zero ICD-11 map types exist in the public output before importing. Fail loudly if the assertion fails.
    - The workflow should produce a manifest listing what was split, mapping counts per target, and a checksum -- for audit trail and debugging.
- **Step 8 -- Update the MySQL/S3 dump pipeline**: The MySQL dump hosted on AWS S3 must be generated from the **public** CIEL version, not the private one. This ensures the publicly downloadable dump never contains ICD-11 mappings. Note: this matters because we are now providing this export feature -- the distributed artifact must respect licensing.

### Phase 3: Historical Cleanup

- **Step 9 -- Clean historical CIEL versions**: 
  - ICD-11 mappings exist in past public CIEL repo versions that have already been released. These need to be removed. Use the Phase 0 analysis to determine the cutoff point and scope. Approach:
    - 1. **Backup**: Before any destructive operations, export every existing public CIEL version and archive the full set to S3 or equivalent. This is the rollback path -- the rewind/re-import process is irreversible once old versions are deleted, and collection references or expansion snapshots tied to old version IDs may break. The archive is the safety net.
    - 1. **Export**: Grab exports for the CIEL version that we decided to start with (in Phase 0) from that point forward.
    - 1. **Processing**: Unpack each export, remove ICD-11 mapping content entirely.
    - 1. **Repo rewind**: Delete the affected repo versions, roll HEAD back to the last clean version.
    - 1. **Re-import**: Bulk import the cleaned exports one at a time, each producing a new release.
  - Bonus: OCL operations in this phase should be done via the CLI -- this is a goal in itself (validating the CLI for batch operations). Claude + CLI can accelerate the analysis and scripted execution.
  - **Caveat -- two approaches considered:**
    - **Surgical**: Remove only ICD-11 mappings from each version in-place (requires super-admin capability, works across mapping versions; not preferred, because this is a sysadmin maintenance approach)
    - **Full re-import** (preferred, because this ultimately would be a user-facing approach): Export, strip, rewind, re-import. More work but produces a clean, verifiable history.
  - **Breakage risk with full re-import:** Re-imported versions will have different internal IDs than the originals. Any collections, expansions, or saved references that point to specific CIEL version URIs (e.g., `/orgs/CIEL/sources/CIEL/v2023-Q3/`) will break if those version identifiers change. The Phase 0 referential integrity assessment (Step 2) will have quantified this risk. The surgical approach avoids this problem but requires capabilities that may not exist yet.

### Phase 4: Downstream Remediation

- **Step 10 -- Act on leakage assessment**: Using the Phase 0 findings (Step 2), execute the remediation approach decided on:
  - If leakage is minimal: document it, notify affected orgs, accept historical copies as-is
  - If leakage is widespread: build tooling for affected orgs to clean up, or accept and focus on preventing future leakage
  - If deletion is needed: regenerate exports for affected repos
- **Step 11 -- Referential integrity remediation**: After cleanup, address any remaining dangling references. This work is required regardless of whether we use the short-term or long-term approach.

---

## What Must Happen Regardless of Approach

Regardless of our technical approach, the following work must be completed by May 22, 2026:

- Assess the scope and blast radius of ICD-11 map exposure (Phase 0)
- Create new private CIEL-->ICD-11 map repo (Phase 2, Step 6)
- Cleaning ICD-11 mappings from historical public CIEL versions (Phase 3, Step 9)
- Assessing and remediating cascade leakage into user repos (Phase 0, Step 2 + Phase 4, Steps 10-11)
- Updating the MySQL/S3 dump to exclude ICD-11 content (Phase 2, Step 8)

The short-term plan handles these as part of its natural flow rather than as a separate remediation effort.

---

## Remaining Gaps / Questions for the Team

1. ICD-11 mapping repo access model -- Who gets access to the private ICD-11 mapping repo, and how?
2. MySQL/S3 dump pipeline customization -- Filipe has started this work and needs to update to point to the new public repo
3. Surgical vs. full re-import for historical cleanup -- The plan prefers full re-import, but re-imported versions get new internal IDs -- breaking any collections, expansions, or saved references pinned to old CIEL version URIs. The surgical approach (delete ICD-11 mappings in-place) avoids this but requires super-admin capabilities that do not currently exist.
4. Migrating existing CIEL workflows -- some workflows will be impacted by the CIEL + ICD-11 distribution model. Which workflows and how will these be addressed?
5. Cascade/Clone leakage: what's A realistic remediation scope? Cloned ICD-11 mappings in user repos are first-class objects in those repos -- not references. We can't delete them without modifying other people's content. Which approach fits OCL's relationship with its user community? This is as much a policy question as a technical one. Phase 0 will quantify the problem; this question is about the response. Realistically, the options are:
  - **Document and notify**: tell affected orgs the mappings exist in their repos and let them decide
  - **Automated purge with consent**: build a tool, offer it to orgs, let them opt in
  - **Accept it**: historical copies are historical copies; focus on preventing future leakage
6. Timing and sequencing constraints
  - Can Phase 2 (publish workflow) go live before Phase 3 (historical cleanup) is complete? Probably yes -- new releases are clean, old ones are dirty but being worked on. But is there a communication or compliance issue with having a partially-cleaned public repo?
  - Does the CIEL Labs redirect (Step 5) need to happen before or after the publish workflow is ready? If before, there's a gap where new releases go to the private repo but no workflow pushes them to public.
  - Is there a hard deadline for licensing compliance driving the overall timeline?

---

## What Comes Next: Follow-On Work Areas

The short-term plan gets CIEL's ICD-11 mappings into a separately distributable repo and achieves licensing compliance. But once the content is split, each part of the platform needs to evolve to make the split feel seamless to users. This follow-on work falls into four buckets.

### 1. Management Impact (CIEL Labs)

CIEL Labs is the admin interface where Andy manages CIEL content. Today it assumes a single repo contains everything. With mappings split across repos, CIEL Labs needs to:

- Present a unified management view across the primary CIEL source and the ICD-11 mapping source, so that editing a concept's ICD-11 maps doesn't require switching contexts
- Route saves to the correct repo -- concept edits go to the CIEL source, ICD-11 mapping edits go to the mapping source
- Surface which repo a mapping lives in, so managers understand the distribution model

This is Filipe's area to drive. The short-term plan's "management stays in one private repo" approach defers this work, but it becomes necessary if/when management moves to the split model.

### 2. Term Browser Impact (API + UI)

Users browsing CIEL in the term browser need to see ICD-11 mappings alongside all other mappings, even though they're in a separate repo. This requires changes at both the API and UI layers:

- **API: Search augmentation** -- Today, searching CIEL by ICD-11 code boosts results because ICD-11 mappings are indexed alongside concepts. With mappings in a separate source, the search index needs to include mappings from associated map sources. The underlying mechanism (`get_unidirectional_mappings()` in oclapi2) currently filters to same-source only.
- **API: Cascade** -- Cascading from a CIEL concept needs to traverse into the ICD-11 mapping source to find related mappings. The source-based cascade currently limits concept resolution to the same source.
- **UI: Scope and filtering** -- oclweb3 already has a Repo/Namespace/All scope toggle for mappings. This needs to be extended so that "repo" scope can include declared map sources (not just same-source mappings), and users can filter to specific map sources rather than seeing all-or-nothing at the namespace level.
- **UI: Provenance** -- When ICD-11 mappings appear alongside native CIEL mappings, the UI should indicate which repo they come from.

### 3. Mapper Impact

The mapper has two distinct scenarios affected by the split:

**Scenario A: Matching to CIEL as the target, with ICD-11 maps in a separate repo.** When a user is mapping their content to CIEL concepts, the match algorithms use CIEL's mappings to augment candidate scoring. If ICD-11 maps are no longer in the CIEL source, the matcher needs to know to also consult the ICD-11 mapping repo. This affects the match API and the mapper's algorithm configuration UI.

**Scenario B: Matching to ICD-11 (or another non-CIEL target) using CIEL as a bridge.** Bridge terminology matching works by finding a path through an intermediary terminology. Today, CIEL can serve as a bridge because it contains ICD-11 maps in the same repo. With the split, the bridge matching logic needs to follow the mapping relationship across repos -- look up the input concept in CIEL, find its ICD-11 mapping in the separate mapping repo, and use that to match against the ICD-11 target. The mapper UI would need to support selecting both a bridge source and its associated map source repos.

In both scenarios, the results display should show provenance -- which repo contributed the mapping that led to a match.

### 4. Access Impact

The ICD-11 mapping repo introduces a new access control dimension:

- **Visibility rules** -- Who can see the ICD-11 mapping repo and its contents? This is tied to ICD-11 licensing. The repo is private, but how is access granted?
- **Cascading access** -- If a user has access to public CIEL but not the ICD-11 mapping repo, search and cascade should gracefully degrade (return results without ICD-11 augmentation, not error). If they do have access, the augmentation should be automatic.
- **Access provisioning** -- Is access manual (admin grants per-org/per-user), self-service (user accepts WHO terms and gets access), or token-based? Does OCL need to track licensing acceptance?
- **Precedent for other private map sources** -- The access model chosen here becomes the template for any future private/premium mapping distributions. Design it with that in mind.

