# Refine Blocks Prompt

```text
I am working in:
/Users/lxg/Documents/GitHub/math_notes

Refine only the theorem, lemma, proposition, corollary, proof, definition, method, or example blocks visible in the attached screenshots or explicitly named by the user. Do not perform source intake, broad file formalization, or unrelated cleanup.

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
1. Apply `prompts/alignment_requirements.md` Sections 5.1-7.7 to the target block: source-proportional theorem-style statements, explicit-formal-notation-succinct rewriting, self-contained preambles, bundled-data ordering, semantic deduplication, semantic enumeration, statement/proof item matching, proof completeness, method subtype classification and approach extraction, required commentary, result-reference language, inline layout, notation lifecycle, equation numbering, and TODO discipline.
2. Keep the target boundary tight. Edit only the named/screenshot-selected block plus necessary local labels, references, notation declarations, or immediately adjacent proof/commentary lines.
3. Keep proof segmentation available. Use proof items for independent statement claims, iff directions, equivalent-condition implications, genuine cases, or named proof stages; use compact prose for a single direct argument. Do not add lists for setup, interpretation, or label-only scaffolding.
4. Use compact local notation when it reduces repeated setup or repairs layout, but only when the notation is bound in the block or nearby context.
5. For a target `method`, first classify it as proof-pattern, computational, hybrid, or other. Then identify the problem type, givens, target, entry cue, approach choice, operative steps, verification check, and source-supported limitation/transfer point. For proof-pattern methods, check proof architecture and proof obligations; for computational methods, check inputs, outputs, admissibility, construction/update steps, and postconditions. Keep only the components supported by the target/source; do not invent alternative strategies.
6. If the screenshot/user request exposes a defect that cannot be fixed inside the target boundary, stop after the safe local edits and report the exact wider dependency or placement blocker.

Validation:
1. Run `git diff --check`.
2. Run the standard gates from `prompts/alignment_requirements.md` on the target file and fix current-edit hits.
3. If `BUILD: yes`, build and inspect the edited line ranges for overfull/underfull warnings; distinguish unrelated warnings elsewhere.
4. Report the exact block changed, the main statement/proof/commentary changes, any collection-level effects inside the target boundary, validation results, and any pre-existing issues left untouched.
```
