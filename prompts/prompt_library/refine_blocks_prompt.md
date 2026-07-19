# Refine Blocks Prompt

```text
I am working in:
/Users/lxg/Documents/GitHub/math_notes

Refine only the theorem, lemma, proposition, corollary, proof, definition, `method`, `proofmethod`, `computationmethod`, algorithm, figure, example, counterexample, intuition, assumption, convention, model, law, derivation, approximation, dimensional check, empirical study, valuation case, warning, remark, motivation, perspective, principle, process, exercise, or question-bank blocks visible in the attached screenshots or explicitly named by the user. Do not perform source intake, broad file formalization, or unrelated cleanup.

Configuration:
- MODE: edit
- TARGET: <exact parts/... file and block/label, or screenshot-selected block>
- MATH_LAYOUT: inline-strict
- COMMENTARY_POLICY: required-new-and-rewritten
- PROOF_REFERENCE_POLICY: earlier-theorem-style-only
- PROOF_COMPLETENESS: full
- BUILD: yes

Safety:
1. Run `git status --short` before editing and preserve unrelated changes.
2. Read the target file, nearby style, relevant earlier owners, and `prompts/alignment_requirements.md`.
3. Edit only the named/screenshot-selected block and necessary local references.
4. Do not stage, commit, push, reset, checkout, restore, delete files, clean the worktree, or edit unrelated generated files.
5. If the target block changes unexpectedly, stop and report the conflict.

Refinement standard:
1. Apply `prompts/alignment_requirements.md` Sections 5.1-7.8 to the target block: source-proportional theorem-style statements, explicit-formal-notation-succinct rewriting, self-contained preambles, bundled-data ordering, semantic deduplication, semantic enumeration, statement/proof item matching, proof completeness, typed-method environment choice and approach extraction, example/counterexample/intuition/remark/motivation/perspective/expository/applied role checks, figure role classification and visual standards, required commentary placement/syntax, result-reference language, inline layout, notation lifecycle, equation numbering, TODO discipline, and multi-PDF readiness.
2. Keep the target boundary tight. Edit only the named/screenshot-selected block plus necessary local labels, references, notation declarations, or immediately adjacent proof/commentary lines.
3. Keep proof segmentation available. Use proof items for independent statement claims, iff directions, equivalent-condition implications, genuine cases, or named proof stages; use compact prose for a single direct argument. Do not add lists for setup, interpretation, or label-only scaffolding.
4. Use compact local notation when it reduces repeated setup or repairs layout, but only when the notation is bound in the block or nearby context.
5. For a target `method`, `proofmethod`, or `computationmethod`, first choose the correct environment: `proofmethod` for proof routes, `computationmethod` for computations/constructions/diagnostics, and legacy `method` only for justified hybrid/other cases. Then identify the problem type, givens, target, entry cue, approach choice, operative steps, verification check, and source-supported limitation/transfer point. For proof methods, check proof architecture and proof obligations; for computation methods, check inputs, outputs, admissibility, construction/update steps, and postconditions. Keep only the components supported by the target/source; do not invent alternative strategies.
6. For a target example, counterexample, intuition, remark, motivation, perspective, principle, process, exercise, or question-bank block, apply Section 5.7: examples need target/data/verification/takeaway and must not be refutational; counterexamples need claim/admissibility/hypothesis/failure/lesson checks; intuitions need anchor/mental model/correspondence/scope/formal bridge and must not be proof authority; remarks need anchor/role/scope/non-authority checks; motivations need need/natural-move/forward-target/boundary checks; perspectives need anchors/viewpoint/synthesis/boundary checks; principles/processes must not own hidden formal content; exercises/question-bank items must not be sole prerequisite owners.
7. For a target theorem-style result, enforce Structural Commentary / Key Insight exactly when required or already present: adjacent pair, Structural Commentary first, Key Insight second, both lines ending in `\\`, immediately before `\end{proof}` when a proof exists, otherwise immediately before the theorem-style `\end{...}` for an allowed proofless exception.
8. For a target figure, apply Section 6.1: classify the primary role as illustration, visualization, schematic, financial exhibit, image, or table-like visual; verify callout, `fig:` label, caption, source/data/model provenance, axes/units/date/currency/window/context when relevant, accessibility, and rendered legibility. Convert table-like visuals to searchable tables when that is the natural owner.
9. For a target assumption, convention, model, law, derivation, approximation, dimensional check, empirical study, valuation case, or warning block, apply Section 5.8: assumptions/conventions need scope; models need purpose, variables, assumptions, structure, inputs/outputs, validation or limits; laws need regime and quantities; derivations need starting point, target, and checkable transformations; approximations need regime and retained/dropped terms; dimensional checks need units and conclusion; empirical studies need data/sample/method/uncertainty/reproducibility/limits; valuation cases need date/currency/basis/method/assumptions/sensitivity/limits; warnings need trigger/failure/consequence/correction.
10. If the screenshot/user request exposes a defect that cannot be fixed inside the target boundary, stop after the safe local edits and report the exact wider dependency or placement blocker.

Validation:
1. Run `git diff --check`.
2. Run the standard gates from `prompts/alignment_requirements.md` on the target file and fix current-edit hits.
3. If `BUILD: yes`, build and inspect the edited line ranges for overfull/underfull warnings; distinguish unrelated warnings elsewhere.
4. Report the exact block changed, the main statement/proof/commentary/figure-role changes, any collection-level effects inside the target boundary, validation results, and any pre-existing issues left untouched.
```
