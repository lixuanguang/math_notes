# Organization, Ownership, and Dependency Flow

## Natural ownership

- Definitions, durable notation, assumptions, and prerequisites precede every use.
- Keep overviews as navigation maps: role, main prerequisites, principal objects/results, and forward route when useful. Do not turn them into duplicate mini-chapters.
- Numbered subsection files own substantive content. A new subsection needs real payload, an active input edge, permission, and a clear durable owner.
- Prefer reordering, moving, splitting, promotion, or a reference to the correct earlier owner over an ad hoc prerequisite paragraph.
- Preserve active empty placeholders and deliberately broad subsection titles unless the current authorized move makes the old owner misleading.
- Keep examples near the definitions/results they test, intuitions near their anchors, and figures near the text/data/model they explain.

## Authority and prerequisites

Only earlier active theorem-style results with adequate proofs may serve as mathematical proof authority. Definitions state objects/conditions but are not theorem substitutes. Formal results and typed methods must not depend on examples, counterexamples, intuitions, remarks, motivations, perspectives, warnings, exercises, empirical studies, valuation cases, figures, or other non-authoritative blocks.

When later work needs content hidden in a non-authoritative block, promote the required definition, assumption, relation, method, or result to the proper earlier owner; leave only explanatory residue in the original block.

Domain context must also precede use. The matching overlay owns the exact requirements, including as relevant: language/variety and gloss convention; edition/witness/translation; time/place/jurisdiction and archival provenance; runtime/specification/system boundary; circuit or process topology and operating basis; material/specimen history; chemical identity and conditions; nuclide/library/facility state; units, data vintage, currency, probability, accounting, valuation, and model assumptions; score/performance/recording identity; and artwork/image provenance. Do not let a figure or caption be the only owner of a required input or relation.

## Structural audit

For the selected batch, check:

- active input order and reference-before-label order;
- definitions, notation, domain context, or equations used before introduction;
- proof-local/block-local notation leaking into later blocks;
- theorem-style results citing later results or non-authoritative environments;
- methods relying on examples or explanatory/applied blocks as authority;
- hidden formal content needed later;
- examples/counterexamples/intuitions/checks too late to illuminate their anchor;
- universal mathematical prerequisites mixed into domain owners, or argument, interpretation, archival evidence, implementation, benchmark, simulation, measurement, valuation, performance, or artifact evidence miscast as mathematics or stronger authority;
- duplicate content, labels, or multiple labels on one environment/object;
- stale equation anchors and untyped TODOs;
- figures cited before introduction, visualizations before their data/model, schematics away from assumptions, financial exhibits away from date/currency/basis, source images away from identity/provenance/rights, and table-like visuals that should be searchable tables;
- local `\input`/`\include` order that breaks dependency flow.

## Edit rules

- Make the smallest coherent structural change: move complete logical blocks, reorder, split, promote, update references, or adjust input order.
- During a structural-only pass, preserve moved mathematical and technical content verbatim except necessary local glue and explicitly authorized reference/label repairs.
- Do not rewrite prose, complete proofs, normalize display math, or add unsupported theory during a structural-only pass.
- Do not rename labels unless necessary and authorized. For duplicate consolidation, keep one stable canonical label and update every reference.
- If material deserves a new subsection/section/part without permission, perform safe same-level work, record the exact proposed owner, and report the blocker.
- Preserve or reconstruct source-to-target provenance in the report when moving source-grounded blocks; do not add bookkeeping prose to LaTeX.

## Labels

Use one stable descriptive label per anchor with the established prefixes: `def:`, `thm:`, `prop:`, `lem:`, `cor:`, `meth:`, `ex:`, `cex:`, `int:`, `rem:`, `mot:`, `per:`, `assump:`, `conv:`, `model:`, `law:`, `der:`, `approx:`, `dim:`, `emp:`, `val:`, `warn:`, `fig:`, `alg:`, and `eq:`. Multiple labels require genuinely distinct anchors. Update all affected references after any move.
