# Theorem-Style Results and Proofs

The theorem-style category is exactly `theorem`, `proposition`, `lemma`, and `corollary`.

## Role and proportionality

- A theorem is a major result; a proposition is an independently useful smaller result; a lemma is subsidiary to later results; a corollary follows with little additional argument. Do not inflate routine construction steps into theorem-style results.
- Include only source-supported hypotheses, objects, and conclusions needed to use the result.
- Keep proof scaffolding in the proof: auxiliary constants, compact boxes, iteration operators and iterates, error majorants, chosen local domains, or proof-only bounds. Retain such data in the statement only when it is part of the final reusable payload or source theorem.
- Simplify or split a statement that has several `Set`, `Let`, `Put`, `Define`, or `Choose` clauses before its conclusion, exposes proof machinery, or bundles a theorem, method, and estimate.
- Split by logical weight: keep the main mechanism in the theorem/proposition and record immediate consequences as corollaries rather than peer theorems.

## Claim census and statement/proof matching

A conclusion is distinct when it can be removed without changing another conclusion, has a different logical type, or creates a separate proof obligation. Existence, uniqueness, characterization, representation, bound, measurability, convergence, and continuity are different types. Recount after `Moreover`, `Furthermore`, `In addition`, `Also`, conclusion-bearing `In particular`, or an `and` joining different types.

- One conclusion: compact prose, no statement list. Keep its proof as compact prose unless the long-proof rule below requires operative-stage items.
- Two or more independent conclusions or conditions: claim items using the canonical roman list below.
- Proof segmentation is mandatory, not optional, when the statement has condition/claim items, an iff has two directions, or equivalent conditions are proved by an implication cycle. Every statement item must be covered in source order; no proof item may silently combine, skip, renumber, or reorder claims.

### Canonical condition and claim enumeration

For a simple unnumbered iff claim, split the proof into its two directions exactly as follows:

```tex
\begin{enumerate}[label=\roman*.]
\setlength{\itemsep}{0pt}
\item[$(\Rightarrow)$] ...
\item[$(\Leftarrow)$] ...
\end{enumerate}
```

For equivalent numbered conditions proved by a cyclic implication chain, list the conditions with the canonical claim list, then use:

```tex
\begin{enumerate}[label=(\roman*)]
\setlength{\itemsep}{0pt}
\item[$(i)$]$\Rightarrow (ii)$ ...
\item[$(ii)$]$\Rightarrow (iii)$ ...
\item[$(iii)$]$\Rightarrow (i)$ ...
\end{enumerate}
```

For numbered claims in which each condition requires its own iff proof, repeat the claim label and split its directions:

```tex
\begin{enumerate}[label=(\roman*)]
\setlength{\itemsep}{0pt}
\item[$(i)$] ($\Rightarrow$) ...
\item[$(i)$] ($\Leftarrow$) ...
\item[$(ii)$] ($\Rightarrow$) ...
\item[$(ii)$] ($\Leftarrow$) ...
\end{enumerate}
```

For a statement containing a list of condition claims, and for a proof containing one direct proof per claim, use:

```tex
\begin{enumerate}[label=(\roman*)]
\setlength{\itemsep}{0pt}
\item ...
\end{enumerate}
```

Mixed claim types use the same mapping in statement order. For example, if claim (i) is an iff and claim (ii) is direct, the proof items are `\item[$(i)$] ($\Rightarrow$)`, `\item[$(i)$] ($\Leftarrow$)`, and `\item[$(ii)$]`. Use custom claim labels whenever a repeated claim number or implication edge would make the automatic enumerate counter disagree with the statement. Do not use unlabeled prose paragraphs in place of any required item.

### Long single-claim proofs

A single conclusion does not justify a statement list, but a long proof still requires visible operative structure.

- The final scoped render is decisive: if the proof body from `Proof.` through its conclusion occupies more than half of the available text height of one page, or crosses a page boundary, a single uninterrupted proof is prohibited. Segment it with the canonical roman enumeration.
- Before rendering, treat four or more distinct operative stages, or a projected proof height over half a page, as a segmentation trigger. Typical stages are setup/reduction, construction, verification, comparison or estimate, contradiction, and conclusion.
- Use three to seven ordered items, each covering a genuine stage and beginning with a concise `\hlt{Stage Name}:` when the stage is not self-evident. Do not make an item for each sentence, cited result, algebraic line, or routine transition.
- Keep common setup before the list only when every item needs it. Otherwise include setup as the first operative item. Close the list before Structural Commentary and Key Insight.
- If an operative-stage item needs a subordinate list, use `label=(\alph*)` so its clauses cannot be confused with outer roman stages. Do not let long-proof stage labels masquerade as statement claim numbers: the statement remains unnumbered, and the stages collectively prove its one claim.

Canonical long-proof structure:

```tex
\begin{proof}
\begin{enumerate}[label=(\roman*)]
\setlength{\itemsep}{0pt}
\item \hlt{Setup}: ...
\item \hlt{Construction}: ...
\item \hlt{Verification}: ...
\item \hlt{Conclusion}: ...
\end{enumerate}
\hlt{Structural Commentary}: ...\\
\hlt{Key Insight}: ...
\end{proof}
```

## Proof completeness

`PROOF_COMPLETENESS: full` means every reviewed theorem-style result has a complete, checkable proof unless its exact label is in `PROOFLESS_EXCEPTIONS`.

- Convert “Proof idea,” “Sketch,” “standard argument,” bare theorem-name invocations, and hand-waving into explicit proof from definitions or applicable earlier results, then compress without losing the operative step.
- Do not delete a weak proof because it is hard. Repair authorized prerequisite ownership or report the exact source/scope blocker.
- A proofless exception still requires a complete statement and any required end commentary.
- When useful, begin a nontrivial proof with its operative plan: direct argument, contradiction, induction, cases, two inclusions/inequalities, construction and verification, compactness, fixed point, approximation, comparison, energy estimate, or reduction.
- Introduce every proof variable and dependency before use. Handle degenerate cases that would otherwise divide by zero, use an empty family, or assume uniqueness.
- For induction, bootstrap, or parameter-uniform arguments, name the predicate once; state the base case and induction hypothesis compactly without prose/symbol duplication. Use a precise singleton parameter space rather than “dummy parameter.”
- A proof ending must discharge the conclusion, not merely restate it.

## Earlier-result authority and reference language

Search only earlier active theorems, propositions, lemmas, and corollaries. Cite one only when it precedes the current result, its hypotheses are verified, its conclusion supplies the exact step, and the reference is clearer or shorter than repetition.

Definitions, examples, counterexamples, intuitions, remarks, motivations, perspectives, methods, applied environments, algorithms, and figures are not proof authority. Do not cite later results.

Authority language is strictly `by`-only: use `$P$ by Theorem \ref{...}.` or `By Lemma \ref{...}, $P$.` Apply the same grammatical form to definitional reductions, assumptions, numbered parts, induction hypotheses, spanning, existence, uniqueness, independence, algebraic operations, and other justifications; this does not promote them to theorem-style authority. Never write “we/one apply, invoke, use, or employ,” an imperative or participial “apply/applying/using,” “authority applied to,” or make an authority the grammatical subject of “shows,” “makes,” “implies,” “ensures,” “provides,” or “proves.” The finite inference verbs `give`, `gives`, `gave`, `yield`, `yields`, and `yielded` are prohibited everywhere inside a proof, including Structural Commentary and Key Insight, regardless of their subject. Use `by <authority or justification> with/for <substitution or specialization>` when needed, or state a direct symbolic equality/implication without an inference verb. State the conclusion in the same sentence as its `by`-clause; do not leave a bare `By Theorem ...` invocation. Keep a short calculation inline when it is clearer than a citation.

## Compact statement and proof paragraphs

- Do not place a blank source line inside a theorem-style statement or its `proof`; it creates an unwanted paragraph break, vertical gap, and indentation.
- Keep consecutive statement/proof sentences in one rendered paragraph and greedily pack them onto the fewest rendered lines allowed by the 100-equivalent cap and actual scoped width. Do not assign each sentence, implication, construction, or induction step its own `\\`.
- Before rendering, retain `\\` only when the line obtained by joining the next complete unit would exceed the cap or another exact repository rule requires it. The single final scoped render may justify one semantic break for a below-cap span that actually wraps. Use a semantic list/case environment for genuine proof divisions; never use an empty line or `\\` as visual padding.

## Structural Commentary and Key Insight

This repository-specific pair is mandatory according to `COMMENTARY_POLICY`:

- `required-new-and-rewritten`: new or materially rewritten theorem-style results;
- `required-all-reviewed`: every reviewed theorem-style result;
- `preserve-existing`: add none, but keep existing valid pairs.

A material rewrite changes the statement, claims, hypotheses, conclusion, proof argument, or decomposition—not typography alone.

Placement and syntax are exact:

```tex
\hlt{Structural Commentary}: <proof architecture or dependency>.\\
\hlt{Key Insight}: <invariant, obstruction, mechanism, or decisive choice>.
```

- With a proof, these are the final two content lines immediately before `\end{proof}`.
- For an allowed proofless exception, they are the final two lines immediately before the theorem-style `\end{...}`.
- Keep them adjacent and in this order. End Structural Commentary with `\\` so Key Insight starts on the next rendered line. Do not end Key Insight with `\\`; the following `\end{proof}` or theorem-style `\end{...}` is already a structural boundary.
- Never place them in the statement, before/after the proof, mid-proof, or inside non-theorem environments.
- Structural Commentary names actual proof architecture or dependency, not the theorem conclusion or “by definition.” Aim for at most 18 lexical words.
- Key Insight states why the proof works, without adding an unowned hypothesis or claim. Aim for at most 12 lexical words.
- Each should fit one rendered line when feasible. A short proof is not an exception.

Before completion, manually check adjacency, order, terminal placement, syntax, content quality, and rendered line length; matching counts alone do not suffice.
