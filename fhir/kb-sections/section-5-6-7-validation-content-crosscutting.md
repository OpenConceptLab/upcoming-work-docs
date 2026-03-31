## Section 5: Validation & Testing (7 issues)

### 5.1 Repo Configuration and Content Validation

**Epic:** #1726

#### What It Is and Why It Matters

OCL repositories need configurable lookup values, including FHIR properties and filters, to ensure that terminology content conforms to expected schemas. This epic covers the ability to define and enforce repo-level configuration -- for example, specifying which FHIR CodeSystem properties and filters are valid for a given source. Without this, content authors have no guardrails when editing terminology in the TermBrowser, increasing the risk of producing FHIR-noncompliant resources.

This is closely related to the operations-layer work on exposing `source.properties` and `source.filters` through FHIR CodeSystem (#2262), but the focus here is on the validation side: ensuring that content written into a repo actually matches the declared property and filter definitions.

#### What Was Built

Nothing has been implemented yet. The epic has no body text and no comments.

#### What Is Pending

- **Repo Configuration and Content Validation (#1726 -- OPEN).** Created 2024-01-04 with no assignee. No child tickets, no body text, and no comments as of the last update on 2024-01-23. This is a placeholder epic that needs decomposition into actionable tasks.

#### Open Design Questions

- What specific FHIR properties and filters should be configurable at the repo level? (#1726)
- How does this interact with the repo type system (#1695) -- should property/filter configurations be driven by repo type templates?
- Should validation be enforced at write time, at release time, or both?

---

### 5.2 Publishing Terminology to the FHIR Ecosystem

**Epic:** #1915

#### What It Is and Why It Matters

The HL7 community publishes a set of requirements (documented at [Publishing terminology to the FHIR Ecosystem](https://confluence.hl7.org/display/FHIR/Publishing+terminology+to+the+FHIR+Ecosystem)) that go beyond the base FHIR Terminology Services specification. These requirements make terminology available for FHIR validation and IG (Implementation Guide) publishing. For OCL to serve as a credible terminology server in the broader FHIR ecosystem -- particularly for workflows like direct IG building from OCL -- it must meet these additional conformance requirements.

The body of this issue references @rkorytkowski to define actual development tasks, but no child tasks have been created yet. Related work has been validated manually: @jamlung-ri demonstrated that OCL-hosted CodeSystems can be used directly in the FHIR IG Publisher after the CodeSystem fixes in #1815 were deployed to QA (May 2024).

#### What Was Built

No direct implementation under this epic. However, the FHIR CodeSystem Fixes (#1815) resolved several issues that were blocking IG Publisher compatibility, including:
- Null fields being emitted in FHIR JSON (FHIR spec requires omission)
- Concept property `value` needing to be `valueString`
- Missing `content` field (e.g., `"content": "complete"`)
- Incorrect casing on property type (`"coding"` vs. `"Coding"`)
- Inactive code count inaccuracy

These were validated by @jamlung-ri on 2024-05-03 in QA and confirmed working with the FHIR IG Publisher.

#### What Is Pending

- **Publishing Terminology to the FHIR Ecosystem (#1915 -- OPEN).** Assigned to @rkorytkowski. Created 2024-08-09, last updated 2025-01-30. No child tasks have been defined yet.

#### Open Design Questions

- What is the full gap between OCL's current FHIR output and the HL7 publishing requirements? (#1915)
- Can OCL serve as a registered terminology server for the FHIR IG Publisher, or does it need a packaging/proxy layer?

---

### 5.3 Automated FHIR Testing Pipeline

**Epic:** #2046

#### What It Is and Why It Matters

As OCL's FHIR surface area grows -- with more resource types, operations, and integration points -- manual testing becomes unsustainable. An automated testing pipeline would continuously validate that OCL's FHIR endpoints produce spec-compliant responses, that operations like `$expand`, `$lookup`, and `$validate-code` return correct results, and that regressions are caught before deployment.

This epic is part of the OCL FHIR Core 2025 initiative (#2253) and is assigned to @rkorytkowski and @jamlung-ri. It has no body text or child tasks.

#### What Was Built

Nothing has been implemented yet.

#### What Is Pending

- **Automated FHIR Testing Pipeline (#2046 -- OPEN).** Created 2025-01-30. No body, no children, no comments. Needs decomposition into test categories (unit, integration, conformance), tooling decisions (e.g., Touchstone, custom test harness), and a phased rollout plan.

#### Open Design Questions

- What test framework should be used -- Touchstone, a custom harness, or both? (#2046)
- What is the minimum viable test coverage for launch?
- Should the pipeline run on every PR, on a schedule, or both?

---

### 5.4 CRMI Compliance

**Epic:** #2049

#### What It Is and Why It Matters

CRMI (Canonical Resource Management Infrastructure) is an HL7 FHIR IG that defines patterns for managing canonical resources (CodeSystems, ValueSets, ConceptMaps, etc.) including versioning, status management, and lifecycle operations. Compliance with CRMI would position OCL as a standards-conformant canonical resource management platform, which is important for adoption by organizations that require CRMI-compliant servers.

#### What Was Built

No implementation details are recorded. The epic was closed on 2026-03-24.

- **CRMI Compliance (#2049 -- CLOSED).** Closed 2026-03-24. No body, no comments, no child tickets. It is unclear whether CRMI compliance was achieved, deferred, or determined to be out of scope. The closure may have been part of a bulk triage on 2026-03-24 (the same date that #2050 and #2048 were also closed).

#### What Is Pending

Nothing formally pending, but the lack of any recorded work or rationale for closure suggests this may need to be revisited.

#### Open Design Questions

- Was CRMI compliance achieved, deferred, or descoped? (#2049)
- If deferred, what is the timeline and what gaps remain?

---

### 5.5 Batch Validation

**Epic:** #2050

#### What It Is and Why It Matters

Batch validation would allow users to submit multiple codes or resources for validation in a single request, rather than validating one at a time. This is particularly important for bulk content loading workflows (e.g., NPM imports) where thousands of concepts need to be checked against a CodeSystem or ValueSet. Without batch validation, post-import quality assurance requires many individual API calls.

#### What Was Built

No implementation details are recorded. The epic was closed on 2026-03-24.

- **Batch Validation (#2050 -- CLOSED).** Closed 2026-03-24. No body, no comments, no child tickets. Same bulk closure date as #2049 and #2048.

#### What Is Pending

Nothing formally pending.

#### Open Design Questions

- Was this implemented, deferred, or descoped? (#2050)
- If deferred, should it be combined with the Automated FHIR Resource Validation epic (#2053)?

---

### 5.6 Automated FHIR Resource Validation

**Epic:** #2053

#### What It Is and Why It Matters

This epic covers the automated validation of FHIR resources as they are created or imported into OCL. Rather than relying on manual review or post-hoc comparison, resources would be validated against the FHIR specification (and potentially CRMI or other profiles) at write time. This is distinct from the testing pipeline (#2046), which validates OCL's FHIR endpoints; this epic validates the content flowing through those endpoints.

The related issue #1761 (Add FHIR XML support) explored deploying the HL7 FHIR Validator as a microservice, which could serve as the validation backend for this epic.

#### What Was Built

Nothing has been implemented yet.

#### What Is Pending

- **Automated FHIR Resource Validation (#2053 -- OPEN).** Created 2025-01-30. No body, no assignee, no children, no comments.

#### Open Design Questions

- Should validation use the HL7 FHIR Validator service (as explored in #1761) or a lighter-weight approach? (#2053)
- At what points in the lifecycle should validation occur -- on import, on edit, on release, or all three?

---

### 5.7 FHIR XML Support

**Epic:** #1761

#### What It Is and Why It Matters

FHIR specifies two primary serialization formats: JSON and XML. OCL currently only supports JSON. Some FHIR clients and workflows (particularly in the European healthcare ecosystem) require XML support. Issue #1761 explores adding XML support by deploying the HL7 FHIR Validator as a microservice, which could handle both XML-to-JSON conversion and FHIR validation in one service.

@rkorytkowski evaluated two options in the issue body: (1) deploy the [FHIR Validator Wrapper](https://github.com/hapifhir/org.hl7.fhir.validator-wrapper), or (2) build a REST-only wrapper around [org.hl7.fhir.core](https://github.com/hapifhir/org.hl7.fhir.core). A third option mentioned was using the Python `fhir.resources` library or universal JSON/XML converters.

@rkorytkowski submitted a PR to the FHIR Validator Wrapper project on 2024-03-12 (https://github.com/hapifhir/org.hl7.fhir.validator-wrapper/pull/167).

#### What Was Built

- **PR submitted to upstream FHIR Validator Wrapper (#1761).** @rkorytkowski opened a PR at the hapifhir validator-wrapper repo on 2024-03-12. The current status of this PR and whether it was merged is not recorded in the OCL issue.

#### What Is Pending

- **Add FHIR XML Support (#1761 -- OPEN).** Assigned to @rkorytkowski. Created 2024-02-07, last updated 2024-03-12. The classification CSV marks this as `review` priority `low`, suggesting it is not on the critical path for the FHIR Service MVP.

#### Open Design Questions

- Which deployment option for FHIR validation was chosen -- the validator wrapper, a custom REST wrapper, or the Python library? (#1761)
- Should the FHIR Validator microservice also serve the Automated FHIR Resource Validation use case (#2053)?
- Is XML support required for the FHIR Service MVP, or can it be deferred?

---

## Section 6: FHIR Content & Packaging (3 issues)

### 6.1 FHIR Baseline Content

**Epic:** #1910

#### What It Is and Why It Matters

OCL aspires to host the "baseline" FHIR NPM packages -- the foundational terminology content that the FHIR ecosystem depends on. These include `hl7.fhir.r4.core#4.0.1`, `hl7.terminology.r4#5.3.0`, `hl7.fhir.uv.ips`, `hl7.fhir.us.ccda`, and `hl7.fhir.us.core#6.1.0`. Making this content available in OCL Online is a prerequisite for OCL to function as a full-fledged FHIR terminology server, since ValueSet expansions frequently reference codes from these baseline packages.

The MVP defined in #1910 is focused on performing a full load of baseline content into QA using the NPM Import feature, then generating a gap report comparing source content to what OCL actually loaded. This gap report would identify: (a) gaps in OCL's FHIR Core capabilities, (b) gaps in reference content needed for expansions, and (c) the maintenance workflow for fixing issues and loading new releases.

The issue body contains an extensive checklist of next steps including: load testing, import validation, versioning gap analysis, namespace ownership modeling, registry population, error message improvements, FHIR Validator integration, and `_history` endpoint support.

#### What Was Built

Baseline content loading has been partially executed. Related work includes:

- **Test Load of Baseline Content via NPM Import (#1957 -- OPEN).** @paynejd requested on 2024-10-22 that @rkorytkowski import `hl7.fhir.r4.core#4.0.1` into QA using the NPM bulk import feature under the `hl7-fhir-r4-core-npm` owner. @rkorytkowski posted import result files on 2025-01-24, indicating the import was attempted. The ticket remains open, suggesting the results have not been fully validated.
- **Skip r4.core Dependency on Subsequent Imports (#2041 -- OPEN).** Assigned to @rkorytkowski, created 2025-01-23. Since nearly all FHIR NPM packages list `hl7.fhir.r4.core` as a dependency, the bulk importer should treat it as pre-loaded rather than re-importing it with every package.
- **FHIR Import Validation/Comparison Process (#1961 -- OPEN).** Created 2024-10-22 with no body, no assignee, and no comments. This would implement the source-to-loaded comparison report described in the #1910 MVP definition.

#### What Is Pending

- **FHIR Baseline Content (#1910 -- OPEN).** Assigned to @rkorytkowski. Created 2024-07-30. The checklist in the issue body has no items checked off. Key outstanding items include: implementing validation (compare source to loaded content), testing versioning edge cases, documenting capability gaps, modeling namespace ownership for HL7 content, and implementing the `_history` endpoint.
- **FHIR Import Validation/Comparison (#1961 -- OPEN).** No assignee, no progress.
- **Skip r4.core Dependency (#2041 -- OPEN).** @rkorytkowski assigned, code activity in oclapi2.

#### Open Design Questions

- What namespace/ownership model should be used for HL7-authored baseline content in OCL Online? (#1910)
- How should OCL handle versioning when a newer package version is imported before an older one? (#1910)
- What is the maintenance workflow for loading new releases of baseline packages? (#1910)
- Should OCL validate imported content against the FHIR Validator as part of the import pipeline? (#1910)

---

### 6.2 FHIR Content Traceability

**Epic:** #2048

#### What It Is and Why It Matters

Content traceability ensures that FHIR resources served by OCL can be traced back to their origin -- whether that is an NPM package import, a manual creation via the TermBrowser, or a bulk upload. This is important for audit, debugging, and trust: consumers of OCL-hosted terminology need to know where content came from, when it was loaded, and whether it has been modified since import.

This epic is part of the OCL FHIR Core 2025 initiative (#2253) and was assigned to @rkorytkowski.

#### What Was Built

No implementation details are recorded. The epic was closed on 2026-03-24.

- **FHIR Content Traceability (#2048 -- CLOSED).** Closed 2026-03-24, same bulk closure date as #2049 and #2050. No body, no comments, no child tickets. It is unclear whether traceability was implemented, deferred, or descoped.

#### What Is Pending

Nothing formally pending, but the lack of recorded work suggests this may need revisiting.

#### Open Design Questions

- Was content traceability implemented via another mechanism (e.g., import metadata on sources)? (#2048)
- If not, what metadata should be captured -- import source, import timestamp, original package version, modification history?

---

### 6.3 Terminology Packaging Service

**Epic:** #2045

#### What It Is and Why It Matters

The Terminology Packaging Service would allow OCL to export curated terminology content as distributable packages -- likely in FHIR NPM package format. This is the complement to the NPM Import capability: where import brings external content into OCL, the packaging service would let users bundle OCL-managed content for distribution to downstream FHIR servers, IG builds, or other consumers.

This is critical for OCL's role in the FHIR ecosystem. Organizations that author and manage terminology in OCL need a way to publish that content in standard formats that other tools (e.g., the FHIR IG Publisher, HAPI FHIR, Ontoserver) can consume.

This epic is part of the OCL FHIR Core 2025 initiative (#2253) and is assigned to @paynejd and @jamlung-ri.

#### What Was Built

Nothing has been implemented yet.

#### What Is Pending

- **Terminology Packaging Service (#2045 -- OPEN).** Created 2025-01-30. No body, no comments, no child tickets. Assigned to @paynejd and @jamlung-ri. Needs requirements definition and decomposition.

#### Open Design Questions

- What package formats should be supported -- FHIR NPM only, or also other formats (e.g., CQL support packages, VSAC exports)? (#2045)
- Should packaging be a synchronous download or an asynchronous job?
- How does packaging interact with versioning -- can users package a specific source version, or only HEAD?
- What metadata should be included in the package manifest?

---

## Section 7: Cross-cutting Concerns

### 7.1 Overview

Several issues span multiple sections and touch on cross-cutting infrastructure concerns: error handling, endpoint consistency, permissions, and format support. Rather than duplicate these across sections, they are collected here.

---

### 7.2 Error Handling and API Robustness

#### What It Is and Why It Matters

Multiple issues across the codebase reveal a pattern of poor error handling in FHIR endpoints. These are not isolated bugs but symptoms of a systemic gap: OCL's FHIR layer often returns raw 500 errors, uninformative 502 Bad Gateway responses, or constraint violation messages that are not actionable for FHIR clients.

Key examples:

- **502 Bad Gateway for Large CodeSystems (#1833 -- OPEN).** CodeSystems with more than ~250 codes cause timeouts. @snyaggarwal profiled the issue in May 2024 and identified four bottlenecks (concept create, version create, double indexing, double serialization). Partial fixes were deployed to QA, but the request still timed out on QA hardware. @rkorytkowski increased the timeout to 10 minutes as a workaround. The underlying issue -- that large synchronous FHIR POSTs should be queued as async tasks -- remains unresolved.

- **CodeSystem POST Bug -- Display Required (#1599 -- OPEN).** FHIR does not require the `display` attribute on CodeSystem concepts, but OCL returns a 500 error when it is missing. @rkorytkowski confirmed on 2024-03-05 that `display` should not be required and that `code` should be used as a fallback concept name. Not yet fixed.

- **Unsupported Search Params (#1839).** @rkorytkowski added `BadRequest` responses for unsupported search params (2024-05-21), which is a positive step toward spec-compliant error handling.

- **Naked FHIR Request Response (#472 -- OPEN).** The root FHIR URL returns a 404 instead of a CapabilityStatement or informative response. Open since 2020 with no progress.

- **Baseline Content Loading Errors (#1910).** The #1910 checklist includes "Improve response of API with proper error messages and data model validation" as an explicit next step.

#### Open Design Questions

- Should OCL return FHIR OperationOutcome resources for all error responses? (#472, #1599, #1833)
- Is there a plan to audit all FHIR endpoints for spec-compliant error responses?

---

### 7.3 Endpoint Consistency

#### What It Is and Why It Matters

FHIR clients expect consistent endpoint behavior regardless of minor URL variations. Two issues highlight gaps:

- **Trailing Slash Handling (#2030 -- OPEN).** Both `POST .../CodeSystem` and `POST .../CodeSystem/` must work. Assigned to @rkorytkowski, code activity in oclapi2. Created 2024-11-27.

- **Owner+ID Scoped Operations (#583 -- OPEN).** @paynejd noted on 2021-09-14 that owner-scoped FHIR operations (e.g., `/orgs/PEPFAR/CodeSystem/MER/$validate-code`) appear to work in some cases but the ticket remains open, suggesting incomplete coverage.

These are relatively small fixes but important for interoperability -- FHIR clients should not need to know OCL-specific URL conventions.

---

### 7.4 Permissions and Multi-tenancy

#### What It Is and Why It Matters

- **Permissions for Registries and $resolveReference (#1744 -- OPEN).** Created 2024-01-23 with labels `enhancement`, `discussion-needed`, `api2`. No body, no comments, no assignee. This issue covers how permissions should work for the canonical URL registry and the `$resolveReference` operation. The design implications are significant: if a FHIR client resolves a canonical URL, should they see results from private namespaces? Should registry entries be editable by org admins only?

This intersects with the `$resolveReference` refactoring (#2261), which proposes that all FHIR operations use `$resolveReference` for canonical URL resolution. The permissions model for the registry will directly affect how multi-tenant resolution works.

---

### 7.5 XML Format Support

#### What It Is and Why It Matters

- **Add FHIR XML Support (#1761 -- OPEN).** Covered in detail in Section 5.7. From a cross-cutting perspective, XML support affects every FHIR endpoint -- not just validation. If implemented via a microservice (as proposed), it would sit in front of or alongside the existing FHIR service and need to handle content negotiation (`Accept: application/fhir+xml`) across all resource types and operations.

The classification CSV marks this as `low` priority and `review` disposition, suggesting it is unlikely to be included in the FHIR Service MVP.

---

### 7.6 FHIR ID Conventions and Character Restrictions

#### What It Is and Why It Matters

- **Underscore Warning in Canonical URLs (#1874 -- OPEN).** @paynejd noted on 2024-07-02 that OCL should not allow underscores in mnemonics and canonical URLs for new content and should warn about existing content. @jamlung-ri expanded this to suggest investigating the full set of unsupported characters from the [FHIR datatype spec](https://build.fhir.org/datatypes.html#uri), recommending hyphens as the replacement for underscores.

This is a cross-cutting concern because FHIR IDs and canonical URLs are used throughout the system -- in repo creation, import, export, registry entries, and FHIR operations. A character validation policy would need to be enforced at multiple layers.

Assigned to @snyaggarwal. No code activity recorded.

---

### 7.7 Summary of Cross-cutting Status

| Concern | Key Issue(s) | Status |
|---------|-------------|--------|
| Error handling / OperationOutcome | #472, #1599, #1833, #1910 | Partially addressed; systemic gap remains |
| Endpoint consistency (trailing slash, scoping) | #2030, #583 | In progress |
| Permissions / multi-tenancy | #1744 | No progress; needs design discussion |
| XML format support | #1761 | Deferred; PR submitted upstream |
| ID/URL character validation | #1874 | No progress |
