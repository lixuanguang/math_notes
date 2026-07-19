# Chemical Engineering Domain Overlay

Use this overlay for material and energy balances, thermodynamics, transport, reaction engineering, separations, process design/control, process simulation, scale-up, and process safety.

## Process basis and balances

- Identify process purpose, system boundary, basis of calculation, steady/dynamic and batch/continuous status, components/species, phases, streams, reactions, recycles/purges, accumulation, and reference states.
- For every stream used materially, record identifier and direction, flow-rate basis, composition basis, temperature, pressure, phase, enthalpy/reference where relevant, and source/status. Keep measured, vendor, assumed, calculated, and simulated values distinct.
- Close total and component material balances, charge/element balances when relevant, and energy balances under one coherent unit system. State residual/closure tolerance rather than hiding imbalance with rounding.
- Define conversion, selectivity, yield, recovery, purity, efficiency, duty, residence time, and capacity on an explicit basis; similarly named metrics often use different denominators.

## Models, equipment, and diagrams

- State thermodynamic property method/EOS and binary parameters, transport correlations, reaction stoichiometry and kinetics, catalyst state, heat/mass-transfer assumptions, phase-equilibrium model, and validity range.
- For simulation, record software/version, property database, component list, flowsheet revision, unit-operation models, specifications/design variables, initialization and convergence method/tolerance, warnings, sensitivity, and validation against plant/pilot/experimental data.
- Distinguish block flow diagram, process flow diagram, and piping/instrumentation diagram. Use the exact current symbol/document convention; label equipment, streams, utilities, control loops, safeguards, boundaries, and revision. A conceptual PFD is not an as-built P&ID.
- Equipment notes distinguish normal, design, startup/shutdown, upset, and relief conditions; state geometry/capacity, materials compatibility, pressure/temperature limits, pressure drop, utilities, control strategy, and scale-up basis when used.

## Safety, environment, and decisions

- Record hazards and inventories, initiating deviations/events, consequence and likelihood basis, safeguards/independent layers, assumptions, residual risk, and applicable source or standard. Separate hazard, risk, operability, occupational safety, and process safety.
- A balance, simulation, or successful run does not establish safe operation, mechanical integrity, emissions compliance, regulatory approval, or economic feasibility. Tie each compliance claim to an exact jurisdiction, revision, requirement, and evidence.
- For environmental/economic comparisons, define functional unit, system boundary, allocation, time/location, price year/currency, capacity factor, utilities, emissions factors, coproduct treatment, and uncertainty.
- Load chemistry for reaction/compound detail, electronic engineering for instrumentation/control hardware, materials for compatibility/degradation, and economics for substantive techno-economic claims.
