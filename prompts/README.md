# Prompts

- `prompts/prompt_library/`: executable workflow entry points. Start every task here.
- `prompts/standards/`: shared modules loaded by an entry point according to its target census.
  - `writing/`: mathematical style and environment roles.
  - `layout/`: inline/display layout, overflow prevention, figures, and accessibility.
  - `structure/`: placement, dependencies, collection quality, and notation lifecycle.
  - `sources/`: source-grounded ingestion and research recommendations.
  - `domains/`: math, quantitative-finance, fundamental-finance, and physics overlays.
- `alignment_requirements.md`: compatibility router for older references; it is not an executable monolithic prompt.

See `prompts/prompt_library/README.md` to choose a workflow and `prompts/standards/README.md` for the conditional loading contract.
