# OCLv3 Knowledge Base: Sections 1 & 2

---

## Section 1: Executive Summary

### 1.1 What Is OCLv3 / TermBrowser v3

OCLv3 -- referred to in project tracking as "TermBrowser v3" or "TBv3" -- is the next-generation web interface for the Open Concept Lab (OCL) platform. It replaces the existing TermBrowser v2 (oclweb2) with a ground-up redesign (oclweb3) that delivers a modern user experience for browsing, authoring, and managing health terminology content. The effort spans three codebases: the OCL API (oclapi2), the new web frontend (oclweb3), and the OCL Mapper (oclmap), with supporting work in ocl-docs and infrastructure.

The v3 initiative is not simply a UI refresh. It introduces foundational platform capabilities that were absent or incomplete in v2: a canonical URL registry for resolving FHIR-style references (#1696), a typed repository model that distinguishes CodeSystems from ValueSets from Dictionaries (#1695), a roles-and-permissions framework (#1812), API throttling (#2121), and a redesigned authentication flow built on Keycloak SSO (#1702, #2145). These "v3-foundation" subsystems reshape how OCL organizes, governs, and exposes terminology content.

### 1.2 Key Stakeholders and Contributors

The contributor footprint across the 208 classified issues reveals a tight core team with specialized roles:

| Contributor | Primary Focus | Notable Involvement |
|---|---|---|
| **@paynejd** (Jonathan Payne) | Product owner, architecture, API design | Canonical URL registry design (#1696, #1732), repo type specification (#1687, #1695), diffs/checksums strategy (#1690), throttling requirements (#2121) |
| **@snyaggarwal** (Sunny Aggarwal) | API & frontend engineering | URL registry implementation (#1732, #1816), $resolveReference (#1747), Keycloak SSO (#1702), throttling implementation (#2121), bulk of oclweb3 feature work |
| **@jamlung-ri** (James Amlung) | UX research, user stories, QA | User stories for repo type (#1695), diffs (#1690), canonical URL registry; QA testing of SSO flows (#1702); design input on search, hierarchy, org views |
| **@paulsonder** (Paul Sonder) | UI/UX design, frontend design specs | Assigned to nearly all Design-labeled issues; search UI (#1694), concept detail views, mapping views, organization and user profile designs |
| **@bmamlin** (Burke Mamlin) | Clinical domain expertise, FHIR alignment | URL registry review (#1732), global registry population strategy (#1743) |
| **@rkorytkowski** (Rafal Korytkowski) | Infrastructure, legacy API knowledge | Global registry population (#1743) |

The pattern across issues is consistent: @paynejd defines requirements and architectural decisions, @snyaggarwal implements them on both API and web sides, @jamlung-ri translates requirements into user stories and performs QA, and @paulsonder produces design specifications. @bmamlin and @rkorytkowski serve as domain and infrastructure advisors on select foundational tickets.

### 1.3 Timeline and Milestones

**Origins (pre-2022).** The earliest issues in the TBv3-classified set date to 2018 (#12, #13), but these are legacy TermBrowser enhancement requests that were never part of a v3 initiative. The v3 label begins appearing around mid-2022.

**Foundation phase (Oct 2022 -- Nov 2023).** The first explicitly v3-scoped issue is #1371 (Canonical URL Restrictions, Round 1), created October 2022. Through 2023, the team defined the architectural foundations: canonical URL handling, repo types, diffs/checksums, and the initial design system. The v3 project board was established, and the "TermBrowser v3 MVP" milestone was created to track the path to a production-ready replacement for v2.

**Build phase (Nov 2023 -- mid 2024).** November 2023 marks a burst of epic creation: #1687 (repo_type), #1690 (diffs/checksums), #1694 (search UI), #1695 (repo type epic), #1696 (canonical URL registry), and the dashboard/registration epic #1688. The URL registry API was specified (#1732) in January 2024 and deployed to QA by January 17, 2024. By February 2024, URL registries were integrated into $resolveReference and deployed behind a feature toggle. The SSO/Keycloak integration (#1702) was completed and deployed to QA by January 2024.

**Feature expansion (mid 2024 -- late 2024).** From mid-2024 onward, the focus shifted to consumer-facing features: repository views, concept details, organization profiles, user profiles, and search experiences. A large batch of "CTA" (call-to-action) authoring tickets was created in November 2024 (#1977--#2031), covering CRUD operations for repositories, concepts, mappings, expansions, references, and organizations.

**Hardening and launch preparation (early 2025 -- present).** In 2025, work has concentrated on API throttling (#2121, created Feb 2025), authentication improvements (#2132, #2138, #2145), and QA testing of authoring workflows. Many CTA tickets are now in "Testing (QA)" status. The Repo Type epic (#1695) was closed on March 18, 2026, indicating that the foundational repo type work is considered complete.

### 1.4 Current State Overview

Based on the 208 classified issues and the 169-item project board:

**Disposition breakdown (from classification):**

- **keep**: the majority of issues are active or relevant to ongoing v3 work
- **close-stale / close-outdated / close-superseded**: a significant cohort of pre-v3-era issues recommended for cleanup
- **review**: issues requiring further triage before a keep/close decision

**Project board status (for the ~110+ items on the v3 board):**

- **Done / Closed**: Dashboard and registration (#1688 and children), SSO Keycloak flow (#1702), URL registry API (#1732), URL registry in TB (#1742), $resolveReference integration (#1747, #1788), ES caching for registry (#1816), Repo Type epic (#1695), multiple user/org profile and search results tickets
- **Testing (QA)**: API throttling (#2121), SSO URL redirects (#2145), concept edit (#1991), repository create/edit/version/release, mapping CRUD, org delete, repo comparison (#1853), concept history (#2290), namespace mappings (#1972), importer UI (#2161)
- **Todo**: Repository templates (Source #2025, Collection #2026, ValueSet #2027, CodeSystem #2028, ConceptMap #2029), repo header (#1871), repo version selector (#1872), repo overview (#1951), concept add-mapping (#1995)
- **Backlog / In Development**: repo_type API attribute (#1687), repo_type in TBv3 (#1727), chip views (#1776), references list (#1949), add references (#2005)
- **Open / No Status**: Canonical URL restrictions (#1371), global registry population (#1743), registry permissions (#1744), namespace selector (#1821), add canonical URL UI (#1827), roles/permissions (#1812), diffs/checksums (#1690), forced sign-in/out UX (#2132), django-auth sign-in (#2138), and many consumer/authoring epics

**Key blockers and gaps:**

1. The **Canonical URL Registry** epic (#1696) has API-side plumbing complete but critical operational and UX pieces remain open: populating the global registry (#1743), defining permissions (#1744), UI for adding URLs (#1827), and the namespace selector (#1821).
2. **Roles and Permissions** (#1812) remains entirely in requirements-gathering stage with no child tickets and no code activity -- it is a prerequisite for multi-tenant governance.
3. **Diffs and Checksums** (#1690) has partial API implementation (source compare, duplicate prevention) but the changelog, squash, collection diff, and TB integration components are unbuilt.
4. **repo_type** API attribute (#1687) is still open despite the parent epic (#1695) being closed -- the migration of existing data and the TB-side implementation (#1727) remain in backlog.
5. **Auth improvements** (#2132, #2138) are newly filed (March 2025) and address UX gaps in session management that affect all OCL web apps.

---

## Section 2: Architecture & Foundation

The "v3-foundation" label identifies a set of cross-cutting subsystems that underpin the TermBrowser v3 experience. These are not features visible to end users in isolation; they are platform capabilities that other features depend on. This section synthesizes the design decisions, implementation status, and open questions for each.

### 2.1 Canonical URL Registry

**Epic:** #1696 | **Children:** #1371, #1732, #1742, #1743, #1744, #1747, #1788, #1816, #1821, #1827

#### What It Is and Why It Matters

In FHIR and broader health terminology standards, resources are identified by canonical URLs -- persistent, globally unique URIs like `http://hl7.org/fhir/ValueSet/example`. OCL's v2 platform had no mechanism to centrally track or resolve these URLs. Canonical URLs on repositories were optional, not enforced as unique, and there was no global registry. This meant that the `$resolveReference` operation -- which resolves a canonical URL to a specific OCL repository -- could produce ambiguous results when multiple repos in different namespaces shared the same canonical URL (#1371).

The Canonical URL Registry introduces a first-class API resource (`/url-registry/`) that maps canonical URLs to OCL repositories, enabling unambiguous resolution across the platform. This is critical for FHIR compliance, for mapping workflows that reference external code systems by canonical URL, and for the broader goal of making OCL a reliable canonical-aware terminology server.

#### What Was Built

**URL Registry API resource (#1732 -- CLOSED).** Specified in January 2024 and deployed to QA by January 17, 2024. The resource model includes:
- `url` (required canonical URL), `namespace` (optional, e.g. `/orgs/CIEL/`), `name`, `extras`, and audit fields
- CRUD endpoints at both global (`/url-registry/`) and namespace-scoped (`/:ownerType/:owner/url-registry/`) levels
- A `$lookup` operation for finding a registry entry by URL

Design decisions from the discussion (#1732 comments):
- The `owner_url` field was added to all entries, with global entries having `owner_url: "/"` and null `owner`/`owner_type` -- this addressed the question of how to represent entries not owned by a specific namespace.
- The `type` field value was changed to `"URLRegistryEntry"` per @paynejd's feedback.
- `$lookup` was scoped to a single registry (global or namespace-specific), with the cross-registry resolution logic delegated to `$resolveReference`.

**$resolveReference integration (#1747 -- CLOSED).** By March 2024, 100% of API logic for finding a repository was routed through `$resolveReference`, including mapping resolution. The key design decision was to incorporate canonical URL resolution directly into the existing `$resolveReference` operation rather than creating a separate `$resolveCanonical` operation (#1732 comments, @paynejd, Jan 19 2024). This meant that all existing consumers of `$resolveReference` automatically gained canonical-aware resolution without API changes.

The resolution order within a namespace follows a three-step lookup: (1) owner-specific registry, (2) owner's repos by canonical URL, (3) global registry.

**Registry entry in $resolveReference response (#1788 -- CLOSED).** When a registry entry is used for resolution, the entry is now included directly in the response body (not the HTTP header), because `$resolveReference` can process multiple expressions in a single request (#1788 comments, @snyaggarwal, Mar 7 2024).

**ES caching for registry (#1816 -- CLOSED).** Registry entries now cache their resolved repository in Elasticsearch, enabling search by resolved repo ID and updating automatically when repos are created/updated with canonical URLs. Deployed to all environments by March 28, 2024 (#1816 comments). An open technical question was raised about `$lookup` vs. `$resolve` semantics -- `$lookup` does not handle the `|` version syntax while `$resolve` does (#1816 comments, @snyaggarwal, Mar 22 2024).

**Canonical URL registries in TermBrowser (#1742 -- CLOSED).** The registry browsing UI was implemented in TBv3 and deployed on QA with refinements including an "Owner chip" to replace the target owner column and a combined repo ID/type display (#1696 comments, @paynejd, Apr 2 2024).

**Mapping resolution switchover (#1747 -- CLOSED).** Mappings were the last API subsystem to switch to `$resolveReference` for repo resolution. The approach passes the source URL through `$resolveReference` with `version='HEAD'` to resolve to the HEAD version (#1747 comments, @snyaggarwal, Jan 31 2024).

#### What Is Pending

**Canonical URL restrictions (#1371 -- OPEN).** The foundational policy questions remain unresolved:
- Should canonical URLs be auto-generated/always present?
- Should they be unique across the system?
- Should updates be restricted (changing a canonical URL could break references across repo versions)?
- What happens when a repo with multiple released versions changes its canonical URL -- does the change apply retroactively?

This is labeled "discussion-needed" and has been open since October 2022. It is the policy backbone that the registry implementation needs to fully operationalize.

**Populating the global registry (#1743 -- OPEN).** The operational question of how to seed and maintain the global registry across environments remains open. The discussion (#1743 comments, @paynejd, Jan 30 2024) surfaces two competing philosophies:
1. **Curated registry**: Only canonical URLs that owners explicitly want discoverable outside their org.
2. **Automatic registry**: Any public repo's canonical URL is automatically registered, with community curation for conflicts.

The current thinking favors minimizing manual curation: public repos with new canonical URLs would auto-register, while private repos would not. Key unresolved edge cases include: what happens when a registered repo is deleted, how to handle conflict resolution, and how to support local OCL implementations.

**Registry permissions (#1744 -- OPEN).** No body or comments -- this is a placeholder for designing who can read, write, and manage registry entries, and how permissions interact with `$resolveReference` behavior. Created January 2024, no progress.

**Namespace selector UI (#1821 -- OPEN).** The TB-side tool for selecting which namespace to query when browsing/testing canonical URLs. Assigned to @paulsonder, no implementation yet.

**Add Canonical URL UI (#1827 -- OPEN).** The basic UI for creating new registry entries in TBv3. No implementation yet.

#### Open Design Questions

- How should `$lookup` and `$resolve` semantics be harmonized, particularly around version syntax (`|`) support? (#1816)
- Should the global registry support batch loading for initial population? (#1732, noted as "out of scope for MVP")
- What is the governance model for the global registry -- first-come-first-served with community escalation, or admin-curated? (#1743)
- How do feature toggles for breaking `$resolveReference` changes get managed across environments? (#1732 comments)

---

### 2.2 Repo Type System

**Epic:** #1695 (CLOSED) | **Children:** #1686 (CLOSED), #1687 (OPEN), #1701 (CLOSED), #1727 (OPEN)

#### What It Is and Why It Matters

OCL's data model historically had `source_type` and `collection_type` as freeform descriptive attributes (e.g., "Dictionary", "Code List", "Interface Terminology"). These did not carry behavioral implications -- a source typed as "CodeSystem" behaved identically to one typed as "External." The Repo Type system introduces a new coded `repo_type` attribute that determines what resources and behaviors are available for a given repository. This is the mechanism that allows OCL to treat a source configured as a FHIR CodeSystem differently from one configured as a plain dictionary, and to present repo-type-specific UI templates, validation rules, and workflows.

The system also introduced a unified `/repos/` endpoint (#1686 -- CLOSED) that searches across both sources and collections, replacing the need for clients to query two separate endpoints.

#### What Was Built

**Unified repos endpoint (#1686 -- CLOSED).** A global endpoint for searching across repository types, implemented with Elasticsearch support.

**Canonical URL filter (#1701 -- CLOSED).** A `canonical_url` filter parameter for repos, sources, and collections endpoints.

**Repo Type epic closure (#1695 -- CLOSED, March 2026).** The parent epic is marked complete. The user stories (#1695 comments, @jamlung-ri, Nov 2023) envisioned: accessing repositories by type (projects, dictionaries, etc.), creating repos pre-configured with type-specific schemas, and eventually exploring public-facing repositories from other organizations.

**Repo type filter in repos (#2252 -- CLOSED).** A filterable facet for repo_type in the repos endpoint, deployed with ES index support.

#### What Is Pending

**repo_type API attribute (#1687 -- OPEN, Backlog).** The core attribute implementation remains open. The specification defines supported repo types:

| Repo Type | Sources | Collections |
|---|---|---|
| Source | Yes | No |
| Collection | No | Yes |
| CodeSystem | Yes | TBD |
| ValueSet | No | Yes |
| ConceptMap | Yes | TBD |
| Dictionary | No (?) | Yes |

A migration mapping from existing `source_type`/`collection_type` values to `repo_type` is defined in the issue body. Open questions from @snyaggarwal's review (Nov 15, 2023) remain unanswered:
- How is `repo_type` updated -- via API, TermBrowser, or both?
- Does it need to appear in TB headers/forms?
- Should new repos accept `repo_type` in the API, default based on the mapping table, or both?
- Do bulk import and CSV converters need changes?
- Is `repo_type` filterable (answered: yes, per #2252)?

Additional discussion on FHIR-specific repo types was flagged by @jamlung-ri (Dec 5, 2023) but not elaborated.

**repo_type in TBv3 (#1727 -- OPEN, Backlog).** The frontend implementation of repo_type display and selection. Depends on #1687 being completed.

#### Key Design Decision

The decision to keep `source_type`/`collection_type` as purely descriptive (optional) fields while introducing `repo_type` as the behavioral driver avoids a breaking migration. Existing content retains its descriptive type; the new `repo_type` is populated via a deterministic mapping from existing values but carries actual behavioral weight going forward.

---

### 2.3 Roles & Permissions

**Epic:** #1812 (OPEN)

#### What It Is and Why It Matters

OCL v2 has a simple two-tier permission model: organization members can be either members or admins, and repository-level permissions are inherited from the owning org/user. The v3 roles-and-permissions initiative (#1812) aims to implement a more granular system that can support:
- Role-based access to specific repositories within an organization
- Differentiated permissions for content authoring vs. administrative actions
- Governance workflows (e.g., change requests, approval chains) that depend on knowing what a user can and cannot do

The requirements document is being developed externally (Google Doc linked in #1812).

#### Current State

This epic is in the earliest stage of all v3-foundation items. It has:
- No child tickets
- No comments
- No assignees
- No milestone

However, it does show oclapi2 code activity per the classification data, suggesting preliminary investigation or scaffolding has occurred. The issue was created March 15, 2024, and last updated February 21, 2025, indicating periodic review but no forward movement on design or implementation.

#### Why It Is Blocked

The external requirements document has not yet been translated into actionable tickets. Until the permission model is defined (which roles exist, what each role can do at the org/repo/resource level, how roles are assigned and inherited), implementation cannot begin. This is a dependency for several other features: registry permissions (#1744), authoring workflows, change request management (#1622), and the "walled garden" / trusted sources concept (#1706).

---

### 2.4 API Throttling

**Epic:** #2121 (OPEN, Testing on QA)

#### What It Is and Why It Matters

API throttling limits the rate at which clients can call OCL API endpoints. Without throttling, the platform is vulnerable to both accidental abuse (runaway scripts, poorly-designed integrations) and intentional denial-of-service. As OCL prepares for broader public use with TBv3, throttling becomes essential for service reliability.

#### What Was Built

The throttling implementation was designed based on analysis of two weeks of production and staging logs (#2121 comments, @snyaggarwal, Mar 13 2025). The initially proposed tiers were:

1. **Guest**: 400 requests/minute, 10,000 requests/day (tracked by IP)
2. **Lite (default)**: 500 requests/minute, 20,000 requests/day
3. **Premium**: 1,000 requests/minute, 50,000 requests/day

The final implementation (per @paynejd's direction, Mar 17 2025) simplified to two tiers:

1. **Guest** (anonymous): 400/min, 10k/day, tracked by IP address
2. **Standard** (authenticated): 500/min, 20k/day

The premium tier was deferred. The implementation was deployed to QA by March 18, 2025.

#### Key Design Decisions

- **Data-driven limits**: Thresholds were set based on actual usage patterns, not arbitrary values.
- **Two-tier simplification**: Rather than launching with three tiers that require a mechanism to assign users to premium status, the team shipped with guest/standard and deferred premium to a later phase -- likely to be revisited when #1812 (roles/permissions) provides the infrastructure for tiered user classification.
- **IP-based tracking for anonymous users**: A pragmatic choice that works for most scenarios but may be inadequate for shared IP environments (NAT, VPN).

#### What Is Pending

- Production deployment (currently QA only)
- Premium tier and custom rate limits for specific API consumers
- Integration with the roles/permissions system (#1812) for programmatic tier assignment
- Rate limit response headers and client-facing documentation

---

### 2.5 Auth & SSO

**Issues:** #1702 (CLOSED), #2132 (OPEN), #2138 (OPEN), #2145 (OPEN, Testing on QA)

#### What It Is and Why It Matters

Authentication is the gateway to all non-public OCL functionality. The v3 auth strategy centers on Keycloak as the SSO provider, replacing the Django-native authentication that powered v2. This shift enables standardized OAuth2/OIDC flows, custom branding of login/registration screens, and a single sign-on experience across OCL web applications (TBv3, OCL Mapper, potentially v2 during the transition period).

#### What Was Built

**Keycloak SSO integration (#1702 -- CLOSED).** The registration, sign-in, and forgot-password flows were implemented with a Keycloak theme and deployed to QA by January 2024. QA testing by @jamlung-ri (Dec 5, 2023) confirmed that organization and location fields were included in registration, and account verification and password reset emails functioned correctly. The issue was closed January 11, 2024.

**SSO URL redirects (#2145 -- OPEN, Testing on QA).** Simple URLs (`/#/signin`, `/#/signup`) that redirect to the actual SSO provider. Implemented for both v2 and v3, deployed to QA, staging, and production (for v2) as of March 27, 2025. This smooths the user experience by providing predictable entry points regardless of the underlying SSO configuration.

#### What Is Pending

**Forced sign-in/sign-out UX (#2132 -- OPEN).** The current behavior when a session expires or a forced sign-out occurs is described as having a "poor user experience" that "can often result in lost work." This issue was filed March 19, 2025, with no assignees, no comments, and no design work. It applies to all OCL web applications, not just TBv3.

**Django-auth sign-in form (#2138 -- OPEN).** For environments or deployments that do not use Keycloak (e.g., local development, on-premise installations), a Django-native sign-in form is needed for oclweb3 and oclmap. Assigned to @snyaggarwal, filed March 24, 2025, no implementation yet.

#### Key Design Decisions

- **Keycloak as the canonical auth provider**: This aligns OCL with industry-standard identity management and enables future features like social login, MFA, and federated identity.
- **Dual-path auth support**: The existence of #2138 indicates that Keycloak is not a hard requirement -- the platform must also support Django-native auth for flexibility. This dual-path approach adds complexity but is necessary for OCL's diverse deployment scenarios (hosted SaaS vs. on-premise).
- **Progressive deployment**: SSO URL redirects (#2145) were deployed to v2 production first, demonstrating a pattern of shipping auth changes to the stable environment before v3.

#### Open Questions

- What should the session timeout behavior be, and how should in-progress work be preserved when a session expires? (#2132)
- Should django-auth and Keycloak auth be runtime-switchable, or deployment-time configured? (#2138)
- How does auth interact with API throttling tiers (#2121) -- are authenticated users identified via their SSO token for rate limiting?

---

### 2.6 Diffs & Checksums

**Epic:** #1690 (OPEN)

#### What It Is and Why It Matters

The diffs and checksums subsystem provides the primitives for answering the question: "What changed?" It spans several capabilities:

1. **Preventing duplicate resource versions** during imports by using checksums to detect when an import would create a version identical to the existing one.
2. **Comparing repository versions** to produce diffs showing what was added, removed, or changed between releases.
3. **Generating changelogs** automatically from those diffs.
4. **Squashing** redundant resource versions that accumulated before duplicate prevention was implemented.
5. **Resource-level comparison** that leverages checksums to highlight meaningful changes between two versions of a concept.

For users managing large terminologies like CIEL, this is essential. Without it, every import creates new resource versions regardless of whether anything changed, making version history meaningless and making it impossible to quickly identify what is different between releases (#1690 comments, @jamlung-ri, Nov 20 2023).

#### What Was Built

Per @paynejd's detailed status update (Feb 13, 2024):

**Duplicate prevention**: Implemented for both concepts and mappings, deployed behind a toggle (enabled on QA). The HTTP response code for a duplicate import that does not create a new version was finalized. Validation with bulk imports on QA was completed.

**Local repo diff**: Checksums are available in exports, and a checksum operation is available in the operations panel. Next steps (unfinished) include creating JavaScript/Python methods for local checksum calculation.

**Repo diff API**: Implemented at `/sources/compare/` for concepts (including hierarchy as a concept attribute). Mappings were subsequently incorporated. Still pending: diffing repo metadata, collection version diff, and a unified comparison view.

**User stories for v3** (#1690 comments, @jamlung-ri, Nov 20 2023):
- See a summary of changes between CIEL versions (X retired, X new concepts, X new mappings)
- Clearly identify when a concept changed across several releases
- See an itemized list of changed concepts between two versions
- Dive into exact changes for a concept that changed since last check-in

An additional user story from @paynejd (Mar 8, 2024): after a bulk import, fetch checksums for a repo version or specific resources to verify import success without waiting for a full export.

#### What Is Pending

The majority of the checksum package remains unbuilt:

- **Changelog generation** (#1814, referenced but not in the architecture dataset): Define requirements and implement MVP for generating a changelog between two repo versions.
- **Squash operation**: No research or requirements defined yet. The question "How deep of a hole are we in?" regarding redundant versions remains unanswered.
- **Collection version diff**: Not implemented.
- **Repo metadata diff**: No approach decided.
- **Checksum-enabled resource comparison in TBv3**: Explicitly deferred ("not planning to do this in v2"), not yet designed for v3.
- **Generic `$compare` operation**: For diffing arbitrary sets of resources (not just repo versions). Not specified.
- **Local checksum calculation**: JavaScript/Python methods not yet created.

#### Key Design Decisions

- **Standard vs. smart checksums**: The system distinguishes between "standard" checksums (exact content comparison) and "smart" checksums (semantically meaningful comparison that ignores irrelevant differences). Both are needed: standard for deduplication, smart for human-facing diffs.
- **CIEL as the reference use case**: The entire design is grounded in CIEL's workflow -- large imports, version-over-version comparison, identifying clinically meaningful changes. This ensures the implementation addresses real-world scale but may need adaptation for other use cases.
- **Toggle-based deployment**: Duplicate prevention behavior was deployed behind a feature toggle, enabling validation on QA without risking production data integrity. This pattern -- deploy behind toggle, validate, then enable -- appears repeatedly across v3-foundation work.

#### Open Questions

- What constitutes a "meaningful" change for smart checksums across different resource types?
- How should the `$compare` operation handle asymmetric comparisons (e.g., comparing a repo version against an arbitrary list of concepts from an import)?
- What is the expected performance envelope for repo diffs on large terminologies like CIEL (millions of resources)?
- How will the changelog capability integrate into the TBv3 release workflow?

---

## Cross-Cutting Observations

### Dependency Chain

Several foundation subsystems have implicit dependencies that create a critical path:

1. **Roles & Permissions (#1812)** is a prerequisite for registry permissions (#1744), API throttling tiers (premium), and authoring governance workflows.
2. **Canonical URL restrictions (#1371)** must be resolved before the global registry (#1743) can be reliably populated.
3. **repo_type API implementation (#1687)** must be completed before the TBv3 repo_type UI (#1727) and the repository templates (#2025--#2029) can ship.
4. **Diffs & checksums (#1690)** depend on the resource comparison tool design, which in turn depends on the concept detail view (#1620, #1621) being finalized.

### Pattern: API-First, Toggle-Gated

A consistent development pattern emerges across all foundation subsystems: the API capability is built first, deployed to QA behind a feature toggle, validated through iterative feedback between @paynejd and @snyaggarwal, and then the TBv3 frontend is connected. This pattern is visible in the URL registry (#1732 -> #1742), $resolveReference (#1747), and throttling (#2121). It has the advantage of decoupling backend readiness from frontend design timelines, but it means several API capabilities deployed months ago still lack their TBv3 exposure.

### Maturity Gradient

| Subsystem | API | TBv3 UI | Policy/Governance |
|---|---|---|---|
| Canonical URL Registry | Mostly complete | Partial (browse works; add/namespace pending) | Open (restrictions, permissions, population strategy) |
| Repo Type | Partially complete (endpoint yes, attribute pending) | Not started | Defined but unimplemented |
| Roles & Permissions | Not started | Not started | Requirements in progress |
| API Throttling | Complete (2 tiers) | N/A (backend only) | Minimal (2 tiers, no premium) |
| Auth & SSO | Complete (Keycloak) | Mostly complete | Open (session UX, dual-path) |
| Diffs & Checksums | Partial (source compare, dedup) | Not started | Design defined, mostly unbuilt |

This gradient shows that the v3 foundation is strongest on the auth/SSO and canonical URL registry fronts, moderately advanced on throttling and repo type, and earliest-stage on roles/permissions and diffs/checksums. The common gap across all subsystems is the governance/policy layer -- the rules about who can do what, under what conditions, with what constraints.
