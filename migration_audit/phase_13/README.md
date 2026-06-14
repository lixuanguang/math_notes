# Phase 13 Migration Audit

Generated from the current working tree on 2026-06-15.

## Summary

- Migrated Part 13, Dynamical and PDE Systems, into `parts/13_dynamical_pde_systems/`.
- Wired `math.tex` to include `parts/13_dynamical_pde_systems/overview` directly after Part 12.
- Moved ODE foundations, linear systems, nonlinear stability, bifurcation, dynamical structure, semigroups, first-order PDE, elliptic/parabolic/hyperbolic PDE, Sobolev spaces, weak solutions, and evolution-equation owners into Part 13.
- Split the old combined PDE and evolution-equation source overview into target owners for partial differential equations and weak solutions/evolution equations.
- Replaced the old `sections/dynamical_pde_systems` source bodies with migration markers into Part 13.

## Validation

Results:

- LaTeX recorder visited 372 local TeX inputs.
- LaTeX recorder visited 209 local figure/non-TeX inputs.
- Missing active inputs or figure paths: none.
- Active Part 13 inputs: 17.
- Old Phase 13 source files on the active path: none.
- Duplicate active labels: none.
- Source-to-target label parity for migrated Phase 13 files: 5 labels preserved, none missing.
- LaTeX build result: success.
- Output: `math.pdf` written with 442 pages.
- Remaining warnings:
  - existing overfull/underfull layout warnings.

## Next Cursor

Phase 13 is complete. Continue with Phase 14, Numerical and Stochastic Computation, starting at
`parts/14_numerical_stochastic_computation/` and source mapping the numerical analysis, numerical
ODE/PDE, discretization, Monte Carlo, stochastic simulation, MCMC, sequential Monte Carlo,
stochastic optimization, and computational stability sources listed in the migration plan.
