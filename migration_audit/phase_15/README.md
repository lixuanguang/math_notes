# Phase 15 Migration Audit

Generated from the current working tree on 2026-06-15.

## Summary

- Rebuilt Part 15, Statistics and Time Series, under `parts/15_statistics_time_series/`.
- Wired `math.tex` to include `parts/15_statistics_time_series/overview` directly after Part 14.
- Added numbered subsection owners for statistical experiments, sufficiency, exponential families,
  local asymptotics, estimation, information bounds, testing, confidence, decision theory, shrinkage,
  Bayesian inference, nonparametric statistics, high-dimensional inference, time-series models,
  resampling, and sequential inference.
- Kept probability, measure-theory, stochastic-process, optimization, and numerical-computation
  prerequisites as cross-references to Parts 11--14.
- Did not migrate from the retired `sections/time_series_analysis` source tree.

## Validation

Results:

- LaTeX recorder visited the active Part 15 target files.
- Active Part 15 inputs: 25 target files, consisting of one part overview, eight section overviews,
  and sixteen numbered subsection owners.
- Old `sections/time_series_analysis` files on the active path: none.
- Machine-learning source files on the active path through Phase 15: none.
- Missing active inputs or figure paths: none reported by the build.
- Duplicate active labels: none reported by the build.
- LaTeX build result: success.
- Command: `pdflatex -recorder -interaction=nonstopmode -halt-on-error math.tex`.
- Output: `math.pdf` written with 454 pages.
- Remaining warnings:
  - existing overfull/underfull layout warnings outside the new Part 15 files.
  - legacy deep headings remain in inactive old `sections/time_series_analysis` and
    `sections/machine_learning` source files.

## Next Cursor

Phase 15's initial rebuild is complete. Continue with Phase 16, Statistical Learning and Deep
Learning, starting at `parts/16_statistical_learning_deep_learning/` and source mapping the root
`machine_learning/...` tree before comparing against the `sections/machine_learning/...` mirror.
