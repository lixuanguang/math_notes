# Notes Workflow

Use this workflow to improve the LaTeX notes one approved, section-bounded
batch at a time.

## Read Order

1. Read this file.
2. Resolve the user's `Start from:` cursor.
3. Choose the starting phase.
4. Read only the README for that phase:
   - Phase 0: `phase-0-source-intake/README.md`
   - Phase 1: `phase-1-reorganize/README.md`
   - Phase 2: `phase-2-dependency-flow/README.md`
   - Phase 3: `phase-3-section-refinement/README.md`

Do not read all phase READMEs unless the user explicitly asks for a full audit.

## Phase Choice

- Phase 0: source screenshots, images, PDFs, or source intake requested.
- Phase 1: structure, placement, or section hierarchy may still be unstable.
- Phase 2: structure is stable, but dependency order needs checking.
- Phase 3: structure and dependency flow are stable; prose is ready to refine.

If the cursor names a phase, start in that phase.

## Cursor Rules

Accepted forms:

- `Start from: Part <roman-or-arabic-number> Section <number>`
- `Start from: Part <exact-or-partial-title> Section <number>`
- `Start from: <file path>`
- `Start from: Phase <number>, <file path/topic/heading>`
- `Start from: <unique topic or section heading>`

Resolve part and section numbers from the compiled LaTeX order: start at
`math.tex`, follow `\input{...}` files, and use the actual `\part{...}` and
`\section{...}` order.

`Part II Section 1` means the first `\section{...}` inside the second
`\part{...}`. In this repository, that currently resolves to Part II, Linear
and Operator Structures, Section 1, Structural Linear Algebra.

If a cursor is ambiguous, stop and ask for clarification before proposing edits.
Bare `Section <number>` is ambiguous whenever multiple parts have that section
number.

## Start Report

Before doing phase work, report:

1. Source chapter/sections, if provided.
2. Resolved cursor: part title, section title, overview file, and first target
   content file when applicable.
3. Starting phase.
4. First source batch, topic batch, dependency batch, or refinement batch to
   inspect.

## Approval Contract

- Work incrementally.
- Do not audit or edit the whole repository at once.
- Do not edit until the user approves the specific proposed batch.
- One approval authorizes one loop in one current section or subsection.
- A batch may contain several related fixes in the current section.
- After validation, stop and ask whether to continue, revise, jump to another
  cursor, or stop.
- If the user gives a new `Start from:` cursor, jump there and treat earlier
  material as intentionally skipped.

User responses:

- `approve`: apply only the proposed batch.
- `skip`: leave it untouched and offer the next relevant batch.
- `revise`: adjust the proposal and present it again.
- `stop`: stop.
- New `Start from:` cursor: jump there.

## Global Math Rules

- Preserve mathematical meaning unless the original is ambiguous, incorrect, or
  structurally misplaced.
- Keep diffs focused and avoid unrelated formatting.
- Do not rename labels unless explicitly approved.
- A single LaTeX environment or mathematical object should have one canonical
  label unless multiple labels refer to genuinely distinct anchors.
- If duplicate-label consolidation is approved, keep one existing canonical
  label where possible, update references to removed labels, and remove only the
  redundant labels.
- Do not consolidate labels for distinct subfigures, separate numbered lines in
  an `align`-type environment, or nested environments.
- Theorems, propositions, lemmas, corollaries, and methods must not depend on
  remarks or examples.
- If formal content depends on material currently found only in a remark or
  example, propose moving or promoting that material before use.
- Resolve dependency-order problems structurally: reorder, move, split, or
  promote content into the correct earlier location.
- Do not patch dependency problems by adding an ad hoc unnumbered prerequisite
  paragraph immediately before usage.
- Avoid explicit references to remarks, examples, or numbered definitions during
  refactors. Use established terms directly, or state the needed condition.

## Style Rules

- Follow nearby repository style, macros, theorem environments, labels, and
  notation.
- Use repository-style `$...$` blocks for standalone displayed formulas when no
  numbering, label, cross-reference, alignment, multi-line layout, or special
  environment behavior is needed.
- Use display environments only when their features are needed.
- In displayed contexts, use `\limits` on indexed operators where appropriate:
  `\sum`, `\prod`, `\bigoplus`, `\coprod`, `\bigcup`, `\bigcap`, `\lim`,
  `\inf`, `\sup`, `\min`, and `\max`.
- Do not force `\limits` into ordinary inline prose.
- Use compact notation such as `\forall`, `\exists`, `\implies`, `\Rightarrow`,
  and `\iff` when it improves clarity without hiding assumptions.
- Keep concise rewrites explicit enough that assumptions, quantifiers,
  dependencies, and proof logic remain clear.
- Prefer the proof environment's QED marker. Use `\qedhere` or `\qed` only when
  placement requires it.
- For unclear prose, first make the mathematics explicit, then compress.

## Validation Baseline

After an approved edit, re-check affected:

- Dependency order.
- References and labels.
- Duplicate labels on one anchor.
- Formal results or methods depending on remarks/examples.
- Relevant `\input` or `\include` order.
- Figure placement, if touched.
- Phase-specific requirements.

Run a lightweight validation if available. Do not build with LaTeX unless the
user asks or the phase README says to.
