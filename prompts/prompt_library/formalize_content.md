# Formalize Content Prompt

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
5. Process exactly one ledger row at a time under the complete Section 4 workflow and Sections 5.1-7.8 standards in `prompts/alignment_requirements.md`: census, explicit formalization, notation audit, earlier-result reuse, compression, structure, packing, collection-level checks, and verification. Rewrite the whole affected environment when needed; do not stop at surface copyediting or the longer explicit draft.
6. Before leaving each row, run the adversarial checklist in Section 4, then re-check the recurring failure modes from recent runs: overcomplicated theorem-style statements, proof scaffolding in statements, non-self-contained theorem-style or typed-method preambles, legacy `method` blocks that should be migrated to `proofmethod` or `computationmethod`, typed methods without problem type/data/target/approach cue/verification, proof methods written as computational recipes, computation methods without input/output/precondition/postcondition checks, examples without target/data/verification/takeaway, refutational examples that should be `counterexample`, counterexamples without claim/admissibility/hypothesis/failure/lesson checks, intuition blocks without anchor/mental model/correspondence/scope/formal bridge, intuition used as proof authority, applied blocks in the wrong environment, models without purpose/variables/assumptions/inputs/outputs/limits, derivations written as proofs, approximations without regime or retained/dropped terms, dimensional checks treated as proof, empirical studies without data/sample/method/uncertainty/reproducibility/limitations, valuation cases without date/currency/basis/method/assumptions/sensitivity/limits, warnings used as proof authority, remarks carrying hidden theorem claims or prerequisites, motivations/perspectives/principles duplicating formal statements, process blocks that should be typed methods or algorithms, exercises/question-bank items owning prerequisites, duplicated prose/notation assertions, misordered bundled data, repeated item setup, unmatched statement/proof items, proof endings that merely restate the claim, label-only proof scaffolding, stranded direction markers, wrong enumerate label styles, weak commentary, avoidable displays, sparse rendered tails, notation leakage, missing source provenance for source-grounded blocks, unnecessary equation labels, and untyped TODOs.
7. Apply the environment-specific rules in Sections 5.2-5.8 for definitions, theorem-style results, proofs, typed methods, examples, counterexamples, intuitions, applied environments, remarks, motivations, perspectives, principles, processes, exercises, commentary, proofless exceptions, and earlier-result citations. For each existing `method`, migrate it to `proofmethod` or `computationmethod` when the type is clear; split hybrid methods when supported and safe; keep legacy `method` only with an explicit justification in the final report. Convert existing `example` blocks to `counterexample` when their main role is refuting a claim or showing a hypothesis is necessary; convert overloaded intuitive prose to `intuition` only when its main role is a mental model, analogy, picture, or heuristic bridge with a clear formal anchor and source/repo support; convert overloaded applied prose to `assumption`, `convention`, `model`, `law`, `derivation`, `approximation`, `dimensionalcheck`, `empiricalstudy`, `valuationcase`, or `warning` only when the role is clear and source/repo-supported. Keep patches atomic—normally one ledger row plus necessary local references—and emit a concise `[n/N] label/type — action; counts; notation/proof/commentary status` checkpoint after every row.
8. Apply Sections 5.5-7.8 for inline layout, semantic `\\` breaks, matrix/display exceptions, dependency order, labels/references, notation collisions, input edges, touched figures, orientation, provenance, notation lifecycle, examples/counterexamples/intuitions/applied checks, equation numbering, TODO discipline, searchability, and multi-PDF readiness. Render and iterate every touched TikZ figure.
9. After the first pass, cold-read every ledger row again in source order. Recount components/claims, reread each proof and commentary line, compile, inspect every affected page individually at readable resolution, and check build-log warnings for the edited line ranges. Fix semantic defects before layout defects; do not rely on contact sheets, box-warning scans, or aggregate counts.
10. Complete all mechanical validation in `prompts/alignment_requirements.md`, including `git diff --check` and an isolated full build. These gates supplement rather than replace the two semantic passes.
11. Do not add unrelated theory. If sources are supplied, use only them and existing repository content. Continue without approval pauses until the active batch is complete. Stop only at a file boundary and report the exact next cursor without repeating completed files.

Final report:
- resolved wider scope, active batch, coverage, and next cursor;
- environment-ledger counts: reviewed, rewritten, retained, split, and proofless exceptions;
- files changed and main mathematical/structural/style changes;
- claim/component restructuring, method environment migrations and approach extraction, example/counterexample/intuition/remark/expository/applied role repairs, proofs added or completed, proof-reference changes, and commentary quality/coverage;
- collection-level decisions: overview orientation, source provenance if applicable, notation lifecycle, examples/counterexamples/intuitions/applied checks, equation labels, TODOs, naming/searchability, and multi-PDF readiness;
- retained display/matrix exceptions and figure work;
- cold-pass, page-render, edited-line warning inspection, mechanical-validation, and isolated-build results;
- preserved pre-existing changes, genuine blockers, and exact next cursor or completion.
```

For a review limited to existing edits and new files, set `FILE_COVERAGE: changed-and-new`. To require commentary on every reviewed theorem-style result, set `COMMENTARY_POLICY: required-all-reviewed`.

For highest reliability, keep `RUN_BATCH: one-numbered-file`, even when TARGET is a part or section, and rerun from the reported cursor. Use `RUN_BATCH: all-selected` only when accepting lower assurance or when the selected scope is already one small file.
