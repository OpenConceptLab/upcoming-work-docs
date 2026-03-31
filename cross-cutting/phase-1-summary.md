# OCL Issues Bucketing Criteria

**Date:** 2026-03-20
**Repository:** `OpenConceptLab/ocl_issues`
**Total open issues at time of analysis:** 633

## Summary

633 open issues in `OpenConceptLab/ocl_issues` were classified into exactly one of three buckets:

| Bucket | Count | Criteria | Action |
|--------|-------|----------|--------|
| **Active** | 75 | In "CIEL-OCL 2026 Part 1" project | Leave alone |
| **Review / "In Between"** | 48 | Created Aug 2025+, not in CIEL project | Human review & routing |
| **Historical backlog** | 510 | Created before Aug 2025, not in CIEL project | Synthesize, then close/keep |
| **Total** | 633 | | |

---

## Bucket 1: Active (75 issues)

**Label:** Active sprint work -- do not touch.

**Project Board:" https://github.com/orgs/OpenConceptLab/projects/11/

**Inclusion criteria:**
- The issue is a member of the **"CIEL-OCL 2026 Part 1" GitHub Project** (org-level project under OpenConceptLab), regardless of when it was created or last updated.

**What this covers:**
- All CIEL-related milestones: CIEL Bridge, CIEL Implementers, CIEL Source Management, CIEL Content Curation, etc.
- Any other issue that has been added to the CIEL-OCL 2026 Part 1 project, even if not in a CIEL-prefixed milestone.

**Disposition:** These issues are actively being worked on. They are excluded from both the synthesis report and the active review list. No cleanup action needed.

---

## Bucket 2: In Between (48 issues)

**Label:** Recent work needing human routing.

**Report:** [ocl-issues-active-review-2026-03.md](ocl-issues-active-review-2026-03.md)

**Inclusion criteria:**
- Created on or after **August 1, 2025**
- AND **not** a member of the "CIEL-OCL 2026 Part 1" GitHub Project

**What this covers:**
- Recent issues (Aug 2025 -- Mar 2026) that represent current thinking but haven't been assigned to an active project yet.
- Mix of TermBrowser, API, Mapper, and cross-cutting work.

**Disposition:** Jonathan reviews personally to decide for each issue:
1. Add to an active project/milestone
2. Move into the synthesis report (backlog)
3. Leave as-is

---

## Bucket 3: Historical backlog (510 issues)

**Label:** Historical backlog -- synthesized for knowledge capture, candidates for closure.

**Report:** [ocl-issues-synthesis-2026-03.md](ocl-issues-synthesis-2026-03.md)

**Inclusion criteria:**
- Created **before August 1, 2025**
- AND **not** a member of the "CIEL-OCL 2026 Part 1" GitHub Project

**What this covers:**
- 7+ years of community input (Feb 2018 -- Jul 2025)
- Organized into 8 themes, 35 sub-themes
- Each issue has a disposition recommendation: keep (303), close (148), or review (59)

**Disposition:** Share synthesis report with community for feedback (Phase 2.5), then execute closures per approved dispositions (Phase 3).
