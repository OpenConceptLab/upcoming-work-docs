# OCL FHIR Service Knowledge Base

**Generated:** 2026-03-24
**Scope:** 59 issues related to OCL's FHIR Service capabilities
**Source:** [OpenConceptLab/ocl_issues](https://github.com/OpenConceptLab/ocl_issues) GitHub repository
**Companion data:** `fhir-raw-archive.json` (full issue bodies + comments), `fhir-issue-classification.csv` (59-row analysis)

---

## Table of Contents

1. [Executive Summary](#section-1-executive-summary)
2. [FHIR Foundation](#section-2-fhir-foundation)
3. [FHIR Operations](#section-3-fhir-operations)
4. [Content Import & Export](#section-4-content-import--export)
5. [Validation & Testing](#section-5-validation--testing)
6. [FHIR Content & Packaging](#section-6-fhir-content--packaging)
7. [Cross-cutting Concerns](#section-7-cross-cutting-concerns)
8. [Resource Library](#section-8-resource-library)
- [Appendix A: Issue Index](#appendix-a-issue-index)
- [Appendix B: Contributor Map](#appendix-b-contributor-map)

---

## Section 1: Executive Summary

### 1.1 What Is the OCL FHIR Service

The OCL FHIR Service is the HL7 FHIR-compliant interface layer of the Open Concept Lab platform. It exposes OCL's terminology content — concepts, mappings, sources, and collections — through standard FHIR resource types (CodeSystem, ValueSet, ConceptMap) and operations ($expand, $lookup, $validate-code, $translate). This enables OCL to interoperate with FHIR-native systems such as electronic health records, terminology servers, and implementation guide authoring tools.

The FHIR Service is not a standalone application but a set of endpoints built into oclapi2 (the Django REST API). Its evolution has been tightly coupled with the TermBrowser v3 initiative, sharing foundational work on canonical URL registries (#1696), typed repositories (#1695), and the $resolveReference operation (#1747). The "OCL FHIR Core 2025" epic (#2253) represents the most recent comprehensive roadmap for FHIR capabilities, encompassing 14 sub-issues covering serialization, validation, content traceability, CRMI compliance, and terminology packaging.

### 1.2 Key Stakeholders and Contributors

| Contributor | Primary Focus | Notable Involvement |
|---|---|---|
| **@paynejd** | Product owner, FHIR strategy | #444, #1695, #1696, #1837, #2045 |
| **@snyaggarwal** | API engineering, FHIR implementation | #1166, #1833, #1874, #2262 |
| **@jamlung-ri** | Requirements, QA, FHIR alignment | #591, #1837, #1898, #2045, #2046 |
| **@rkorytkowski** | Infrastructure, legacy FHIR work | #782, #828, #974, #1166, #1296 |
| **@bmamlin** | Clinical domain, FHIR standards | #1296 |

### 1.3 Timeline and Milestones

**Early FHIR work (2018-2021).** The earliest FHIR issues (#444, #472, #582, #583, #591) date from 2018-2021 and represent initial thinking about how OCL should expose content via FHIR. These were exploratory — defining how implicit value sets work, planning FHIR download formats, and scoping SVCM (Sharing Value Sets, Code Systems, and Concept Maps) support.

**Foundation phase (2022-2023).** FHIR work accelerated alongside the TermBrowser v3 initiative. The canonical URL registry (#1696), repo type system (#1695), and $resolveReference (#1747) laid the groundwork for proper FHIR resource identification and resolution. The FHIR CodeSystem and ValueSet operations received focused attention (#974, #1296, #1310).

**Build phase (2024).** The bulk of FHIR implementation work happened in 2024, with 26 issues created. Key deliverables included CodeSystem fixes (#1815), ConceptMap import handling (#1836), FHIR search parameters (#1839, #1840), and significant work on expansion matching logic (#1296). The NPM import pipeline (#1166, #1910, #1957) enabled loading of standard FHIR terminology packages.

**FHIR Core 2025 (Oct 2025 - present).** The #2253 epic ("OCL FHIR Core 2025") was created in October 2025, defining a comprehensive FHIR roadmap with 14 sub-issues: terminology packaging (#2045), automated FHIR testing (#2046), serialization library (#2047), content traceability (#2048), CRMI compliance (#2049), batch validation (#2050), model documentation (#2051, since deleted), batch translation (#2052), and automated resource validation (#2053).

### 1.4 Current State Overview

**Total issues:** 59

**Disposition breakdown:**

| Disposition | Count |
|------------|-------|
| keep | 37 |
| review | 15 |
| close-stale | 6 |
| close-outdated | 1 |

**By subcategory:**

| Subcategory | Count |
|------------|-------|
| FHIR Operations | 39 |
| Validation & Testing | 7 |
| FHIR Foundation | 5 |
| Content Import & Export | 5 |
| FHIR Content & Packaging | 3 |

**By era:**

| Era | Count |
|-----|-------|
| Build Phase (2024) | 26 |
| Legacy (pre-2022) | 12 |
| FHIR Core 2025 | 8 |
| Recent (2025+) | 7 |
| Foundation Phase (2022-2023) | 6 |

**Issues with code evidence:** 13 of 59

**Overlap with TBv3 analysis:** 9 issues appear in both FHIR and TBv3 buckets (flagged in classification CSV)

---

<!-- Sections 2-7 will be assembled from kb-sections/ files -->

---

## Section 8: Resource Library

### FHIR Specifications
- [HL7 FHIR R4 Specification](https://hl7.org/fhir/R4/)
- [FHIR Terminology Module](https://hl7.org/fhir/R4/terminology-module.html)
- [FHIR CodeSystem Resource](https://hl7.org/fhir/R4/codesystem.html)
- [FHIR ValueSet Resource](https://hl7.org/fhir/R4/valueset.html)
- [FHIR ConceptMap Resource](https://hl7.org/fhir/R4/conceptmap.html)
- [CRMI Implementation Guide](http://hl7.org/fhir/uv/crmi/)

### OCL Documentation
- [OCL FHIR Service Documentation](https://docs.openconceptlab.org/)
- [OCL API v2 Documentation](https://docs.openconceptlab.org/)

### Key Epics
- [#2253: OCL FHIR Core 2025](https://github.com/OpenConceptLab/ocl_issues/issues/2253) — Master FHIR roadmap epic
- [#1166: NPM Import of Baseline FHIR Content](https://github.com/OpenConceptLab/ocl_issues/issues/1166) — FHIR content loading
- [#869: FHIR/SVCM Support in OCL](https://github.com/OpenConceptLab/ocl_issues/issues/869) — Original FHIR support epic

---

## Appendix A: Issue Index

| # | Title | Status | Disposition | Section |
|---|-------|--------|-------------|---------|
| 444 | Plan how to handle "implicit value sets" in FHIR | OPEN | keep | 2 |
| 472 | Provide response for naked fhir request | OPEN | close-stale | 3 |
| 582 | Ability to filter by codesystem properties | OPEN | close-stale | 3 |
| 583 | Ability to perform FHIR operation by Owner and Id | OPEN | review | 3 |
| 591 | Download/View as FHIR | OPEN | close-stale | 3 |
| 632 | Implement features to allow configuration of case sensitivit... | OPEN | close-stale | 3 |
| 782 | Introduce attribute to control how an OCL source is exposed ... | OPEN | keep | 3 |
| 828 | Automatically generate changelog for oclweb2, oclapi2, oclfh... | OPEN | close-outdated | 3 |
| 865 | FHIR UI in TermBrowser | OPEN | close-stale | 3 |
| 869 | FHIR/SVCM Support in OCL | OPEN | review | 3 |
| 974 | FHIR $expand operation should utilize OCL's full text search... | OPEN | keep | 3 |
| 1166 | NPM Import of Baseline FHIR Content, plus Known FHIR Service... | OPEN | keep | 4 |
| 1296 | Requirements: Basic expansion matching logic for ValueSet op... | OPEN | keep | 3 |
| 1310 | Implement recursive real-time expansions | OPEN | keep | 3 |
| 1599 | CodeSystem POST Bug - Display attribute seems to be required... | OPEN | keep | 3 |
| 1610 | Use canonical URL where possible in the "system" field of a ... | OPEN | keep | 3 |
| 1695 | Repo Type | CLOSED | review | 2 |
| 1696 | Canonical URL Registry | OPEN | keep | 2 |
| 1726 | Repo Configuration and Content Validation - Configuring Look... | OPEN | keep | 5 |
| 1744 | Permissions for registries and $resolveReference behavior | OPEN | review | 2 |
| 1761 | Add FHIR xml support | OPEN | review | 5 |
| 1793 | Implement basic analytics on OCL FHIR Core utilization | OPEN | close-stale | 3 |
| 1815 | FHIR CodeSystem Fixes | OPEN | review | 3 |
| 1823 | CodeSystem $lookup Enhancement - displayLanguage Parameter | OPEN | keep | 3 |
| 1833 | 502 Bad Gateway for Large CodeSystem resources | OPEN | keep | 3 |
| 1835 | OCL rejects "duplicate" resource imports - "org_source_uniqu... | OPEN | review | 3 |
| 1836 | FHIR ConceptMap fails to import due to "null" map_type | OPEN | review | 3 |
| 1837 | Review/finalize $translate operation | OPEN | keep | 3 |
| 1839 | Add code searchParam for CodeSystem | OPEN | review | 3 |
| 1840 | CodeSystem listing should include total | OPEN | review | 3 |
| 1874 | In TB, warn users that underscore not officially supported b... | OPEN | keep | 2 |
| 1898 | Download the (or one of the) FHIR representation of a reposi... | OPEN | keep | 3 |
| 1910 | FHIR baseline content | OPEN | keep | 6 |
| 1915 | OCL support for Publishing terminology the FHIR ecosystem, i... | OPEN | keep | 5 |
| 1919 | Support ConceptMap and CodeSystem with the same ID | OPEN | keep | 3 |
| 1922 | Fix overwriting ConceptMap version | OPEN | keep | 3 |
| 1924 | Import r4.core dependency once | OPEN | keep | 3 |
| 1927 | CodeSystem Import Bug for Date property | OPEN | keep | 3 |
| 1929 | CodeSystem Import Bug: New line character removed when impor... | OPEN | keep | 3 |
| 1957 | Test load baseline content via NPM import | OPEN | keep | 4 |
| 1961 | Implement FHIR import validation/comparison process | OPEN | review | 4 |
| 2027 | Template / Repository / ValueSet | OPEN | keep | 3 |
| 2028 | Template / Repository / CodeSystem | OPEN | keep | 3 |
| 2030 | FHIR endpoints must be handled with or without trailing slas... | OPEN | keep | 3 |
| 2041 | Do not import npm hl7.fhir.r4.core 4.0.1 if listed in depend... | OPEN | keep | 4 |
| 2045 | Terminology Packaging Service | OPEN | keep | 6 |
| 2046 | Automated FHIR Testing Pipeline | OPEN | keep | 5 |
| 2047 | Implement FHIR Serialization Library | OPEN | keep | 4 |
| 2048 | FHIR Content Traceability | CLOSED | keep | 6 |
| 2049 | CRMI Compliance | CLOSED | keep | 5 |
| 2050 | Batch Validation | CLOSED | keep | 5 |
| 2052 | Batch Translation | CLOSED | keep | 3 |
| 2053 | Automated FHIR Resource Validation | OPEN | keep | 5 |
| 2093 | Export Metadata as a ConceptMap | OPEN | keep | 3 |
| 2114 | Bug: Value Set Compose Statement shows "ValueSet" in the "sy... | OPEN | keep | 3 |
| 2253 | OCL FHIR Core 2025 | OPEN | review | 3 |
| 2261 | Use $resolveReference to resolve canonical URL to OCL repo v... | OPEN | review | 3 |
| 2262 | Expose OCL source.properties & source.filters through FHIR C... | OPEN | review | 3 |
| 2281 | Proposal to support download of a concept's mappings as a va... | OPEN | review | 3 |

## Appendix B: Contributor Map

| Contributor | Issues | Primary Sections |
|---|---|---|
| @bmamlin | #1296 | Section 3 |
| @italomacedo | #2261 | Section 3 |
| @jamlung-ri | #591, #1837, #1898, #2045, #2046 | Section 3, 5, 6 |
| @paulsonder | #2027 | Section 3 |
| @paynejd | #444, #1695, #1696, #1837, #2045 | Section 2, 3, 6 |
| @rkorytkowski | #782, #828, #974, #1166, #1296, #1599, #1610, #1761 | Section 3, 4, 5, 6 |
| @snyaggarwal | #1166, #1833, #1874, #2262 | Section 2, 3, 4 |
