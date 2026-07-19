# Applied, Scientific, Empirical, and Finance Environments

Use these environments only when their role is clearer than a definition, theorem-style result, typed method, example, counterexample, or remark. They are not mathematical proof authority by default. If a block contains a universal mathematical claim, split the claim into a theorem-style result with proof and retain applied context in its proper owner.

Load the matching domain overlay for every affected block.

## Assumptions and conventions

- `assumption`: a declared local or standing hypothesis. State scope, objects, domains, regularity/distributional/market/physical conditions, and where it applies. Do not hide conclusions, definitions, or model equations inside it.
- `convention`: a notational, sign, coordinate, unit, discounting, compounding, frequency, calendar, measure, or modeling choice. State scope and exceptions. It is not a result.

Place recurring assumptions/conventions before all dependants; keep source-specific ones near the source-grounded block.

## Models and laws

A nontrivial `model` identifies:

1. purpose and intended question;
2. state space/variables with dimensions, units, currency, frequency, measures, dates, and parameters where relevant;
3. assumptions, idealizations, market/statistical/physical conditions, and initial/boundary regimes;
4. equations, constraints, dynamics, objective, accounting identity, or data-generating structure;
5. inputs and outputs;
6. calibration/benchmark/validation, ongoing monitoring where relevant, intended-use boundary, and limitations supported by the source.

Keep reusable computations in `computationmethod`, pseudocode in an algorithm, empirical checks in `empiricalstudy`, and mathematical consequences in theorem-style owners.

Use `law` sparingly for a source-presented physical law, conservation principle, lawlike accounting relation, no-arbitrage principle, or durable empirical relation. State quantities and context, regime, assumptions/idealizations, and consequence. If proved mathematically, use theorem-style; if chosen, use `model` or `assumption`; if heuristic, use `principle`.

## Derivations, approximations, and dimensional checks

- `derivation`: state the starting assumptions/laws/definitions/model and target formula; keep each transformation checkable. Verify units/dimensions for physical formulas and sign/date/frequency/currency consistency for finance. It does not replace a proof of a theorem-style claim.
- `approximation`: state the small/large parameter or limit, baseline, retained terms, dropped terms, validity regime, and error/order/stability only when supported. Use theorem-style for a limit theorem and `computationmethod` for a reusable approximation procedure.
- `dimensionalcheck`: state dimensions of active quantities; verify additive terms agree, both sides match, and function arguments are dimensionless. Conclude only consistency/inconsistency, never truth of a law or model.

## Empirical studies

A nontrivial `empiricalstudy` records:

- question and claim status;
- dataset/source/sample window and preprocessing;
- model, strategy, simulation, calibration, or computation;
- parameters and random seeds when relevant;
- metric/test and benchmark;
- uncertainty, robustness, or sensitivity;
- data/code/reproducibility handle and access constraints;
- result and limitation.

Distinguish observed fact, simulated output, statistical estimate, model-implied value, backtest, and interpretation. Never turn a backtest into a theorem, forecast, or recommendation.

## Valuation cases

A `valuationcase` states valuation purpose, subject asset/company/security, valuation date, currency, fiscal period, basis of value/accounting basis, method, historical inputs and sources, forecast horizon, assumptions and drivers, discount/growth/multiple choices, scenarios/sensitivities, conclusion, and risks/limitations. Distinguish historical fact, estimate, forecast, opinion, and recommendation. A valuation is not exact.

## Warnings

A `warning` records one local pitfall: trigger, failure mode, consequence, and safe correction/reference. It is normally one compact paragraph and is not proof authority.

## Environment labels

Use one stable descriptive label with the established prefix: `assump:`, `conv:`, `model:`, `law:`, `der:`, `approx:`, `dim:`, `emp:`, `val:`, or `warn:`. Do not make later formal results depend on content that remains only in these non-authoritative blocks; promote the required mathematical assumption or result first.
