# Reorganize Content Prompt

```text
I am working in:
/Users/lxg/Documents/GitHub/math_notes

Reorganize the selected LaTeX scope so structure, placement, file order, source ownership, applied-environment ownership, and section hierarchy are ready for dependency checks and later formalization.

Configuration:
- MODE: edit
- SCOPE_LEVEL: <part | section | subsection | file>
- TARGET: <exact parts/... path or unambiguous part-scoped cursor>
- START_CURSOR: <beginning | exact resume file>
- FILE_COVERAGE: <all-active | changed-and-new | tracked-modified | untracked-new>
- RUN_BATCH: one-numbered-file
- CONTENT_POLICY: refine-only
- ALLOW_NEW_SUBSECTION: <no | yes only if explicitly approved for this run>
- ALLOW_NEW_SECTION_OR_PART: no
- BUILD: no

Authority and safety:
1. Read `prompts/alignment_requirements.md` for repository structure, safety, labels, dependency ownership, collection-level standards, and allowed hierarchy.
2. This prompt is structural, not a prose/formalization pass. Preserve moved mathematical content verbatim except for necessary surrounding glue, input edges, labels/references explicitly approved in this run, and tiny local duplicate cleanup.
3. Do not build LaTeX, stage, commit, push, reset, checkout, restore, revert, delete unrelated files, clean the worktree, or edit generated PDF/auxiliary files.
4. Run `git status --short` before editing. Preserve unrelated tracked and untracked work. If a patch conflicts or a target file changed unexpectedly, stop and report the conflict.

Required reading:
1. Read `STRUCTURE_MIGRATION_README.md`, `math.tex`, and `parts/base.tex`.
2. Read relevant part and section `overview.tex` files.
3. Read the target files and nearby subsection files needed to understand ownership, placeholders, prerequisites, labels, notation, and figures.
4. Resolve active `\input` order before proposing moves.

Structural audit:
For the current topic batch, check:
- existing placeholder subsection files and active empty inputs that should be preserved as future-content owners;
- subsection files made empty by the current proposed moves, where deprecation or active-input removal may be appropriate;
- material that belongs in a different file, subsection, or order;
- content whose size, independence, or prerequisite role suggests promotion from subsection to section or from section to part;
- definitions, notation, examples, intuitions, applied environments, results, methods, and proofs appearing in an illogical order;
- major definitions or unfamiliar results without nearby source-supported examples, nonexamples, counterexamples, intuitions, or test computations;
- prerequisites that should move before dependants;
- formal results or methods depending on intuitions, remarks, motivations, perspectives, or examples;
- duplicate local material or duplicate labels;
- multiple labels on one environment or mathematical object;
- equation labels on formulas that are not referenced, or later equation references without stable `eq:` anchors;
- stale, untyped, or misplaced TODO comments;
- figures far from the text that introduces or uses them;
- back-to-back figures that are not an intentional comparison;
- figure-role placement problems: illustrations too late to clarify the formal object, visualizations before their data/model owner, schematics separated from modeled assumptions, financial exhibits separated from valuation/date/currency context, or table-like visuals that should be searchable tables;
- displayed indexed operators to leave as later formalization candidates.

Batch limits:
1. Use one mathematical topic per batch.
2. Prefer one target section or subsection.
3. Prefer 1-3 source files and roughly 300-500 lines or less.
4. Do not migrate broad multi-section structures unless this exact scope was requested.

Edit rules:
1. Move complete logical blocks where possible.
2. Preserve moved statements, proofs, examples, intuitions, remarks, algorithms, and figures verbatim.
3. Do not rewrite prose, formalize statements, complete proofs, or normalize display math during this pass.
4. Do not rename labels unless explicitly approved; if duplicate-label consolidation is approved, keep one stable canonical label and update references.
5. Do not rename a broad subsection title to a single narrow content name merely because the current file contains only that topic; active subsection names may intentionally reserve room for future content. Rename only when the current title is wrong or misleading for the durable owner, and report why the replacement still leaves appropriate future scope.
6. Do not remove, deprecate, or comment out an active empty subsection input merely because it is empty. Existing active empty subsections may be placeholders. Remove or deprecate an active subsection only when this reorganization moved all substantive content out of it and the emptied file is no longer the natural future owner.
7. Update only necessary `\input` or `\include` order and local connective text.
8. Do not add new theory. A new subsection is allowed only if `ALLOW_NEW_SUBSECTION: yes`; a new section or part is allowed only if `ALLOW_NEW_SECTION_OR_PART: yes`.
9. If material should be promoted to a new section or part but `ALLOW_NEW_SECTION_OR_PART: no`, do not perform the promotion. Record the exact promotion candidate, continue safe same-level organization, and report the blocker.
10. When moving source-grounded material, preserve or reconstruct its source-to-target provenance in the report instead of embedding broad bookkeeping in LaTeX.

Report before editing when the placement is nontrivial:
- topic name and resolved target;
- target file(s), source file(s), and exact blocks proposed for movement;
- destination for each block and why it is the natural owner;
- whether the move fills a placeholder, fixes reference-before-label order, or repairs prerequisite flow;
- whether any active empty subsection is an existing placeholder to preserve, or was emptied by the proposed moves and may be deprecated;
- whether any subsection title is intentionally broad and should be preserved rather than narrowed to the current single topic;
- whether any subsection-to-section or section-to-part promotion is recommended or blocked by configuration;
- duplicate-label consolidation, if any, with canonical label and references to update;
- notation lifecycle, equation-label, TODO, example/counterexample/intuition placement, and applied-environment ownership concerns;
- figure role and placement concerns;
- ambiguous candidates under `Needs Human Review`.

Validation and final report:
- re-check affected references, labels, inputs, and figure placement;
- confirm moved figures retain their primary role, typed wrapper when already classified, callout, caption, label, source/data/model context, and proximity to the formal or applied owner they explain;
- confirm existing active placeholder subsections and broad future-facing subsection titles were preserved unless this run emptied and displaced their content;
- confirm no formal result or method still depends on an intuition/remark/motivation/perspective/example in the affected batch;
- confirm collection-level checks in the affected batch: overview orientation, notation lifecycle, source provenance when applicable, example/intuition placement, applied-environment ownership, equation labels, typed TODOs, and multi-PDF readiness;
- confirm moved mathematical content was preserved verbatim except for reported local glue/reference edits;
- list files changed, blocks moved, labels/references updated, and remaining structural blockers;
- state that no build, staging, commit, push, reset, checkout, revert, unrelated delete, or clean action was performed.
```
