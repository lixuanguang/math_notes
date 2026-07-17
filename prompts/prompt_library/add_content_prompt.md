# Add Content Prompt

```text
I am working in:
/Users/lxg/Documents/GitHub/math_notes

I attached screenshots, source images, PDFs, or exact source files from a mathematics text. Inspect the repository and choose the best target under the current `parts/` structure. Use `STRUCTURE_MIGRATION_README.md` as the placement and ownership reference.

The goal is final-quality source-grounded insertion, not rough intake. Shared mathematical, proof, commentary, citation, layout, and validation standards live in `prompts/alignment_requirements.md`; this prompt adds source-intake, placement, and screenshot-ledger rules.

Configuration:
- MODE: edit
- SCOPE_LEVEL: <part | section | subsection | file>
- TARGET: <exact parts/... path, unambiguous part-scoped cursor, or "auto-place from SOURCE_MATERIAL">
- START_CURSOR: beginning
- FILE_COVERAGE: changed-and-new
- RUN_BATCH: one-numbered-file
- PASS_MODE: <first-pass | gap-fill | second-pass>
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
1. Read `prompts/alignment_requirements.md` completely and treat it as canonical except where this prompt is stricter. This prompt overrides `prompts/alignment_requirements.md` on building: do not run a LaTeX build.
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

Manual screenshot intake loop:
1. Inspect all screenshots in order first. Treat them as the source ledger, not as a vague topic suggestion.
2. Group the screenshots into coherent source blocks: definitions, results, proofs, methods, examples, algorithms, figures, exercises, or outline material.
3. Resolve the natural owner from the active `parts/` tree. With `TARGET: auto-place from SOURCE_MATERIAL`, choose the best existing part/section/subsection from the screenshots and repository structure.
4. Select exactly one numbered subsection file for the active batch. If `START_CURSOR` names a file, start there; otherwise choose the first source-supported numbered file in active order. Do not spread one run across several numbered files.
5. Compare the source ledger against that file and nearby prerequisites. For each source block, classify the status as `covered`, `partial`, `missing`, `misplaced`, `unsupported`, or `needs later file`.
6. Edit only `partial`, `missing`, or locally `misplaced` material for the active file. Leave covered material unchanged unless a tiny local amendment is needed to integrate a new block.
7. After each inserted or materially amended block, run the final-quality loop below before moving to the next block.
8. If the screenshots still contain usable material for earlier files, run another `gap-fill` or `second-pass` batch starting at the earliest affected file. Do not advance to later files merely because the source set is long.
9. Do not advance past the last file actually supported by SOURCE_MATERIAL. Report the next cursor, and explicitly say when later files need new source material.

PASS_MODE meanings:
- `first-pass`: place the main supported material for the chosen numbered file at final local quality.
- `gap-fill`: compare screenshots against existing additions and add only genuinely missing source-supported content.
- `second-pass`: restart from the earliest affected numbered file and catch omissions from the same source set; do not duplicate first-pass coverage.

Final-quality loop for every inserted or touched environment:
1. Apply the complete canonical row workflow and Sections 5.1-5.5 of `prompts/alignment_requirements.md` to each new or materially touched block.
2. Treat SOURCE_MATERIAL as the hard support boundary. Formalize and complete what the source plus earlier repository results support; do not invent missing hypotheses, examples, proof steps, convergence claims, complexity bounds, or implementation details.
3. Re-read the source block, the LaTeX preamble, each statement item, and each proof item separately. The final block must be self-contained at the local level, source-supported, itemized only when semantically needed, and proof-complete when written as a theorem-style result.
4. Use source-supported compact local notation when it removes repeated setup or repairs layout. If layout still fails, follow the repair order in Section 5.5 before retaining any display exception.
5. Run the standard gates on the active numbered file after each batch and `git diff --check`. If `BUILD: yes`, build and inspect edited line ranges for overfull/underfull warnings; if `BUILD: no`, report that this visual check was intentionally skipped.
6. Fix every current-edit gate hit and distinguish genuinely pre-existing hits in the report. Do not leave a block that would require a later targeted-refinement pass just to reach canonical quality.

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
1. Add a polished, compact, source-grounded integration, not a full textbook transcription.
2. Preserve source-supported coverage; mark genuine uncertainty with concise comments such as `% TODO(source): verify ...`.
3. Use existing theorem environments, macros, labels, and nearby style. Use `\hlt{...}` for result titles when local style does.
4. Prefer concise definitions, propositions, lemmas, corollaries, examples, methods, remarks, and algorithms only when the source and existing repo content support them.
5. Do not invent missing inputs, outputs, hypotheses, convergence claims, complexity bounds, implementation details, examples, or proof steps. If a theorem-style proof cannot be completed from the source plus earlier repository results, do not promote it to a theorem-style result; use a source TODO, remark, or report the blocker.
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

Canonical quality reminders:
1. Do not over-expand beyond the provided material, but do not leave rough transcription when the source supports a clean formal block.
2. Apply `prompts/alignment_requirements.md` Sections 5.1-5.5 directly, especially self-contained theorem-style and method preambles, factored setup, semantic enumeration, statement/proof item matching, proof completeness, required commentary, result-reference language, and inline layout.
3. For methods, enumerate only actual executable solving steps. Cases, definitions, summaries, and interpretation stay in prose or formulas.
4. `prompts/prompt_library/formalize_content.md` is for later wider-scope review and build verification, not for rescuing rough new blocks from this prompt.

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
- PASS_MODE and active numbered file;
- files changed;
- main definitions, results, examples, methods, algorithms, figures, or source notes added;
- extracted source blocks grouped by classification when that clarifies coverage;
- coverage ledger summary: covered, partial, missing, misplaced, unsupported, and needs-later-file blocks;
- existing material cross-referenced instead of duplicated;
- any exercises or questions integrated;
- any uncertainties, gaps, TODOs, or blocked section/part needs;
- exact next cursor and whether another pass over earlier numbered files is needed;
- final-quality confirmation for new/touched environments: preambles self-contained, proof items matched, notation audit done, standard gates clean for current edits, and no rough block deferred to later formalization;
- build/log status for edited line ranges when BUILD is enabled, or an explicit BUILD-disabled note;
- whether uncommitted edits were detected and preserved;
- build action taken or intentionally skipped according to `BUILD`, and confirmation that no staging, commit, push, reset, checkout, revert, delete, or clean action was performed.
```

After this prompt, use `prompts/prompt_library/reorganize_content_prompt.md` or `prompts/prompt_library/dependency_flow_prompt.md` if placement or prerequisite order is still uncertain. Use `prompts/prompt_library/formalize_content.md` for later wider-scope review and build verification, not as a substitute for finalizing the new source-grounded blocks here.
