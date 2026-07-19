# Domain Router

Use domain files as overlays; they do not replace the universal writing, layout, structure, source, or validation modules.

Classify a block by four questions:

1. What is its evidence object: proof, specification, algorithm, program, benchmark, model, circuit, datasheet, derivation, dataset, simulation, measurement, backtest, filing, valuation input, or visual evidence?
2. What context is required to interpret it: object domain, language/runtime/platform, interface or protocol revision, circuit topology and reference, unit/dimension, operating regime, currency/date/frequency, measure/filtration, accounting basis, or sample window?
3. What is the claim's authority: proved theorem, normative requirement, specified behavior, implementation observation, model assumption, calculated value, simulated output, measured result, estimate, backtest, valuation opinion, or interpretation?
4. What makes it reproducible or auditable: proof details, artifact/build/run instructions, data and configuration, circuit/netlist/model, instruments and setup, calibration or backtest protocol, uncertainty/error, sensitivity, or audit trail?

Then load only the matching overlay:

| `DOMAIN` value | Module | Typical evidence |
| --- | --- | --- |
| `math` | `prompts/standards/domains/math.md` | Definitions, theorems/proofs, exact examples, proof and computational methods. |
| `computer-science` | `prompts/standards/domains/computer_science.md` | Specifications, algorithms, programs, systems, protocols, datasets, computational experiments, or benchmarks. |
| `electronic-engineering` | `prompts/standards/domains/electronic_engineering.md` | Circuits, devices, schematics, datasheets, HDL, calculations, simulations, measurements, or compliance evidence. |
| `quant-finance` | `prompts/standards/domains/quantitative_finance.md` | Pricing/risk theory, stochastic models, calibration, optimization, simulations, backtests, or market data. |
| `fundamental-finance` | `prompts/standards/domains/fundamental_finance.md` | Accounting, statements, corporate finance, filings, forecasts, scenarios, or valuation. |
| `physics` | `prompts/standards/domains/physics.md` | Laws, physical models, approximations, simulations, experiments, measurements, or dimensional reasoning. |

For mixed material, assign the narrowest overlay per row. Load both CS and EE for embedded/firmware work when both software behavior and hardware interfaces matter; load math as well only when a formal mathematical owner is touched, not merely because equations appear. Put universal mathematical prerequisites in their mathematical owner and applied evidence in an applied owner. Never turn empirical, benchmarked, simulated, measured, physical, accounting, or valuation evidence into a theorem merely by writing it mathematically.
