# Meta-Prompt: Run The Notes Workflow

Use this prompt to run the notes workflow from a chosen starting point, including optional source intake from screenshots, source images, or PDFs.

## Starting Command

Copy this command and edit the cursor:

```text
Run the notes workflow.

Start from: Section 1
```

For source intake, use:

```text
Run the notes workflow with source intake.

Source chapter/sections:
<state the chapter or sections extracted here>

Start from: Section 1
```

Other examples:

```text
Run the notes workflow.

Start from: Section 2
```

```text
Run the notes workflow.

Start from: sections/topology/compactness.tex
```

```text
Run the notes workflow.

Start from: Phase 3, Spectral Theorem
```

## Meta-Prompt

```text
You are working in the LaTeX notes repository at:

/Users/lxg/Documents/GitHub/math_notes

Run the notes workflow using the four phase READMEs:

0. prompts/note-workflow/phase-0-source-intake/README.md
1. prompts/note-workflow/phase-1-reorganize/README.md
2. prompts/note-workflow/phase-2-dependency-flow/README.md
3. prompts/note-workflow/phase-3-section-refinement/README.md

Source chapter/sections:
<state the chapter or sections extracted here, if adding new source material>

Start from: <section number, file path, topic, or section heading>

Instructions:

- First read the four phase READMEs.
- Use the `Start from:` cursor to determine where to begin.
- If a phase is specified in the cursor, begin in that phase.
- If no phase is specified, decide which phase is appropriate:
  - Use Phase 0 if screenshots, source images, PDFs, or other source files are attached or source intake is requested.
  - Use Phase 1 if structural organization may still need work.
  - Use Phase 2 if organization is stable but dependency flow needs checking.
  - Use Phase 3 if organization and dependency flow are stable and the section is ready for prose refinement.
- If the cursor is ambiguous, stop and ask for clarification before proposing edits.

Global workflow:

- Work incrementally.
- Do not audit or edit the whole repository at once.
- Do not make changes without approval for the specific section-bounded source insertion batch, topic batch, dependency-flow issue batch, or refinement issue batch.
- Each approval authorizes only one loop from the relevant phase README.
- Each loop should resolve one approved issue batch inside one current section or subsection, rather than one isolated content piece at a time.
- A section-bounded issue batch may contain multiple related fixes in the current section, such as placement, dependency order, labels, references, displayed-operator notation, proof segmentation, and clarity/succinctness adjustments.
- After completing one loop, stop and ask whether to continue, revise, jump to another cursor, or stop.
- If the user gives a new `Start from:` cursor, jump there and treat earlier material as intentionally skipped.
- In Phase 0, use only attached/provided source material and existing repository content. Do not search elsewhere or add unsupported material from memory.
- In Phase 0, do not insert source material until the user approves the specific section-bounded insertion batch.

Global mathematical rules:

- Preserve mathematical meaning unless something is ambiguous, incorrect, or structurally misplaced.
- Keep diffs focused.
- Avoid unrelated formatting changes.
- Do not rename labels unless explicitly approved.
- During review, identify any single `\begin{...}...\end{...}` environment or mathematical object with multiple `\label{...}` commands for the same anchor.
- If duplicate-label consolidation is approved, keep one canonical existing label where possible, update all references to removed labels, and remove only the redundant labels.
- Do not consolidate labels that refer to genuinely distinct anchors, such as subfigures, separate numbered lines in an `align`-type environment, or nested environments.
- Theorems, propositions, lemmas, corollaries, and methods must not depend on or reference remarks or examples.
- During content refactor, avoid adding explicit references to remarks, examples, or numbered definitions. Use established terms and notation directly; if clarity would otherwise require such a reference, state the needed condition or propose moving/promoting the needed content.
- Remarks and examples may clarify formal content, but formal content should not rely on them.
- If essential content appears only in a remark or example, propose moving or promoting it before it is referenced by a formal result or method.
- In displayed equation contexts, normalize indexed operators with `\limits` where appropriate, such as `\sum\limits`, `\prod\limits`, `\bigoplus\limits`, `\coprod\limits`, `\bigcup\limits`, `\bigcap\limits`, `\lim\limits`, `\inf\limits`, `\sup\limits`, `\min\limits`, and `\max\limits`.
- Do not force `\limits` into ordinary inline prose unless the repository convention clearly treats that math as display-style.
- Keep succinct rewrites explicit enough that assumptions, quantifiers, dependencies, and proof logic remain clear. If a passage is too implicit, first make it explicit, then compress it using notation.
- During Phase 3, segment if-and-only-if proofs, chains of equivalent conditions, lists of equivalence proofs, and lists of condition proofs using the standard proof-style blocks from `prompts/note-workflow/phase-3-section-refinement/README.md`.
- Do not force segmented enumerate blocks onto proofs that are clearer as a single direct argument.

Begin by reporting:

1. The source chapter/sections, if provided.
2. The cursor you will use.
3. The phase you will start with.
4. The first section-bounded source batch, topic batch, dependency-flow issue batch, or refinement issue batch you propose to inspect.

Then follow the relevant phase README exactly.
```
