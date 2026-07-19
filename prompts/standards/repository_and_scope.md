# Repository, Scope, and Execution Standard

## Objective and authority

Produce a scholarly and technically correct, explicit, formal where appropriate, notation-aware, succinct, logically ordered, source-honest, and visually sound reference.

Use this editing loop whenever scholarly, mathematical, or technical content is changed:

> Make the content explicit, formalize it, replace repeated boilerplate with readable notation, reuse applicable earlier results, compress without information loss, and verify the rendered result.

Instruction precedence is: the current user request; safety, evidence integrity, and mathematical correctness; the selected prompt-library entry point and its loaded modules; `STRUCTURE_MIGRATION_README.md`, `math.tex`, `parts/base.tex`, and active `parts/` content; nearby style. `prompts/alignment_requirements.md` is a compatibility router, not a competing monolithic prompt.

## Repository ownership

- `parts/` is the only canonical LaTeX body. Do not recreate the retired repo-level `sections/` tree.
- `math.tex` is the document entry point; `parts/base.tex` owns shared macros and environments; `parts/00_notations/` owns durable notation; `STRUCTURE_MIGRATION_README.md` owns placement rules.
- Ignore Lean, `MathNotes/`, and `blueprint/` unless the user includes them.
- Visible book depth is exactly `\part -> \section -> \subsection`. Do not add body `\subsubsection` or `\paragraph` headings.
- Keep overview files structural. Put substantive mathematics in numbered subsection files unless an established nearby convention clearly supports a short orientation paragraph in an overview.
- Extend the natural owner, keep prerequisites before dependants, cross-reference instead of duplicating, and keep figures near their introducing or using text.

## Structure permissions

- Add no empty skeletons or new placeholders.
- A new subsection requires `ALLOW_NEW_SUBSECTION: yes`; a new section or part requires `ALLOW_NEW_SECTION_OR_PART: yes` and explicit user authorization.
- Preserve existing active empty subsection inputs and broad future-facing subsection titles. They may be intentional scaffolding. Remove or deprecate one only when the current authorized reorganization moved its substantive content elsewhere and the old owner is no longer natural.
- Outside-scope edits are limited to necessary input edges, affected labels/references, recurring notation ownership, prerequisite promotion, or paired figure/text repairs. Report them.

## Common configuration semantics

- `MODE`: `edit` unless the entry point or user requests `audit-only`.
- `SCOPE_LEVEL`: `part`, `section`, `subsection`, or `file`, plus workflow-specific values such as `notation-list`.
- `DOMAIN`: `auto`, `mixed`, or one registered value from `prompts/standards/domains/README.md`. The router is the single owner of the domain list.
- `TARGET`: an exact path or unambiguous active-tree cursor.
- `START_CURSOR`: `beginning` or an exact resume file.
- `FILE_COVERAGE`:
  - `all-active`: every `.tex` file reachable through active `\input` edges in scope, including active untracked files;
  - `changed-and-new`: tracked modified plus untracked `.tex` files in scope;
  - `tracked-modified` or `untracked-new`: only that Git-status class.
- `RUN_BATCH`:
  - `one-numbered-file`: complete only the next active numbered subsection file; this is the high-assurance default;
  - `all-source-supported`: source-intake only; process every permission-allowed target supported by the supplied source;
  - `all-selected`: allowed only when the selected scope remains small enough for environment-level review.
- `CONTENT_POLICY`: `refine-only`, `source-grounded`, or a workflow-specific non-content mode such as `recommendation-only`.
- `BUILD`: follow the entry point. Builds must write outside the repository.

Capture the exact coverage set before editing. Inspect inactive untracked files for ownership, but do not activate one without permission. With `DOMAIN: auto`, classify each affected block by its evidence and context; use `mixed` only when more than one domain is genuinely present.

## Safety and dirty-worktree discipline

Before editing, run `git status --short` and read the structural owners, target files, nearby prerequisites, labels, notation, and affected figures required by the entry point.

Preserve all unrelated tracked and untracked work. Do not reset, checkout, restore, revert, clean, delete unrelated files, stage, commit, push, or edit repository-generated PDF/auxiliary files. Use focused patches. Do not overwrite whole content files for a local change. If an overlapping target changes unexpectedly or a patch fails, stop on that file and report the conflict.

## Semantic review protocol

The atomic review unit is a logical environment or figure, not a file, page, grep match, or environment count. For a full formalization or source-intake pass:

1. Traverse active `\input` order.
2. Build a source-order ledger. A theorem-style statement and its immediately following proof form one row; every other formal environment and figure is its own row. For fast formalization, keep only row identity/type/domain, proof or commentary status when applicable, and action; expand a row when changed or blocked.
3. Otherwise record the row's domain, type/label, component or claim count, proof status, required commentary status, figure role where relevant, action, and final page.
4. Process one row at a time: census; explicitness; formalization; notation; earlier-result reuse; compression; environment choice; domain overlay; layout; verification.
5. Rewrite the complete affected environment when a defect is semantic. Do not stop at a surface copyedit or at the longer first explicit draft.
6. Keep patches atomic: normally one row plus its necessary local labels/references.
7. For long full-profile runs, emit compact checkpoints. Fast formalization uses no per-row checkpoint.
8. Full-profile runs cold-read every row in source order. Fast formalization cold-reads changed rows and any row whose authority, notation, reference, or placement they affect.

A successful build and clean searches are necessary but not sufficient; completion is semantic.

Under `refine-only`, preserve intended coverage, repair local defects, and add no unrelated theory. A selected scope authorizes continuous work within its permissions; do not pause after each file unless the configured batch ends there.
