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

- One conclusion: compact prose, no list.
- Two or more independent conclusions: claim items or a logical split.
- Proof items must cover statement items one-for-one, in the same order and with matching conceptual labels.
- Iff directions may remain within the relevant claim item when concise.

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

Authority language is strictly `by`-only: use `$P$ by Theorem \ref{...}.` or `By Lemma \ref{...}, $P$.` Apply the same grammatical form to definitional reductions, assumptions, numbered parts, induction hypotheses, and other cited justifications; this does not promote them to theorem-style authority. Never write “we/one apply, invoke, use, or employ,” an imperative or participial “apply/applying/using,” “authority applied to,” or make an authority the grammatical subject of “gives,” “yields,” “shows,” “makes,” “implies,” “ensures,” “provides,” or “proves.” Use `by <authority> with/for <substitution or specialization>` when needed. State the conclusion in the same sentence as its `by`-clause; do not leave a bare `By Theorem ...` invocation. Keep a short calculation inline when it is clearer than a citation.

## Compact statement and proof paragraphs

- Do not place a blank source line inside a theorem-style statement or its `proof`; it creates an unwanted paragraph break, vertical gap, and indentation.
- Keep consecutive statement/proof sentences in one rendered paragraph and therefore one logical source line. Use a semantic list/case environment for genuine proof divisions, or an intended `\\` for a compact rendered break; never use an empty line or an unintended `\\` as visual padding.

## Structural Commentary and Key Insight

This repository-specific pair is mandatory according to `COMMENTARY_POLICY`:

- `required-new-and-rewritten`: new or materially rewritten theorem-style results;
- `required-all-reviewed`: every reviewed theorem-style result;
- `preserve-existing`: add none, but keep existing valid pairs.

A material rewrite changes the statement, claims, hypotheses, conclusion, proof argument, or decomposition—not typography alone.

Placement and syntax are exact:

```tex
\hlt{Structural Commentary}: <proof architecture or dependency>.\\
\hlt{Key Insight}: <invariant, obstruction, mechanism, or decisive choice>.\\
```

- With a proof, these are the final two content lines immediately before `\end{proof}`.
- For an allowed proofless exception, they are the final two lines immediately before the theorem-style `\end{...}`.
- Keep them adjacent, in this order, and end both with `\\`.
- Never place them in the statement, before/after the proof, mid-proof, or inside non-theorem environments.
- Structural Commentary names actual proof architecture or dependency, not the theorem conclusion or “by definition.” Aim for at most 18 lexical words.
- Key Insight states why the proof works, without adding an unowned hypothesis or claim. Aim for at most 12 lexical words.
- Each should fit one rendered line when feasible. A short proof is not an exception.

Before completion, manually check adjacency, order, terminal placement, syntax, content quality, and rendered line length; matching counts alone do not suffice.
