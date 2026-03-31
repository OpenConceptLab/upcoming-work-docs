# 3. Design System

Three Design-only issues relate to the OCL design system — the shared visual language and reusable component patterns underlying the oclweb3 interface. The design system was never formalized into a standalone library; instead, design tokens and patterns from Zeplin/Figma were implemented directly as React components in oclweb3.

---

### #1381 — Design system (Epic)

- **Created:** 2022-10-11 by @paulsonder
- **Labels:** Design, DS, V3
- **Body:** Empty
- **Assignees:** @paulsonder

This was a placeholder epic for the broader design system initiative. No sub-issues are formally linked in GitHub, though several DS-labeled issues (#1379–#1398) were created in the same batch and are thematically related. In practice, design system work was done in Zeplin/Figma and implemented piecemeal into oclweb3 components.

The oclweb3 codebase now has reusable components (`EntityChip`, `EmptyOverview`, shared form patterns, etc.) but no formal design system library or documentation site.

**Disposition: close-stale** — The epic served its purpose as a tracking placeholder. If a formal design system library is desired in the future, a new ticket with current scope should be created.

---

### #1398 — Table empty states

- **Created:** 2022-10-27 by @paulsonder
- **Labels:** Design, DS
- **Body:** Empty
- **Assignees:** @paulsonder

oclweb3 has `EmptyOverview.jsx` and `RepoEmptyOverview.jsx` components that handle these cases. Empty states have been implemented as needed across the application.

**Disposition: close-stale** — Empty states have been implemented. The ticket body was empty, the work is done at a practical level.

---

### #1960 — Object preview

- **Created:** 2024-10-22 by @jamlung-ri
- **Labels:** Design, V3
- **Assignees:** @paulsonder, @jamlung-ri
- **Body:** Contains detailed mockups

Active design issue with substantive content. Mockups show preview popups appearing on hover over concept, organization, user, and repository objects. Active discussion between @paulsonder and @jamlung-ri covers content requirements, interaction behavior, and additional scope (mapping preview, repo type display, loading state).

NOT yet implemented in oclweb3 — no preview/popover component exists.

**Disposition: keep** — Active design work with clear requirements and mockups. Medium priority future enhancement.

---
