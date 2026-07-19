# Electronic Engineering Domain Overlay

Use this overlay for circuits, devices, electronic systems, schematics, datasheets, HDL, calculations, simulations, measurements, and compliance-related evidence. Shared modules still own mathematical proof, applied-environment roles, figures, source grounding, and rendered layout.

## Claim and operating context

- Classify each substantive statement as a physical law, circuit/device model, datasheet specification, design requirement, calculated value, simulated output, measured result, or standards/compliance claim. Keep those authorities distinct.
- Identify the system or device, topology, ports and signal direction, reference node/ground, polarity and sign convention, inputs/outputs, operating mode, and initial/boundary conditions needed to interpret the claim.
- State the analysis regime: DC, AC small-signal, transient, noise, sampled-data, digital, mixed-signal, RF, power, or thermal; time, frequency, Laplace, phasor, or state-space domain; peak, peak-to-peak, RMS, average, instantaneous, or complex amplitude.
- Record units and dimensions, ordinary versus angular frequency, phase reference, impedance convention, and the reference quantity for decibels. State idealizations and limits such as lumped/quasi-static, linear/time-invariant, small-signal, loading, supply, temperature, tolerance, process corner, and component rating.

## Schematics and technical diagrams

- Use recognized graphical symbols and reference designators consistently; cite the exact symbol/document standard and revision when conformance matters. Do not invent or redraw a standardized symbol in a way that changes its meaning.
- Show unambiguous connections, junctions and crossings, named nets, component values/ratings, ports, power rails, grounds, signal direction, polarity, and test points needed to reproduce the reasoning. Mark wireless or off-page connections clearly.
- State whether a schematic is functional, logical, wiring, or physical and whether geometry is to scale. A schematic explains connectivity and intent; it is not measurement evidence or proof that a built circuit will satisfy a requirement.

## Components and source data

- Record manufacturer, exact part number, datasheet/revision/date, package or grade when relevant, and the operating/test conditions attached to every quoted value.
- Distinguish absolute maximum ratings, recommended operating conditions, guaranteed minimum/maximum characteristics, typical values, and characteristic curves. Preserve tolerances, derating, temperature, frequency, bias, load, and confidence/test limits that affect use.
- Do not interpolate, extrapolate, substitute parts, or convert a typical value into a guaranteed design limit without explicit support and a stated engineering margin.

## Calculation and simulation

- State governing equations/models, assumptions, loading, parasitics, initial/boundary conditions, approximations, and the validity range. Check dimensional consistency and reconcile sign, polarity, reference, and complex-frequency conventions.
- For simulation, record tool/version, model or library revision, schematic/netlist/HDL and configuration, solver/analysis type, timestep or frequency grid, tolerances/convergence controls, initial conditions, sweeps/corners/Monte Carlo setup, and random seeds when they affect the result.
- Label analytic, simulated, and measured values explicitly and compare them only under matched conditions. Agreement within one scenario does not validate a model outside that scenario.

## Measurement and verification

- Record the device-under-test revision, complete setup and stimulus, instrument/probe model, calibration or verification status, bandwidth, input impedance/loading, coupling, sample rate, record length, triggering, window/filter/averaging, and environmental conditions that materially affect the result.
- Report resolution, noise, repeated trials, uncertainty components and method, and coverage information where needed. Distinguish direct indication, derived quantity, estimate, detection limit, and pass/fail decision.
- Tie every pass/fail statement to an exact requirement and test condition; state margins or decision/guard-band rules when used. A calculation or simulation alone does not establish measurement traceability, safety, regulatory approval, or compliance.

## Specialized interfaces and plots

- For digital/embedded interfaces, record voltage levels, active-high/low convention, clock/reset domain, timing constraints, latency/throughput definition, bit/byte ordering, framing, state transitions, and protocol revision. Load the computer-science overlay too when firmware, software, or protocol behavior is substantively involved.
- For frequency-domain or network data, record port order, reference impedance, calibration/reference plane, parameter convention, sweep conditions/resolution, and de-embedding. For power/thermal results, define input/output power, loss/efficiency basis, operating point, thermal boundary, and derating.
- Plot axes with quantities and units. State logarithmic scales, decibel reference, phase convention/unwrapping, waveform timebase/coupling/bandwidth, and whether each trace is calculated, simulated, or measured. Preserve the repository's inline/display and no-overflow rules for every equation and render-inspect all touched diagrams and plots.
