# Dependency Flow — Entry Point

```text
Repository: /Users/lxg/Documents/GitHub/math_notes

Goal: audit and repair prerequisite, notation/context-before-use, authority, and reference flow after broad organization is stable.

Configuration:
- MODE: edit
- SCOPE_LEVEL: <part | section | subsection | file>
- DOMAIN: <auto | math | computer-science | electronic-engineering | quant-finance | fundamental-finance | physics | mixed>
- TARGET: <exact parts/... path or unambiguous active-tree cursor>
- START_CURSOR: <beginning | exact resume file>
- FILE_COVERAGE: <all-active | changed-and-new | tracked-modified | untracked-new>
- RUN_BATCH: one-numbered-file
- CONTENT_POLICY: refine-only
- ALLOW_NEW_SUBSECTION: no
- ALLOW_NEW_SECTION_OR_PART: no
- BUILD: no

Load before editing:
1. `prompts/standards/repository_and_scope.md`.
2. `prompts/standards/structure/organization_and_dependencies.md`.
3. `prompts/standards/structure/collection_quality.md`.
4. `prompts/standards/validation.md` (structural-only profile).
5. `prompts/standards/domains/README.md`, then only the configured or affected-block domain overlay(s).
6. Load `prompts/standards/structure/notation_lifecycle.md` for notation findings and `prompts/standards/layout/figures.md` for figure-dependent findings.

Execution:
1. Run `git status --short`; read `STRUCTURE_MIGRATION_README.md`, `math.tex`, `parts/base.tex`, relevant notation and overview files, TARGET, earlier active prerequisites, and nearby owners.
2. Resolve active input order and domain per affected block.
3. Perform the complete dependency audit in `organization_and_dependencies.md`, including authority type, local notation leakage, domain context, hidden prerequisites, equation order, figure-only ownership, and input order.
4. Apply the smallest coherent repair: reorder, move, split, promote, update references, or adjust inputs. Do not hide the problem with a shortcut prerequisite paragraph, add unsupported theory, or perform unrelated prose formalization.
5. Preserve environments intact unless the dependency repair requires a split/promotion. Preserve/reconstruct source provenance for moved source-grounded blocks.
6. If prerequisite machinery is missing outside the authorized source/scope, report the exact blocker. Do not manufacture it.
7. Run structural validation. Confirm every affected dependency now has an earlier authoritative owner; domain context precedes use; no formal block depends on an explanatory/applied/visual-only owner; notation and equations are scoped and ordered; and references/inputs are coherent. Do not build.

Final report: affected path and role; domain classifications; dependencies and earlier owners; notation/context issues; authority promotions/moves; example/intuition/applied/figure placement changes; equation/TODO/label/input repairs; provenance; files changed; validation; remaining blockers; and confirmation that no build or Git publication action occurred.
```
