# Phase 3: Refine Section By Section

Use this phase after organization and dependency flow are stable.

## Goal

Refine mathematical writing section by section, resolving one section-bounded issue batch at a time:

- Formalize wording.
- Make prose more succinct.
- Introduce notation where useful.
- Use compact standard notation such as `\forall`, `\exists`, `\implies`/`\Rightarrow`, and `\iff` where it tightens mathematical prose without obscuring the argument.
- Standardize terminology.
- Tighten proofs and explanations.
- Let the proof environment's QED marker end proofs where possible instead of repeating the proved statement in prose.
- Standardize segmented proof structure for equivalence and condition-list arguments.
- Preserve the established organization from earlier phases.
- Consolidate multiple labels on a single LaTeX environment or mathematical object into one approved canonical label.
- Prefer repository-style `$...$` equation blocks over `\[...\]`, `$$...$$`, `equation`, `align`, and related display environments whenever the displayed formula does not need numbering, labels, cross-references, alignment, multi-line layout, or another environment feature.
- Normalize displayed indexed operators so they use `\limits` where appropriate.
- Detect and repair visually short final lines or isolated formula fragments when a semantic rewrite can improve readability.
- Make content concise without making it under-explained.

## Cursor

The user may specify where to begin with:

```text
Start from: <part-scoped section, file path, topic, or section heading>
```

Examples:

```text
Start from: Part II Section 1
Start from: Part II Section 2
Start from: sections/linear_algebra/spectral_linear_algebra/3_1_eigenstructure_and_invariant_subspaces.tex
Start from: Spectral Theorem
```

If a cursor is provided, start there and treat earlier material as intentionally skipped. Resolve part and section numbers from the compiled LaTeX order beginning at `math.tex`. If a cursor is ambiguous, including a bare `Section <number>` that appears in multiple parts, stop and ask for clarification before proposing edits.

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
- Wordy quantifier or connective phrases that can become compact math notation, such as "for every" to `\forall`, "there exists" to `\exists`, "implies" to `\implies`/`\Rightarrow`, and "if and only if" to `\iff`.
- Displayed formulas that can use repository-style `$...$` equation blocks instead of `\[...\]`, `$$...$$`, `equation`, `equation*`, `align`, `align*`, `gather`, or `multline`.
- Displayed indexed operators that should use `\limits`, such as `\sum\limits`, `\prod\limits`, `\bigoplus\limits`, `\coprod\limits`, `\bigcup\limits`, `\bigcap\limits`, `\lim\limits`, `\inf\limits`, `\sup\limits`, `\min\limits`, and `\max\limits`.
- Proofs that can be tightened without changing meaning.
- Proof endings that merely restate the claim, such as "This proves the theorem"; replace them with the automatic QED marker or with `\qedhere`/`\qed` only when placement requires it.
- Proofs of equivalences or lists of conditions that should be segmented with the standard enumerate blocks below.
- Proof items whose visible content is mostly labels or proof-direction markers, such as an outer `$(v)$` line followed immediately by a nested `$(\Rightarrow)$` or `$(\Leftarrow)$` line.
- Proof-direction items, especially `$(\Rightarrow)$` and `$(\Leftarrow)$`, whose body wraps into a tiny continuation line or strands a side condition such as `$c \in \mathbb{F}$`.
- Inline equation or relation chains that visibly break after an unfinished relation symbol, such as a line ending with `=`, `\le`, `\ge`, `\sim`, `\iff`, `\Rightarrow`, or another binary relation before the expression continues on the next line.
- Enumerate label style: definition or method lists may use `\begin{enumerate}[label=\roman*.]`; proof, equivalence, implication, and condition-list blocks should use `\begin{enumerate}[label=(\roman*)]`.
- Passages that became too terse or would become too terse after refactoring; make the mathematical content explicit first, then compress it using notation.
- Rendered or likely rendered short final lines: paragraphs, definitions, proof items, or explanatory sentences whose final visual line contains only a few words or a lone inline formula fragment.
- Examples or remarks that contain formal content needed by later results.
- Theorems, propositions, lemmas, corollaries, or methods that reference remarks or examples.
- Refactored content that explicitly references remarks, examples, or numbered definitions where the needed condition should instead be stated directly or supplied by prior exposition.
- Any dependency issue that should be sent back to Phase 1 or Phase 2 for structural reordering instead of being patched with a local unnumbered prerequisite paragraph.
- Multiple labels on one object: a single `\begin{...}...\end{...}` block or mathematical object should not carry multiple `\label{...}` commands unless the labels refer to genuinely distinct subobjects.

## Short-Line Cleanup

During Phase 3, treat short final visual lines as readability candidates when they are visible in the compiled output or strongly suggested by the source. Flag a paragraph, definition, proof item, or explanatory sentence if its final rendered line has only a few words, a single equation fragment, or a stranded relation such as `$B = PAQ$` after a long preceding clause.

Also flag proof-marker artifacts: lines whose main visible content is an enumerate label, a repeated condition number, or a direction marker rather than mathematical content. This includes patterns such as an outer `$(v)$` item containing only `For (v), prove both implications.` followed immediately by nested `$(\Rightarrow)$` and `$(\Leftarrow)$` items.

For direction-labeled proof items, inspect the whole rendered item, not only the label line. A `$(\Rightarrow)$` or `$(\Leftarrow)$` item is still a cleanup candidate when its body has enough content but wraps so that the final or continuation line contains only a short side condition, a bound such as `$c \in \mathbb{F}$`, or a few trailing words after a long quantified sentence.

Also flag unfinished relation wraps: a proof item or paragraph should not leave a displayed line ending with a binary relation while the right-hand side starts on the next line, as in a long inline chain ending with `=`, followed by `$a^{-1}0 = 0$` on the next line.

Prefer semantic repairs over spacing tricks:

- First make the mathematical content explicit, then compress it with notation.
- Pull an isolated relation into the preceding clause when it remains readable, using forms such as `with $B = PAQ$`, `where $B = PAQ$`, or `i.e. $B = PAQ$`.
- Introduce notation or quantifiers that shorten a wordy setup without hiding assumptions, e.g. replace repeated prose by `$P,Q$ invertible` when the objects are already clear.
- Replace label-only proof scaffolding with content-bearing text: state the actual implication or equivalence in the parent item, or flatten the directions into sibling items in the same enumerate, repeating the condition label and putting the direction marker in the item body, such as `\item[$(v)$] ($\Rightarrow$)` and `\item[$(v)$] ($\Leftarrow$)`.
- Repair direction-item wrap problems by moving quantifier bounds earlier, tightening repeated terms, or splitting the sentence before the quantified conclusion; for example, avoid ending a `$(\Rightarrow)$` item with a stranded `$c \in \mathbb{F}$` line after `for all $\mathbf{u},\mathbf{v} \in \mathcal{U}$`.
- Repair unfinished relation wraps by shortening the chain, naming an intermediate equality in prose, splitting the argument before the chain, or moving the chain to a repository-style `$...$` equation block when the chain is central and genuinely benefits from display treatment.
- Split an overlong sentence into balanced sentences if that prevents a tiny trailing line and improves the logic.
- Move a central formula to a repository-style `$...$` equation block only when the formula genuinely benefits from display treatment.
- Reorder clauses so the condition, notation, or conclusion is not stranded at the end of a line.
- Avoid cosmetic fixes such as manual `\\`, `\newline`, arbitrary `\hspace`, forced breaks, or spacing tweaks unless the mathematical layout itself requires them.

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
- Whether any displayed formula can be converted to repository-style `$...$` equation format without losing numbering, labels, cross-references, alignment, multi-line layout, or other environment-specific behavior.
- Whether any displayed equation context needs `\limits` normalization for indexed operators.
- Whether any proof should be segmented using one of the standard proof-style blocks.
- Whether any proof item has label-only or direction-marker-only scaffolding, and whether it should be rewritten as content-bearing parent text or flat repeated-label direction items.
- Whether any `$(\Rightarrow)$` or `$(\Leftarrow)$` item wraps into a short continuation line, and the intended quantifier, notation, sentence-splitting, or clause-order repair.
- Whether any inline equation chain visibly breaks after an unfinished relation symbol, and whether the fix should be compression, prose splitting, an intermediate named step, or a repository-style `$...$` equation block.
- Whether any enumerate block uses the wrong label style for its role: `label=\roman*.` only for definition/method lists, and `label=(\roman*)` for proof, equivalence, implication, or condition-list blocks.
- Any place where succinctness would make the content too implicit, and how you will keep the needed assumptions, definitions, or proof steps explicit.
- Any short final rendered lines or isolated formula fragments, and the intended prose, notation, clause-order, or display-structure repair.
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
- Use notation for quantifiers and logical connectives when it shortens the prose naturally; keep it in math mode, and do not replace readable explanatory sentences with dense symbolic strings.
- Do not edit later sections.
- Do not rename labels unless explicitly approved.
- If duplicate-label consolidation is approved, keep one canonical existing label where possible, update all references to removed labels, and remove only the redundant labels.
- Remove or rewrite references from formal results or methods to remarks or examples.
- If necessary, promote essential content from a remark or example into formal exposition or a formal result.
- Avoid adding explicit references to remarks, examples, or numbered definitions during content refactor. Use established terms and notation directly; if clarity would otherwise require a reference, state the needed condition or move/promote the needed content with approval.
- Do not patch dependency-order problems by adding an ad hoc unnumbered prerequisite paragraph before usage. If refinement reveals a dependency problem, propose returning to Phase 1 or Phase 2 to reorder, split, move, or promote the relevant content.
- Prefer repository-style `$...$` equation blocks for standalone displayed formulas whenever possible. Use `\[...\]`, `$$...$$`, `equation`, `equation*`, `align`, `align*`, `gather`, or `multline` only when the formula genuinely needs numbering, labels, cross-references, alignment, multi-line layout, or another environment feature.
- In displayed equation contexts, normalize indexed operators to use `\limits` where appropriate. This includes `equation`, `equation*`, `align`, `align*`, `gather`, `multline`, `\[...\]`, `$$...$$`, and any repository-specific `$...$` display-style equation blocks. Do not force `\limits` into ordinary inline prose unless the repository convention clearly treats that math as display-style.
- For indexed direct sums, use the size-appropriate operator, e.g. `\bigoplus\limits_{i \in I}`, rather than forcing limits onto an ordinary binary `\oplus` unless that is already the local convention.
- Use a two-pass refinement when prose is unclear: first make the mathematical content explicit, then make it succinct with notation. Do not remove assumptions, quantifiers, dependencies, or proof steps merely to shorten the prose.
- When repairing short final lines or stranded formula fragments, prefer prose, notation, clause-order, or display-structure revisions over manual line breaks or spacing adjustments.
- When a proof item is followed immediately by `$(\Rightarrow)$` or `$(\Leftarrow)$`, do not leave the outer item as a short placeholder such as `For (v), prove both implications.`; make the outer item substantive or flatten the proof directions into repeated-label sibling items in the same enumerate if that reads better.
- When a `$(\Rightarrow)$` or `$(\Leftarrow)$` item itself has a short continuation line, rewrite the item semantically: move bounds such as `$c \in \mathbb{F}$` before the conclusion, compress repeated variables with notation, or split the item into clearer sentences.
- Do not leave an inline equation chain with a rendered line ending in an unfinished binary relation. Rewrite the argument so each rendered line ends after a complete expression, or promote a long equality chain to a repository-style `$...$` equation block when display layout is the clearest form.
- Use `\begin{enumerate}[label=(\roman*)]` for proof, equivalence, implication, and condition-list blocks. Reserve `\begin{enumerate}[label=\roman*.]` for definition or method lists where the bare roman-with-period style is intentional.
- Use the standard proof-style blocks below when a proof is naturally an equivalence, a chain of equivalent conditions, a list of equivalence proofs, or a list of condition proofs. Do not force these blocks onto proofs that are clearer as a single direct argument.
- Prefer the proof environment's automatic QED marker to a final sentence that reiterates the statement just proved; use `\qedhere` or `\qed` only when the marker needs explicit placement.

Do not consolidate labels that refer to genuinely distinct anchors, such as subfigures, separate numbered lines in an `align`-type environment, or nested environments. Put ambiguous cases under `Needs Human Review`.

## Proof-Style Blocks

For an if-and-only-if proof, use:

```latex
\begin{enumerate}[label=(\roman*)]
\setlength{\itemsep}{0pt}
\item[$(\Rightarrow)$]
\item[$(\Leftarrow)$]
\end{enumerate}
```

For a proof cycling through a list of equivalent conditions, use:

```latex
\begin{enumerate}[label=(\roman*)]
\setlength{\itemsep}{0pt}
\item[$(i)$]$\Rightarrow (ii)$
\item[$(ii)$]$\Rightarrow (iii)$
\end{enumerate}
```

Add further implication steps as needed, including the final implication back to the first condition when proving equivalence by a cycle.

For a list of if-and-only-if type proofs, use:

```latex
\begin{enumerate}[label=(\roman*)]
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

When one condition in a condition-list proof requires both directions, do not insert a nested enumerate below a placeholder item such as `For (v), prove both implications.` Keep the proof flat by repeating the condition label in the same enumerate and putting the direction marker at the start of the item body:

```latex
\begin{enumerate}[label=(\roman*)]
\setlength{\itemsep}{0pt}
\item[$(v)$] ($\Rightarrow$)
\item[$(v)$] ($\Leftarrow$)
\end{enumerate}
```

## Writing Goals

- Replace informal explanations with precise mathematical language.
- Use standard notation where it improves clarity.
- Prefer compact logical notation in mathematical clauses, including `\forall`, `\exists`, `\implies`/`\Rightarrow`, and `\iff`, whenever it makes the prose tighter and still readable.
- Make definitions, propositions, methods, examples, and proofs concise.
- End proofs with QED where possible instead of a final prose repetition of the proved statement.
- Segment equivalence and condition-list proofs using the standard proof-style blocks when doing so improves readability.
- Avoid label-only proof scaffolding such as a short `$(v)$` line followed immediately by a nested `$(\Rightarrow)$` line; prefer flat repeated-label direction items.
- Avoid direction-labeled proof items whose content strands a tiny continuation line after the proof marker.
- Avoid unfinished inline equality or implication chains whose rendered line ends with a binary relation and continues on the next line.
- Keep enumerate label style role-sensitive: bare `\roman*.` for definition/method lists, parenthesized `(\roman*)` for proof/equivalence/condition-list structures.
- Keep concise writing explicit enough that assumptions, quantifiers, dependencies, and proof logic remain recoverable without guessing.
- State assumptions explicitly.
- Remove redundant phrasing.
- Keep notation consistent within each file and across related files.
- Use repository-style `$...$` equation blocks for standalone displayed formulas whenever possible, reserving display environments for labels, numbering, cross-references, alignment, multi-line layout, or other needed environment behavior.
- Standardize displayed indexed operators with `\limits` where appropriate.
- Avoid leaving a definition, proof item, or explanatory paragraph with a tiny final line or isolated formula fragment when a semantic rewrite can fix it.
- Avoid explicit references to remarks, examples, and numbered definitions in the refactored content unless the user explicitly approves an exception.
- Do not change mathematical content unless the original is ambiguous, incorrect, or structurally misplaced.

## Validation

After editing a section:

- Re-check notation consistency within the section and nearby dependencies.
- Re-check that standalone displayed formulas use repository-style `$...$` equation format whenever possible, and that any remaining display environment has a concrete reason such as numbering, labels, cross-references, alignment, or multi-line layout.
- Re-check displayed indexed operators for appropriate `\limits` usage.
- Re-check that any segmented equivalence or condition-list proof uses the appropriate standard proof-style block.
- Re-check that segmented proofs do not leave label-only outer items or nested direction-marker artifacts such as a bare `$(v)$` line followed by `$(\Rightarrow)$`; use flat repeated-label direction items instead where appropriate.
- Re-check that `$(\Rightarrow)$` and `$(\Leftarrow)$` items do not strand short continuation lines such as a lone quantified bound or side condition.
- Re-check that no touched inline equation chain renders with a line ending in an unfinished relation symbol such as `=`, `\iff`, or `\Rightarrow`.
- Re-check enumerate label styles: definition/method lists may use `label=\roman*.`, while proof/equivalence/condition-list blocks use `label=(\roman*)`.
- Re-check that proof endings use the QED marker where possible and do not simply iterate the statement just proved.
- Re-check that succinct rewrites remain explicit enough to preserve assumptions, quantifiers, dependencies, and proof logic.
- Re-check any visible or likely short final lines introduced or touched by the edit, and confirm they were fixed semantically rather than by spacing hacks where possible.
- Re-check that no dependency-order issue was hidden by adding a shortcut prerequisite paragraph.
- Re-check references and labels affected by the edit.
- Confirm each affected environment or object has at most one label unless distinct anchors justify multiple labels.
- Confirm no formal result or method depends on a remark or example.
- Run a lightweight validation if available.
- Summarize what changed.
- Ask: `Next step: continue to the next logical section, revise this one, jump to a specific cursor, or stop?`
