# Phase 1: Reorganize Content

Use this phase when the notes may need structural changes before prose refinement.

## Goal

Reorganize the repository topic by topic, using section-bounded issue batches rather than moving one content piece at a time:

- Decide file order, chapter order, and section hierarchy.
- Move definitions before results that use them.
- Resolve dependency issues by structural reordering, not by inserting ad hoc prerequisite paragraphs before usage.
- Ensure formal results and methods do not depend on remarks or examples.
- Split oversized sections.
- Merge duplicated material.
- Fill placeholder files where suitable.
- Move misplaced topic blocks to more natural locations.
- Preserve moved mathematical content exactly.
- Consolidate multiple labels on a single LaTeX environment or mathematical object into one approved canonical label.

## Cursor

The user may specify where to begin with:

```text
Start from: <section number, file path, topic, or section heading>
```

Examples:

```text
Start from: Section 1
Start from: Section 2
Start from: sections/topology/compactness.tex
Start from: Compactness
```

If a cursor is provided, start there and treat earlier material as intentionally skipped. If the cursor is ambiguous, stop and ask for clarification before proposing edits.

## Batch Rules

- Work in small section-bounded topic batches.
- Use one mathematical topic per batch.
- Prefer one current target section or subsection per batch. If a reorganization issue spans multiple sections, propose the part affecting the current target section first unless the user approves a broader batch.
- Prefer 1-3 source files per batch.
- Prefer complete logical blocks: definitions, examples, propositions, proofs, remarks, methods, or subsections.
- Avoid batches larger than roughly 300-500 lines unless the user approves.
- Do not audit or migrate the whole repository at once.
- Do not apply any move until the user approves the specific batch.

A section-bounded issue batch may include multiple related reorganization fixes for the selected section, such as moving several definitions before their uses, consolidating duplicate local blocks, fixing local label issues, and updating the relevant `\input` or `\include` order. Do not request separate approval for each individual block when the blocks belong to the same section-level issue batch.

## Audit Priorities

For the current topic only, check:

- Placeholder files: empty or mostly-empty `.tex` files with comments describing intended content.
- Reference-before-label issues: `\ref`, `\eqref`, `\autoref`, `\cref`, `\Cref`, `\pageref`, `\nameref`.
- Multiple labels on one object: a single `\begin{...}...\end{...}` block or mathematical object should not carry multiple `\label{...}` commands unless the labels refer to genuinely distinct subobjects.
- Display-operator notation candidates: note displayed equation contexts where indexed operators such as `\sum`, `\prod`, `\bigoplus`, `\coprod`, `\bigcup`, `\bigcap`, `\lim`, `\inf`, `\sup`, `\min`, or `\max` may need `\limits` during later refinement.
- Logical order: definitions before use, notation before use, examples after supporting content.
- Dependency structure: prefer moving, splitting, or promoting existing content into the correct earlier location over adding a local unnumbered prerequisite paragraph before use.
- Formal dependency: theorems, propositions, lemmas, corollaries, and methods must not reference or depend on remarks or examples.
- Figure placement: figures should remain near the text that introduces, explains, or uses them.
- Consecutive figures: avoid back-to-back figure blocks unless they form an intentional comparison and the user explicitly approves.

## Proposal Format

Before editing, present:

- Topic name.
- Current target section or subsection.
- Target file(s).
- Source file(s).
- Exact block(s) proposed for movement, with file paths and line ranges.
- Short reason each block belongs in the target location.
- Whether the move fills a placeholder.
- Whether it improves reference-before-label order.
- Whether any moved block has multiple labels for a single environment or object, the proposed canonical label to keep, and which references would need updating.
- Whether any moved block has displayed indexed operators that should be normalized with `\limits` during Phase 3.
- Whether it improves logical order.
- Whether figure placement remains logical.
- Whether the move avoids unintended consecutive figures.
- Any ambiguous candidates under `Needs Human Review`.
- Whether any theorem, proposition, lemma, corollary, or method currently references a remark or example, and how the move would fix it.

## Approval Loop

After presenting a batch:

- If the user says `approve`, apply only that batch.
- If the user says `skip`, leave it untouched and ask whether to find another topic.
- If the user says `revise`, adjust the batch and present it again.
- If the user says `stop`, stop.
- If the user gives a new `Start from:` cursor, jump there and treat earlier material as intentionally skipped.

## Applying Approved Moves

When applying an approved batch:

- Preserve moved content verbatim.
- Apply all approved items in the section-bounded issue batch together.
- Do not rewrite prose.
- Do not change mathematical statements.
- Do not rename labels unless the approved batch explicitly includes duplicate-label consolidation.
- If duplicate-label consolidation is approved, keep one canonical existing label where possible, update all references to removed labels, and remove only the redundant labels.
- Do not alter equations, theorem environments, definitions, examples, methods, or proofs.
- Move complete logical blocks where possible.
- Only update surrounding structure, such as `\input` or `\include` order, if needed.

Do not consolidate labels that refer to genuinely distinct anchors, such as subfigures, separate numbered lines in an `align`-type environment, or nested environments. Put ambiguous cases under `Needs Human Review`.

## Validation

After applying a batch:

- Re-check affected references and labels.
- Confirm each moved environment or object has at most one label unless distinct anchors justify multiple labels.
- Re-check figure placement.
- Confirm no unintended consecutive figures were created.
- Run a lightweight validation if available.
- Summarize what moved.
- Confirm moved content was preserved verbatim.
- Ask: `Next step: continue to another topic batch, revise this one, jump to a specific cursor, or stop?`
