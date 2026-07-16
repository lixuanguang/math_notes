# Formalize Content Prompt

Run with GPT-5.6 Sol and Extra High reasoning.

```text
I am working in:
/Users/lxg/Documents/GitHub/math_notes

Align the selected LaTeX scope to the canonical standard.

Configuration:
- MODE: edit
- SCOPE_LEVEL: <part | section | subsection | file>
- TARGET: <exact parts/... path or unambiguous part-scoped cursor>
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
- BUILD: yes

Instructions:

1. Read `prompts/alignment_requirements.md` completely and treat it as canonical. Then read `STRUCTURE_MIGRATION_README.md`, `math.tex`, `parts/base.tex`, relevant notation files, target overviews/files, and required prerequisites.
2. Run `git status --short`. Resolve TARGET, START_CURSOR, active `\input` order, and the exact FILE_COVERAGE set. Preserve all unrelated work; perform none of the prohibited Git or destructive actions in `prompts/alignment_requirements.md`.
3. Apply RUN_BATCH before editing. With `one-numbered-file`, use the specified file when SCOPE_LEVEL is `file`; otherwise select only the next active numbered subsection file from START_CURSOR. The wider TARGET defines traversal, not permission to rush the whole section. Quality has priority over coverage.
4. Inventory every logical unit in the active file in source order. Treat a theorem-style statement and its following proof as one row; treat every other formal environment as its own row. Maintain a ledger with type/label, COMPONENT_COUNT or CLAIM_COUNT, proof status, commentary status, action, and rendered page. A grep result, successful build, or total environment count is never evidence that a row is semantically complete.
5. Process exactly one ledger row at a time. Read the full environment, proof, and relevant earlier owners; then perform the complete loop: census; explicit; formal; notation-driven; applicable earlier-result reuse; succinct; structure; packing; verification. After making the mathematics explicit, inspect every sentence and replace mathematical prose with bound, established notation wherever possible: membership, quantifiers, maps, definitions, relations, implications, equivalences, convergence, bounds, and parallel cases. Repeat this audit after compression. Retain prose only for motivation, interpretation, proof architecture, necessary transitions, or when notation would obscure meaning. Never invent cryptic symbols or hide prose in `\text{...}`. Rewrite the whole affected environment when needed—do not stop at surface copyediting or the longer explicit draft.
6. Before leaving each row, adversarially verify: all objects/hypotheses/conclusions are bound; every replaceable mathematical phrase has become notation; independent components or claims are itemized; repeated item setup is factored into the preamble; every proof obligation has an explicit equality, estimate, construction, limit, or applicable earlier citation; commentary is actually concise; and the rendered block has clean semantic breaks with no sparse tail. Repeat the row if any check fails. Keep patches atomic—normally one ledger row plus necessary local references—and emit a concise `[n/N] label/type — action; counts; notation/proof/commentary status` checkpoint after every row.
7. For definitions and similar environments, count parallel objects, constructions, characterizations, cases, and postamble tests. Itemize two or more components, including a second list for a parallel postamble when useful, and factor every shared tuple/domain/parameter/hypothesis before the items.
8. For every theorem, proposition, lemma, and corollary, count independent claims, itemize or split them, and make proof items follow the statement one-for-one. Under PROOF_COMPLETENESS `full`, replace proof ideas, sketches, “standard” placeholders, and hand-wavy transitions with complete formal proofs using definitions or applicable earlier theorem-style results. Do not delete a difficult proof. Only labels in PROOFLESS_EXCEPTIONS may remain proofless; otherwise report missing prerequisite machinery as a blocker.
9. Apply COMMENTARY_POLICY only to theorem-style results. Formalize and compress both lines: Structural Commentary should name the actual mechanism, use notation when useful, and normally be at most 18 words; Key Insight should state one invariant or idea and normally be at most 12 words. Each should fit one rendered line when feasible.
10. Enforce formal quantifiers, result-citation language, proof-reference applicability/order, labels, dependencies, notation collisions, semantic `\\` breaks, and the fewer-than-five-word sparse-line repair rule. Repair proof endings that only restate the claim, label-only proof scaffolding, stranded direction markers, wrong enumerate label styles, and inline equation chains likely to break after an unfinished relation symbol. Enforce MATH_LAYOUT: inline all avoidable formulas; use inline `smallmatrix` for matrices with at most three rows; retain only documented display exceptions. Render and iterate every touched TikZ figure.
11. After the first pass, cold-read every ledger row again in source order. Recount components/claims, reread each proof and commentary line, compile, and inspect every affected page individually at readable resolution. Fix semantic defects before layout defects; do not rely on contact sheets, box-warning scans, or aggregate counts.
12. Complete all mechanical validation in `prompts/alignment_requirements.md`, including the prose-to-notation reconciliation, coverage, citations, labels/references, inputs, notation, displays/matrices, `git diff --check`, and an isolated full build. These gates supplement rather than replace the two semantic passes.
13. Do not add unrelated theory. If sources are supplied, use only them and existing repository content. Continue without approval pauses until the active batch is complete. Stop only at a file boundary and report the exact next cursor without repeating completed files.

Final report:
- resolved wider scope, active batch, coverage, and next cursor;
- environment-ledger counts: reviewed, rewritten, retained, split, and proofless exceptions;
- files changed and main mathematical/structural/style changes;
- claim/component restructuring, proofs added or completed, proof-reference changes, and commentary quality/coverage;
- retained display/matrix exceptions and figure work;
- cold-pass, page-render, mechanical-validation, and isolated-build results;
- preserved pre-existing changes, genuine blockers, and exact next cursor or completion.
```

For a review limited to existing edits and new files, set `FILE_COVERAGE: changed-and-new`. To require commentary on every reviewed theorem-style result, set `COMMENTARY_POLICY: required-all-reviewed`.

For highest reliability, keep `RUN_BATCH: one-numbered-file`, even when TARGET is a part or section, and rerun from the reported cursor. Use `RUN_BATCH: all-selected` only when accepting lower assurance or when the selected scope is already one small file.
