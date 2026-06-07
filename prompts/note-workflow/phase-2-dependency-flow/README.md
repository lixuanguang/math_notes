# Phase 2: Check Dependency Flow

Use this phase after broad organization is stable but before prose refinement.

Read `prompts/note-workflow/README.md` before this file.

## Goal

For one section-bounded dependency batch, verify that mathematical dependencies
appear before they are used and fix problems structurally.

## Checks

For the current section or topic, check:

- Definitions used before they are stated.
- Notation used before it is introduced.
- Results that depend on later results.
- Methods that rely on examples or remarks.
- Theorems, propositions, lemmas, or corollaries that reference examples or
  remarks.
- Formal content hidden inside remarks or examples but needed later.
- Explicit references to remarks, examples, or numbered definitions that should
  instead be replaced by prior exposition or direct conditions.
- Ad hoc prerequisite paragraphs that should become formal earlier exposition or
  disappear through reordering.
- Labels and references whose order may confuse the reader.
- Multiple labels on one environment or mathematical object.
- Local `\input` or `\include` order when it affects dependency flow.

## Findings Must Include

- File path and section heading.
- Mathematical role of the section.
- Section-bounded issue batch summary.
- Dependencies used in the section and whether each was introduced earlier.
- Notation introduced too late.
- Formal results or methods that reference remarks/examples.
- Content that should be promoted from a remark/example into formal exposition.
- Duplicate-label findings, canonical label to keep, and references to update.
- Proposed minimal fixes grouped as one batch.
- Whether the batch requires moving, splitting, promoting, creating formal
  content in an earlier location, consolidating labels, updating references, or
  adjusting include order.
- Why the fix is structural rather than a shortcut prerequisite paragraph.

## Approved Edit Rules

- Apply all approved dependency-flow fixes together.
- Make the smallest coherent structural change.
- Preserve mathematical meaning.
- Avoid prose refinement unless needed for dependency clarity.
- Do not process later sections.
- Do not rename labels unless explicitly approved.
- Keep theorem, proposition, lemma, corollary, method, definition, example, and
  proof environments intact unless the approved fix requires movement or
  promotion.

## Validation

After editing:

- Re-check dependency order in affected files.
- Confirm no dependency issue was hidden by a shortcut prerequisite paragraph.
- Re-check references and labels.
- Confirm affected environments or objects have at most one label unless
  distinct anchors justify multiple labels.
- Confirm no formal result or method depends on a remark/example.
- Run a lightweight validation if available.
- Summarize changes.

Ask:

```text
Next step: continue dependency-flow checks, revise this batch, jump to a cursor, or stop?
```
