# Examples and Expository Environments

Examples, counterexamples, intuitions, remarks, motivations, perspectives, principles, processes, exercises, and question banks are explanatory or pedagogical. Anchor each block to a nearby formal owner, give it one clear job, and keep it free of hidden reusable claims, definitions, proof obligations, prerequisites, methods, or algorithms. Promote such content before later use.

## Examples

Use `example` for a positive or non-refutational job: instantiate a definition, verify a hypothesis, compute an invariant, test a theorem in a positive case, show a model or boundary case that still satisfies the intended property, compare notions, or show a method in action.

A nontrivial example needs:

1. target being illustrated;
2. exact data;
3. property, hypothesis, computation, membership, or comparison check;
4. precise takeaway.

Do not print these labels unless useful. If the block only names an object, add a supported check or keep it as nearby prose. If it proves a general assertion, promote that assertion. If its procedure is reusable, extract or cite a `computationmethod`.

## Counterexamples

Use `counterexample`, not `example`, when the purpose is to refute a universal statement, implication, identity, equivalence, uniqueness claim, or a claim formed by removing a hypothesis.

A counterexample needs:

1. exact claim tested;
2. admissible in-domain data;
3. verification of all hypotheses/ambient assumptions;
4. verification that the claimed conclusion fails;
5. lesson no broader than the demonstrated failure.

Prefer the simplest exact object or boundary case. One counterexample refutes a universal/conditional claim but cannot prove a universal theorem or refute bare existence without establishing its negation. Keep several only when they expose genuinely different failures. Use `cex:` labels.

## Intuition

Use `intuition` for a source- or repository-supported mental model, picture, analogy, heuristic, familiar special case, limiting regime, or domain interpretation.

A nontrivial intuition needs:

1. formal anchor;
2. mental model;
3. correspondence between the model and formal objects/terms;
4. scope and failure boundary;
5. formal owner later work must use instead.

Keep it concise and near the object it explains. It is never proof authority and cannot replace hypothesis verification. Use `int:` labels.

## Remarks and warnings

A `remark` is one focused local caveat, comparison, convention note, interpretation, variant, boundary, or short consequence. State its anchor, role, scope, and non-authority. It should normally be one paragraph and not a list. Promote quantified, reusable, or proof-bearing claims.

Use `warning` under the applied-environment standard when a dedicated pitfall needs a trigger, failure mode, consequence, and correction. Use `counterexample` when an exact refutation demonstrates the warning and `convention` for a durable choice.

## Motivation

Place `motivation` before the object it motivates. Include the obstruction/question or recurring pattern, why the next formal move is natural, the forward target, and a boundary excluding hidden results or prerequisites. Keep it short enough that the reader reaches the formal object quickly. Do not duplicate an overview or preview results before their owner. Use `mot:` labels.

## Perspective

Place `perspective` after its owners. Name the earlier anchors, the viewpoint/dictionary/analogy/duality/hierarchy/coordinate change, what the view unifies or simplifies, and where it stops. It cannot introduce prerequisites. Promote a classification, theorem, reusable workflow, or assumption before later use. Use `per:` labels.

## Principles, processes, exercises, and question banks

- A `principle` is a durable source-supported heuristic or organizing doctrine with a scope, use case, and limitation. If universally true and used as authority, make it theorem-style with proof.
- A `process` is organizational. Use typed methods for mathematical approaches and algorithms for executable pseudocode. Do not duplicate a method as a process.
- Exercises and `qnbank` items must specify givens and the task. Keep them only when they add supported practice or mathematics. They cannot be the sole owner of a definition, result, method, notation, or prerequisite.
- During source-grounded intake, do not invent examples, counterexamples, intuitions, or answerless exercises beyond the source and earlier active repository content.
