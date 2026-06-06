# Phase 3: Refine Section By Section

Use this phase after organization and dependency flow are stable.

## Goal

Refine mathematical writing section by section, resolving one section-bounded issue batch at a time:

- Formalize wording.
- Make prose more succinct.
- Introduce notation where useful.
- Standardize terminology.
- Tighten proofs and explanations.
- Standardize segmented proof structure for equivalence and condition-list arguments.
- Preserve the established organization from earlier phases.
- Consolidate multiple labels on a single LaTeX environment or mathematical object into one approved canonical label.
- Normalize displayed indexed operators so they use `\limits` where appropriate.
- Make content concise without making it under-explained.

## Cursor

The user may specify where to begin with:

```text
Start from: <section number, file path, topic, or section heading>
```

Examples:

```text
Start from: Section 1
Start from: Section 2
Start from: sections/linear_algebra/eigenvalues.tex
Start from: Spectral Theorem
```

If a cursor is provided, start there and treat earlier material as intentionally skipped. If the cursor is ambiguous, stop and ask for clarification before proposing edits.

## Section Rules

- Work one section at a time.
- Do not process multiple sections in one pass.
- Do not skip ahead unless the user gives a `Start from:` cursor.
- Do not continue to another section until the user approves.
- Each approval authorizes one section-bounded issue batch:

```text
identify and analyse section -> group issues into one section-bounded batch -> edit current section -> validate -> seek permission again
```

A section-bounded issue batch may include multiple related refinements inside the current section, such as formalizing prose, tightening proof structure, normalizing displayed operators with `\limits`, consolidating duplicate labels, removing improper references to remarks/examples/numbered definitions, and expanding prose that became too terse. Do not request separate approval for each individual sentence, formula, label, or proof step when they belong to the same current-section batch.

## Writing Checks

For the current section, check:

- Informal wording.
- Redundant phrasing.
- Vague assumptions.
- Undefined terms.
- Inconsistent notation.
- Notation that could replace wordy prose.
- Displayed indexed operators that should use `\limits`, such as `\sum\limits`, `\prod\limits`, `\bigoplus\limits`, `\coprod\limits`, `\bigcup\limits`, `\bigcap\limits`, `\lim\limits`, `\inf\limits`, `\sup\limits`, `\min\limits`, and `\max\limits`.
- Proofs that can be tightened without changing meaning.
- Proofs of equivalences or lists of conditions that should be segmented with the standard enumerate blocks below.
- Passages that became too terse or would become too terse after refactoring; make the mathematical content explicit first, then compress it using notation.
- Examples or remarks that contain formal content needed by later results.
- Theorems, propositions, lemmas, corollaries, or methods that reference remarks or examples.
- Refactored content that explicitly references remarks, examples, or numbered definitions where the needed condition should instead be stated directly or supplied by prior exposition.
- Any dependency issue that should be sent back to Phase 1 or Phase 2 for structural reordering instead of being patched with a local unnumbered prerequisite paragraph.
- Multiple labels on one object: a single `\begin{...}...\end{...}` block or mathematical object should not carry multiple `\label{...}` commands unless the labels refer to genuinely distinct subobjects.

## Analysis Format

Before editing, report:

- File path and section heading.
- Brief summary of what the section is doing.
- Section-bounded issue batch summary.
- Passages that should be more formal, succinct, notation-driven, or precise, grouped by issue type.
- Whether any theorem, proposition, lemma, corollary, or method references a remark or example.
- How you will fix any forbidden reference to a remark or example.
- Whether the refactor can avoid explicit references to remarks, examples, or numbered definitions while preserving clarity.
- Whether any clarity issue is actually a dependency-order problem that should be resolved by moving, splitting, or promoting content rather than adding a shortcut prerequisite paragraph.
- Whether any displayed equation context needs `\limits` normalization for indexed operators.
- Whether any proof should be segmented using one of the standard proof-style blocks.
- Any place where succinctness would make the content too implicit, and how you will keep the needed assumptions, definitions, or proof steps explicit.
- Whether any environment or object has multiple labels, the proposed canonical label to keep, and which references would need updating.
- Intended edits, grouped as one section-bounded issue batch and stated before applying them.

## Approval Loop

After presenting the section analysis:

- If the user says `approve`, apply only the approved section-bounded issue batch in the current section.
- If the user says `skip`, leave it untouched and ask whether to continue.
- If the user says `revise`, adjust the proposed edits and present them again.
- If the user says `stop`, stop.
- If the user gives a new `Start from:` cursor, jump there and treat earlier material as intentionally skipped.

## Editing Rules

When editing an approved section:

- Make focused edits only within the current section.
- Apply all approved items in the section-bounded issue batch together.
- Preserve mathematical meaning unless the original is ambiguous or incorrect.
- Prefer concise formal language and standard notation.
- Do not edit later sections.
- Do not rename labels unless explicitly approved.
- If duplicate-label consolidation is approved, keep one canonical existing label where possible, update all references to removed labels, and remove only the redundant labels.
- Remove or rewrite references from formal results or methods to remarks or examples.
- If necessary, promote essential content from a remark or example into formal exposition or a formal result.
- Avoid adding explicit references to remarks, examples, or numbered definitions during content refactor. Use established terms and notation directly; if clarity would otherwise require a reference, state the needed condition or move/promote the needed content with approval.
- Do not patch dependency-order problems by adding an ad hoc unnumbered prerequisite paragraph before usage. If refinement reveals a dependency problem, propose returning to Phase 1 or Phase 2 to reorder, split, move, or promote the relevant content.
- In displayed equation contexts, normalize indexed operators to use `\limits` where appropriate. This includes `equation`, `equation*`, `align`, `align*`, `gather`, `multline`, `\[...\]`, `$$...$$`, and any repository-specific `$...$` display-style equation blocks. Do not force `\limits` into ordinary inline prose unless the repository convention clearly treats that math as display-style.
- For indexed direct sums, use the size-appropriate operator, e.g. `\bigoplus\limits_{i \in I}`, rather than forcing limits onto an ordinary binary `\oplus` unless that is already the local convention.
- Use a two-pass refinement when prose is unclear: first make the mathematical content explicit, then make it succinct with notation. Do not remove assumptions, quantifiers, dependencies, or proof steps merely to shorten the prose.
- Use the standard proof-style blocks below when a proof is naturally an equivalence, a chain of equivalent conditions, a list of equivalence proofs, or a list of condition proofs. Do not force these blocks onto proofs that are clearer as a single direct argument.

Do not consolidate labels that refer to genuinely distinct anchors, such as subfigures, separate numbered lines in an `align`-type environment, or nested environments. Put ambiguous cases under `Needs Human Review`.

## Proof-Style Blocks

For an if-and-only-if proof, use:

```latex
\begin{enumerate}[label=\roman*.]
\setlength{\itemsep}{0pt}
\item[$(\Rightarrow)$]
\item[$(\Leftarrow)$]
\end{enumerate}
```

For a proof cycling through a list of equivalent conditions, use:

```latex
\begin{enumerate}[label=(\roman*).]
\setlength{\itemsep}{0pt}
\item[$(i)$]$\Rightarrow (ii)$
\item[$(ii)$]$\Rightarrow (iii)$
\end{enumerate}
```

Add further implication steps as needed, including the final implication back to the first condition when proving equivalence by a cycle.

For a list of if-and-only-if type proofs, use:

```latex
\begin{enumerate}[label=(\roman*).]
\setlength{\itemsep}{0pt}
\item
\item
\end{enumerate}
```

For a list of condition-type proofs, use:

```latex
\begin{enumerate}[label=(\roman*)]
\setlength{\itemsep}{0pt}
\item
\item
\end{enumerate}
```

## Writing Goals

- Replace informal explanations with precise mathematical language.
- Use standard notation where it improves clarity.
- Make definitions, propositions, methods, examples, and proofs concise.
- Segment equivalence and condition-list proofs using the standard proof-style blocks when doing so improves readability.
- Keep concise writing explicit enough that assumptions, quantifiers, dependencies, and proof logic remain recoverable without guessing.
- State assumptions explicitly.
- Remove redundant phrasing.
- Keep notation consistent within each file and across related files.
- Standardize displayed indexed operators with `\limits` where appropriate.
- Avoid explicit references to remarks, examples, and numbered definitions in the refactored content unless the user explicitly approves an exception.
- Do not change mathematical content unless the original is ambiguous, incorrect, or structurally misplaced.

## Validation

After editing a section:

- Re-check notation consistency within the section and nearby dependencies.
- Re-check displayed indexed operators for appropriate `\limits` usage.
- Re-check that any segmented equivalence or condition-list proof uses the appropriate standard proof-style block.
- Re-check that succinct rewrites remain explicit enough to preserve assumptions, quantifiers, dependencies, and proof logic.
- Re-check that no dependency-order issue was hidden by adding a shortcut prerequisite paragraph.
- Re-check references and labels affected by the edit.
- Confirm each affected environment or object has at most one label unless distinct anchors justify multiple labels.
- Confirm no formal result or method depends on a remark or example.
- Run a lightweight validation if available.
- Summarize what changed.
- Ask: `Next step: continue to the next logical section, revise this one, jump to a specific cursor, or stop?`
