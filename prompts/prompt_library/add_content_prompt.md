# Add Content Prompt

```text
I am working in:
/Users/lxg/Documents/GitHub/math_notes

I attached screenshots, source images, PDFs, or exact source files from a mathematics text. Inspect the repository and choose the best target under the current `parts/` structure. Use `STRUCTURE_MIGRATION_README.md` as the placement and ownership reference.

Configuration:
- MODE: edit
- SCOPE_LEVEL: <part | section | subsection | file>
- TARGET: <exact parts/... path, unambiguous part-scoped cursor, or "auto-place from SOURCE_MATERIAL">
- START_CURSOR: beginning
- FILE_COVERAGE: changed-and-new
- RUN_BATCH: one-numbered-file
- MATH_LAYOUT: inline-strict
- COMMENTARY_POLICY: required-new-and-rewritten
- PROOF_REFERENCE_POLICY: earlier-theorem-style-only
- PROOF_COMPLETENESS: full
- PROOFLESS_EXCEPTIONS: none
- CONTENT_POLICY: source-grounded
- SOURCE_MATERIAL: <exact attached files, screenshots, PDFs, or page ranges>
- ALLOW_NEW_SUBSECTION: yes
- ALLOW_NEW_SECTION_OR_PART: no
- BUILD: no

Authority and safety:
1. Read `prompts/alignment_requirements.md` completely and treat it as canonical except where this prompt is stricter. This source-intake prompt overrides `prompts/alignment_requirements.md` on building: do not run a LaTeX build.
2. Use only SOURCE_MATERIAL and existing repository content. Do not search online, browse, or add unsupported material from memory.
3. Do not stage, commit, push, reset, checkout, restore, revert, delete files, clean the worktree, or edit generated PDF/auxiliary files.
4. Assume unrelated uncommitted edits may exist from parallel runs. Preserve them. Before editing, run `git status --short`, inspect the target files, and use focused patches only.
5. Never overwrite a whole file. Never remove existing content unless it is a tiny directly related duplicate; explain any such removal. If a target file changed unexpectedly or a patch does not apply cleanly, stop and report the conflict.

Required reading before placement:
1. Read `STRUCTURE_MIGRATION_README.md`, `math.tex`, and `parts/base.tex`.
2. Read the relevant part and section `overview.tex` files.
3. Read nearby subsection files for style, notation, labels, figures, algorithms, and existing coverage.
4. Check for existing related definitions, results, examples, methods, algorithms, notation, and figures so you can cross-reference or extend rather than duplicate.
5. If the source contains an algorithm, pseudocode, or step-by-step computational procedure, inspect nearby algorithm usage before choosing the format.

Classify the sources first:
1. Contents or outline only: do not edit. Give a concise coverage and placement audit.
2. Substantive pages: integrate conservatively.
3. Mixed: use contents pages only for placement and coverage; integrate only what the substantive pages support.
4. For substantive material, extract and classify supported formulas, definitions, claims, theorems, propositions, lemmas, corollaries, examples, methods, remarks, exercises, diagrams, tables, proof ideas, notation, and prerequisites before choosing the insertion point.
5. Report ambiguous classifications before insertion instead of silently forcing them into an environment.

Placement rules:
1. Prefer an existing subsection file whenever reasonable.
2. Add a new numbered subsection only when the material clearly does not fit an existing subsection.
3. Do not create a new section or part. If one seems necessary, stop and ask.
4. Do not create broad skeletons, placeholder files, or empty future headings.
5. Keep visible depth exactly `\part`, `\section`, `\subsection`; do not add book-body `\subsubsection` or `\paragraph`.
6. If a new subsection file is added, update only the necessary `overview.tex` or active `\input` edge.
7. Keep prerequisites before dependants and prefer structurally correct placement over local prerequisite patches.

Integration style:
1. Add a polished but compact first-pass integration, not a full textbook transcription.
2. Preserve source-supported coverage; mark genuine uncertainty with concise comments such as `% TODO(source): verify ...`.
3. Use existing theorem environments, macros, labels, and nearby style. Use `\hlt{...}` for result titles when local style does.
4. Prefer concise definitions, propositions, lemmas, corollaries, examples, methods, remarks, proof ideas, and algorithms only when the source supports them.
5. Do not invent missing inputs, outputs, hypotheses, convergence claims, complexity bounds, implementation details, examples, or proof steps.
6. Do not closely paraphrase long textbook passages. Write original notes in the repository's style.
7. Use stable descriptive labels such as `def:...`, `prop:...`, `lem:...`, `ex:...`, `meth:...`, `alg:...`, and `fig:...`.
8. For exercises or questions, integrate only useful supported mathematics; otherwise leave at most a concise TODO/source note.
9. Add TikZ figures only when a diagram is mathematically useful. Do not reproduce text screenshots or decorative figures.
10. Update notation files only for notation that will recur across major sections.

Algorithms:
1. Prefer a prose `method` environment for short conceptual procedures.
2. Use `breakablealgorithm` with `algorithmic` only when actual step-by-step pseudocode is useful and supported by the source.
3. Follow nearby repository style, for example `\begin{breakablealgorithm}`, `\caption{...}`, `\begin{algorithmic}`, `\Require`, `\Ensure`, and `\State`.
4. Keep algorithms compact and mathematically focused; do not transcribe long textbook pseudocode mechanically.

Formalization level:
1. This is source intake, so do not over-expand beyond the provided material.
2. Still bind local symbols, hypotheses, domains, and conclusions clearly.
3. Use notation-driven prose where natural: `\forall`, `\exists`, maps, set-builder notation, implications, equivalences, and explicit bounds.
4. If a full proof is present and source-supported, integrate it compactly. If only a proof idea is supported, label it honestly as a proof idea or leave a TODO rather than inventing a proof.
5. Leave deeper environment-by-environment formalization to a later run with `prompts/prompt_library/formalize_content.md`.

Planning-only report:
If the sources are only contents or outline pages, report:
- what the source appears to cover;
- best existing `parts/...` locations;
- already covered, partially covered, and missing material;
- whether no new structure, a new subsection, a new section, or a new part seems appropriate;
- the exact proposed location if a new subsection is recommended.

Edit report:
If edits were made, report:
- chosen target and why;
- files changed;
- main definitions, results, examples, methods, algorithms, figures, or source notes added;
- extracted source blocks grouped by classification when that clarifies coverage;
- existing material cross-referenced instead of duplicated;
- any exercises or questions integrated;
- any uncertainties, gaps, TODOs, or blocked section/part needs;
- whether uncommitted edits were detected and preserved;
- that no build, staging, commit, push, reset, checkout, revert, delete, or clean action was performed.
```

After source intake, use `prompts/prompt_library/reorganize_content_prompt.md` or `prompts/prompt_library/dependency_flow_prompt.md` if placement or prerequisite order is still uncertain. Then run `prompts/prompt_library/formalize_content.md` on the changed/new files with `FILE_COVERAGE: changed-and-new` when you want full environment-level formalization and build verification.
