# Prompt Library

Use one prompt directly instead of running a monolithic workflow.

- `add_content_prompt.md`: source-grounded intake from screenshots, PDFs, or provided files.
- `reorganize_content_prompt.md`: structural movement, splitting, placement, and duplicate-label cleanup.
- `dependency_flow_prompt.md`: dependency-order audit and structural repair.
- `formalize_content.md`: full environment-level formalization against `prompts/alignment_requirements.md`.

Recommended sequence for rough new material:

```text
add_content_prompt.md -> reorganize_content_prompt.md -> dependency_flow_prompt.md -> formalize_content.md
```

Skip any prompt whose work is already settled. For canonical mathematical and layout requirements, read `prompts/alignment_requirements.md`.
