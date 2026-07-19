# Source Grounding and Technical-Source Ingestion

Use only the supplied `SOURCE_MATERIAL` and existing active repository content for subject claims, proofs, examples, data, assumptions, models, and interpretations. Do not fill gaps from memory or web search. Mark genuine uncertainty with a precise `% TODO(source): ...` or report the blocker.

## Classify before editing

- **Outline only:** use for placement/coverage audit; insert no subject content.
- **Substantive:** integrate conservatively.
- **Mixed:** use outline pages for placement and substantive pages for content.
- **Research paper/preprint:** apply the critical-content filter below; do not summarize section by section.

Build a complete source-to-target ledger before editing. For each block record exact source location, domain, type/role, target owner, provenance (`source-stated`, `source-derived`, or `repo-derived`), and coverage status from `prompts/standards/structure/collection_quality.md`.

`source-derived` means only a direct formalization or short consequence necessary to make a source statement usable. `repo-derived` means an earlier active result completes a proof or avoids duplication. Keep these distinct.

## Source boundary

- Preserve the source's supported level of generality and claim strength.
- Do not invent hypotheses, proof steps, convergence/complexity bounds, algorithms, examples, counterexamples, intuitions, edge cases, data context, or interpretations.
- If a theorem-style proof cannot be completed from the source plus earlier active theorem-style results, do not manufacture authority. Keep the content in a truthful non-theorem owner, use a precise source TODO, or report it as blocked.
- Do not closely paraphrase long passages. Write original compact notes while preserving mathematical meaning and provenance.
- Reuse or extend existing owners and methods instead of duplicating source preliminaries.

## Research-paper critical-content filter

Record bibliographic metadata, paper type, domain, target, and an extraction decision for each major component. Inspect the abstract, introduction, main results/methods, figures/tables, discussion/conclusion, and supplements only as needed to identify durable content.

Ingest only material that creates or repairs a durable local owner: a main definition/result, specification, algorithm or contract, sharp hypothesis, essential example/counterexample, proof architecture, transferable method, system/circuit model, law, derivation, approximation, benchmark or empirical study, measurement, valuation case, central figure/table, notation convention, validation check, or limitation.

Skip literature reviews, broad background already owned, rhetoric, duplicated preliminaries, routine derivations, exhaustive robustness tables, implementation minutiae, and appendices unless they contain a needed owner, proof, dataset, diagnostic, reproducibility fact, limitation, or visual.

Do not promote an abstract/introduction/discussion assertion into formal content unless the paper body or supplement supports the statement, proof, model, data, derivation, or experiment.

Apply the matching domain file:

- **Mathematics:** main definitions/results, exact hypotheses, essential examples/counterexamples, reusable proof architecture; auxiliary lemmas only when reused or the cleanest owner.
- **Computer science:** abstraction/language/system and version, specification or contract, inputs/outputs/state, algorithm and correctness/complexity basis, implementation/runtime/configuration, dataset/workload/metric, experiment protocol, artifacts, security/privacy assumptions, and limitations.
- **Electronic engineering:** device/system/topology, operating regime and conventions, source/datasheet conditions, circuit/model/equations, schematic, calculation/simulation setup, test equipment and loading, measurement uncertainty, requirement/compliance status, and validity limits.
- **Quantitative finance:** problem/market/model/data/sample, measure/admissibility, objective, pricing/hedging/risk/calibration/backtest method, costs/constraints, benchmark/metric, validation, availability, and limitations.
- **Fundamental finance:** entity/security/industry, date/currency/basis, data and adjustments, valuation/accounting method, drivers, forecasts/scenarios/sensitivities, risks, conflicts, and fact/estimate/opinion status.
- **Physics:** system/regime, quantities/units, laws/equations, conditions, approximations, derivation, experiment/simulation, uncertainty, availability, and validity limits.

## Environment or figure-type gap protocol

Use this only when source material has a durable role that every existing environment/figure wrapper would distort.

1. Exhaust the current vocabulary and consider splitting content across existing owners.
2. Search the web only for reputable writing, publishing, documentation, regulatory, or domain-presentation standards for the role—never for subject content.
3. Propose the minimum extension: role, why existing roles fail, name, label prefix if needed, authority/dependency status, required components, provenance rule, layout/render checks, and exact prompt/base files affected.
4. If `ALLOW_NEW_ENVIRONMENT_OR_FIGURE_TYPE: yes-if-standard-supported` and both standards and supplied source justify it, make focused, domain-neutral updates. Text environments in theorem numbering use the established `\newtheorem`/`\normalfont` style; visual roles wrap ordinary `figure` numbering.
5. Use the new role only for source-supported blocks requiring it. Do not migrate unrelated content.
6. If support is weak or the refactor exceeds scope, classify the block `needs-new-environment-or-figure-type`, continue other allowed work, and report the sources searched and proposed next action.

Web standards used in this gap protocol justify presentation semantics only; they may not supply examples, claims, proofs, data, assumptions, or domain context for the notes.
