# Structure Reference

The canonical LaTeX source tree is `parts/`, and `math.tex` inputs that tree
directly. This file is a maintenance reference for placement, ownership, and
structural checks.

## Source Layout

- `parts/base.tex`: shared preamble, macros, and theorem environments.
- `parts/00_notations/`: front-matter notation and symbol scope rules.
- `parts/01_...` through `parts/17_...`: mathematical body content.
- Each numbered part has one `overview.tex` with one `\part{...}` and inputs for
  its section folders.
- Each section folder has one `overview.tex` with one `\section{...}` and inputs
  for numbered subsection files.
- Numbered subsection files are the deepest visible book-body level and contain
  `\subsection{...}` plus content.

The active include order in `math.tex` is:

```tex
\input{parts/base}
\input{parts/00_notations/overview}
\input{parts/01_set_theory_logic_foundations/overview}
\input{parts/02_structural_linear_algebra/overview}
\input{parts/03_geometric_spectral_linear_algebra/overview}
\input{parts/04_matrix_analysis_numerical_linear_algebra/overview}
\input{parts/05_groups_rings_fields/overview}
\input{parts/06_modules_multilinear_homological/overview}
\input{parts/07_commutative_algebra/overview}
\input{parts/08_algebraic_geometry/overview}
\input{parts/09_real_topological_analysis/overview}
\input{parts/10_calculus_series_approximation/overview}
\input{parts/11_measure_integration_functional_analysis/overview}
\input{parts/12_probability_stochastic_systems/overview}
\input{parts/13_dynamical_pde_systems/overview}
\input{parts/14_numerical_stochastic_computation/overview}
\input{parts/15_statistical_inference_and_time_series/overview}
\input{parts/16_statistical_data_analysis_and_applied_models/overview}
\input{parts/17_statistical_learning_deep_learning/overview}
```

## Editing Rules

- Add LaTeX content under `parts/`.
- Use the section index below for first-pass placement, then inspect local
  `overview.tex` files and nearby subsection files before editing.
- Extend an existing subsection when it is the natural owner.
- Add the next numbered subsection file only when no existing subsection fits.
- Add a new section folder only when the topic does not fit an existing section.
- Add a new part only when the material spans multiple sections and does not fit
  the ownership table.
- Keep `overview.tex` files structural: headings and inputs only.
- Preserve the visible depth convention: `\part`, `\section`, and
  `\subsection`; do not add book-body `\subsubsection` or `\paragraph`.
- Prefer cross-references over duplicate definitions or duplicate theory.
- Keep figures close to the text that introduces or uses them.
- When introducing durable notation, update the relevant notation file in the
  same change.
- Keep LeanBlueprint markers in the LaTeX environment they document.

For content-moving work, make one coherent mathematical move at a time, preserve
labels and mathematical content unless rewriting is explicitly requested, update
only affected inputs, and validate before removing the old included source.

For formalization-loop work, process one logical unit at a time: either the
substantive body of a section `overview.tex`, or one numbered subsection file.
Prefer exact `parts/...` cursors. Bare section numbers are ambiguous because
section counters restart in each part.

## Section Index

Use this as the first-pass placement index. For subsection-level placement,
inspect the relevant `overview.tex` and numbered subsection files.

```text
parts/01_set_theory_logic_foundations/
  01_sets/
  02_logic_and_proofs/
  03_counting_and_finite_sums/
  04_relations_orders_and_lattices/
  05_functions/
  06_cardinality_choice_and_infinite_sets/
  07_axiomatic_and_advanced_set_theory/

parts/02_structural_linear_algebra/
  01_vector_spaces_and_linear_structure/
  02_direct_sums_quotients_and_decomposition/
  03_linear_maps_and_matrix_representations/
  04_block_matrices_and_matrix_operations/
  05_duality_and_multilinear_structure/
  06_finite_dimensional_topological_vector_spaces/

parts/03_geometric_spectral_linear_algebra/
  01_inner_product_geometry/
  02_orthogonality_projections_and_least_squares/
  03_bilinear_and_quadratic_forms/
  04_affine_projective_and_convex_geometry/
  05_eigenstructure_and_invariant_subspaces/
  06_polynomial_structure_and_canonical_forms/
  07_spectral_theorems_and_operator_functions/

parts/04_matrix_analysis_numerical_linear_algebra/
  01_trace_determinant_rank_and_matrix_invariants/
  02_positive_definite_and_structured_matrices/
  03_matrix_products_vectorization_and_spectral_radius/
  04_matrix_decompositions/
  05_norms_conditioning_perturbation_and_stability/
  06_numerical_linear_algebra/

parts/05_groups_rings_fields/
  01_algebraic_language_and_categories/
  02_group_theory/
  03_rings_ideals_and_polynomial_rings/
  04_fields_and_galois_theory/

parts/06_modules_multilinear_homological/
  01_module_theory/
  02_noetherian_modules_and_pid_structure_theorems/
  03_linear_operators_as_modules/
  04_associative_algebras/
  05_tensor_products/
  06_symmetric_and_exterior_algebras/
  07_chain_complexes_and_homology/

parts/07_commutative_algebra/
  01_prime_ideals_and_spectra/
  02_localization_and_local_rings/
  03_noetherian_rings_and_modules/
  04_integral_dependence_and_dimension/
  05_regularity_and_singularities/

parts/08_algebraic_geometry/
  01_affine_algebraic_sets/
  02_morphisms_and_coordinate_rings/
  03_projective_geometry/
  04_schemes/
  05_sheaves_and_cohomology/
  06_smoothness_tangent_spaces_and_dimension/
  07_divisors_line_bundles_and_curves/

parts/09_real_topological_analysis/
  01_number_systems_and_completeness/
  02_real_sequences_and_completeness_methods/
  03_metric_spaces_and_euclidean_topology/
  04_compactness_and_completeness/
  05_connectedness_and_continuity/
  06_general_topology_for_analysis/

parts/10_calculus_series_approximation/
  01_one_variable_differentiation_and_riemann_integration/
  02_riemann_stieltjes_and_improper_integration/
  03_several_variable_differentiation/
  04_inverse_implicit_and_rank_theorems/
  05_differential_forms_and_stokes_theory/
  06_infinite_series_and_summability/
  07_uniform_convergence/
  08_function_space_compactness/
  09_power_series_and_approximation/
  10_fourier_structure/

parts/11_measure_integration_functional_analysis/
  01_sigma_algebras_measures_and_extension/
  02_measurable_functions_and_lebesgue_integration/
  03_product_measures_and_fubini_theory/
  04_radon_nikodym_and_differentiation/
  05_lp_spaces_and_modes_of_convergence/
  06_banach_and_hilbert_spaces/
  07_weak_topologies_compact_operators_and_spectral_theory/

parts/12_probability_stochastic_systems/
  01_probability_spaces_random_variables_and_expectation/
  02_conditional_probability_and_conditional_expectation/
  03_probabilistic_convergence/
  04_limit_theorems/
  05_stochastic_processes/
  06_stochastic_calculus_and_sdes/

parts/13_dynamical_pde_systems/
  01_dynamical_systems_and_odes/
  02_partial_differential_equations/
  03_weak_solutions_and_evolution_equations/

parts/14_numerical_stochastic_computation/
  01_numerical_analysis/
  02_numerical_differential_systems/
  03_monte_carlo_and_stochastic_computation/

parts/15_statistical_inference_and_time_series/
  01_statistical_models_and_experiments/
  02_estimation_theory/
  03_hypothesis_testing_and_confidence/
  04_decision_theory/
  05_bayesian_inference/
  06_nonparametric_and_high_dimensional_statistics/
  07_time_series_models/
  08_sequential_inference_and_resampling/

parts/16_statistical_data_analysis_and_applied_models/
  01_survey_sampling/
  02_exploratory_data_analysis_and_data_summaries/
  03_categorical_data_analysis/
  04_analysis_of_variance_and_designed_experiments/
  05_linear_models_and_regression/

parts/17_statistical_learning_deep_learning/
  01_learning_problems_and_risk/
  02_generalization_theory/
  03_classical_supervised_learning/
  04_unsupervised_and_latent_variable_learning/
  05_probabilistic_graphical_and_causal_learning/
  06_neural_network_foundations/
  07_modern_deep_models/
  08_learning_systems_and_evaluation/
```

## Notation Files

```text
parts/00_notations/
  overview.tex
  00_collision_index_and_scope_rules.tex
  01_global_conventions.tex
  02_linear_operator_structures.tex
  03_algebraic_structures.tex
  04_algebraic_geometry_commutative_algebra.tex
  05_analysis_continuous_structure.tex
  06_probability_stochastic_structure.tex
  07_numerical_computational_mathematics.tex
```

## Ownership

| Topic | Owner |
| --- | --- |
| Global notation, collision index, and symbol scope rules | Notations |
| Set theory, cardinality, choice | Set Theory, Logic, and Foundations |
| Finite-dimensional linear maps | Structural Linear Algebra |
| Inner products, forms, finite-dimensional metric geometry | Geometric and Spectral Linear Algebra |
| Matrix algorithms | Matrix Analysis and Numerical Linear Algebra |
| Rings, groups, fields | Groups, Rings, and Fields |
| Modules and Smith/PID/operator-module structure | Modules, Multilinear, and Homological Methods |
| Commutative algebra | Commutative Algebra |
| Algebraic geometry | Algebraic Geometry |
| Real/metric/topological foundations | Real and Topological Analysis |
| Riemann/Stieltjes and classical calculus | Calculus, Series, and Approximation |
| Abstract measure and Lebesgue integration | Measure, Integration, and Functional Analysis |
| Probability spaces and limit theorems | Probability and Stochastic Systems |
| ODEs, dynamical systems, and PDE | Dynamical and PDE Systems |
| Numerical algorithms and stochastic computation | Numerical and Stochastic Computation |
| Statistical models, estimation, tests, Bayes, nonparametrics, time series, and sequential inference | Statistical Inference and Time Series |
| Survey sampling, exploratory data analysis, categorical data, ANOVA/design, regression, and classical applied models | Statistical Data Analysis and Applied Models |
| Prediction, representation, learned models | Statistical Learning and Deep Learning |

## Lean

Lean files live under `MathNotes/`. New generated stubs mirror
`parts/<path>/<name>.tex` as `MathNotes/parts/<path>/<name>.lean`.

```sh
python3 scripts/scaffold_lean_sections.py
```

The scaffolding script creates only missing mirrored stubs and regenerates
`MathNotes.lean`. Existing modules under `MathNotes/sections/` are legacy Lean
formalization modules, not LaTeX source.

Use `LEAN.md` for Lean setup, escaped import names, and LeanBlueprint commands.

## Validation

Run the relevant checks after structural edits:

```sh
pdflatex -recorder -interaction=nonstopmode -halt-on-error math.tex
lake build
rg -n '^\\subsubsection|^\\paragraph' math.tex parts
```
