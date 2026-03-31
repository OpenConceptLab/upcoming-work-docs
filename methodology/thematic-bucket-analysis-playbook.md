# Thematic Bucket Analysis Playbook

**Purpose:** Reusable instructions for producing a comprehensive analysis of a thematic bucket of OCL issues. Each bucket gets the same set of outputs, following the format established by the TBv3 analysis (`reports/tbv3-analysis/`).

**Goal:**
Every single ticket in `ocl_issues` must fall into 3 buckets when we're done:
- closed (and incorporated into the knowledge base)
- active as part of the active CIEL project
- keep - with reviewed/keep label applied -- and then we'll develop a new label/project taxonomy based on this set that we'll use moving forward


**Prerequisites:**
- Working directory: `/Users/jonathanpayne/projects/ocl/ocl-workspace`
- GitHub CLI (`gh`) authenticated with access to `OpenConceptLab/ocl_issues`
- Phase 1 data files available in `data/`:
  - `categorized-all.json` — 510 issues with theme, sub_theme, disposition, priority_hint
  - `bucket-synthesis.json` — 511 issues with full metadata (title, body, labels, assignees, milestone, dates)
  - `code-evidence.json` — commit/PR references for 69 issues
  - `bucket-active-review.json` — 25 reviewed/keep issues
  - `bucket-ciel-excluded.json` — 78 active CIEL project issues

**Exemplar:** `reports/tbv3-analysis/` contains the reference implementation for all output formats.

---

## How to Define a New Bucket

Before starting, define these parameters:

```yaml
bucket_name: "FHIR Service"          # Human-readable name
folder_slug: "fhir-analysis"          # Folder name under reports/
file_prefix: "fhir"                   # Prefix for output files

# Where to find issues for this bucket:
issue_sources:
  backlog_filter:                      # How to filter categorized-all.json
    sub_themes: ["FHIR Integration"]   # Exact sub_theme matches
    title_keywords: ["FHIR", "CodeSystem", "ValueSet", "ConceptMap"]
    label_matches: ["fhir"]
  epic_roots: [2253]                   # Parent issues whose sub-issues should be included
  reviewed_keep: [2261, 2262]          # reviewed/keep issues in this bucket
  github_projects: []                  # GitHub Project numbers (org-level) if any
  overlap_buckets: ["tbv3-analysis"]   # Other buckets that may share issues

# Knowledge base section structure:
kb_sections:
  - title: "Executive Summary"
    slug: "exec-summary"
  - title: "FHIR Foundation"
    slug: "foundation"
    topics: ["canonical URLs", "repo types", "model alignment"]
  # ... etc
```

---

## Step 1: Collect Issues

**Goal:** Build a deduplicated list of all issue numbers in the bucket, with source metadata.

### 1a. Query the backlog

```python
import json

categorized = json.load(open("data/categorized-all.json"))
synthesis = json.load(open("data/bucket-synthesis.json"))
evidence = json.load(open("data/code-evidence.json"))

# Filter by sub_theme, title keywords, and labels
def matches_bucket(item, sub_themes, title_keywords, label_matches):
    if item.get("sub_theme") in sub_themes:
        return True
    title = item.get("title", "").lower()
    if any(kw.lower() in title for kw in title_keywords):
        return True
    # Check original labels from synthesis data
    return False

bucket_issues = {c["number"]: c for c in categorized if matches_bucket(c, ...)}
```

### 1b. Get epic sub-issues

```bash
gh api graphql -f query='{
  repository(owner:"OpenConceptLab", name:"ocl_issues") {
    issue(number: EPIC_NUMBER) {
      subIssues(first: 50) {
        nodes { number title state }
      }
    }
  }
}'
```

### 1c. Add reviewed/keep issues

```python
# Add from bucket-active-review.json for specific issue numbers
```

### 1d. Check for overlap with other buckets

```python
# Load other bucket's all-issue-numbers.json
# Flag issues that appear in both
```

### 1e. Save issue list

**Output:** `reports/{folder_slug}/all-issue-numbers.json`
```json
{
  "metadata": {
    "bucket": "FHIR Service",
    "generated": "YYYY-MM-DD",
    "total_issues": N,
    "sources": {
      "backlog_filter": N,
      "epic_sub_issues": N,
      "reviewed_keep": N,
      "overlap_with_other_buckets": N
    }
  },
  "issues": [
    {
      "number": 1166,
      "source": "backlog_filter",
      "overlap": ["tbv3-analysis"],
      "in_backlog": true
    }
  ]
}
```

---

## Step 2: Fetch Raw Data Archive

**Goal:** Full issue bodies and comments for every issue in the bucket.

### Fetch via GraphQL (batch by 5-10 issues per query)

```bash
gh api graphql -f query='{
  repository(owner:"OpenConceptLab", name:"ocl_issues") {
    i1166: issue(number: 1166) { ...IssueFields }
    i974: issue(number: 974) { ...IssueFields }
  }
}
fragment IssueFields on Issue {
  number title state body
  comments(first: 100) {
    nodes { author { login } createdAt body }
  }
  labels(first: 20) { nodes { name } }
  assignees(first: 10) { nodes { login } }
  milestone { title }
  createdAt updatedAt closedAt
}'
```

### Save as archive

**Output:** `reports/{folder_slug}/{file_prefix}-raw-archive.json`
```json
{
  "metadata": {
    "total_issues": N,
    "total_comments": N,
    "issues_with_urls": N,
    "generated": "YYYY-MM-DD"
  },
  "issues": {
    "1166": {
      "number": 1166,
      "title": "...",
      "state": "OPEN",
      "body": "full markdown body...",
      "comments": [
        {"author": "username", "createdAt": "ISO8601", "body": "..."}
      ],
      "labels": ["fhir", "Epic"],
      "assignees": ["snyaggarwal"],
      "milestone": "TermBrowser v3 MVP",
      "createdAt": "ISO8601",
      "updatedAt": "ISO8601",
      "closedAt": null
    }
  }
}
```

---

## Step 3: Project Hierarchy (if applicable)

**Goal:** Capture the project board structure with parent-child relationships and status.

### If a GitHub Project exists

```bash
# Requires read:project token scope
gh project item-list PROJECT_NUMBER --owner OpenConceptLab --limit 500 \
  --format json
```

### If no formal project, construct from epic sub-issues

Use the sub-issue tree from Step 1b to build a hierarchy:

```bash
gh api graphql -f query='{
  repository(owner:"OpenConceptLab", name:"ocl_issues") {
    issue(number: EPIC_NUMBER) {
      title state
      subIssues(first: 50) {
        nodes {
          number title state
          labels(first:10) { nodes { name } }
          assignees(first:5) { nodes { login } }
          milestone { title }
          subIssues(first: 20) {
            nodes { number title state }
          }
        }
      }
    }
  }
}'
```

**Output:** `reports/{folder_slug}/{file_prefix}-project-hierarchy.md`
```markdown
# {Bucket Name} — Project Hierarchy

**Generated:** YYYY-MM-DD
**Total project items:** N
**Root items (top-level):** N

## {Milestone or Group}

- **Epic Title** [#NNNN](url) — state: OPEN | labels: ... | assigned: ...
  - **Child Title** [#NNNN](url) — status: Todo | state: OPEN | ...
    - **Grandchild** [#NNNN](url) — state: CLOSED | ...
```

---

## Step 4: Issue Classification CSV

**Goal:** A spreadsheet with one row per issue, matching the tbv3 column structure exactly.

### Column specification

```
issue_number    - GitHub issue number
title           - Issue title
theme           - High-level theme (e.g., "API", "TermBrowser", "Infrastructure")
disposition     - keep / close-stale / close-outdated / close-superseded / close-duplicate / review
priority        - high / medium / low
subcategory     - Sub-theme within the bucket (e.g., "FHIR Operations", "Content Import")
labels          - Comma-separated GitHub labels
assignees       - Comma-separated GitHub usernames
milestone       - Milestone name or empty
created         - YYYY-MM-DD
updated         - YYYY-MM-DD
in_{bucket}_project  - yes / no (is it on the project board)
project_status  - Project board column (Todo, In Progress, Done, etc.) or "n/a"
has_code_activity    - yes / no (from code-evidence.json)
code_repos      - Comma-separated repo names with commits
era_classification   - Classification of when the work happened (e.g., "FHIR Core 2025", "Pre-2023 Legacy", "Active")
era_evidence    - Brief explanation of era classification
```

### Data sources for each column

- `issue_number`, `title`, `theme`, `disposition`, `priority`, `subcategory`: from `categorized-all.json` (backlog issues) or generated fresh (non-backlog issues)
- `labels`, `assignees`, `milestone`, `created`, `updated`: from `bucket-synthesis.json` or raw archive
- `in_{bucket}_project`, `project_status`: from project hierarchy data
- `has_code_activity`, `code_repos`: from `code-evidence.json`
- `era_classification`, `era_evidence`: generated by analyzing issue dates, code activity, project membership, and milestone history

**Output:** `reports/{folder_slug}/{file_prefix}-issue-classification.csv`

---

## Step 5: Knowledge Base

**Goal:** A comprehensive synthesis document that tells the story of this bucket — what was built, what's pending, what decisions were made, and what's unresolved.

### Structure

```markdown
# {Bucket Name} Knowledge Base

**Generated:** YYYY-MM-DD
**Scope:** N issues from {sources description}
**Source:** [OpenConceptLab/ocl_issues](https://github.com/OpenConceptLab/ocl_issues)
**Companion data:** `{prefix}-raw-archive.json` (full issue bodies + comments), `{prefix}-issue-classification.csv` (N-row analysis)

---

## Table of Contents

1. [Executive Summary](#section-1-executive-summary)
2-N. [Domain sections]
- [Appendix A: Issue Index](#appendix-a-issue-index)
- [Appendix B: Contributor Map](#appendix-b-contributor-map)

---

## Section 1: Executive Summary

### 1.1 What Is {Bucket Name}
[1-2 paragraphs: what this initiative/area is, why it matters to OCL, how it relates to the broader platform]

### 1.2 Key Stakeholders and Contributors
[Table of contributors with their roles and notable issue involvement]

| Contributor | Primary Focus | Notable Involvement |
|---|---|---|
| **@username** | Role description | Specific issues and contributions |

### 1.3 Timeline and Milestones
[Chronological narrative of phases, keyed to issue dates and commit activity]

### 1.4 Current State Overview
[Disposition breakdown, what's done vs pending vs abandoned]

---

## Section N: {Domain Topic}

### N.x {Subtopic}

**Epic:** #NNNN | **Children:** #n1, #n2, #n3

#### What It Is and Why It Matters
[Context paragraph explaining the feature/area and its strategic importance]

#### What Was Built
- **Feature Name (#ticket -- STATUS).** When it was built, what it does.
  - Implementation details, decisions made, who contributed

#### What Is Pending
- **Feature Name (#ticket -- OPEN).** One-sentence current status.
  - What's blocking, what's next

#### Open Design Questions
- Unresolved question (#ticket reference)

---

## Appendix A: Issue Index

| # | Title | Status | Disposition | Section |
|---|-------|--------|-------------|---------|
| NNNN | Title | OPEN | keep | 3.2 |

## Appendix B: Contributor Map

| Contributor | Issues | Primary Sections |
|---|---|---|
| @username | #n1, #n2, ... | Section 3, 5 |
```

### How to generate

Use parallel agents (one per major section). Provide each agent with:
- The raw archive JSON (bodies + comments) for issues in their section
- The classification CSV for context
- The section structure to follow
- Instructions to follow the format above exactly

**Output:** `reports/{folder_slug}/{file_prefix}-knowledge-base.md`

---

## Step 6: KB Section Files

Split the knowledge base into individual section files for manageability.

**Output:** `reports/{folder_slug}/kb-sections/section-{N}-{slug}.md`

Each section file is self-contained with its own heading structure.

---

## Step 7: Commit & Verify

### Commit

```bash
cd /Users/jonathanpayne/projects/ocl/ocl-workspace
git add reports/{folder_slug}/
git commit -m "{Bucket Name} analysis: N issues across M sections

Sources: {list sources}
Outputs: knowledge base, classification CSV, raw archive, project hierarchy"
```

### Verification checklist

- [ ] All issues from the defined sources are present in `all-issue-numbers.json`
- [ ] Every issue in the list has an entry in the raw archive (body + comments)
- [ ] Every issue has a row in the classification CSV
- [ ] CSV columns match the tbv3 format exactly (same headers, same order)
- [ ] Knowledge base covers all sub-themes/subcategories from the classification
- [ ] Overlaps with other buckets are flagged (not double-counted)
- [ ] Appendix A in the KB has a complete issue index
- [ ] Appendix B has a contributor map

---

## Bucket Registry

Track which buckets have been analyzed:

| Bucket | Folder | Issues | Status |
|--------|--------|--------|--------|
| TermBrowser v3 | `tbv3-analysis/` | 262 | Complete |
| V3 (unreviewed) | `v3-unreviewed-analysis/` | 70 | Complete |
| api2 | `api2-analysis/` | 314 | Complete |
| Fully Orphaned | `orphaned-analysis/` | 113 | Complete |
| FHIR Service | `fhir-analysis/` | TBD | In Progress |
| Mapper | `mapper-analysis/` | TBD | Planned |
| Infrastructure | `infra-analysis/` | TBD | Planned |
| Community & DevEx | `community-analysis/` | TBD | Planned |
| Remainder | `remainder-analysis/` | TBD | Planned |
