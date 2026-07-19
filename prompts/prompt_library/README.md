# Prompt Library: Entry Points

Start here. Choose one entry point; do not preload every file under `prompts/standards/`.

| Goal | Entry point | Default validation |
| --- | --- | --- |
| Integrate supplied source material at final local quality | `add_content_prompt.md` | Per-file semantic checks plus final build/page render |
| Fix named or screenshot-selected blocks | `refine_blocks_prompt.md` | Targeted build/render |
| Move, split, or re-place content | `reorganize_content_prompt.md` | Structural, no build |
| Repair prerequisite and authority order | `dependency_flow_prompt.md` | Structural, no build |
| Fully formalize one active numbered file | `formalize_content.md` | Full build and page render |
| Repair durable notation and collisions | `notation_list_prompt.md` | Full build and notation-page render |
| Find references for future enrichment | `further_research_prompt.md` | Web/metadata validation; no LaTeX build |

## Loading model

Every entry point provides:

- a small mandatory module list;
- conditional modules selected after inspecting the target/source;
- task-specific configuration and batching;
- a validation profile.

The module contract is in `prompts/standards/README.md`. Conditional does not mean optional: if the target contains that block type, its module must be read completely before editing it. Resolve only one registry row for an explicit `DOMAIN`; with `auto` or `mixed`, classify affected rows using `prompts/standards/domains/README.md` and load only overlays actually represented.

Examples:

- Refining one theorem proof loads repository/scope, mathematical style, theorem/proof, math layout, the matching domain, and targeted validation. It does not load figures, applied finance, source ingestion, or research recommendations.
- Refining a benchmark or circuit-measurement block loads only the matching CS or EE overlay plus the shared block/layout modules it actually uses; embedded firmware may load both overlays.
- Refining a close reading, archival claim, laboratory result, score analysis, or artwork record loads only its matching domain overlay; mixed methods add another overlay only for evidence the second domain substantively owns.
- Moving a figure loads repository/scope, organization/dependencies, collection quality, figures, the relevant domain, and structural validation. It does not load theorem proof-writing rules unless theorem content is changed.
- Adding a mixed paper loads source grounding and the domain router, then only the environment/domain modules used by the extraction ledger.

## Suggested source workflow

Use only phases that remain necessary:

```text
add_content_prompt.md (first-pass)
-> optional add_content_prompt.md (second-pass)
-> reorganize_content_prompt.md
-> dependency_flow_prompt.md
-> formalize_content.md
-> notation_list_prompt.md
-> optional further_research_prompt.md
```

- Source intake owns complete source classification, placement, provenance, and final local quality. A second pass catches genuinely missed source-supported content and first-pass duplication.
- Reorganization owns movement, same-level placement, promotion recommendations, placeholder preservation, and mixed-domain owner separation.
- Dependency flow owns prerequisite, notation/context-before-use, authority, and figure-only ownership repairs.
- Formalization owns the row-by-row explicit/formal/notation/succinct pass, environment typing, proof completion, inline layout, cold pass, build, and rendered inspection.
- Notation work runs after local wording stabilizes and promotes only durable notation.
- Further research recommends authoritative non-duplicate sources but never edits current technical/mathematical content or the bibliography.

For manual corrections to existing blocks, use `refine_blocks_prompt.md` directly. Skip any phase whose work is already settled.
