# Prompt Library

Use one prompt directly instead of running a monolithic workflow.

- `add_content_prompt.md`: final-quality source-grounded insertion from screenshots, PDFs, or provided files.
- `refine_blocks_prompt.md`: targeted refinement of screenshot-selected theorem/proof/method blocks.
- `reorganize_content_prompt.md`: structural movement, splitting, placement, and duplicate-label cleanup.
- `dependency_flow_prompt.md`: dependency-order audit and structural repair.
- `formalize_content.md`: full environment-level formalization against `prompts/alignment_requirements.md`.

Recommended sequence for a new source batch:

```text
add_content_prompt.md with PASS_MODE: first-pass -> optional add_content_prompt.md with PASS_MODE: second-pass -> reorganize_content_prompt.md -> dependency_flow_prompt.md -> formalize_content.md
```

For manual screenshot corrections to existing blocks, use `refine_blocks_prompt.md` directly.

Skip any prompt whose work is already settled. For canonical mathematical and layout requirements, read `prompts/alignment_requirements.md`.

When prompt requirements overlap, keep the shared standard in `prompts/alignment_requirements.md` and leave only workflow-specific instructions in the library prompt.
