# Add Source-Grounded Content — Entry Point

```text
Repository: /Users/lxg/Documents/GitHub/math_notes

Goal: inspect supplied screenshots, images, PDFs, papers, or exact files; choose the natural owner in the active `parts/` tree; and integrate every permission-allowed source block at final local quality. This is not rough transcription or a paper summary.

Configuration:
- MODE: edit
- SCOPE_LEVEL: <part | section | subsection | file>
- DOMAIN: <auto | math | computer-science | electronic-engineering | quant-finance | fundamental-finance | physics | mixed>
- TARGET: <exact parts/... path, active-tree cursor, or auto-place from SOURCE_MATERIAL>
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
- SOURCE_MATERIAL: <exact attachments/files/pages>
- ALLOW_NEW_SUBSECTION: yes
- ALLOW_NEW_SECTION_OR_PART: no
- ALLOW_NEW_ENVIRONMENT_OR_FIGURE_TYPE: yes-if-standard-supported
- BUILD: yes

Load before planning:
1. `prompts/standards/repository_and_scope.md`.
2. `prompts/standards/sources/source_grounding.md`.
3. `prompts/standards/structure/organization_and_dependencies.md`.
4. `prompts/standards/structure/collection_quality.md`.
5. `prompts/standards/writing/mathematical_style.md`.
6. `prompts/standards/layout/math_layout.md` — mandatory for every inserted/touched LaTeX block, including inline/display and no-overflow rules.
7. `prompts/standards/validation.md` (full semantic and render profile, applied to all inserted/materially amended rows and affected pages).
8. `prompts/standards/domains/README.md`, then only the configured or source-ledger domain overlay(s).

After classifying source blocks, load every matching conditional module before planning its LaTeX owner:
- theorem/proof -> `prompts/standards/writing/theorems_and_proofs.md`;
- method/process/algorithm -> `prompts/standards/writing/methods_and_algorithms.md`;
- example/counterexample/intuition/remark/motivation/perspective/principle/exercise/qnbank -> `prompts/standards/writing/expository_environments.md`;
- assumption/convention/model/law/derivation/approximation/dimensionalcheck/empiricalstudy/valuationcase/warning -> `prompts/standards/writing/applied_environments.md`;
- figure/plot/diagram/image/table-like visual -> `prompts/standards/layout/figures.md`;
- durable notation/collision/macro -> `prompts/standards/structure/notation_lifecycle.md`.

Source boundary and browsing:
- Subject content may come only from SOURCE_MATERIAL and existing active repository content.
- Do not browse for claims, proofs, examples, data, assumptions, notation, or exposition.
- The sole browsing exception is the environment/figure-type gap protocol in `source_grounding.md`; web research there may justify presentation semantics only.

Required repository reading:
1. Run `git status --short`; preserve all unrelated work and use focused patches.
2. Read `STRUCTURE_MIGRATION_README.md`, `math.tex`, `parts/base.tex`, relevant part/section overviews, likely target files, nearby prerequisites, notation, labels, figures, algorithms, and existing related environment owners.
3. For papers/preprints, inspect only the portions needed for the critical-content ledger described in `source_grounding.md`.

Source-ledger and placement loop:
1. Inspect all supplied pages/images in order before editing. Group them into coherent blocks and classify each as outline, substantive, mixed, or research paper; assign domain and semantic/visual role. Report genuinely ambiguous classifications before insertion rather than forcing a misleading owner.
2. Build the complete source-to-target ledger from `source_grounding.md` and `collection_quality.md`. With auto-placement, choose the best existing owner from the active tree.
3. Compare each source block with its proposed owner and prerequisites; assign coverage/provenance status. Use active input order, not screenshot order, for edits.
4. Outline-only material receives a placement/coverage audit and no insertion.
5. `first-pass`: integrate all supported, allowed blocks across all planned targets.
6. `second-pass`: compare the same source ledger against current LaTeX from the earliest affected target; add only genuinely missing/partial content and merge, compress, or cross-reference accidental duplication.
7. Under `RUN_BATCH: all-source-supported`, continue through every planned target without approval pauses. Do not advance beyond SOURCE_MATERIAL.
8. If a source block requires a new section/part, mark `blocked-new-section-or-part`, continue allowed blocks, and report the exact proposed owner. Add a new subsection only when no existing subsection is natural; give it real payload and update only the necessary active input edge. Never create empty skeletons.
9. If no current environment/figure role can truthfully own a durable source block, follow the gap protocol before editing it. Continue other allowed blocks even if that block remains blocked.

Final-quality loop per inserted/materially amended block:
1. Apply every loaded module completely. Treat a theorem statement and proof as one ledger row; every other environment/figure as its own row.
2. Preserve source-supported generality and authority. Formalize what the source plus earlier active results support; do not invent missing content.
3. Re-read the source block, target preamble, each semantic item/step, and each proof obligation separately. Use the correct environment and typed figure role; promote hidden prerequisites before later use.
4. Keep theorem statements source-proportional; move proof machinery to the proof/method. Complete theorem-style proofs or report a source/scope blocker. Enforce exact Structural Commentary / Key Insight requirements.
5. Reuse/extend an existing method or owner rather than duplicating supported prose. Prefer `computationmethod` for conceptual procedures and an algorithm only for useful executable pseudocode.
6. Place source-supported examples, counterexamples, intuitions, checks, domain context, and figures near their anchors. Do not invent them.
7. Scope notation at the smallest durable level. Add global notation only when it recurs across major sections. Number equations only when referenced or genuinely central.
8. Apply the inline-strict semantic repair order. After each target file, run applicable source/search/diff gates and fix current-edit hits before continuing.
9. After all planned targets, run one isolated full build, inspect warnings for every edited range, render every affected page at readable resolution, and repair all current-edit overflow, collision, sparse-tail, figure, and page-break defects. Do not leave a rough block for a later prompt when the supplied source already supports a canonical local result.

Planning-only report for outline sources:
- source coverage, best active owners, already/partially/not covered material, structure level needed, exact proposed subsection when relevant, domain classification, and any environment/figure-role gap.

Edit report:
- chosen targets and rationale; PASS_MODE, DOMAIN, all planned files processed, and source boundary;
- paper critical-content ledger summary when applicable;
- files changed and source blocks added/amended by role;
- coverage/provenance status totals and existing owners reused instead of duplicated;
- method, expository, applied, algorithm, figure, notation, equation, TODO, and structure decisions;
- gap-protocol searches/extensions or blockers; unauthorized section/part proposals;
- final-quality confirmation: self-contained preambles, matched proof obligations, source authority, notation audit, inline layout audit, and current-edit gates;
- isolated build, edited-line warning, and affected-page render results, including retained display/matrix exceptions;
- preserved uncommitted work, remaining uncertainties, completion cursor, and whether a second pass is useful.
```

After a first pass, rerun with `PASS_MODE: second-pass` only when the same SOURCE_MATERIAL may contain missed supported content. Use reorganization/dependency entry points only if those concerns remain; use formalization for a later wider-scope row review, not to rescue rough source intake.
