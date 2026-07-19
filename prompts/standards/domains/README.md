# Domain Router

Use domain files as overlays; they do not replace the universal writing, layout, structure, source, or validation modules.

Classify a block by four questions:

1. What is the evidence object: proof/argument, text or historical record, specification, artifact/performance, dataset, model, experiment, simulation, measurement, filing, or visual evidence?
2. What context is required: language/edition/witness, time/place/jurisdiction, population/sample, software/version, material/process/specimen, apparatus/operating regime, units, currency/date/frequency, or work/recording/object identity?
3. What is the claim's authority: proved result, reconstructed argument, textual or historical interpretation, normative requirement, specified behavior, observation, model implication, calculated/simulated/measured result, estimate, forecast, or opinion?
4. What makes it reproducible or auditable: proof/inference details, retrievable citation/provenance, artifact/data/code, method and configuration, specimen/sample history, instrument/setup, uncertainty, sensitivity, limitations, or rights/access trail?

Then load only the matching overlay:

| Category | `DOMAIN` value | Module | Typical evidence |
| --- | --- | --- | --- |
| Formal/computing | `math` | `prompts/standards/domains/math.md` | Definitions, theorems/proofs, exact examples, proof and computational methods. |
| Formal/computing | `computer-science` | `prompts/standards/domains/computer_science.md` | Specifications, algorithms, programs, systems, protocols, computational experiments, or benchmarks. |
| Humanities | `linguistics` | `prompts/standards/domains/linguistics.md` | Language examples, glosses/transcriptions, judgments, corpora, experiments, or analyses. |
| Humanities | `philosophy` | `prompts/standards/domains/philosophy.md` | Arguments, reconstructions, objections/replies, thought experiments, or textual interpretations. |
| Humanities | `literature` | `prompts/standards/domains/literature.md` | Textual passages/variants, editions/translations, close readings, reception, or criticism. |
| Humanities | `history` | `prompts/standards/domains/history.md` | Archival records, oral histories, artifacts, chronology, source criticism, or historiography. |
| Social science | `political-science` | `prompts/standards/domains/political_science.md` | Institutions, cases, surveys, interviews, political data, causal designs, or normative claims. |
| Social science | `economics` | `prompts/standards/domains/economics.md` | Economic models/data, equilibria, identification, experiments, forecasts, or policy analysis. |
| Science/engineering | `physics` | `prompts/standards/domains/physics.md` | Laws, physical models, approximations, simulations, experiments, measurements, or dimensional reasoning. |
| Science/engineering | `chemistry` | `prompts/standards/domains/chemistry.md` | Compounds/reactions, procedures, spectra, characterization, mechanisms, or computations. |
| Science/engineering | `materials-science-engineering` | `prompts/standards/domains/materials_science_engineering.md` | Composition, processing/specimen history, structure, properties, characterization, or performance. |
| Science/engineering | `chemical-engineering` | `prompts/standards/domains/chemical_engineering.md` | Balances, flowsheets, equipment, simulation/control, scale-up, or process-safety evidence. |
| Science/engineering | `electronic-engineering` | `prompts/standards/domains/electronic_engineering.md` | Circuits, devices, schematics, datasheets, HDL, simulations, measurements, or compliance evidence. |
| Science/engineering | `nuclear-science-engineering` | `prompts/standards/domains/nuclear_science_engineering.md` | Nuclear/decay data, transport/reactor models, radiation measurements, safety or regulatory evidence. |
| Finance | `quant-finance` | `prompts/standards/domains/quantitative_finance.md` | Pricing/risk theory, stochastic models, calibration, optimization, simulations, backtests, or market data. |
| Finance | `fundamental-finance` | `prompts/standards/domains/fundamental_finance.md` | Accounting, statements, corporate finance, filings, forecasts, scenarios, or valuation. |
| Arts | `music` | `prompts/standards/domains/music.md` | Scores, editions, notation, performances/recordings, analyses, or encodings. |
| Arts | `fine-arts` | `prompts/standards/domains/fine_arts.md` | Artworks, architecture, images, catalogue/provenance records, conservation evidence, or interpretations. |

For mixed material, assign the narrowest overlay per row. Load a second overlay only when its evidence or method is substantive—for example, CS+EE for firmware, chemistry+materials for synthesis/property work, philosophy+political science for normative theory, or history+literature for archival textual interpretation. Load math only when a formal mathematical owner is touched, not merely because equations appear. Put universal prerequisites in their natural owner and applied/interpretive evidence in its domain owner. Never turn an argument, interpretation, benchmark, simulation, measurement, forecast, or opinion into a theorem merely by formal notation.
