# Nuclear Science and Engineering Domain Overlay

Use this overlay for nuclear structure and reactions, decay/radiation data, reactor and fuel-cycle analysis, radiation transport/dosimetry, nuclear materials, safety analysis, and regulatory context.

## Nuclear identity and data authority

- Use unambiguous nuclide/state notation and define proton number, mass number, isomeric or excited state, charge state, reaction channel, and reference frame where relevant.
- Classify every nuclear datum as directly experimental, compiled unevaluated, evaluated/recommended, model-calculated, processed, simulated, or regulatory/design value. Record database/library, release/version/date, evaluator or source, material identifier, temperature, processing route, and covariance/uncertainty.
- For decay data, state parent/daughter, mode, half-life, branching or emission probability, energy/intensity convention, uncertainty, and evaluation date. For reaction data, state target/projectile, channel, incident-energy definition and spectrum, differential/integral form, angular/frame convention, and normalization.
- Follow current SI and ISO atomic/nuclear quantity names, symbols, and units. Keep activity, fluence, flux, kerma, absorbed dose, equivalent dose, effective dose, and dose rate distinct; state radiation/tissue weighting and irradiation geometry when applicable.

## Reactor, transport, and computation

- Identify facility/system and state: geometry/configuration, materials and isotopic composition, temperatures/densities, moderator/coolant/reflector, power, burnup and history, control positions, boundary conditions, source, and operating/transient mode.
- State code/version, nuclear-data library and processing version, energy-group or continuous-energy treatment, thermal-scattering data, geometry/mesh, tallies/responses, variance reduction, histories/seeds, convergence, depletion chain/timestep, and statistical plus nuclear-data uncertainty.
- Distinguish verification, validation, benchmark agreement, uncertainty quantification, bias/margin, and regulatory acceptance. A code run, criticality result, or benchmark match does not validate every application regime.
- For criticality/reactivity, define multiplication-factor convention, excess/differential quantities, reference state, uncertainty/bias, subcritical margin, and whether values are measured, calculated, or licensed limits.

## Safety, security, and compliance

- A safety analysis identifies hazards/source term, initiating events, accident sequences, frequencies/likelihood categories, consequences, assumptions, credited safety functions, defense-in-depth layers, human actions, uncertainties, and acceptance criteria.
- Cite exact jurisdiction, regulation, licence basis, standard/guide identifier, revision, and applicability. Distinguish binding requirement, regulatory guidance/acceptable method, consensus standard, facility procedure, and informative recommendation.
- Do not infer safety, safeguards adequacy, security, dose compliance, environmental acceptability, or licensing status from a research calculation. Preserve access controls and omit protected or security-sensitive operational details not authorized for the notes.
- Load physics for underlying laws, materials for fuel/structural behavior, chemical engineering for fuel-cycle/process hazards, and computer science for substantive computational artifacts.
