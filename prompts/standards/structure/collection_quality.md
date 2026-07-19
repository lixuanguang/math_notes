# Collection-Level Quality

Local environment quality is necessary but not sufficient. Apply the relevant checks whenever a workflow changes ownership, coverage, overviews, source integration, or cross-volume organization.

## Reader orientation

- A touched part/section overview should be a concise navigation map, not duplicated content.
- State the unit's role, main prerequisites, main objects/results, and forward dependencies only when they help placement.
- Preserve a readable route: notation and definitions before use, examples/checks near anchors, and results after prerequisites.

## Source provenance and coverage

For `CONTENT_POLICY: source-grounded`, maintain a source-to-target ledger. Give every source block an exact identifier, type, target owner, provenance (`source-stated`, `source-derived`, or `repo-derived`), and status: `covered`, `partial`, `missing`, `misplaced`, `unsupported`, `needs-later-file`, `needs-new-environment-or-figure-type`, or `blocked-new-section-or-part`.

Do not litter LaTeX with bookkeeping. Put provenance in the report unless a precise `% TODO(source): ...` is required for unreadable, ambiguous, or incomplete source material. A source pass is incomplete if it inserts only easy content and leaves other source blocks unclassified.

## Examples and boundary checks

When supplied sources or existing repository content provide them, keep major definitions and nontrivial hypotheses near a meaningful example, nonexample, counterexample, test computation, intuition, dimensional/sanity check, benchmark, limiting case, or sensitivity analysis. Do not invent these during source-grounded intake.

## Equation anchors

Number and label only referenced or central equations. Use one descriptive `eq:` label and `\eqref`; remove stale labels after movement. Do not number decorative or one-off formulas.

## TODO discipline

Use only precise typed comments: `% TODO(source):`, `% TODO(proof):`, `% TODO(structure):`, `% TODO(notation):`, or `% TODO(build):`. Name the missing object or blocker. A TODO cannot replace a proof required under `PROOF_COMPLETENESS: full` unless the exact blocker is outside the authorized scope or source boundary. Report every new or retained TODO and remove obsolete ones.

## Searchability and future volumes

- Use stable result titles, labels, canonical terms, and operator names searchable with `rg`.
- Avoid local synonyms unless the distinction is stated and meaningful.
- Keep shared standards and environments domain-neutral; place domain-specific notation or preamble layers at their natural future volume scope.
- Separate universal mathematics from applications. Applied owners cite mathematical prerequisites; they do not absorb them.
- Record cross-volume dependencies in overviews/reports when content may later move to another PDF.
- Distinguish source types where relevant: theorem, assumption, physical law, dataset, simulation, market convention, accounting identity, valuation input, forecast, and interpretation.
- Date- and context-sensitive material must retain units/source context or market/reporting date, currency, frequency, and source.

## New environment or figure role

Exhaust existing definitions, theorem-style results, typed methods, algorithms, expository blocks, applied blocks, tables, and figure wrappers first. Add a role only when it is durable and existing owners would distort authority, provenance, context, or reader expectations. Follow the source-intake gap protocol; do not create a type for a one-off stylistic preference.
