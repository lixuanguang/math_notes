# Phase 16 Migration Audit

Generated from the current working tree on 2026-06-15.

## Summary

- Rebuilt Part 16, Statistical Learning and Deep Learning, under `parts/16_statistical_learning_deep_learning/`.
- Wired `math.tex` to include `parts/16_statistical_learning_deep_learning/overview` directly after Part 15.
- Added numbered subsection owners for learning problems, risk, empirical risk, surrogate losses, generalization theory, classical supervised learning, unsupervised learning, graphical and causal learning, neural-network foundations, modern deep models, and learning-system evaluation.
- Confirmed the root `machine_learning/...` tree and `sections/machine_learning/...` mirror are identical before migration.
- Migrated usable deep-learning material into the new structure: feedforward networks, output and hidden units, universal approximation, backpropagation, SGD variants, regularization, dropout, batch normalization, convolution, pooling, adversarial robustness, bagging, boosting, and sparse representations.
- Left the old root and mirror machine-learning source files intact because they are not active in the PDF include graph; no active duplicate owner remains after Part 16 is wired.

## Validation

Results:

- LaTeX recorder visited the active Part 16 target files.
- Active Part 16 inputs: 43 target files, consisting of one part overview, eight section overviews,
  and thirty-four numbered subsection owners.
- Old `sections/machine_learning` files on the active path: none.
- Root `machine_learning` files on the active path: none.
- Missing active inputs or figure paths: none reported by the build.
- Duplicate active labels: none reported by the build.
- Unresolved references or citations: none reported by the build.
- LaTeX build result: success.
- Command: `pdflatex -recorder -interaction=nonstopmode -halt-on-error math.tex`.
- Output: `math.pdf` written with 469 pages.
- Remaining warnings:
  - existing overfull/underfull layout warnings outside the new Part 16 files.

## Next Cursor

After Phase 16 validates, continue with Phase 17, Notations, starting at `parts/00_notations/` and source mapping `sections/notation_list.tex` plus the `sections/notation/...` files.
