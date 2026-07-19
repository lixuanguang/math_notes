# Domain Router

Use domain files as overlays; they do not replace the universal writing, layout, structure, source, or validation modules.

Classify a block by four questions:

1. What is its evidence object: proof, model, law, derivation, approximation, dataset, experiment, simulation, backtest, filing, valuation input, or visual evidence?
2. What context is required to interpret notation: object domain, unit/dimension, currency/date/frequency, measure/filtration, accounting basis, physical regime, or sample window?
3. What is the claim's authority: proved theorem, source-stated law, model assumption, estimate, simulated output, backtested result, valuation opinion, or interpretation?
4. What makes it reproducible: proof details, data/code/materials, calibration or backtest protocol, uncertainty/error, sensitivity, or audit trail?

Then load only the matching overlay:

| `DOMAIN` value | Module | Typical evidence |
| --- | --- | --- |
| `math` | `prompts/standards/domains/math.md` | Definitions, theorems/proofs, exact examples, proof and computational methods. |
| `quant-finance` | `prompts/standards/domains/quantitative_finance.md` | Pricing/risk theory, stochastic models, calibration, optimization, simulations, backtests, or market data. |
| `fundamental-finance` | `prompts/standards/domains/fundamental_finance.md` | Accounting, statements, corporate finance, filings, forecasts, scenarios, or valuation. |
| `physics` | `prompts/standards/domains/physics.md` | Laws, physical models, approximations, simulations, experiments, measurements, or dimensional reasoning. |

For mixed material, assign the narrowest overlay per row. Put universal mathematical prerequisites in their mathematical owner and applied evidence in an applied owner. Never turn empirical, simulated, physical, accounting, or valuation evidence into a theorem merely by writing it mathematically.
