# Phase 2: Check Dependency Flow

Use this phase after the broad organization is stable, but before prose refinement.

## Goal

Check that mathematical dependencies are introduced in the right order, resolving one section-bounded issue batch at a time:

- Each section should only use concepts already introduced.
- Definitions should precede results that use them.
- Notation should be introduced before use.
- Dependency issues should be fixed by structural reordering, moving, splitting, or promoting content, not by inserting ad hoc unnumbered prerequisite paragraphs before usage.
- Formal results and methods must not depend on remarks or examples.
- Essential content inside remarks or examples should be promoted into formal exposition if later results depend on it.
- A single LaTeX environment or mathematical object should have one canonical label unless multiple labels refer to genuinely distinct anchors.
- Refactored content should avoid depending on explicit references to remarks, examples, or numbered definitions; definitions should be introduced before use so later content can use the defined terms and notation directly.

## Cursor

The user may specify where to begin with:

```text
Start from: <section number, file path, topic, or section heading>
```

Examples:

```text
Start from: Section 1
Start from: Section 2
Start from: sections/analysis/sequences.tex
Start from: Monotone Convergence Theorem
```

If a cursor is provided, start there and treat earlier material as intentionally skipped. If the cursor is ambiguous, stop and ask for clarification before proposing edits.

## Batch Rules

- Work section by section or topic by topic.
- Do not check the whole repository at once.
- Keep each batch focused on one coherent section and the related dependency-flow issues inside that section.
- Do not split related issues inside the same section into one approval per content piece.
- Do not edit until the user approves the proposed section-bounded issue batch.
- Each approval authorizes one section-bounded dependency-flow issue batch.

A section-bounded issue batch may include multiple related fixes in the current section, such as moving a needed definition earlier, introducing notation before use, promoting content out of a remark/example, consolidating duplicate labels, and updating local references. Keep the batch limited to the current section unless a cross-section prerequisite fix is necessary and explicitly included in the proposal. Do not solve dependency issues by adding a local unnumbered prerequisite paragraph before the first use; propose the structurally correct reordering instead.

## Dependency Checks

For the current section or topic, check:

- Definitions used before they are stated.
- Notation used before it is introduced.
- Results that depend on later results.
- Places where a dependency problem would be better solved by moving, splitting, or promoting content rather than adding local explanatory text.
- Any ad hoc prerequisite paragraph that should instead become formal earlier exposition or be eliminated through reordering.
- Methods that rely on examples or remarks.
- Theorems, propositions, lemmas, and corollaries that reference examples or remarks.
- Refactored content that explicitly references a remark, example, or numbered definition where the needed condition should instead be stated directly or supplied by prior exposition.
- Remarks or examples containing content that is necessary for later formal results.
- Labels and references whose order may confuse the reader.
- Multiple labels on one object: identify any single `\begin{...}...\end{...}` block or mathematical object with multiple `\label{...}` commands for the same anchor.
- Local `\input` or `\include` order if it affects dependency flow.

## Findings Format

Before editing, report:

- File path and section heading.
- Mathematical role of the section.
- Section-bounded issue batch summary.
- Dependencies used in the section.
- Whether each dependency was introduced earlier.
- Any notation introduced too late.
- Any formal result or method that references a remark or example.
- Any content that unnecessarily relies on explicit references to remarks, examples, or numbered definitions.
- Any content that should be promoted from a remark or example into formal exposition.
- Any single environment or object with multiple labels, the proposed canonical label to keep, and which references would need updating.
- Proposed minimal fixes grouped as one section-bounded issue batch.
- Whether the batch requires moving content, splitting content, promoting content into formal exposition, creating a formal definition/result in an appropriate earlier location, consolidating labels, updating references, or adjusting include order.
- Why the proposed fix is a structural dependency fix rather than a shortcut prerequisite paragraph.

## Approval Loop

After presenting findings:

- If the user says `approve`, apply only the proposed section-bounded issue batch.
- If the user says `skip`, leave it untouched and ask whether to check another section or topic.
- If the user says `revise`, adjust the proposed section-bounded issue batch and present it again.
- If the user says `stop`, stop.
- If the user gives a new `Start from:` cursor, jump there and treat earlier material as intentionally skipped.

## Applying Approved Fixes

When applying an approved dependency-flow issue batch:

- Apply all approved items in the section-bounded issue batch together.
- Make the smallest coherent structural changes needed, while preserving the bigger-picture dependency order.
- Preserve mathematical meaning.
- Avoid prose refinement unless necessary for dependency clarity.
- Do not add ad hoc unnumbered prerequisite paragraphs before usage as a shortcut.
- If prerequisite content is missing or late, move, split, or promote it into the appropriate earlier formal location instead.
- Do not process later sections.
- Do not rename labels unless explicitly approved.
- If duplicate-label consolidation is approved, keep one canonical existing label where possible, update all references to removed labels, and remove only the redundant labels.
- Keep theorem, proposition, lemma, corollary, method, definition, example, and proof environments intact unless the approved fix requires promotion or movement.

Do not consolidate labels that refer to genuinely distinct anchors, such as subfigures, separate numbered lines in an `align`-type environment, or nested environments. Put ambiguous cases under `Needs Human Review`.

## Validation

After applying an issue batch:

- Re-check dependency order in affected files.
- Re-check that dependency issues were resolved structurally rather than by shortcut prerequisite paragraphs.
- Re-check references and labels.
- Confirm each affected environment or object has at most one label unless distinct anchors justify multiple labels.
- Re-check that formal results and methods do not depend on remarks or examples.
- Run a lightweight validation if available.
- Summarize changes.
- Ask: `Next step: continue dependency-flow checks, revise this issue batch, jump to a specific cursor, or stop?`
