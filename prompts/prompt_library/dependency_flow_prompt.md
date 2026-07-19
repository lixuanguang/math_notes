# Dependency Flow Prompt

```text
I am working in:
/Users/lxg/Documents/GitHub/math_notes

Audit and repair mathematical and applied dependency flow in the selected LaTeX scope. Organization should already be broadly stable; this pass verifies that definitions, notation, assumptions, prerequisites, source ownership, applied context, and formal results appear before use.

Configuration:
- MODE: edit
- SCOPE_LEVEL: <part | section | subsection | file>
- TARGET: <exact parts/... path or unambiguous part-scoped cursor>
- START_CURSOR: <beginning | exact resume file>
- FILE_COVERAGE: <all-active | changed-and-new | tracked-modified | untracked-new>
- RUN_BATCH: one-numbered-file
- CONTENT_POLICY: refine-only
- ALLOW_NEW_SUBSECTION: no
- ALLOW_NEW_SECTION_OR_PART: no
- BUILD: no

Authority and safety:
1. Read `prompts/alignment_requirements.md` for canonical dependency, label, structure, collection-level, and safety rules.
2. This prompt fixes dependency order structurally. Do not use shortcut prerequisite paragraphs to hide ordering problems.
3. Do not build LaTeX, stage, commit, push, reset, checkout, restore, revert, delete unrelated files, clean the worktree, or edit generated PDF/auxiliary files.
4. Run `git status --short` before editing. Preserve unrelated tracked and untracked work. If a patch conflicts or a target file changed unexpectedly, stop and report the conflict.

Required reading:
1. Read `STRUCTURE_MIGRATION_README.md`, `math.tex`, `parts/base.tex`, relevant notation files, and active overview files.
2. Read the target file(s), earlier active prerequisites, and nearby owners needed to decide whether dependencies already exist before use.
3. Resolve active `\input` order before editing.

Dependency checks:
For the current section or topic, check:
- definitions used before they are stated;
- notation used before it is introduced;
- proof-local or block-local notation reused later without a durable declaration;
- theorem-style results depending on later theorem-style results;
- methods relying on examples, intuitions, remarks, motivations, perspectives, warnings, empirical studies, or valuation cases as authority;
- theorem, proposition, lemma, corollary, or method environments referencing examples, intuitions, remarks, motivations, perspectives, warnings, empirical studies, or valuation cases as authority;
- formal content hidden inside intuitions, remarks, motivations, perspectives, examples, warnings, empirical studies, valuation cases, or other applied environments but needed later;
- examples, counterexamples, intuitions, applied checks, or test computations placed too late to illuminate the definition, hypothesis, result, model, law, approximation, or valuation assumption they are meant to explain or test;
- explicit references to intuitions, remarks, motivations, perspectives, examples, or numbered definitions that should instead become direct conditions or prior exposition;
- ad hoc prerequisite paragraphs that should be moved, promoted, or removed through reordering;
- equation references before the referenced formula or equation labels that are stale after movement;
- labels and references whose order may confuse the reader;
- multiple labels on one environment or mathematical object;
- TODOs that conceal dependency, source, proof, notation, or build blockers;
- local `\input` or `\include` order affecting dependency flow.

Edit rules:
1. Make the smallest coherent structural change: reorder, move, split, promote, update references, or adjust input order.
2. Preserve mathematical meaning. Avoid prose refinement unless it is needed for dependency clarity.
3. Keep environments intact unless the dependency repair requires movement, splitting, or promotion.
4. Do not rename labels unless explicitly approved; if duplicate-label consolidation is approved, keep one stable canonical label and update references.
5. Do not process later sections merely because they might also need refinement.
6. Do not add unsupported theory. If required prerequisite machinery is missing, report the blocker or add only source/repo-supported content within the selected scope.
7. Preserve or reconstruct source provenance in the report for any moved source-grounded block. Do not use provenance bookkeeping as mathematical prose.

Findings or edit report:
- file path, section heading, and mathematical role of the section;
- dependencies used in the section and whether each was introduced earlier;
- notation introduced too late;
- proof-local notation reused outside its scope;
- formal results or methods that reference intuitions/remarks/motivations/perspectives/examples;
- content promoted from an intuition/remark/motivation/perspective/example/applied environment into formal exposition;
- examples/counterexamples/intuitions/applied checks moved earlier to support definitions, hypotheses, results, models, laws, approximations, or valuation assumptions;
- equation-reference and TODO-discipline findings;
- duplicate-label findings and any canonical label chosen;
- minimal fixes applied or proposed, grouped as one coherent batch;
- why the fix is structural rather than a shortcut prerequisite paragraph;
- files changed, references/labels/input edges updated, and remaining blockers;
- state that no build, staging, commit, push, reset, checkout, revert, unrelated delete, or clean action was performed.

Validation:
- re-check dependency order in affected files;
- confirm no dependency issue was hidden by a shortcut paragraph;
- re-check references, labels, and input order;
- confirm no affected formal result or method depends on an intuition, remark, motivation, perspective, example, warning, empirical study, valuation case, or other non-authoritative block;
- confirm affected environments or objects have at most one label unless distinct anchors justify multiple labels.
- confirm notation scope, equation references, typed TODOs, and source provenance remain coherent after movement.
```
