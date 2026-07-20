# Math Notes Standards Router

This file is retained for compatibility with older instructions. It is no longer a monolithic prompt.

## Start here

Choose exactly one executable entry point in `prompts/prompt_library/`:

- `add_content_prompt.md` — integrate supplied screenshots, PDFs, papers, or files.
- `refine_blocks_prompt.md` — repair explicitly named or screenshot-selected blocks.
- `reorganize_content_prompt.md` — move/split/place content without prose formalization.
- `dependency_flow_prompt.md` — audit and repair prerequisite/authority order.
- `formalize_content.md` — full row-by-row formalization and rendered verification.
- `notation_list_prompt.md` — audit durable notation and collisions after formalization.
- `further_research_prompt.md` — recommend sources for a later source-grounded run.

Each entry point contains a load manifest. Read only the shared modules it marks mandatory and the conditional modules corresponding to block types actually present. The complete module index and loading contract are in `prompts/standards/README.md`.

## Why the standard is segmented

The former file repeated safety, domain, environment, layout, source, and validation rules across every workflow. The segmented version keeps one authoritative owner for each rule and avoids loading figure, finance, research-paper, notation-list, or other requirements when the target does not contain them.

Scope and build exceptions in an entry point may narrow what work is performed; they never weaken any standard applicable to a block that is touched.

## Non-negotiable repository standards

- Preserve mathematical correctness, explicit hypotheses, quantifier scope, proof completeness, and source/claim authority while making prose succinct.
- For any LaTeX content edit, load `prompts/standards/layout/math_layout.md`. Its inline-math preference, display exceptions, semantic line-breaking rules, and rendered no-overflow check are user-specific requirements.
- For theorem-style work, load `prompts/standards/writing/theorems_and_proofs.md`, including exact Structural Commentary / Key Insight placement and syntax.
- Preserve unrelated work and the canonical `parts/` hierarchy.
- A successful build or clean search never substitutes for semantic and rendered review.

## Standards directories

- `prompts/standards/writing/` — mathematical style and environment semantics.
- `prompts/standards/layout/` — inline/display layout, overflow prevention, figures, and accessibility.
- `prompts/standards/structure/` — placement, dependencies, collection quality, and notation lifecycle.
- `prompts/standards/sources/` — source-grounded ingestion and later research recommendations.
- `prompts/standards/domains/` — the registered formal/computing, humanities, social-science, science/engineering, finance, and arts overlays.
- `prompts/standards/validation.md` — structural, targeted, and full render-validation profiles.
- `prompts/standards/external_sources.md` — current external basis; not normally loaded during an editing run.
