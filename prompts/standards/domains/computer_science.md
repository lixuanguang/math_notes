# Computer Science Domain Overlay

Use this overlay for computer-science specifications, algorithms, programs, systems, protocols, datasets, computational experiments, and benchmarks. Shared modules still own mathematical proof, algorithm-environment syntax, source grounding, figures, and rendered layout.

## Claim and authority

- Classify each substantive statement as a definition, normative specification, proved result, algorithm contract, implementation behavior, experimental result, security claim, or interpretation. Keep those authorities distinct.
- Name the abstraction level and relevant version: mathematical model, language, type system, API, protocol, compiler/runtime, library, operating system, architecture, or artifact revision.
- Do not infer correctness, termination, portability, security, conformance, or complexity from examples, tests, successful execution, or benchmark results.

## Definitions, specifications, and protocols

- Define syntax, semantics, types, state, memory/concurrency/failure model, and determinism or randomness only as needed for the claim.
- State inputs, outputs, preconditions, postconditions, invariants, state transitions, error behavior, and undefined or implementation-defined cases where relevant.
- For an external specification, record the exact title, revision/date, section, and whether cited text is normative or informative. Use uppercase `MUST`, `SHOULD`, `MAY`, and related BCP 14 terms only when the governing document declares that convention; otherwise use ordinary language.
- A worked request, trace, or test vector illustrates behavior but does not establish conformance. Record interoperability assumptions and extension/version-negotiation rules when they affect the result.

## Algorithms and implementations

- For an algorithm, state the problem, admissible input, output/postcondition, main invariant or correctness route, termination condition, and edge cases. State complexity only with its cost model, input-size parameters, resource measured, and case type such as worst-case, average-case, amortized, or expected.
- Distinguish language-independent pseudocode from concrete code. For an implementation, record language and toolchain/runtime versions, dependencies, platform assumptions, interfaces, configuration, build/run procedure, and tests needed to support the note's claim.
- Separate specification defects, algorithmic defects, implementation defects, configuration failures, and environmental limitations. Do not present one implementation's behavior as portable or specified behavior without support.
- Keep listings and pseudocode readable after rendering. Break long expressions, types, commands, and identifiers only at syntactically valid or semantic boundaries; do not solve overflow by unreadable scaling.

## Systems, data, and computational experiments

- Identify system boundary, components, interfaces, data flow, control flow, state, concurrency/timing assumptions, failure modes, and trust boundaries when relevant. A diagram must distinguish these roles rather than merge them into decorative arrows.
- For a benchmark or computational study, record the question, workload or dataset provenance and version, preprocessing/splits, hardware, software versions, configuration, baseline, metric, timing or measurement procedure, warm-up, repetitions, random seeds, uncertainty/variation, and limitations needed to interpret the result.
- Define performance claims relative to the tested workload and environment. Distinguish statistical from practical significance and never generalize a benchmark beyond its supported platforms, inputs, scales, or operating conditions.
- For learned or data-driven systems, also record model/checkpoint version, training-versus-evaluation boundary, hyperparameters that affect the claim, leakage controls, evaluation population, and failure or distribution-shift limits when supported.
- Inventory supporting code, scripts, data, models, and generated outputs; record license/access constraints, persistent identifier or archival location, setup instructions, and the command-to-result mapping. Call an artifact available, functional, reusable, reproduced, or replicated only when the cited evidence supports that exact status.

## Security, privacy, and human studies

- A security note states assets, security property, trust assumptions, attacker capabilities, attack surface, mitigations, residual risk, and verification evidence. Scanning, testing, or absence of a known exploit is not proof of security.
- Record dependency/provenance, secure configuration, vulnerability or advisory identifiers and versions, and disclosure status only when relevant and source-supported. Separate vulnerability, exploitability, likelihood, impact, and risk.
- For human-participant or user studies, record population/recruitment, task, conditions, exclusions, consent/ethics status when stated, privacy handling, analysis, uncertainty, and generalizability limits. Never invent approval or consent status.
