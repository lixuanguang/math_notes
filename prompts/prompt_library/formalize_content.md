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
- INLINE_LINE_BUDGET: 100-rendered-visible-characters
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
5. `prompts/standards/validation.md` (fast formalization profile).
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
2. Apply RUN_BATCH. For a file target, use that file; otherwise choose only the next active numbered subsection at START_CURSOR. Build a compact source-order ledger containing row identity/type/domain, proof or commentary status when applicable, and action.
3. Make one semantic pass in source order. For each changed row, enforce explicit claims, correct environment and authority, complete proof obligations, scoped notation, the domain overlay, and source limits. Keep patches atomic; do not emit per-row progress messages.
4. Apply the 100-character preflight in `math_layout.md` to every changed prose–inline-math span. Count rendered-visible content, including the printed form of references/citations, not LaTeX command names, braces, or label keys. Split or compress semantically when over budget; never omit needed assumptions or conclusions.
5. Cold-read only changed rows and rows whose authority, notation, reference, or placement they affect. Run applicable search gates and `git diff --check` once after the file stabilizes.
6. Run exactly one isolated full build and render the affected pages once. Inspect overfull boxes near changed lines and the changed blocks. Rebuild or rerender only when this final pass finds an actual current-edit overflow, collision, broken reference, or unreadable visual.
7. Stop at the active file boundary and report the next cursor.

Final report: scope/domain/file and next cursor; rows changed and substantive proof/environment/notation/source decisions; display/matrix/figure exceptions; 100-character preflight, search, diff, single-build, log, and one-pass render results; preserved unrelated work and genuine blockers.
```

For existing edits/new files only, use `FILE_COVERAGE: changed-and-new`. Use `COMMENTARY_POLICY: required-all-reviewed` when every reviewed theorem-style result needs the commentary pair. Keep `RUN_BATCH: one-numbered-file` unless the selected scope is already one small file and the user explicitly accepts a broader batch.
