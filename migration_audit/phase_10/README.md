# Phase 10 Migration Audit

Generated from the current working tree on 2026-06-14.

## Summary

- Migrated Part 10, Calculus, Series, and Approximation, into `parts/10_calculus_series_approximation/`.
- Wired `math.tex` to include `parts/10_calculus_series_approximation/overview` directly after Part 9.
- Moved one-variable calculus, Riemann and Riemann--Stieltjes integration, several-variable differentiation, inverse/implicit/rank theorems, multiple integration, differential forms, Stokes theory, series, uniform convergence, function-space compactness, power series, approximation, and Fourier structure into Part 10 owners.
- Replaced the old differential/geometric-analysis and convergence/function-space source bodies with compatibility forwarders into Part 10.
- Updated the legacy analysis overview so the active old analysis part begins with measure/integration and functional analysis.

## Validation

Results:

- Active input walk visited 356 local TeX inputs.
- Active input walk visited 209 local figure/non-TeX paths.
- Missing active inputs or figure paths: none.
- Active Part 10 inputs: 36.
- Old Phase 10 source files on the active path: none.
- Duplicate active labels: none.
- LaTeX build result: success.
- Output: `math.pdf` written with 441 pages.
- Remaining warnings:
  - existing overfull/underfull layout warnings.

## Next Cursor

Phase 10 is complete. Continue with Phase 11, Measure, Integration, and Functional Analysis, starting at
`parts/11_measure_integration_functional_analysis/` and source mapping the measure theory,
Lebesgue integration, product measure, Radon-Nikodym, differentiation, `Lp` spaces,
Banach/Hilbert, and operator-theoretic functional analysis sources listed in the migration plan.
