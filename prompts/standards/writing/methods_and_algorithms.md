# Methods, Processes, and Algorithms

Typed methods record reusable approaches to classes of problems. They are not theorem statements, actual proofs, worked examples, glossary entries, or pseudocode by default.

## Choose the owner first

- `proofmethod`: reusable proof strategy whose output is a proof route, reduction, recognition criterion, or obligation checklist.
- `computationmethod`: reusable computation, construction, estimation, approximation, decomposition, diagnostic, or test whose output is an object, value, approximation, certificate, or diagnostic.
- `method`: legacy/fallback only for a short convention, classification workflow, or inseparable hybrid. Justify every retained use in the report.
- `process`: document or organizational workflow, not mathematical problem solving.
- `breakablealgorithm`/`algorithmic`: executable or genuinely useful step-by-step pseudocode with supported inputs and outputs.

Migrate a legacy `method` when its subtype is clear. Split a supported hybrid into typed methods, theorem/proof, example, or algorithm components when that makes authority and output clearer.

Use stable descriptive `meth:` labels and precise titles such as `Compactness Extraction`, `Picard Iteration`, or `Spectral Diagnostic`.

## Extract the problem-solving core

For a nontrivial method, identify only source/repository-supported content:

1. problem type;
2. given data, constraints, unknown, and target/output;
3. entry cue suggesting this approach;
4. driving theorem, transformation, invariant, estimate, decomposition, coordinate change, model, or other choice;
5. ordered operative steps;
6. verification/postcondition, including boundary, degenerate, convergence, dimensional, uniqueness, or consistency checks when relevant;
7. reusable limitation, look-back, or transfer point.

The final method need not print these seven headings. Use `\hlt{Use When}` and `\hlt{Key Idea}` only when they reduce ambiguity. If several approaches are source-supported, give a concise selection rule, not a generic menu of tactics.

Steps must perform mathematical work. Replace “understand the problem,” “apply the theorem,” “simplify,” and “check the answer” with the exact object, hypothesis check, transformation, calculation, or verification. Keep worked data in an example, actual proof obligations in a proof, and implementation detail in an algorithm.

## Proof-method requirements

Record the applicable claim form, cueing hypotheses/conclusion, proof architecture, available earlier theorem-style owners, obligations in order, and endpoint check. Steps should choose an arbitrary object, reduce to a definition, establish directions/cases/invariants/estimates, construct witnesses, pass to limits, invoke verified earlier results, and close the exact conclusion.

Do not write a proof method as a computation recipe or use it instead of proving a nearby theorem.

## Computation-method requirements

Record input data and admissibility, output, setup/normalization/initialization, construction or update rule, branch/stopping criterion when supported, and postcondition. Include error, convergence, stability, uniqueness, or complexity only when supported by the source or an earlier active result.

If executable pseudocode is the point, use `breakablealgorithm`; otherwise keep the conceptual procedure in `computationmethod`.

## Algorithms

- Follow nearby repository style: caption, `alg:` label, `\Require`, `\Ensure`, and compact `\State` steps.
- State supported preconditions, outputs/postconditions, and any necessary invariant or termination condition.
- Keep one action per step and nesting readable.
- Do not mechanically transcribe long pseudocode or invent convergence, complexity, stopping, or edge-case guarantees.

When new results, examples, or algorithms reveal a reusable route, construction, diagnostic, or verification check, extend a suitable nearby method rather than duplicating the same prose. Do not invent a method solely to summarize every result.
