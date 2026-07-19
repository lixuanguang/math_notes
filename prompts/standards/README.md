# Standards Module Index

The files in this directory are shared requirements, not entry-point prompts. Start every task from exactly one file in `prompts/prompt_library/`; that entry point tells you which modules to load.

## Loading contract

1. Read `prompts/standards/repository_and_scope.md` for every editing workflow.
2. Inspect the requested target or supplied source and make a block/figure census.
3. Load only the modules required by that census and the entry point's mandatory list.
4. With one explicit `DOMAIN`, resolve only its registry row and load that overlay. With `DOMAIN: auto`, read `prompts/standards/domains/README.md`, classify each affected block, and load only the matches; with `mixed`, load each domain actually represented.
5. A conditional module becomes mandatory as soon as the workflow touches its subject. For example, touching a theorem and a figure requires both `prompts/standards/writing/theorems_and_proofs.md` and `prompts/standards/layout/figures.md`.
6. Requirements accumulate. A workflow may narrow scope, sources, batching, or build behavior, but it may not silently weaken an applicable standard.
7. `external_sources.md` records the research basis and is not normally loaded during editing.

## Module map

| Module | Load when |
| --- | --- |
| `prompts/standards/repository_and_scope.md` | Any repository edit or audit. |
| `prompts/standards/writing/mathematical_style.md` | Mathematical prose, definitions, claims, proofs, calculations, or local notation are edited. |
| `prompts/standards/writing/theorems_and_proofs.md` | A theorem, proposition, lemma, corollary, or proof is reviewed or changed. |
| `prompts/standards/writing/methods_and_algorithms.md` | A `method`, `proofmethod`, `computationmethod`, process, or algorithm is reviewed or changed. |
| `prompts/standards/writing/expository_environments.md` | An example, counterexample, intuition, remark, motivation, perspective, principle, exercise, or question bank is reviewed or changed. |
| `prompts/standards/writing/applied_environments.md` | An assumption, convention, model, law, derivation, approximation, dimensional check, empirical study, valuation case, or warning is reviewed or changed. |
| `prompts/standards/layout/math_layout.md` | Any LaTeX prose or mathematics is edited. This module is never optional for content edits. |
| `prompts/standards/layout/figures.md` | A figure, plot, diagram, image, or table-like visual is moved, added, or materially changed. |
| `prompts/standards/structure/organization_and_dependencies.md` | Content is placed, moved, split, promoted, reordered, or dependency-audited. |
| `prompts/standards/structure/collection_quality.md` | Overviews, source ownership, equation anchors, TODOs, or cross-volume organization are affected. |
| `prompts/standards/structure/notation_lifecycle.md` | Global/section notation, notation-list entries, collisions, macros, or first-use ownership are affected. |
| `prompts/standards/sources/source_grounding.md` | Provided sources, screenshots, PDFs, papers, or source-derived content are used. |
| `prompts/standards/sources/research_recommendations.md` | The task searches for sources to recommend for later ingestion. |
| `prompts/standards/domains/*.md` | The affected content belongs to that domain. |
| `prompts/standards/validation.md` | Any editing workflow; use the profile selected by its entry point. |

## Non-negotiable cross-module rules

- Succinctness must never hide objects, domains, hypotheses, quantifiers, conclusions, proof obligations, interfaces, operating conditions, units, dates, edition or provenance, evidence or authority status, rights context, or limitations required to interpret a claim.
- Under `MATH_LAYOUT: inline-strict`, the inline/display rules and rendered overflow checks in `prompts/standards/layout/math_layout.md` are mandatory.
- Only earlier theorem-style results with adequate proofs may serve as mathematical proof authority.
- Expository, interpretive, textual, historical, empirical, computational, engineering, financial, physical, performance, artistic, and visual blocks are not mathematical proof authority unless their mathematical consequence is separately stated and proved in a theorem-style environment.
- Preserve unrelated work and the active `parts/` hierarchy.
