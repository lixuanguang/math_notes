# Reorganize Content — Entry Point

```text
Repository: /Users/lxg/Documents/GitHub/math_notes

Goal: make placement, source ownership, file order, domain ownership, and hierarchy ready for dependency review and later formalization. This is a structural pass, not a prose rewrite.

Configuration:
- MODE: edit
- SCOPE_LEVEL: <part | section | subsection | file>
- DOMAIN: <auto | math | quant-finance | fundamental-finance | physics | mixed>
- TARGET: <exact parts/... path or unambiguous active-tree cursor>
- START_CURSOR: <beginning | exact resume file>
- FILE_COVERAGE: <all-active | changed-and-new | tracked-modified | untracked-new>
- RUN_BATCH: one-numbered-file
- CONTENT_POLICY: refine-only
- ALLOW_NEW_SUBSECTION: <no | yes only when explicitly approved>
- ALLOW_NEW_SECTION_OR_PART: no
- BUILD: no

Load before editing:
1. `prompts/standards/repository_and_scope.md`.
2. `prompts/standards/structure/organization_and_dependencies.md`.
3. `prompts/standards/structure/collection_quality.md`.
4. `prompts/standards/validation.md` (structural-only profile).
5. `prompts/standards/domains/README.md`, then only the configured or candidate-block domain overlay(s).
6. Load `prompts/standards/layout/figures.md` when moving/placing figures and `prompts/standards/structure/notation_lifecycle.md` when notation ownership changes.

Execution:
1. Run `git status --short`; read `STRUCTURE_MIGRATION_README.md`, `math.tex`, `parts/base.tex`, relevant part/section overviews, target files, and nearby files required to resolve owners, placeholders, prerequisites, labels, notation, and figures.
2. Resolve active input order and exact batch. Prefer one topic, one section/subsection, 1–3 source files, and roughly 300–500 lines unless the user explicitly requests broader movement.
3. Audit natural ownership, placeholders, files emptied by the proposed move, future-facing titles, promotion candidates, mixed-domain separation, prerequisite order, duplicate content/labels, equation/TODO ownership, examples/intuitions/applied context, and figure-role placement.
4. Before a nontrivial move, report a compact proposed movement map: source block, destination, reason, placeholder/title treatment, promotion/permission status, domain split, labels/references, notation/context, figures, and ambiguous items needing review.
5. Move complete logical blocks. Preserve statements, proofs, examples, commentary, algorithms, and figures verbatim except necessary local glue, input edges, and explicitly reported label/reference repairs. Do not formalize, complete proofs, normalize display math, or add theory in this pass.
6. Preserve active empty placeholders and broad durable titles. Deprecate only a file emptied by this authorized move when it is no longer a natural future owner.
7. If promotion needs an unauthorized new section/part, continue safe same-level work and report the exact proposed location.
8. Run structural validation: active order, labels/references, inputs, figure proximity/context, provenance, domain authority, notation scope, equation anchors, typed TODOs, and placeholder/title preservation. Do not build.

Final report: files/blocks moved; destination rationale; domain/owner decisions; placeholders/titles preserved or changed; promotion blockers; labels/references/inputs updated; figure, notation, equation, TODO, provenance, and collection decisions; remaining blockers; and confirmation that content remained verbatim apart from reported glue/reference edits and that no build or Git publication action occurred.
```
