# Prompt Library

Use one prompt directly instead of running a monolithic workflow.

- `add_content_prompt.md`: final-quality source-grounded insertion from screenshots, PDFs, papers, or provided files, including domain-overlay classification, critical research-paper ingestion, typed-method, example, counterexample, intuition, figure-role, applied-environment, and remark extraction.
- `refine_blocks_prompt.md`: targeted refinement of screenshot-selected theorem/proof/typed-method/figure/example/counterexample/intuition/applied/remark blocks.
- `reorganize_content_prompt.md`: structural movement, splitting, placement, figure-role placement, and duplicate-label cleanup.
- `dependency_flow_prompt.md`: dependency-order audit, figure-only prerequisite audit, and structural repair.
- `formalize_content.md`: full environment-level formalization against `prompts/alignment_requirements.md`.
- `notation_list_prompt.md`: post-formalization notation-list audit and repair, including domain-aware collision and context checks.
- `further_research_prompt.md`: web-based reference recommendation pass with domain-specific authority filters that updates `Content_Enhancement_Recommendations.md` without editing bibliography or LaTeX content.

Recommended sequence for a new source batch:

```text
add_content_prompt.md with PASS_MODE: first-pass -> optional add_content_prompt.md with PASS_MODE: second-pass -> reorganize_content_prompt.md -> dependency_flow_prompt.md -> formalize_content.md -> notation_list_prompt.md -> further_research_prompt.md
```

Phase ownership:

- `add_content_prompt.md` classifies every source block by domain when configured with `DOMAIN: auto`, auto-places allowed material when configured, integrates all source-supported content in one run, applies critical-content filtering for research papers by domain, records source provenance, and handles new environment/figure-type gaps through standards-only web research when explicitly authorized by its configuration.
- `add_content_prompt.md` with `PASS_MODE: second-pass` catches missed supported content and removes/merges accidental duplicate coverage from the first pass.
- `reorganize_content_prompt.md` handles movement, splitting, same-level placement, subsection creation when allowed, duplicate labels, and promotion recommendations, including mixed-domain separation when universal mathematical prerequisites, models, empirical studies, valuation cases, or physical regimes would be clearer in separate owners. It preserves broad subsection titles and active empty placeholder subsections unless the run itself emptied and displaced their content. It is the phase that identifies subsection-to-section or section-to-part promotion; it performs the promotion only when `ALLOW_NEW_SECTION_OR_PART: yes`.
- `dependency_flow_prompt.md` repairs prerequisite order, notation lifecycle, source ownership after movement, invalid dependency authority, and domain context before use.
- `formalize_content.md` performs the row-by-row theorem/proof/typed-method/figure/example/counterexample/intuition/applied/remark/style/layout/build pass after the structure is stable, migrates legacy `method` blocks to `proofmethod` or `computationmethod` when clear, classifies figures by role, converts refutational examples to `counterexample`, extracts supported intuitive prose to `intuition`, and repairs applied blocks against Sections 5.8 and 7.11.
- `notation_list_prompt.md` audits `parts/00_notations/` after formalization, promotes only durable notation, repairs collision entries, applies domain-aware unit/date/currency/measure/basis/regime context checks, removes verified stale entries, and reports macro candidates.
- `further_research_prompt.md` runs after the notes structure and notation are stable, searches the web for high-quality references that could enhance the selected scope using domain-specific authority filters, skips sources already present in `references.bib`, and records only non-duplicative recommendations in `Content_Enhancement_Recommendations.md`.

For manual screenshot corrections to existing blocks, use `refine_blocks_prompt.md` directly.

Skip any prompt whose work is already settled. For canonical theorem/proof, typed-method, figure-role, example/counterexample/intuition/remark/motivation/perspective/expository, applied/scientific/finance, mathematical, layout, source-provenance, and collection-level requirements, read `prompts/alignment_requirements.md`, especially Section 5.0 for the external writing baseline, Section 5.7 for examples, counterexamples, intuition, remarks, motivation, and perspective, Section 5.8 for applied environments, Section 6.1 for typed figures (`illustrationfigure`, `visualizationfigure`, `schematicfigure`, `financialexhibitfigure`, `sourceimagefigure`, `tablevisualfigure`), Section 7 for collection-level standards, Section 7.9 for further research recommendations, Section 7.10 for research-paper ingestion, and Section 7.11 for math/quant-finance/fundamental-finance/physics domain overlays.

When prompt requirements overlap, keep the shared standard in `prompts/alignment_requirements.md` and leave only workflow-specific instructions in the library prompt.
