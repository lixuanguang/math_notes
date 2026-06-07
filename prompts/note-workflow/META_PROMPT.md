# Meta-Prompt: Run The Notes Workflow

Use this prompt to run the notes workflow from a chosen starting point, including optional source intake from screenshots, source images, or PDFs.

## Starting Command

Prefer a part-scoped cursor so the starting point is unambiguous:

```text
Run the notes workflow.

Start from: Part II Section 1
```

For source intake, use:

```text
Run the notes workflow with source intake.

Source chapter/sections:
<state the chapter or sections extracted here>

Start from: Part II Section 1
```

Other examples:

```text
Run the notes workflow.

Start from: Part II Section 2
```

```text
Run the notes workflow.

Start from: sections/topology/compactness.tex
```

```text
Run the notes workflow.

Start from: Phase 3, Spectral Theorem
```

## Cursor Syntax

Use one of these forms:

- `Start from: Part <roman-or-arabic-number> Section <number>`
- `Start from: Part <exact or partial part title> Section <number>`
- `Start from: <file path>`
- `Start from: Phase <number>, <file path/topic/heading>`
- `Start from: <unique topic or section heading>`

Interpretation rules:

- Resolve part and section numbers from the actual LaTeX order, starting at `math.tex`, following `\input{...}` files, and using the `\part{...}` and `\section{...}` sequence that appears in the compiled notes.
- Treat `Part II Section 1` as: the second `\part{...}` in `math.tex` order, then the first `\section{...}` inside that part. In the current repository, this resolves to Part II, Linear and Operator Structures, Section 1, Structural Linear Algebra.
- If a part is specified, do not match a same-numbered section in any other part.
- If only `Section <number>` is given, it is ambiguous whenever more than one part has that section number; ask for the part before proposing edits.
- If a topic or heading matches multiple files or multiple section levels, report the candidates and ask for clarification before proposing edits.
- After resolving the cursor, report the resolved part title, section title, overview file, and first target content file before starting the phase workflow.

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

Start from: <part-scoped section, file path, topic, or section heading>

Instructions:

- First read the four phase READMEs.
- Use the `Start from:` cursor to determine where to begin.
- Resolve `Start from: Part <roman-or-arabic-number> Section <number>` by reading `math.tex` in compiled order, following `\input{...}` files, and matching the specified `\part{...}` and `\section{...}` in that order.
- Treat `Part II Section 1` as the first `\section{...}` inside the second `\part{...}` in `math.tex` order; in the current repository, this is Part II, Linear and Operator Structures, Section 1, Structural Linear Algebra.
- If only `Section <number>` is given and more than one part has that section number, stop and ask which part the user means.
- If a topic, section heading, or file-like cursor matches more than one candidate, stop and ask the user to choose among the candidates before proposing edits.
- If a phase is specified in the cursor, begin in that phase.
- If no phase is specified, decide which phase is appropriate:
  - Use Phase 0 if screenshots, source images, PDFs, or other source files are attached or source intake is requested.
  - Use Phase 1 if structural organization may still need work.
  - Use Phase 2 if organization is stable but dependency flow needs checking.
  - Use Phase 3 if organization and dependency flow are stable and the section is ready for prose refinement.
- If the cursor is ambiguous after applying the rules above, stop and ask for clarification before proposing edits.

Global workflow:

- Work incrementally.
- Do not audit or edit the whole repository at once.
- Do not make changes without approval for the specific section-bounded source insertion batch, topic batch, dependency-flow issue batch, or refinement issue batch.
- Each approval authorizes only one loop from the relevant phase README.
- Each loop should resolve one approved issue batch inside one current section or subsection, rather than one isolated content piece at a time.
- A section-bounded issue batch may contain multiple related fixes in the current section, such as placement, dependency order, labels, references, displayed-operator notation, proof segmentation, and clarity/succinctness adjustments.
- Resolve dependency-order problems with bigger-picture structural changes: reorder, move, split, or promote content into the correct earlier location.
- Do not use shortcuts such as adding an ad hoc unnumbered prerequisite paragraph immediately before usage.
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
- Prefer repository-style `$...$` equation blocks for standalone displayed formulas whenever possible. Use `\[...\]`, `$$...$$`, `equation`, `equation*`, `align`, `align*`, `gather`, or `multline` only when the formula genuinely needs numbering, labels, cross-references, alignment, multi-line layout, or another environment feature.
- In displayed equation contexts, normalize indexed operators with `\limits` where appropriate, such as `\sum\limits`, `\prod\limits`, `\bigoplus\limits`, `\coprod\limits`, `\bigcup\limits`, `\bigcap\limits`, `\lim\limits`, `\inf\limits`, `\sup\limits`, `\min\limits`, and `\max\limits`.
- Do not force `\limits` into ordinary inline prose unless the repository convention clearly treats that math as display-style.
- Use mathematical notation to tighten prose whenever it improves clarity, especially standard quantifiers and connectives such as `\forall`, `\exists`, `\implies`/`\Rightarrow`, and `\iff` for "if and only if"; keep notation inside math mode and avoid turning readable arguments into opaque symbol strings.
- Keep succinct rewrites explicit enough that assumptions, quantifiers, dependencies, and proof logic remain clear. If a passage is too implicit, first make it explicit, then compress it using notation.
- During Phase 3, segment if-and-only-if proofs, chains of equivalent conditions, lists of equivalence proofs, and lists of condition proofs using the standard proof-style blocks from `prompts/note-workflow/phase-3-section-refinement/README.md`.
- Do not force segmented enumerate blocks onto proofs that are clearer as a single direct argument.
- Prefer letting the proof environment's QED marker close a proof, using `\qedhere` or `\qed` only when needed for placement; avoid final sentences that merely restate the theorem, proposition, lemma, or claim.

Begin by reporting:

1. The source chapter/sections, if provided.
2. The cursor you will use, including the resolved part title, section title, overview file, and first target content file when applicable.
3. The phase you will start with.
4. The first section-bounded source batch, topic batch, dependency-flow issue batch, or refinement issue batch you propose to inspect.

Then follow the relevant phase README exactly.
```
