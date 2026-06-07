# Phase 1: Reorganize Content

Use this phase when structure, placement, file order, or section hierarchy may
need work before dependency checks or prose refinement.

Read `prompts/note-workflow/README.md` before this file.

## Goal

For one section-bounded topic batch:

- Decide whether material belongs in a different file, subsection, or order.
- Move definitions and notation before results that use them.
- Split oversized sections or merge duplicated local material.
- Fill placeholder files where suitable.
- Move misplaced blocks to more natural locations.
- Consolidate duplicate labels only when explicitly approved.

Preserve moved mathematical content verbatim.

## Batch Limits

- One mathematical topic per batch.
- Prefer one target section or subsection.
- Prefer 1-3 source files and roughly 300-500 lines or less.
- Do not migrate broad multi-section structures unless the user approves that
  scope.

## Audit Checklist

For the current topic only, check:

- Placeholder files.
- Reference-before-label issues.
- Multiple labels on one environment or mathematical object.
- Logical order of definitions, notation, examples, results, and proofs.
- Dependency problems that require moving, splitting, or promoting content.
- Formal results or methods that depend on remarks or examples.
- Figures that are far from the text that introduces or uses them.
- Back-to-back figures that are not an intentional comparison.
- Displayed indexed operators that should be normalized later in Phase 3.

## Proposal Must Include

- Topic name.
- Current target section or subsection.
- Target file(s) and source file(s).
- Exact blocks proposed for movement, with file paths and line ranges.
- Where each block would move and why.
- Whether the move fills a placeholder.
- Whether it improves reference-before-label or logical order.
- Any duplicate-label consolidation proposed, including canonical label and
  references to update.
- Any displayed indexed-operator candidates to revisit in Phase 3.
- Whether figure placement remains logical.
- Ambiguous candidates under `Needs Human Review`.
- Whether any formal dependency on a remark/example exists and how the move
  would fix it.

## Approved Edit Rules

- Apply only the approved batch.
- Move complete logical blocks where possible.
- Preserve moved content verbatim.
- Do not rewrite prose or change mathematical statements.
- Do not rename labels unless explicitly approved.
- Only update surrounding structure, such as `\input` or `\include` order, when
  needed by the approved move.

## Validation

After editing:

- Re-check affected references and labels.
- Confirm moved environments or objects have at most one label unless distinct
  anchors justify multiple labels.
- Re-check figure placement and unintended consecutive figures.
- Run a lightweight validation if available.
- Summarize what moved and confirm content was preserved verbatim.

Ask:

```text
Next step: continue to another topic batch, revise this one, jump to a cursor, or stop?
```
