# Prompt Library

Use one prompt directly instead of running a monolithic workflow.

- `add_content_prompt.md`: final-quality source-grounded insertion from screenshots, PDFs, or provided files, including typed-method and example/remark extraction.
- `refine_blocks_prompt.md`: targeted refinement of screenshot-selected theorem/proof/typed-method/example/remark blocks.
- `reorganize_content_prompt.md`: structural movement, splitting, placement, and duplicate-label cleanup.
- `dependency_flow_prompt.md`: dependency-order audit and structural repair.
- `formalize_content.md`: full environment-level formalization against `prompts/alignment_requirements.md`.
- `notation_list_prompt.md`: post-formalization notation-list audit and repair.

Recommended sequence for a new source batch:

```text
add_content_prompt.md with PASS_MODE: first-pass -> optional add_content_prompt.md with PASS_MODE: second-pass -> reorganize_content_prompt.md -> dependency_flow_prompt.md -> formalize_content.md -> notation_list_prompt.md
```

Phase ownership:

- `add_content_prompt.md` classifies every source block, auto-places allowed material when configured, integrates all source-supported content in one run, and records source provenance.
- `add_content_prompt.md` with `PASS_MODE: second-pass` catches missed supported content and removes/merges accidental duplicate coverage from the first pass.
- `reorganize_content_prompt.md` handles movement, splitting, same-level placement, subsection creation when allowed, duplicate labels, and promotion recommendations. It is the phase that identifies subsection-to-section or section-to-part promotion; it performs the promotion only when `ALLOW_NEW_SECTION_OR_PART: yes`.
- `dependency_flow_prompt.md` repairs prerequisite order, notation lifecycle, source ownership after movement, and invalid dependency authority.
- `formalize_content.md` performs the row-by-row theorem/proof/typed-method/example/remark/style/layout/build pass after the structure is stable and migrates legacy `method` blocks to `proofmethod` or `computationmethod` when clear.
- `notation_list_prompt.md` audits `parts/00_notations/` after formalization, promotes only durable notation, repairs collision entries, removes verified stale entries, and reports macro candidates.

For manual screenshot corrections to existing blocks, use `refine_blocks_prompt.md` directly.

Skip any prompt whose work is already settled. For canonical theorem/proof, typed-method, example/remark/expository, mathematical, layout, source-provenance, and collection-level requirements, read `prompts/alignment_requirements.md`, especially Section 5.0 for the external writing baseline, Section 5.7 for examples and remarks, and Section 7 for collection-level standards.

When prompt requirements overlap, keep the shared standard in `prompts/alignment_requirements.md` and leave only workflow-specific instructions in the library prompt.
