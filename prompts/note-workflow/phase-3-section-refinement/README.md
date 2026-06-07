# Phase 3: Refine Section By Section

Use this phase after organization and dependency flow are stable.

Read `prompts/note-workflow/README.md` before this file.

## Goal

For one section-bounded refinement batch:

- Formalize wording.
- Make prose succinct without making it opaque.
- Introduce notation where useful.
- Tighten proofs and explanations.
- Normalize display math style and indexed operators.
- Use standard proof-style blocks when they improve readability.
- Preserve established organization.

## Checks

For the current section, check:

- Informal, redundant, vague, or imprecise wording.
- Undefined terms or inconsistent notation.
- Wordy quantifier/connective prose that can become readable notation.
- Proofs that can be tightened without changing meaning.
- Proof endings that merely restate the claim.
- Equivalence, implication, or condition-list proofs that should be segmented.
- Label-only proof scaffolding, such as an outer `$(v)$` item followed only by
  nested direction items.
- Direction items whose body strands a short final line or side condition.
- Inline equation chains likely to break after an unfinished relation symbol.
- Enumerate label style: `label=\roman*.` for definition/method lists, and
  `label=(\roman*)` for proof/equivalence/condition lists.
- Standalone displayed formulas that can use repository-style `$...$` blocks.
- Displayed indexed operators needing `\limits`.
- Short final rendered lines or isolated formula fragments that can be repaired
  semantically.
- Formal results or methods referencing remarks/examples.
- Content that has become too terse or hides assumptions.
- Multiple labels on one environment or mathematical object.
- Dependency-order issues that should go back to Phase 1 or 2 instead of being
  patched locally.

## Analysis Must Include

- File path and section heading.
- Brief summary of the section.
- Section-bounded refinement batch summary.
- Passages to make more formal, succinct, notation-driven, or precise.
- Any forbidden reference to a remark/example and the intended fix.
- Any issue that is really a dependency-order problem.
- Display formulas to convert to repository-style `$...$` blocks.
- Displayed indexed operators to normalize with `\limits`.
- Proofs needing segmentation or proof-ending cleanup.
- Label-only or direction-marker proof artifacts and the intended repair.
- Wrong enumerate label styles.
- Short final lines or formula fragments and the semantic repair.
- Duplicate-label findings, canonical label to keep, and references to update.
- Intended edits grouped as one batch.

## Approved Edit Rules

- Edit only the approved current section batch.
- Preserve mathematical meaning unless the original is ambiguous, incorrect, or
  structurally misplaced.
- Prefer concise formal language and standard notation.
- Use notation only when it remains readable.
- Do not edit later sections.
- Do not rename labels unless explicitly approved.
- Remove or rewrite references from formal results or methods to remarks or
  examples.
- If refinement reveals a dependency problem, propose returning to Phase 1 or 2.
- Prefer semantic line repairs over manual `\\`, `\newline`, spacing, or
  arbitrary layout tweaks.
- Do not leave an inline equation chain with a likely rendered line ending in an
  unfinished binary relation.
- Use the proof environment's automatic QED marker where possible.

## Proof-Style Blocks

For an if-and-only-if proof:

```latex
\begin{enumerate}[label=(\roman*)]
\setlength{\itemsep}{0pt}
\item[$(\Rightarrow)$]
\item[$(\Leftarrow)$]
\end{enumerate}
```

For a cycle of equivalent conditions:

```latex
\begin{enumerate}[label=(\roman*)]
\setlength{\itemsep}{0pt}
\item[$(i)$]$\Rightarrow (ii)$
\item[$(ii)$]$\Rightarrow (iii)$
\item[$(iii)$]$\Rightarrow (i)$
\end{enumerate}
```

For lists of equivalence or condition proofs:

```latex
\begin{enumerate}[label=(\roman*)]
\setlength{\itemsep}{0pt}
\item
\item
\end{enumerate}
```

When one condition needs both directions, keep the proof flat:

```latex
\begin{enumerate}[label=(\roman*)]
\setlength{\itemsep}{0pt}
\item[$(v)$] ($\Rightarrow$)
\item[$(v)$] ($\Leftarrow$)
\end{enumerate}
```

Do not force these blocks onto proofs that are clearer as a direct argument.

## Validation

After editing:

- Re-check notation consistency.
- Re-check display formula format and displayed indexed operators.
- Re-check segmented proof structure and enumerate label styles.
- Re-check proof endings.
- Re-check short final lines or formula fragments touched by the edit.
- Re-check that concise rewrites preserve assumptions, quantifiers,
  dependencies, and proof logic.
- Re-check references and labels.
- Confirm affected environments or objects have at most one label unless
  distinct anchors justify multiple labels.
- Confirm no formal result or method depends on a remark/example.
- Run a lightweight validation if available.
- Summarize what changed.

Ask:

```text
Next step: continue to the next logical section, revise this one, jump to a cursor, or stop?
```
