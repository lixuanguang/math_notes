# Add Content Prompt

```text
I am working in:
/Users/lxg/Documents/GitHub/math_notes

I attached screenshots, source images, PDFs, or exact source files from a mathematics text. Inspect the repository and choose the best target under the current `parts/` structure. Use `STRUCTURE_MIGRATION_README.md` as the placement and ownership reference.

The goal is final-quality source-grounded insertion, not rough intake. Shared mathematical, proof, commentary, citation, layout, source-provenance, collection-level, and validation standards live in `prompts/alignment_requirements.md`; this prompt adds source-intake, placement, and screenshot-ledger rules.

Configuration:
- MODE: edit
- SCOPE_LEVEL: <part | section | subsection | file>
- TARGET: <exact parts/... path, unambiguous part-scoped cursor, or "auto-place from SOURCE_MATERIAL">
- START_CURSOR: beginning
- FILE_COVERAGE: changed-and-new
- RUN_BATCH: all-source-supported
- PASS_MODE: <first-pass | second-pass>
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
1. Read `prompts/alignment_requirements.md` completely and treat it as canonical except where this prompt is stricter. This prompt overrides `prompts/alignment_requirements.md` on building and source-intake batching: do not run a LaTeX build, and do not stop after only one numbered subsection file when SOURCE_MATERIAL supports more allowed placements.
2. Use only SOURCE_MATERIAL and existing repository content. Do not search online, browse, or add unsupported material from memory.
3. Do not stage, commit, push, reset, checkout, restore, revert, delete files, clean the worktree, or edit generated PDF/auxiliary files.
4. Assume unrelated uncommitted edits may exist from parallel runs. Preserve them. Before editing, run `git status --short`, inspect the target files, and use focused patches only.
5. Never overwrite a whole file. Never remove existing content unless it is a tiny directly related duplicate; explain any such removal. If a target file changed unexpectedly or a patch does not apply cleanly, stop and report the conflict.

Required reading before placement:
1. Read `STRUCTURE_MIGRATION_README.md`, `math.tex`, and `parts/base.tex`.
2. Read the relevant part and section `overview.tex` files.
3. Read nearby subsection files for style, notation, labels, figures, algorithms, and existing coverage.
4. Check for existing related definitions, results, examples, `proofmethod`, `computationmethod`, legacy `method`, algorithms, notation, and figures so you can cross-reference or extend rather than duplicate.
5. If the source contains an algorithm, pseudocode, or step-by-step computational procedure, inspect nearby algorithm usage before choosing the format.

Manual screenshot intake loop:
1. Inspect all screenshots in order first. Treat them as the source ledger, not as a vague topic suggestion.
2. Group the screenshots into coherent source blocks: definitions, results, proofs, methods, examples, algorithms, figures, exercises, or outline material.
3. Resolve the natural owner from the active `parts/` tree. With `TARGET: auto-place from SOURCE_MATERIAL`, choose the best existing part/section/subsection from the screenshots and repository structure.
4. Build a complete source-to-target plan before editing. Include every source block with an allowed existing owner or an allowed new subsection; record each block as `source-stated`, `source-derived`, or `repo-derived` when applicable; use active `\input` order for the target files, not screenshot order, when editing.
5. With `RUN_BATCH: all-source-supported`, process every planned target file in the same run. Do not ask whether to continue to the next subsection, section, or part. Continue until all source-supported, permission-allowed blocks are classified and integrated or explicitly reported as blocked.
6. If a source block naturally requires a new section or part, do not stop to ask mid-run. Mark that block `blocked-new-section-or-part`, continue with the remaining allowed blocks, and report the exact proposed higher-level location.
7. For each planned target file, compare the source ledger against that file and nearby prerequisites. Classify each source block as `covered`, `partial`, `missing`, `misplaced`, `unsupported`, `needs later file`, or `blocked-new-section-or-part`.
8. Edit only `partial`, `missing`, or locally `misplaced` material for the active planned target. Leave covered material unchanged unless a tiny local amendment is needed to integrate a new block.
9. After each inserted or materially amended block, run the final-quality loop below before moving to the next block. After each target file, run the current-edit gates for that file, then proceed to the next planned target without asking for approval.
10. Do not advance past the last file actually supported by SOURCE_MATERIAL. If later files need new source material, report that as a source boundary, not as a continuation prompt.

PASS_MODE meanings:
- `first-pass`: place all supported material from SOURCE_MATERIAL across every allowed target file at final local quality.
- `second-pass`: rerun over the same SOURCE_MATERIAL from the earliest affected target, compare against the current LaTeX state, and add only genuinely missing or still-partial source-supported content. Explicitly check for duplicated prose, repeated theorem payloads, and first-pass material that should be compressed, merged, or cross-referenced instead of repeated.

Final-quality loop for every inserted or touched environment:
1. Apply the complete canonical row workflow and Sections 5.1-7.7 of `prompts/alignment_requirements.md` to each new or materially touched block.
2. Treat SOURCE_MATERIAL as the hard support boundary. Formalize and complete what the source plus earlier repository results support; do not invent missing hypotheses, examples, proof steps, convergence claims, complexity bounds, or implementation details.
3. Re-read the source block, the LaTeX preamble, each statement item, each typed-method step, each example/remark/expository role, and each proof item separately. The final block must be self-contained at the local level, source-supported, itemized only when semantically needed, in the correct typed-method environment when written as a method, role-complete when written as an example, remark, motivation, perspective, principle, process, exercise, or question-bank item, and proof-complete when written as a theorem-style result.
4. Keep theorem-style statements source-proportional. Do not move proof scaffolding, Picard iteration machinery, local construction constants, or proof-only error estimates into the statement unless the source presents them as reusable conclusions.
5. Run the semantic deduplication and bundled-data ordering checks from `prompts/alignment_requirements.md`: no adjacent clause may repeat the same quantifier, scope, hypothesis, induction assumption, or conclusion in both prose and notation, and no map may use a derived domain before that domain is defined.
6. Use source-supported compact local notation when it removes repeated setup or repairs layout. If layout still fails, follow the repair order in Section 5.5 before retaining any display exception.
7. Run the standard gates on each active planned target file after its current edits and run `git diff --check`. If `BUILD: yes`, build and inspect edited line ranges for overfull/underfull warnings; if `BUILD: no`, report that this visual check was intentionally skipped.
8. Apply collection-level checks locally: orientation text only where structural, new notation scoped at the smallest durable level, source-supported examples/counterexamples placed near the definitions they test, equation labels only when referenced, and TODO comments typed and reported.
9. Fix every current-edit gate hit and distinguish genuinely pre-existing hits in the report. Do not leave a block that would require a later targeted-refinement pass just to reach canonical quality.

Classify the sources first:
1. Contents or outline only: do not edit. Give a concise coverage and placement audit.
2. Substantive pages: integrate conservatively.
3. Mixed: use contents pages only for placement and coverage; integrate only what the substantive pages support.
4. For substantive material, extract and classify supported formulas, definitions, claims, theorems, propositions, lemmas, corollaries, examples, counterexamples, nonexamples, typed methods, remarks, motivations, perspectives, principles, processes, exercises, diagrams, tables, proof ideas, notation, and prerequisites before choosing the insertion point.
5. Report ambiguous classifications before insertion instead of silently forcing them into an environment.

Placement rules:
1. Prefer an existing subsection file whenever reasonable.
2. Add a new numbered subsection only when the material clearly does not fit an existing subsection.
3. Do not create a new section or part. If one seems necessary, classify the affected source block as `blocked-new-section-or-part`, continue all other allowed blocks, and report the exact proposed location.
4. Do not create broad skeletons, placeholder files, or empty future headings.
5. Keep visible depth exactly `\part`, `\section`, `\subsection`; do not add book-body `\subsubsection` or `\paragraph`.
6. If a new subsection file is added, update only the necessary `overview.tex` or active `\input` edge.
7. Keep prerequisites before dependants and prefer structurally correct placement over local prerequisite patches.

Integration style:
1. Add a polished, compact, source-grounded integration, not a full textbook transcription.
2. Preserve source-supported coverage; mark genuine uncertainty with concise comments such as `% TODO(source): verify ...`.
3. Use existing theorem environments, macros, labels, and nearby style. Use `\hlt{...}` for result titles when local style does.
4. Prefer concise definitions, propositions, lemmas, corollaries, examples, typed methods, remarks, motivations, perspectives, principles, processes, exercises, question-bank items, and algorithms only when the source and existing repo content support them. Use `proofmethod` for transferable proof patterns and `computationmethod` for transferable computations, constructions, approximations, diagnostics, or algorithm previews. Use legacy `method` only for justified hybrid/other cases.
5. When adding a theorem, lemma, proposition, corollary, example, or algorithm, compare it against existing `proofmethod`, `computationmethod`, and legacy `method` blocks in the nearby owner and prerequisites. If the new source-supported material provides a reusable proof route, construction, diagnostic, verification check, limitation, or selection cue, extend the existing method or add the smallest appropriate typed method instead of duplicating that prose inside multiple results.
6. Do not invent missing inputs, outputs, hypotheses, convergence claims, complexity bounds, implementation details, examples, or proof steps. If a theorem-style proof cannot be completed from the source plus earlier repository results, do not promote it to a theorem-style result; use a source TODO, remark, or report the blocker.
7. Do not closely paraphrase long textbook passages. Write original notes in the repository's style.
8. Use stable descriptive labels such as `def:...`, `prop:...`, `lem:...`, `ex:...`, `meth:...`, `alg:...`, and `fig:...`.
9. For exercises or questions, integrate only useful supported mathematics; otherwise leave at most a concise TODO/source note.
10. Add TikZ figures only when a diagram is mathematically useful. Do not reproduce text screenshots or decorative figures.
11. Update notation files only for notation that will recur across major sections. Keep local notation near first use and do not let proof-local notation leak into later blocks.
12. Add source-supported examples, nonexamples, counterexamples, or test computations when they clarify major definitions or hypotheses. Each nontrivial example must identify what it illustrates, bind exact data, verify the property or failure, and state the takeaway. Do not invent examples during screenshot intake.
13. Keep remarks, motivations, perspectives, principles, processes, exercises, and question-bank items within the roles in `prompts/alignment_requirements.md` Section 5.7. Promote hidden results, methods, algorithms, definitions, notation, or prerequisites before later use.
14. Number and label equations only when they are referenced later or central enough to need an anchor; otherwise keep formulas inline or unnumbered according to `MATH_LAYOUT`.

Algorithms:
1. Prefer a prose `computationmethod` environment for short conceptual computational procedures.
2. Use `breakablealgorithm` with `algorithmic` only when actual step-by-step pseudocode is useful and supported by the source. If the content is a reusable computational idea but not executable pseudocode, keep it as a `computationmethod`.
3. Follow nearby repository style, for example `\begin{breakablealgorithm}`, `\caption{...}`, `\begin{algorithmic}`, `\Require`, `\Ensure`, and `\State`.
4. Keep algorithms compact and mathematically focused; do not transcribe long textbook pseudocode mechanically.

Canonical quality reminders:
1. Do not over-expand beyond the provided material, but do not leave rough transcription when the source supports a clean formal block.
2. Apply `prompts/alignment_requirements.md` Sections 5.1-7.7 directly, especially source-proportional theorem-style statements, self-contained theorem-style and typed-method preambles, factored setup, bundled-data ordering, semantic deduplication, semantic enumeration, statement/proof item matching, proof completeness, example/remark/expository environment roles, required commentary, result-reference language, inline layout, source provenance, notation lifecycle, examples/counterexamples, equation numbering, and TODO discipline.
3. For methods, first choose `proofmethod`, `computationmethod`, or justified legacy `method`, then extract the problem type, data, target, entry cue, approach choice, operative steps, verification check, and reusable limitation/transfer point supported by the source. Apply proof-method standards to proof routes and computation-method standards to constructions, computations, approximations, diagnostics, and algorithm previews. Enumerate only actual solving steps; cases, definitions, summaries, and interpretation stay in prose or formulas.
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
- PASS_MODE and all active planned target files processed;
- files changed;
- main definitions, results, examples/counterexamples/nonexamples, typed methods, remarks, motivations, perspectives, principles, processes, exercises/question-bank items, algorithms, figures, or source notes added;
- method environment and approach decisions: `proofmethod`/`computationmethod`/legacy `method` choices, existing methods extended or cross-referenced, problem types, entry cues, selected approaches, verification checks, and alternatives intentionally omitted as unsupported;
- example/remark/expository decisions: examples' targets and checks, counterexample failures, remarks kept as non-authoritative, and any hidden content promoted to a formal owner;
- extracted source blocks grouped by classification and provenance when that clarifies coverage;
- coverage ledger summary: covered, partial, missing, misplaced, unsupported, and needs-later-file blocks;
- existing material cross-referenced instead of duplicated;
- any exercises or questions integrated;
- any uncertainties, gaps, TODOs, or blocked section/part needs;
- collection-level decisions: overview/input updates, notation lifecycle, examples/counterexamples, equation labels, and TODO taxonomy;
- completion cursor, source-boundary status, and whether a later `second-pass` over the same SOURCE_MATERIAL is recommended;
- final-quality confirmation for new/touched environments: preambles self-contained, proof items matched, notation audit done, standard gates clean for current edits, and no rough block deferred to later formalization;
- build/log status for edited line ranges when BUILD is enabled, or an explicit BUILD-disabled note;
- whether uncommitted edits were detected and preserved;
- build action taken or intentionally skipped according to `BUILD`, and confirmation that no staging, commit, push, reset, checkout, revert, delete, or clean action was performed.
```

After a first pass, rerun this prompt with `PASS_MODE: second-pass` when you want to catch additional supported content from the same SOURCE_MATERIAL. Then use `prompts/prompt_library/reorganize_content_prompt.md` or `prompts/prompt_library/dependency_flow_prompt.md` if placement or prerequisite order is still uncertain. Use `prompts/prompt_library/formalize_content.md` for later wider-scope review and build verification, not as a substitute for finalizing the new source-grounded blocks here.
