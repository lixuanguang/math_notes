# Formalize Content — Entry Point

```text
Repository: /Users/lxg/Documents/GitHub/math_notes

Goal: align the selected active LaTeX scope to the repository's canonical scholarly, technical, mathematical, structural, and rendered standard.

Configuration:
- MODE: edit
- SCOPE_LEVEL: <part | section | subsection | file>
- DOMAIN: <auto | registered domain from prompts/standards/domains/README.md | mixed>
- TARGET: <exact parts/... path or unambiguous active-tree cursor>
- START_CURSOR: <beginning | exact resume file>
- FILE_COVERAGE: <all-active | changed-and-new | tracked-modified | untracked-new>
- RUN_BATCH: one-numbered-file
- MATH_LAYOUT: inline-strict
- COMMENTARY_POLICY: required-new-and-rewritten
- PROOF_REFERENCE_POLICY: earlier-theorem-style-only
- PROOF_COMPLETENESS: full
- PROOFLESS_EXCEPTIONS: none
- CONTENT_POLICY: refine-only
- SOURCE_MATERIAL: <none | exact provided files/pages>
- ALLOW_NEW_SUBSECTION: no
- ALLOW_NEW_SECTION_OR_PART: no
- ALLOW_NEW_ENVIRONMENT_OR_FIGURE_TYPE: no
- BUILD: yes

Load before editing:
1. `prompts/standards/repository_and_scope.md`.
2. `prompts/standards/layout/math_layout.md` — mandatory; preserve all inline/display and no-overflow requirements.
3. `prompts/standards/structure/organization_and_dependencies.md`.
4. `prompts/standards/structure/collection_quality.md`.
5. `prompts/standards/validation.md` (full semantic and render profile).
6. Domain overlays: for one explicit DOMAIN, resolve only its row in `prompts/standards/domains/README.md`; for auto/mixed, read the router and load only ledger matches.

After the initial target census, load every applicable conditional module before editing its first matching row:
- mathematical prose/definition/result/calculation/notation -> `prompts/standards/writing/mathematical_style.md`;
- theorem/proof -> `prompts/standards/writing/theorems_and_proofs.md`;
- method/process/algorithm -> `prompts/standards/writing/methods_and_algorithms.md`;
- example/counterexample/intuition/remark/motivation/perspective/principle/exercise/qnbank -> `prompts/standards/writing/expository_environments.md`;
- assumption/convention/model/law/derivation/approximation/dimensionalcheck/empiricalstudy/valuationcase/warning -> `prompts/standards/writing/applied_environments.md`;
- figure/plot/diagram/image/table-like visual -> `prompts/standards/layout/figures.md`;
- durable notation, collision, or macro ownership -> `prompts/standards/structure/notation_lifecycle.md`;
- supplied source material -> `prompts/standards/sources/source_grounding.md`.

Execution:
1. Run `git status --short`; read `STRUCTURE_MIGRATION_README.md`, `math.tex`, `parts/base.tex`, relevant notation/overview/target/prerequisite files, and resolve active input order and exact coverage.
2. Apply RUN_BATCH before editing. For a file target, use that file. Otherwise choose only the next active numbered subsection file at START_CURSOR. The wider TARGET defines traversal, not permission to dilute row-level review.
3. Build the complete source-order ledger required by `repository_and_scope.md`. Classify domain and load conditional modules before processing rows.
4. Process one row at a time through the explicit-formal-notation-succinct loop, environment-role standard, earlier-result authority check, layout rules, domain overlay, and adversarial review. Migrate clear legacy `method` blocks; convert refutational `example` blocks; promote hidden prerequisites; classify materially touched figures. Do not add unrelated theory; when SOURCE_MATERIAL is supplied, keep every new claim within that source and earlier active repository support.
5. Keep patches atomic and emit one compact progress checkpoint per row.
6. After the first pass, perform a cold second pass over every ledger row. Recount claims/components; recheck proof obligations, commentary syntax/quality, environment roles, notation scope, source authority, domain context, displays/matrices, figures, and page layout.
7. Run all applicable search gates, `git diff --check`, an isolated full build, edited-line log inspection, and readable page-by-page render inspection. Fix every current-edit defect, including any changed equation or inline formula that overflows or packs badly.
8. Stop at the active file boundary. Report the exact next cursor without repeating completed files.

Final report:
- resolved wider scope, DOMAIN, active file, coverage, and next cursor;
- ledger counts: reviewed, rewritten, retained, split, and proofless exceptions;
- files changed and material mathematical/structural/environment changes;
- method migrations, expository/applied role repairs, proof additions/completions, proof-reference changes, and commentary coverage/syntax;
- notation lifecycle, provenance if applicable, equation/TODO/figure decisions, display and matrix exceptions;
- cold-pass, search, diff, build, edited-line warning, and page-render results;
- preserved pre-existing work and genuine blockers.
```

For existing edits/new files only, use `FILE_COVERAGE: changed-and-new`. Use `COMMENTARY_POLICY: required-all-reviewed` when every reviewed theorem-style result needs the commentary pair. Keep `RUN_BATCH: one-numbered-file` unless the selected scope is already one small file and the user explicitly accepts a broader batch.
