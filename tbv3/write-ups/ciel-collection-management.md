# CIEL-Based Collection Management in OCL TBv3

## Overview

The core funded outcome of TBv3 is enabling a Terminology Implementer — typically an OpenMRS or DHIS2 project lead — to build and maintain a concept dictionary that references CIEL content, entirely within the browser. Today that workflow requires direct API calls, manual reference management, and significant technical expertise. TBv3 makes it accessible: browsing CIEL, selecting concepts, configuring cascade, managing versions, and updating to new CIEL releases are all first-class UI workflows.

## MVP Workflow

**Build a new collection.** The implementer creates a new collection repository (type: Dictionary), selects a validation schema (typically OpenMRS), and begins adding concepts. They can search globally for a term, filter by Source = CIEL, and add concepts one at a time from the concept detail panel. Or they navigate directly to CIEL's source page and browse by concept class. Or they paste a list of concept IDs into a bulk-add dialog that previews what will be added, what's already included, and what couldn't be resolved.

When adding the first concept from CIEL, the system records the resolved CIEL version as the collection's canonical source version. All subsequent unversioned references to CIEL resolve to that same version — keeping the collection internally consistent even as CIEL continues releasing new versions.

**Configure cascade.** CIEL organizes drug regimens, question-answer sets, and concept sets using internal mappings (Q-AND-A, CONCEPT-SET). When adding a concept to their collection, the implementer selects a cascade option: None (just this concept), Source Mappings (concept + its direct mappings), or Source to Concepts (full recursive traversal — the right choice for OpenMRS Q-AND-A structures). The system adds the cascaded concepts and mappings automatically, and the expansion reflects the complete logical set.

**Preview before saving.** Before committing any reference, the implementer can preview what it resolves to — how many new concepts and mappings it would add, which are already in the collection, and whether there are any version consistency warnings. This lets them test intensional references (e.g., "all CIEL diagnoses with 'malaria' in the name") before they're persisted.

**Manage references.** The References tab lists all defining references for the collection — extensional (specific concept IDs) and intensional (query-based rules). From here the implementer can remove references in bulk, transform their version-pinning behavior (unpin, lock to a specific version), or rebuild the expansion after manual changes.

**Version and release.** When the collection is ready to share, the implementer creates a named version (e.g., `v2024-Q3`), optionally marks it Released, and the system auto-computes the expansion asynchronously. The released version is immutable and available downstream (e.g., via FHIR API for an OpenMRS instance).

**Update to a new CIEL release.** When CIEL publishes a new version, collection owners are notified. They can review a diff showing which of their included concepts changed, were retired, or are new in CIEL. They accept the update (advancing their canonical CIEL version and triggering a re-expansion) or stay on their current version. This gives implementers a structured, non-breaking path to staying current.

## Mockup — Adding a Concept to a Collection

```
┌─────────────────────────────────────────────────────────────────┐
│  CIEL  >  Malaria, confirmed                                    │
│  Concept Class: Diagnosis  |  Datatype: N/A  |  ID: 167840     │
│                                                                 │
│  Names                          Mappings                        │
│  ─────────────────────          ─────────────────────────────  │
│  Malaria, confirmed (FSN, en)   SAME-AS  ICD-10: B54           │
│  Malaria confirmée  (FSN, fr)   SAME-AS  SNOMED: 61462000      │
│                                                                 │
│  [ Add to Collection ▼ ]   [ Compare ]   [ Share ]             │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌────────────────────────────────────────────────────────────────┐
│  Add to Collection                                      ✕      │
│                                                                │
│  Collection  [ My Org Dictionary 2024           ▼ ]           │
│              ↳ Locked to CIEL v2024-08-01                      │
│                                                                │
│  Cascade     ○ None                                            │
│              ○ Source Mappings                                 │
│              ● Source to Concepts (OpenMRS Q-AND-A)   ← rec.  │
│              ○ Custom                                          │
│                                                                │
│  Preview:  + 1 concept   + 5 mappings   0 already included     │
│                                                                │
│            [ Cancel ]         [ Add to Collection ]            │
└────────────────────────────────────────────────────────────────┘
```
