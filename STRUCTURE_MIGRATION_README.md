# Structure Migration Reference

The canonical LaTeX source tree is `parts/`, and `math.tex` inputs that tree
directly. This file is a maintenance reference for placement, ownership, and
structural checks.

## Migration Status

The LaTeX structure migration is complete.

- `parts/` is the canonical LaTeX source tree.
- `math.tex` should input `parts/` files only.
- The former repo-level LaTeX `sections/` tree is retired and should not be
  recreated.
- `MathNotes/sections/` contains legacy Lean modules only; it is not a LaTeX
  source tree.
- New mirrored Lean stubs should live under `MathNotes/parts/`.

## Source Layout

- `parts/base.tex`: shared preamble, macros, and theorem environments.
- `parts/00_notations/`: front-matter notation and symbol scope rules.
- `parts/01_...` through `parts/22_...`: mathematical body content, numbered
  in the same order as the main table of contents.
- Each part folder has one `overview.tex` with one `\part{...}` and inputs for
  its section folders.
- Each section folder has one `overview.tex` with one `\section{...}` and inputs
  for numbered subsection files.
- Numbered subsection files are the deepest visible book-body level and contain
  `\subsection{...}` plus content.

The active include order in `math.tex` is:

```tex
\input{parts/base}
\input{parts/00_notations/overview}
\input{parts/01_set_theory_logic_and_foundations/overview}
\input{parts/02_structural_linear_algebra/overview}
\input{parts/03_linear_maps_and_matrix_representations/overview}
\input{parts/04_geometric_and_spectral_linear_algebra/overview}
\input{parts/05_polynomial_structure_and_canonical_forms/overview}
\input{parts/06_matrix_analysis_and_numerical_linear_algebra/overview}
\input{parts/07_groups_rings_fields/overview}
\input{parts/08_modules_multilinear_homological/overview}
\input{parts/09_commutative_algebra/overview}
\input{parts/10_algebraic_geometry/overview}
\input{parts/11_real_topological_analysis/overview}
\input{parts/12_calculus_series_approximation/overview}
\input{parts/13_measure_foundations_and_extension/overview}
\input{parts/14_measure_integration_functional_analysis/overview}
\input{parts/15_probability_foundations_and_distributions/overview}
\input{parts/16_probability_stochastic_systems/overview}
\input{parts/17_dynamical_pde_systems/overview}
\input{parts/18_numerical_stochastic_computation/overview}
\input{parts/19_statistical_inference_and_time_series/overview}
\input{parts/20_statistical_data_analysis_and_applied_models/overview}
\input{parts/21_statistical_learning_deep_learning/overview}
\input{parts/22_classical_supervised_learning/overview}
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

## Placement Workflow

When adding or moving material:

1. Pick the likely owner from the ownership table.
2. Open that part's `overview.tex` and the relevant section `overview.tex`.
3. Inspect nearby numbered subsection files before creating a new file.
4. Extend the existing natural owner when one exists.
5. If a new numbered subsection file is needed, add the next number in that
   section folder and add one matching `\input{...}` to the section
   `overview.tex`.
6. If a new section folder is needed, add its `overview.tex`, add the section
   input to the part `overview.tex`, and keep the ordering local and
   mathematical rather than alphabetical by default.
7. After adding a new `.tex` file under `parts/`, run the Lean scaffolding
   command in the Lean section if a mirrored Lean stub is expected.

## Content Moves

For content-moving work, make one coherent mathematical move at a time. Preserve
labels and mathematical content unless rewriting is explicitly requested, update
only affected inputs, and validate before removing the old included source.

Before deleting or retiring a source file, confirm it is no longer included by
`math.tex`, a part `overview.tex`, a section `overview.tex`, or
`blueprint/src/content.tex`.

## Formalization Loop

For formalization-loop work, process one logical unit at a time: either the
substantive body of a section `overview.tex`, or one numbered subsection file.
Prefer exact `parts/...` cursors. Bare section numbers are ambiguous because
section counters restart in each part.

## Section Index

Use this as the first-pass placement index. For subsection-level placement,
inspect the relevant `overview.tex` and numbered subsection files.

```text
parts/01_set_theory_logic_and_foundations/
  01_sets/
  02_logic_and_proofs/
  03_functions/
  04_counting_and_finite_sums/
  05_relations_orders_and_lattices/
  06_cardinality_choice_and_infinite_sets/
  07_axiomatic_and_advanced_set_theory/

parts/02_structural_linear_algebra/
  01_vector_spaces_and_linear_structure/
  02_direct_sums_quotients_and_decomposition/
  03_matrix_representations_change_of_basis_block_matrices_and_operations/
  04_duality_and_multilinear_structure/

parts/03_linear_maps_and_matrix_representations/
  01_linear_maps_and_operations/
  02_kernels_images_rank_and_nullity/
  03_matrix_representations/
  04_row_reduction_and_elementary_matrices/
  05_change_of_basis/
  06_matrix_equivalence_and_similarity/

parts/04_geometric_and_spectral_linear_algebra/
  01_inner_product_geometry/
  02_orthogonality_projections_and_least_squares/
  03_bilinear_and_quadratic_forms/
  04_affine_projective_and_convex_geometry/
  05_eigenstructure_and_invariant_subspaces/
  06_spectral_theorems_and_operator_functions/

parts/05_polynomial_structure_and_canonical_forms/
  01_operator_polynomials/
  02_characteristic_and_minimal_polynomials/
  03_cayley_hamilton_and_annihilators/
  04_generalized_eigenspaces/
  05_primary_decomposition/
  06_jordan_and_canonical_forms/
  07_transpose_and_conjugate_similarity/

parts/06_matrix_analysis_and_numerical_linear_algebra/
  01_trace_determinant_rank_and_matrix_invariants/
  02_positive_definite_and_structured_matrices/
  03_matrix_products_vectorization_and_spectral_radius/
  04_matrix_decompositions/
  05_norms_conditioning_perturbation_and_stability/
  06_numerical_linear_algebra/

parts/07_groups_rings_fields/
  01_algebraic_language_and_categories/
  02_group_theory/
  03_rings_ideals_and_polynomial_rings/
  04_fields_and_galois_theory/

parts/08_modules_multilinear_homological/
  01_module_theory/
  02_noetherian_modules_and_pid_structure_theorems/
  03_linear_operators_as_modules/
  04_associative_algebras/
  05_tensor_products/
  06_symmetric_and_exterior_algebras/
  07_chain_complexes_and_homology/

parts/09_commutative_algebra/
  01_prime_ideals_and_spectra/
  02_localization_and_local_rings/
  03_noetherian_rings_and_modules/
  04_integral_dependence_and_dimension/
  05_regularity_and_singularities/

parts/10_algebraic_geometry/
  01_affine_algebraic_sets/
  02_morphisms_and_coordinate_rings/
  03_projective_geometry/
  04_schemes/
  05_sheaves_and_cohomology/
  06_smoothness_tangent_spaces_and_dimension/
  07_divisors_line_bundles_and_curves/

parts/11_real_topological_analysis/
  01_number_systems_and_completeness/
  02_real_sequences_and_completeness_methods/
  03_metric_spaces_and_euclidean_topology/
  04_compactness_and_completeness/
  05_connectedness_and_continuity/
  06_general_topology_for_analysis/
  07_finite_dimensional_topological_vector_spaces/

parts/12_calculus_series_approximation/
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

parts/13_measure_foundations_and_extension/
  01_sigma_algebras_and_measurable_spaces/
  02_measures_charges_and_basic_examples/
  03_outer_measures_and_caratheodory_extension/
  04_borel_lebesgue_and_stieltjes_measures/
  05_continuity_and_regularity_of_measures/
  06_regular_approximation_and_caratheodory_tests/
  07_vitali_steinhaus_and_nonmeasurable_sets/
  08_cantor_lebesgue_singular_function/

parts/14_measure_integration_functional_analysis/
  01_measurable_functions_and_lebesgue_integration/
  02_product_measures_and_fubini_theory/
  03_radon_nikodym_and_differentiation/
  04_lp_spaces_and_modes_of_convergence/
  05_banach_and_hilbert_spaces/
  06_weak_topologies_compact_operators_and_spectral_theory/

parts/15_probability_foundations_and_distributions/
  01_probability_spaces_and_random_variables/
  02_joint_distributions_multivariate_laws_and_transformations/
  03_expectation_and_integration_in_probability/
  04_order_statistics_and_extrema/
  05_normal_derived_distributions/

parts/16_probability_stochastic_systems/
  01_conditional_probability_and_conditional_expectation/
  02_probabilistic_convergence/
  03_limit_theorems/
  04_stochastic_processes/
  05_stochastic_calculus_and_sdes/

parts/17_dynamical_pde_systems/
  01_dynamical_systems_and_odes/
  02_partial_differential_equations/
  03_weak_solutions_and_evolution_equations/

parts/18_numerical_stochastic_computation/
  01_numerical_analysis/
  02_numerical_differential_systems/
  03_monte_carlo_and_stochastic_computation/

parts/19_statistical_inference_and_time_series/
  01_statistical_models_and_experiments/
  02_estimation_theory/
  03_hypothesis_testing_and_confidence/
  04_decision_theory/
  05_bayesian_inference/
  06_nonparametric_and_high_dimensional_statistics/
  07_time_series_models/
  08_sequential_inference_and_resampling/

parts/20_statistical_data_analysis_and_applied_models/
  01_survey_sampling/
  02_exploratory_data_analysis_and_data_summaries/
  03_categorical_data_analysis/
  04_analysis_of_variance_and_designed_experiments/
  05_linear_models_and_regression/

parts/21_statistical_learning_deep_learning/
  01_learning_problems_and_risk/
  02_generalization_theory/
  03_unsupervised_and_latent_variable_learning/
  04_probabilistic_graphical_and_causal_learning/
  05_neural_network_foundations/
  06_modern_deep_models/
  07_learning_systems_and_evaluation/

parts/22_classical_supervised_learning/
  01_linear_prediction_and_generalized_linear_models/
  02_regularization_and_model_selection/
  03_basis_expansions_splines_and_wavelets/
  04_kernel_methods_and_rkhs_theory/
  05_support_vector_machines_and_margin_methods/
  06_trees_forests_and_boosting/
  07_additive_models_and_adaptive_basis_methods/
  08_boosting_and_additive_trees/
  09_high_dimensional_supervised_learning/
  10_prototype_and_nearest_neighbor_methods/
  11_flexible_and_mixture_discriminant_analysis/
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
| Finite-dimensional linear maps and matrix representations | Linear Maps and Matrix Representations |
| Inner products, forms, finite-dimensional metric geometry | Geometric and Spectral Linear Algebra |
| Operator polynomials, minimal polynomials, and canonical forms | Polynomial Structure and Canonical Forms |
| Matrix algorithms | Matrix Analysis and Numerical Linear Algebra |
| Rings, groups, fields | Groups, Rings, and Fields |
| Modules and Smith/PID/operator-module structure | Modules, Multilinear, and Homological Methods |
| Commutative algebra | Commutative Algebra |
| Algebraic geometry | Algebraic Geometry |
| Real/metric/topological foundations | Real and Topological Analysis |
| Riemann/Stieltjes and classical calculus | Calculus, Series, and Approximation |
| Measure spaces, outer measure, and extension | Measure Foundations and Extension |
| Lebesgue integration and functional analysis | Measure, Integration, and Functional Analysis |
| Probability foundations and distributions | Probability Foundations and Distributions |
| Conditional probability, convergence, limit theorems, stochastic processes, and SDEs | Probability and Stochastic Systems |
| ODEs, dynamical systems, and PDE | Dynamical and PDE Systems |
| Numerical algorithms and stochastic computation | Numerical and Stochastic Computation |
| Statistical models, estimation, tests, Bayes, nonparametrics, time series, and sequential inference | Statistical Inference and Time Series |
| Survey sampling, exploratory data analysis, categorical data, ANOVA/design, regression, and classical applied models | Statistical Data Analysis and Applied Models |
| Statistical learning foundations, unsupervised learning, causal/graphical learning, neural networks, and systems | Statistical Learning and Deep Learning |
| Classical supervised learning | Classical Supervised Learning |

## Lean

Lean files live under `MathNotes/`. New generated stubs mirror
`parts/<path>/<name>.tex` as `MathNotes/parts/<path>/<name>.lean`.

```sh
python3 scripts/scaffold_lean_sections.py
```

The scaffolding script creates only missing mirrored stubs and regenerates
`MathNotes.lean`. Existing modules under `MathNotes/sections/` are legacy Lean
formalization modules, not LaTeX source.

Lean filenames mirror the `.tex` filenames on disk. Numbered path components are
escaped in Lean import names with guillemets, as described in `LEAN.md`.

Use `LEAN.md` for Lean setup, escaped import names, and LeanBlueprint commands.
Use `blueprint/README.md` for the LeanBlueprint web/check workflow.

## Validation

Run the relevant checks after structural edits:

```sh
pdflatex -recorder -interaction=nonstopmode -halt-on-error math.tex
lake build
rg -n '\\input\{sections/|sections/' math.tex parts references.tex blueprint/src
rg -n '\\subsubsection|\\paragraph' parts
```

For bibliography-affecting edits, use the full LaTeX/BibTeX sequence from
`README.md`. For LeanBlueprint-affecting edits, run the relevant commands from
`blueprint/README.md` after `lake build`.
