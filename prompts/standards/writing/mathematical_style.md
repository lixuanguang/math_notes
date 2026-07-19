# Mathematical Writing and Local Notation

## Baseline

- State a claim before proving it. Do not hide proof steps in the statement.
- Use each environment for its mathematical role. Definitions own concepts; theorem-style environments own proved assertions; methods own transferable approaches; examples test or illustrate; expository and applied blocks explain context without becoming hidden proof authority.
- Keep statements concise but usable. Bind the objects, hypotheses, and conclusions needed to use them; move discussion, motivation, proof scaffolding, and routine construction data elsewhere.
- Make nontrivial proof architecture visible when it orients the reader.
- Every proof sentence must advance an obligation through a definition, cited earlier result, construction, equality, inequality, estimate, limit, or logical implication.
- Give detail where the step is crucial or unfamiliar; compress routine steps only while they remain checkable.
- Established notation has priority over prose for mathematical content. Keep notation simple, scoped, and consistent; retain prose only when it adds interpretation, context, assumptions, proof architecture, or other meaning not encoded symbolically.

## Explicit, formal, notation-aware, succinct loop

Apply this loop to every changed definition, statement, proof, method, calculation, and mathematical clause:

1. Expose the objects, domains, hypotheses, quantifiers, dependencies, and conclusion.
2. Bind every symbol before first use. Order bundled data by dependency: spaces and base objects; neighborhoods/intervals/parameters; derived products/domains; then maps or solutions defined on them.
3. Use established notation by default for membership, maps, `\defeq`, set builders, recurrences, relations, `\implies`, `\iff`, convergence, bounds, and scoped `\forall`, `\exists`, or `\exists!`. A prose rendering of mathematical content is permitted only when it adds meaning or context not encoded by the notation.
4. Use prose for motivation, interpretation, assumptions, proof architecture, transitions, or another semantic contribution beyond the notation. Do not retain prose merely because it reads naturally, use symbols as English words, or use `\text{...}` to disguise prose inside math.
5. Remove adjacent prose/notation duplication. State a quantifier, scope, hypothesis, or conclusion once, not verbally and symbolically in neighboring clauses.
6. Compress repeated setup across parallel items into one preamble.
7. Re-read after compression: no object, condition, dependency, exception, or proof step may have disappeared; no cryptic abbreviation may have replaced clarity.

A theorem-style statement, definition, or typed-method preamble must state its short local condition directly instead of using a reference as a substitute for the object or hypothesis. References belong in proofs when they supply an actual earlier result. Do not use “obvious,” “clearly,” unexplained “similarly,” or vague symmetry when a short operative equality, implication, bound, construction, or limit argument is available.

Prefer one complete sentence per source line. Do not split a sentence or equation solely for source wrapping.

### Quantifier compression

- In definitions, statements, calculations, and formal proof clauses, use a scoped quantifier by default and express its mathematically definable predicate symbolically when meaning is preserved: “$P(i)$ for every/each/at every index $i\in I$” becomes `$(\forall i\in I)\,P(i)$`; “$P(i)$ for some $i\in I$” becomes `$(\exists i\in I)\,P(i)$`; and a unique-existence clause becomes `$(\exists! i\in I)\,P(i)$`.
- Bind the variable and domain inside the quantifier prefix, keep the entire predicate in the same math span, and make parallel universal/existential clauses stylistically symmetric. Do not repeat the same scope verbally beside the notation.
- Prose is an exception: retain it only when the predicate is primarily linguistic or the prose adds discourse emphasis, context, dependencies, or a proof step not encoded by the notation. A quantifier symbol is not a substitute for an undefined predicate.

## Semantic enumeration

Enumeration is semantic, not decorative.

- Run a component census. Two or more parallel objects, constructions, characterizations, cases, independently usable conclusions, or operative steps normally require items.
- Shared setup, motivation, interpretation, caveats, and summaries stay outside lists.
- Compare drafted items token by token and factor every repeated phrase, domain, tuple, parameter, or hypothesis into the preamble.
- Use `(i), (ii), ...` for parallel components/claims and roman proof steps or explicit `$(\Rightarrow)$`, `$(\Leftarrow)$` labels when directions are the real units.
- Do not create label-only outer items, unnecessary nested lists, or lists for a single direct argument.

Repository list style:

```tex
\begin{enumerate}[label=(\roman*)]
\setlength{\itemsep}{0pt}
\item ...
\end{enumerate}
```

## Environment choice

Use the smallest environment that truthfully owns the content. Definitions with several parallel components should itemize them after shared setup; a parallel postamble may use a second compact list. After `\item \hlt{Keyword}:`, begin with the distinguishing notation or condition rather than echoing the keyword. Theorem-style results use a single conclusion as prose and multiple independent conclusions as matched claim items or logically weighted splits. Proof items must match statement items in order. A one-line convention remains prose; a reusable approach belongs in a typed method; executable pseudocode belongs in an algorithm. Promote any reusable claim, prerequisite, definition, proof obligation, or procedure hidden inside an explanatory block.

Before leaving a changed block, ask:

1. Are all objects, domains, hypotheses, quantifiers, dependencies, and conclusions explicit?
2. Would removing a sentence delete a separate component or claim that should be itemized?
3. Is setup repeated across items?
4. Is each proof sentence or method step operative?
5. Is every notation-capable mathematical clause symbolic unless its prose adds meaning or context?
6. Is every derived symbol defined before use?
7. Is the environment the correct owner and authority type?
8. Does the rendered block remain readable under the active layout mode?
