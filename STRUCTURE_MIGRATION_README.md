# Structure Migration Plan

This README maps the current `sections/` tree to a cleaner `parts/` tree with explicit
part, section, and subsection granularity. It is a planning artifact only: no LaTeX source
files are moved by this document.

Important migration constraint: the migration is content-copying, not rewriting. Each target
part/section/subsection file should receive copied mathematical content with wording, labels,
proofs, and displays preserved. After copied content is verified in the new `parts/` location,
remove the overlapping content from the old repo-level `sections/...` source files so there is
only one active owner for each piece of mathematics.

## Goals

- Use fewer, expandable parts than a one-specialty-per-part outline.
- Avoid giant umbrella parts that become hard to maintain.
- Keep visible depth to `\part`, `\section`, and `\subsection`.
- Use `parts/` as the canonical new content tree.
- Keep part, section, and subsection content controlled by separate files.
- Preserve mathematical content while copying; do not rewrite mathematics during migration.
- Remove overlapping old content after verifying the copied target content.
- Remove all book-body `\subsubsection` headings by making target subsection files the deepest visible level.
- Avoid duplicate ownership: first occurrence develops the theory; later occurrences apply it and cross-reference it.

## Target Include Order

The proposed replacement for the body include sequence in `math.tex` is:

```tex
\input{parts/01_mathematical_foundations/overview}
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
\input{parts/13_dynamical_pde_numerical_systems/overview}
\input{parts/14_statistics_time_series/overview}
\input{parts/15_statistical_learning_deep_learning/overview}
```

Each part folder owns one `overview.tex` containing the `\part{...}` heading and inputs for its
numbered section folders.

## Canonical Directory Layout

Use this filesystem pattern:

```text
parts/
  01_mathematical_foundations/
    overview.tex
    01_sets/
      overview.tex
      01_introduction_to_sets.tex
      02_cartesian_products.tex
      03_subsets_and_power_sets.tex
    02_logic_and_proofs/
      overview.tex
      01_statements_and_well_formed_language.tex
      02_connectives_conditionals_and_truth_tables.tex
  02_structural_linear_algebra/
    overview.tex
    01_vector_spaces_and_linear_structure/
      overview.tex
      01_vector_spaces.tex
      02_subspaces_and_spans.tex
```

File responsibilities:

- `parts/<number>_<part_name>/overview.tex` contains exactly one `\part{...}` and inputs section `overview.tex` files.
- `parts/<part>/<number>_<section_name>/overview.tex` contains exactly one `\section{...}` and inputs numbered subsection files.
- `parts/<part>/<section>/<number>_<subsection_name>.tex` contains one `\subsection{...}` and its copied content.
- If a section is genuinely short and does not need subsections yet, its `overview.tex` may contain the section body directly. Prefer subsection files once content becomes substantial.
- No target file should use `\subsubsection` for book-body structure.

## Ownership Rules

| Topic | Owner | Later Uses Should Do |
| --- | --- | --- |
| Set theory, cardinality, choice | Mathematical Foundations | Reference it from analysis/algebra |
| Finite-dimensional linear maps | Structural Linear Algebra | Use from matrix/spectral parts |
| Inner products, forms, finite-dimensional metric geometry | Geometric and Spectral Linear Algebra | Reference from functional analysis |
| Matrix algorithms | Matrix Analysis and Numerical Linear Algebra | Reference from numerical PDE/computation |
| Rings, groups, fields | Groups, Rings, and Fields | Use from algebraic geometry/module theory |
| Modules and Smith/PID/operator-module structure | Modules, Multilinear, and Homological Methods | Reference from spectral linear algebra |
| Commutative algebra | Commutative Algebra | Reference from algebraic geometry |
| Real/metric/topological foundations | Real and Topological Analysis | Reference from measure/probability |
| Riemann/Stieltjes and classical calculus | Calculus, Series, and Approximation | Reference from measure/dynamics |
| Abstract measure and Lebesgue integration | Measure, Integration, and Functional Analysis | Probability specializes it |
| Probability spaces and limit theorems | Probability and Stochastic Systems | Statistics/time series use it |
| PDE and numerical methods | Dynamical, PDE, and Numerical Systems | Statistics/ML avoid redeveloping algorithms |
| Inference for data-generating processes | Statistics and Time Series | Learning uses risk/prediction language |
| Prediction, representation, learned models | Statistical Learning and Deep Learning | Statistics remains inference-focused |

## Target Structure and Source Mapping

### 1. Mathematical Foundations

Target:

```tex
\part{Mathematical Foundations}
\section{Sets}
  \subsection{Introduction to Sets}
  \subsection{Cartesian Products}
  \subsection{Subsets and Power Sets}
  \subsection{Union, Intersection, Difference, and Complement}
  \subsection{Indexed Sets and Number Systems}
  \subsection{Russell's Paradox and Axioms}
\section{Logic and Proofs}
  \subsection{Statements and Well-Formed Language}
  \subsection{Connectives, Conditionals, and Truth Tables}
  \subsection{Quantifiers, Bound Variables, and Negation}
  \subsection{Proof Grammar and Inference}
  \subsection{Direct, Contrapositive, and Contradiction Proofs}
  \subsection{Induction, Recursion, and Counterexamples}
\section{Counting and Finite Sums}
  \subsection{Lists and Counting Principles}
  \subsection{Permutations, Subsets, and Binomial Coefficients}
  \subsection{Inclusion-Exclusion, Pigeonhole, and Combinatorial Proof}
  \subsection{Finite Sums}
\section{Relations, Orders, and Lattices}
  \subsection{Relations and Equivalence}
  \subsection{Partitions, Congruence, and Quotients}
  \subsection{Ordered Sets, Well-Orders, and Lattices}
  \subsection{Relations Between Sets and Closures}
\section{Functions}
  \subsection{Functions, Images, and Preimages}
  \subsection{Injective, Surjective, and Bijective Maps}
  \subsection{Composition, Restriction, and Inverse Functions}
\section{Cardinality, Choice, and Infinite Sets}
  \subsection{Same Cardinality, Finite, Countable, and Uncountable}
  \subsection{Diagonalization and Power Sets}
  \subsection{Schroeder--Bernstein and Cardinal Comparison}
  \subsection{Cardinal Arithmetic}
  \subsection{Choice, Zorn's Lemma, and Well-Ordering}
\section{Axiomatic and Advanced Set Theory}
  \subsection{Extensionality, Specification, and Replacement}
  \subsection{Ordinals, Transfinite Recursion, and Well-Foundedness}
  \subsection{Models, Constructibility, and Independence}
  \subsection{Filters, Ultrafilters, and Sets of Reals}
```

Current sources:

- `sections/foundational_prerequisites.tex`
- `sections/mathematical_language_sets_and_logic/overview.tex`
- `sections/mathematical_language_sets_and_logic/1_sets/*`
- `sections/mathematical_language_sets_and_logic/2_logic_and_proofs/*`
- `sections/mathematical_language_sets_and_logic/3_counting_and_finite_sums/*`
- `sections/mathematical_language_sets_and_logic/4_relations_orders_and_lattices/*`
- `sections/mathematical_language_sets_and_logic/5_functions/*`
- `sections/mathematical_language_sets_and_logic/6_cardinality_choice_and_infinite_sets/*`
- `sections/mathematical_language_sets_and_logic/7_axiomatic_and_advanced_set_theory/*`

Notes:

- This part should own cardinality and choice.
- Keep the current fine-grained section/subsection ordering here. Do not collapse the seven current foundation sections into three broad sections.
- `sections/analysis/foundations_of_analysis/1_2_cardinality_and_infinite_sets.tex` should be merged here or reduced to a cross-reference.

### 2. Structural Linear Algebra

Target:

```tex
\part{Structural Linear Algebra}
\section{Vector Spaces and Linear Structure}
  \subsection{Vector Spaces}
  \subsection{Subspaces and Spans}
  \subsection{Linear Independence and Bases}
  \subsection{Dimension and Coordinates}
\section{Direct Sums, Quotients, and Decomposition}
  \subsection{Sums and Direct Sums}
  \subsection{Quotient Spaces}
  \subsection{Decomposition and Complementation}
\section{Linear Maps and Matrix Representations}
  \subsection{Linear Maps and Operations}
  \subsection{Kernels, Images, Rank, and Nullity}
  \subsection{Matrix Representations}
  \subsection{Change of Basis}
  \subsection{Matrix Equivalence and Similarity}
\section{Block Matrices and Matrix Operations}
  \subsection{Block Matrix Algebra}
  \subsection{Matrix Operations and Identities}
\section{Duality and Multilinear Structure}
  \subsection{Dual Spaces and Dual Bases}
  \subsection{Annihilators and Transposes}
  \subsection{Multilinear Structure}
\section{Finite-Dimensional Topological Vector Spaces}
```

Current sources:

- `sections/linear_algebra/structural_linear_algebra/1_1_vector_spaces_and_linear_structure.tex`
- `sections/linear_algebra/structural_linear_algebra/1_2_direct_sums_quotients_and_decomposition.tex`
- `sections/linear_algebra/structural_linear_algebra/1_3_linear_maps_and_representations.tex`
- `sections/linear_algebra/structural_linear_algebra/1_4_block_matrices_and_matrix_operations.tex`
- `sections/linear_algebra/structural_linear_algebra/1_5_duality_and_multilinear_structure.tex`
- `sections/linear_algebra/structural_linear_algebra/1_6_finite_dimensional_topological_vector_spaces.tex`

Suggested split for `1_3_linear_maps_and_representations.tex`:

- `\section{Linear Maps and Matrix Representations}`
  - `\subsection{Linear Maps and Operations}`
  - `\subsection{Kernels, Images, Rank, and Nullity}`
  - `\subsection{Matrix Representations}`
  - `\subsection{Change of Basis}`
  - `\subsection{Matrix Equivalence and Similarity}`

### 3. Geometric and Spectral Linear Algebra

Target:

```tex
\part{Geometric and Spectral Linear Algebra}
\section{Inner Product Geometry}
  \subsection{Inner Products and Norms}
  \subsection{Orthogonality and Angles}
  \subsection{Orthonormal Bases}
\section{Orthogonality, Projections, and Least Squares}
  \subsection{Orthogonal Complements}
  \subsection{Orthogonal Projections}
  \subsection{Least Squares and Metric Optimization}
  \subsection{Adjoints and Orthogonal Operators}
\section{Bilinear and Quadratic Forms}
  \subsection{Bilinear Pairings and Radicals}
  \subsection{Quadratic Forms and Polar Forms}
  \subsection{Orthogonal Decomposition and Witt Theory}
  \subsection{Symplectic Geometry}
  \subsection{Classical Groups and Isometries}
\section{Affine, Projective, and Convex Geometry}
  \subsection{Affine Geometry}
  \subsection{Projective Geometry}
  \subsection{Positive Systems, Convexity, and Separation}
\section{Eigenstructure and Invariant Subspaces}
  \subsection{Eigenvalues and Eigenvectors}
  \subsection{Invariant Subspaces}
  \subsection{Triangularization and Decomposition}
\section{Polynomial Structure and Canonical Forms}
  \subsection{Operator Polynomials}
  \subsection{Characteristic and Minimal Polynomials}
  \subsection{Cayley-Hamilton and Annihilators}
  \subsection{Generalized Eigenspaces}
  \subsection{Jordan and Canonical Forms}
\section{Spectral Theorems and Operator Functions}
  \subsection{Spectral Theory of Structured Operators}
  \subsection{Operator Functions}
  \subsection{The Umbral Calculus}
```

Current sources:

- `sections/linear_algebra/geometric_linear_algebra/2_1_inner_product_geometry.tex`
- `sections/linear_algebra/geometric_linear_algebra/2_2_orthogonal_complements_and_projections.tex`
- `sections/linear_algebra/geometric_linear_algebra/2_3_least_squares_and_metric_optimization.tex`
- `sections/linear_algebra/geometric_linear_algebra/2_4_adjoints_and_orthogonal_operators.tex`
- `sections/linear_algebra/geometric_linear_algebra/2_5_metric_vector_spaces_and_bilinear_forms.tex`
- `sections/linear_algebra/geometric_linear_algebra/2_6_affine_and_projective_geometry.tex`
- `sections/linear_algebra/geometric_linear_algebra/2_7_positive_systems_convexity_and_separation.tex`
- `sections/linear_algebra/spectral_linear_algebra/3_1_eigenstructure_and_invariant_subspaces.tex`
- `sections/linear_algebra/spectral_linear_algebra/3_2_polynomial_structure_of_operators.tex`
- `sections/linear_algebra/spectral_linear_algebra/3_3_jordan_and_canonical_forms.tex`
- `sections/linear_algebra/spectral_linear_algebra/3_4_spectral_theory_of_structured_operators.tex`
- `sections/linear_algebra/spectral_linear_algebra/3_5_operator_functions.tex`
- `sections/linear_algebra/spectral_linear_algebra/3_6_umbral_calculus.tex`

Suggested split for `2_5_metric_vector_spaces_and_bilinear_forms.tex`:

- `\section{Bilinear and Quadratic Forms}`
  - `\subsection{Bilinear Pairings and Radicals}`
  - `\subsection{Quadratic Forms and Polar Forms}`
  - `\subsection{Orthogonal Decomposition and Witt Theory}`
  - `\subsection{Symplectic Geometry}`
  - `\subsection{Classical Groups and Isometries}`

Suggested split for `3_2_polynomial_structure_of_operators.tex`:

- `\section{Polynomial Structure and Canonical Forms}`
  - `\subsection{Operator Polynomials}`
  - `\subsection{Characteristic and Minimal Polynomials}`
  - `\subsection{Cayley-Hamilton and Annihilators}`
  - `\subsection{Generalized Eigenspaces}`
  - `\subsection{Primary Decomposition}`

### 4. Matrix Analysis and Numerical Linear Algebra

Target:

```tex
\part{Matrix Analysis and Numerical Linear Algebra}
\section{Trace, Determinant, Rank, and Matrix Invariants}
  \subsection{Trace and Determinant}
  \subsection{Minors, Cofactors, and Rank}
  \subsection{Commutators and Special Matrix Classes}
\section{Positive Definite and Structured Matrices}
  \subsection{Positive Semidefinite and Positive Definite Matrices}
  \subsection{Principal Minors and Inertia}
  \subsection{Hermitian and Normal Matrix Structure}
\section{Matrix Products, Vectorization, and Spectral Radius}
  \subsection{Kronecker Products and Vectorization}
  \subsection{Hadamard Products}
  \subsection{Spectral Radius and Matrix Powers}
\section{Matrix Decompositions}
  \subsection{LU, QR, and Cholesky-Type Decompositions}
  \subsection{Spectral and Singular Value Decompositions}
\section{Norms, Conditioning, Perturbation, and Stability}
  \subsection{Matrix Norms}
  \subsection{Conditioning}
  \subsection{Perturbation Bounds}
  \subsection{Stability}
\section{Numerical Linear Algebra}
  \subsection{Direct Methods}
  \subsection{Iterative Methods}
  \subsection{Numerical Spectral Methods}
```

Current sources:

- `sections/linear_algebra/matrix_analysis/4_1_matrix_classes_and_invariants.tex`
- `sections/linear_algebra/matrix_analysis/4_2_matrix_decompositions.tex`
- `sections/linear_algebra/matrix_analysis/4_3_matrix_norms_and_conditioning.tex`
- `sections/linear_algebra/matrix_analysis/4_4_perturbation_and_stability.tex`
- `sections/linear_algebra/matrix_analysis/4_5_numerical_linear_algebra.tex`

Suggested split for `4_1_matrix_classes_and_invariants.tex`:

- `\section{Trace, Determinant, Rank, and Matrix Invariants}`
  - `\subsection{Trace and Determinant}`
  - `\subsection{Minors, Cofactors, and Rank}`
  - `\subsection{Commutators and Special Matrix Classes}`
- `\section{Positive Definite and Structured Matrices}`
  - `\subsection{Positive Semidefinite and Positive Definite Matrices}`
  - `\subsection{Principal Minors and Inertia}`
  - `\subsection{Hermitian and Normal Matrix Structure}`
- `\section{Matrix Products, Vectorization, and Spectral Radius}`
  - `\subsection{Kronecker Products and Vectorization}`
  - `\subsection{Hadamard Products}`
  - `\subsection{Spectral Radius and Matrix Powers}`

### 5. Groups, Rings, and Fields

Target:

```tex
\part{Groups, Rings, and Fields}
\section{Algebraic Language and Categories}
  \subsection{Sets, Maps, Relations, and Universal Properties}
  \subsection{Categories and Functors}
  \subsection{Algebraic Structures as Objects}
  \subsection{Exactness and Diagrams}
\section{Group Theory}
  \subsection{Groups, Subgroups, and Homomorphisms}
  \subsection{Group Actions}
  \subsection{Normality and Structure Theorems}
  \subsection{Sylow Theory and Finite Groups}
  \subsection{Representation-Theoretic Preview}
\section{Rings, Ideals, and Polynomial Rings}
  \subsection{Rings and Ideals}
  \subsection{Polynomial Rings and Factorization}
\section{Fields and Galois Theory}
  \subsection{Field Extensions}
  \subsection{Splitting Fields and Normality}
  \subsection{Galois Groups}
  \subsection{Classical Applications}
  \subsection{Scalar Extension in Linear Algebra}
```

Current sources:

- `sections/algebraic_structures/algebraic_language_and_categories/*`
- `sections/algebraic_structures/group_theory/*`
- `sections/algebraic_structures/rings_ideals_and_modules/3_1_rings_and_ideals.tex`
- `sections/algebraic_structures/rings_ideals_and_modules/3_2_polynomial_rings_and_factorization.tex`
- `sections/algebraic_structures/fields_and_galois_theory/*`

Notes:

- `sections/algebraic_structures/rings_ideals_and_modules/overview.tex` should be split. Rings stay here; modules move to the next part.
- `4_5_scalar_extension_in_linear_algebra.tex` may stay in fields if it is primarily about scalar extension, but linear algebra should only cross-reference it.

### 6. Modules, Multilinear Algebra, and Homological Methods

Target:

```tex
\part{Modules, Multilinear Algebra, and Homological Methods}
\section{Module Theory}
  \subsection{Modules and Submodules}
  \subsection{Generated, Cyclic, and Finitely Generated Modules}
  \subsection{Torsion and Quotients}
\section{Noetherian Modules and PID Structure Theorems}
  \subsection{Free Modules and Rank}
  \subsection{Noetherian Modules}
  \subsection{Smith Normal Form}
  \subsection{Finitely Generated PID Modules}
  \subsection{Elementary Divisors and Invariant Factors}
\section{Linear Operators as Modules}
  \subsection{Polynomial Modules from Operators}
  \subsection{Invariant Factors}
  \subsection{Elementary Divisors}
  \subsection{Operator Classification}
\section{Associative Algebras}
  \subsection{Associative Algebra Structures}
  \subsection{Modules over Algebras}
\section{Tensor Products}
  \subsection{Tensor Products and Universal Properties}
  \subsection{Tensor Product Bases and Maps}
\section{Symmetric and Exterior Algebras}
  \subsection{Symmetric Algebras}
  \subsection{Exterior Algebras}
  \subsection{Multilinear Algebra Revisited}
\section{Chain Complexes and Homology}
  \subsection{Chain Complexes}
  \subsection{Homology}
  \subsection{Derived Functors Preview}
```

Current sources:

- `sections/algebraic_structures/rings_ideals_and_modules/3_3_modules.tex`
- `sections/algebraic_structures/rings_ideals_and_modules/3_4_structure_theorems.tex`
- `sections/algebraic_structures/rings_ideals_and_modules/3_5_linear_operators_as_modules.tex`
- `sections/algebraic_structures/rings_ideals_and_modules/3_6_associative_algebras.tex`
- `sections/algebraic_structures/tensor_exterior_and_homological_algebra/5_1_tensor_products_and_universal_properties.tex`
- `sections/algebraic_structures/tensor_exterior_and_homological_algebra/5_2_symmetric_and_exterior_algebras.tex`
- `sections/algebraic_structures/tensor_exterior_and_homological_algebra/5_3_multilinear_algebra_revisited.tex`
- `sections/algebraic_structures/tensor_exterior_and_homological_algebra/5_4_chain_complexes_and_homology.tex`
- `sections/algebraic_structures/tensor_exterior_and_homological_algebra/5_5_derived_functors_preview.tex`

Suggested split for `3_4_structure_theorems.tex`:

- `\section{Noetherian Modules and PID Structure Theorems}`
  - `\subsection{Free Modules and Rank}`
  - `\subsection{Noetherian Modules}`
  - `\subsection{Smith Normal Form}`
  - `\subsection{Finitely Generated PID Modules}`
  - `\subsection{Elementary Divisors and Invariant Factors}`

### 7. Commutative Algebra

Target:

```tex
\part{Commutative Algebra}
\section{Prime Ideals and Spectra}
  \subsection{Prime Ideals}
  \subsection{Spectra}
\section{Localization and Local Rings}
  \subsection{Localization}
  \subsection{Local Rings}
\section{Noetherian Rings and Modules}
  \subsection{Noetherian Rings}
  \subsection{Noetherian Modules}
\section{Integral Dependence and Dimension}
  \subsection{Integral Dependence}
  \subsection{Dimension Theory}
\section{Regularity and Singularities}
  \subsection{Regularity}
  \subsection{Singularities Preview}
```

Current sources:

- `sections/algebraic_geometry_commutative_algebra/commutative_algebra/1_1_prime_ideals_and_spectra.tex`
- `sections/algebraic_geometry_commutative_algebra/commutative_algebra/1_2_localization_and_local_rings.tex`
- `sections/algebraic_geometry_commutative_algebra/commutative_algebra/1_3_noetherian_rings_and_modules.tex`
- `sections/algebraic_geometry_commutative_algebra/commutative_algebra/1_4_integral_dependence_and_dimension.tex`
- `sections/algebraic_geometry_commutative_algebra/commutative_algebra/1_5_regularity_and_singularities_preview.tex`

Notes:

- This part owns local algebra used later by algebraic geometry.
- Avoid redeveloping general module theory here; cross-reference the module part.

### 8. Algebraic Geometry

Target:

```tex
\part{Algebraic Geometry}
\section{Affine Algebraic Sets}
  \subsection{Affine Algebraic Sets}
  \subsection{Ideals and Coordinate Rings}
\section{Morphisms and Coordinate Rings}
  \subsection{Regular Maps}
  \subsection{Coordinate Ring Functoriality}
\section{Projective Geometry}
  \subsection{Projective Space}
  \subsection{Projective Varieties}
\section{Schemes}
  \subsection{Affine Schemes}
  \subsection{Gluing and Scheme Morphisms}
\section{Sheaves and Cohomology}
  \subsection{Sheaves}
  \subsection{Cohomology Preview}
\section{Smoothness, Tangent Spaces, and Dimension}
  \subsection{Smoothness}
  \subsection{Tangent Spaces}
  \subsection{Dimension}
\section{Divisors, Line Bundles, and Curves}
  \subsection{Divisors}
  \subsection{Line Bundles}
  \subsection{Curves}
```

Current sources:

- `sections/algebraic_geometry_commutative_algebra/algebraic_geometry/2_1_affine_algebraic_sets.tex`
- `sections/algebraic_geometry_commutative_algebra/algebraic_geometry/2_2_morphisms_and_coordinate_rings.tex`
- `sections/algebraic_geometry_commutative_algebra/algebraic_geometry/2_3_projective_geometry.tex`
- `sections/algebraic_geometry_commutative_algebra/algebraic_geometry/2_4_schemes.tex`
- `sections/algebraic_geometry_commutative_algebra/algebraic_geometry/2_5_sheaves_and_cohomology_preview.tex`
- `sections/algebraic_geometry_commutative_algebra/algebraic_geometry/2_6_smoothness_tangent_spaces_and_dimension.tex`
- `sections/algebraic_geometry_commutative_algebra/algebraic_geometry/2_7_divisors_line_bundles_and_curves.tex`

Notes:

- `2_2_morphisms_and_coordinate_rings.tex` and `2_3_projective_geometry.tex` may remain separate files but can appear under one section if either remains short.

### 9. Real and Topological Analysis

Target:

```tex
\part{Real and Topological Analysis}
\section{Number Systems and Completeness}
  \subsection{Ordered Fields and Completeness}
  \subsection{Suprema and Infima}
  \subsection{Basic Real-Number Structure}
\section{Real Sequences and Completeness Methods}
  \subsection{Sequences and Limits}
  \subsection{Cauchy Sequences}
  \subsection{Completeness Methods}
\section{Metric Spaces and Euclidean Topology}
  \subsection{Metric Spaces}
  \subsection{Open and Closed Sets}
  \subsection{Euclidean Topology}
\section{Compactness and Completeness}
  \subsection{Compactness}
  \subsection{Completeness}
  \subsection{Total Boundedness}
\section{Connectedness and Continuity}
  \subsection{Connectedness}
  \subsection{Continuity}
  \subsection{Uniform Continuity}
\section{General Topology for Analysis}
  \subsection{Topological Spaces and Bases}
  \subsection{Product Spaces}
  \subsection{Separation and Countability Conditions}
```

Current sources:

- `sections/analysis/foundations_of_analysis/1_1_number_systems_and_completeness.tex`
- `sections/analysis/foundations_of_analysis/1_3_real_sequences_and_completeness_methods.tex`
- `sections/analysis/metric_and_topological_structure/2_1_metric_spaces_and_euclidean_topology.tex`
- `sections/analysis/metric_and_topological_structure/2_2_compactness_and_completeness.tex`
- `sections/analysis/metric_and_topological_structure/2_3_connectedness_and_continuity.tex`
- `sections/analysis/metric_and_topological_structure/2_4_selected_general_topology.tex`

Notes:

- `sections/analysis/foundations_of_analysis/1_2_cardinality_and_infinite_sets.tex` should not remain here as full theory. Merge or cross-reference from Mathematical Foundations.
- Empty directories `sections/analysis/topological_analysis`, `sections/analysis/geometric_and_measure_analysis`, and `sections/analysis/differential_and_integral_calculus` can be removed after confirming no tooling depends on them.

### 10. Calculus, Series, and Approximation

Target:

```tex
\part{Calculus, Series, and Approximation}
\section{One-Variable Differentiation and Riemann Integration}
  \subsection{Differentiation and Basic Theorems}
  \subsection{Riemann Integration}
  \subsection{Fundamental Theorems of Calculus}
\section{Riemann-Stieltjes and Improper Integration}
  \subsection{Riemann-Stieltjes Integrability}
  \subsection{Step Integrators and Change of Variable}
  \subsection{Improper Integrals}
  \subsection{Vector-Valued Integrals and Curves}
\section{Several-Variable Differentiation}
  \subsection{Partial and Total Derivatives}
  \subsection{Differentiability and Linear Approximation}
\section{Inverse, Implicit, and Rank Theorems}
  \subsection{Inverse Function Theorem}
  \subsection{Implicit Function Theorem}
  \subsection{Rank Theorem}
\section{Differential Forms and Stokes Theory}
  \subsection{Differential Forms and Manifolds}
  \subsection{Stokes Theory}
\section{Infinite Series and Summability}
  \subsection{Series Tests}
  \subsection{Summability Methods}
\section{Uniform Convergence}
  \subsection{Uniform Limits}
  \subsection{Interchange of Limits}
\section{Function-Space Compactness}
  \subsection{Equicontinuity}
  \subsection{Arzela-Ascoli-Type Compactness}
\section{Power Series and Approximation}
  \subsection{Power Series}
  \subsection{Approximation Methods}
\section{Fourier Structure}
  \subsection{Fourier Orthogonality}
  \subsection{Fourier Approximation}
```

Current sources:

- `sections/analysis/differential_and_geometric_analysis/4_1_one_variable_differentiation_and_integration.tex`
- `sections/analysis/differential_and_geometric_analysis/4_2_several_variable_differentiation.tex`
- `sections/analysis/differential_and_geometric_analysis/4_3_inverse_implicit_and_rank_theorems.tex`
- `sections/analysis/differential_and_geometric_analysis/4_4_differential_forms_and_manifolds.tex`
- `sections/analysis/differential_and_geometric_analysis/4_5_stokes_theory.tex`
- `sections/analysis/convergence_and_function_spaces/3_1_infinite_series_and_summability.tex`
- `sections/analysis/convergence_and_function_spaces/3_2_uniform_convergence.tex`
- `sections/analysis/convergence_and_function_spaces/3_3_function_space_compactness.tex`
- `sections/analysis/convergence_and_function_spaces/3_4_power_series_and_approximation.tex`
- `sections/analysis/convergence_and_function_spaces/3_5_fourier_structure.tex`

Suggested split for `4_1_one_variable_differentiation_and_integration.tex`:

- `\section{One-Variable Differentiation and Riemann Integration}`
  - `\subsection{Differentiation and Basic Theorems}`
  - `\subsection{Riemann Integration}`
  - `\subsection{Fundamental Theorems of Calculus}`
- `\section{Riemann-Stieltjes and Improper Integration}`
  - `\subsection{Riemann-Stieltjes Integrability}`
  - `\subsection{Step Integrators and Change of Variable}`
  - `\subsection{Improper Integrals}`
  - `\subsection{Vector-Valued Integrals and Curves}`

### 11. Measure, Integration, and Functional Analysis

Target:

```tex
\part{Measure, Integration, and Functional Analysis}
\section{Sigma-Algebras, Measures, and Extension}
  \subsection{Sigma-Algebras and Measurable Spaces}
  \subsection{Measures, Charges, and Basic Examples}
  \subsection{Outer Measures and Caratheodory Extension}
  \subsection{Borel, Lebesgue, and Stieltjes Measures}
  \subsection{Continuity and Regularity of Measures}
\section{Measurable Functions and Lebesgue Integration}
  \subsection{Measurable Functions}
  \subsection{Lebesgue Integration}
  \subsection{Convergence Theorems}
\section{Product Measures and Fubini Theory}
  \subsection{Product Measures}
  \subsection{Fubini and Tonelli Theorems}
\section{Radon-Nikodym and Differentiation}
  \subsection{Signed and Absolutely Continuous Measures}
  \subsection{Radon-Nikodym Theorem}
  \subsection{Differentiation of Measures}
\section{Lp Spaces and Modes of Convergence}
  \subsection{Lp Spaces}
  \subsection{Modes of Convergence}
\section{Banach and Hilbert Spaces}
  \subsection{Normed and Banach Spaces}
  \subsection{Hilbert Spaces}
  \subsection{Core Functional Analytic Theorems}
\section{Weak Topologies, Compact Operators, and Spectral Theory}
  \subsection{Weak Topologies and Duality}
  \subsection{Compact Operators}
  \subsection{Spectral Theory of Operators}
  \subsection{Distributions and Sobolev Preview}
```

Current sources:

- `sections/analysis/measure_and_integration_structure/5_1_sigma_algebras_and_measures.tex`
- `sections/analysis/measure_and_integration_structure/5_1a_regular_approximation_additivity_nonmeasurable_sets.tex`
- `sections/analysis/measure_and_integration_structure/5_2_measurable_functions.tex`
- `sections/analysis/measure_and_integration_structure/5_3_lebesgue_integration.tex`
- `sections/analysis/measure_and_integration_structure/5_4_convergence_theorems.tex`
- `sections/analysis/measure_and_integration_structure/5_5_product_measures_and_fubini_theory.tex`
- `sections/analysis/measure_and_integration_structure/5_6_radon_nikodym_and_differentiation.tex`
- `sections/analysis/measure_and_integration_structure/5_7_lp_spaces.tex`
- `sections/analysis/measure_and_integration_structure/5_8_modes_of_convergence.tex`
- `sections/analysis/functional_and_operator_analysis/6_1_normed_and_banach_spaces.tex`
- `sections/analysis/functional_and_operator_analysis/6_2_hilbert_spaces.tex`
- `sections/analysis/functional_and_operator_analysis/6_3_core_functional_analytic_theorems.tex`
- `sections/analysis/functional_and_operator_analysis/6_4_weak_topologies_and_duality.tex`
- `sections/analysis/functional_and_operator_analysis/6_5_compact_operators.tex`
- `sections/analysis/functional_and_operator_analysis/6_6_spectral_theory_of_operators.tex`
- `sections/analysis/functional_and_operator_analysis/6_7_distributions_and_sobolev_preview.tex`

Suggested split for `5_1_sigma_algebras_and_measures.tex`:

- `\section{Sigma-Algebras, Measures, and Extension}`
  - `\subsection{Sigma-Algebras and Measurable Spaces}`
  - `\subsection{Measures, Charges, and Basic Examples}`
  - `\subsection{Outer Measures and Caratheodory Extension}`
  - `\subsection{Borel, Lebesgue, and Stieltjes Measures}`
  - `\subsection{Continuity and Regularity of Measures}`

Notes:

- Functional analysis stays here because it grows naturally from measure, `Lp`, Banach, and Hilbert space material.
- PDE-related Sobolev applications should cross-reference `6_7_distributions_and_sobolev_preview.tex` rather than redevelop functional analysis.

### 12. Probability and Stochastic Systems

Target:

```tex
\part{Probability and Stochastic Systems}
\section{Probability Spaces, Random Variables, and Expectation}
  \subsection{Probability Spaces and Random Variables}
  \subsection{Expectation and Integration in Probability}
\section{Conditional Probability and Conditional Expectation}
  \subsection{Conditional Probability}
  \subsection{Conditional Expectation}
\section{Probabilistic Convergence}
  \subsection{Modes of Probabilistic Convergence}
  \subsection{Probability on Metric Spaces}
\section{Limit Theorems}
  \subsection{Laws of Large Numbers}
  \subsection{Central Limit Theory}
\section{Stochastic Processes}
  \subsection{Process-Level Probability}
  \subsection{Filtrations and Adapted Processes}
  \subsection{Martingales in Discrete and Continuous Time}
  \subsection{Markov Chains and Markov Processes}
  \subsection{Stationary Processes and Ergodicity}
  \subsection{Gaussian Processes}
  \subsection{Point Processes and Renewal Structure}
\section{Stochastic Calculus and SDEs}
  \subsection{Brownian Motion}
  \subsection{Stochastic Integration}
  \subsection{Ito Calculus}
  \subsection{Stochastic Differential Equations}
  \subsection{Change of Measure and Girsanov Theory}
  \subsection{Diffusions and PDE Connections}
  \subsection{Stochastic Flows and Advanced Dynamics}
```

Current sources:

- `sections/probability_stochastic_structure/probability_spaces_and_convergence/1_1_probability_spaces_and_random_variables.tex`
- `sections/probability_stochastic_structure/probability_spaces_and_convergence/1_2_expectation_and_integration_in_probability.tex`
- `sections/probability_stochastic_structure/probability_spaces_and_convergence/1_3_conditional_probability_and_conditional_expectation.tex`
- `sections/probability_stochastic_structure/probability_spaces_and_convergence/1_4_modes_of_probabilistic_convergence.tex`
- `sections/probability_stochastic_structure/probability_spaces_and_convergence/1_5_laws_of_large_numbers.tex`
- `sections/probability_stochastic_structure/probability_spaces_and_convergence/1_6_central_limit_theory.tex`
- `sections/probability_stochastic_structure/probability_spaces_and_convergence/1_7_probability_on_metric_spaces.tex`
- `sections/probability_stochastic_structure/stochastic_processes/*`
- `sections/probability_stochastic_structure/stochastic_calculus_and_dynamics/*`

Notes:

- Probability should specialize measure theory, not repeat it.
- Stochastic processes and stochastic calculus can remain within one part for now because stochastic calculus files are currently short.

### 13. Dynamical, PDE, and Numerical Systems

Target:

```tex
\part{Dynamical, PDE, and Numerical Systems}
\section{Dynamical Systems and ODEs}
  \subsection{ODE Foundations and Flows}
  \subsection{Linear Systems and Stability}
  \subsection{Nonlinear Stability Theory}
  \subsection{Bifurcation Theory}
  \subsection{Dynamical Systems Structure}
  \subsection{Semigroups and Evolution Viewpoint}
\section{Partial Differential Equations}
  \subsection{First-Order PDE and Characteristics}
  \subsection{Elliptic Equations}
  \subsection{Parabolic Equations}
  \subsection{Hyperbolic Equations}
\section{Weak Solutions and Evolution Equations}
  \subsection{Sobolev Spaces for PDE}
  \subsection{Weak Solutions and Variational Methods}
  \subsection{Evolution Equations}
\section{Numerical Analysis}
  \subsection{Floating Point and Error Analysis}
  \subsection{Nonlinear Equations and Optimization Basics}
  \subsection{Interpolation and Approximation}
  \subsection{Numerical Differentiation and Quadrature}
  \subsection{Numerical Stability and Convergence}
\section{Numerical Differential Systems}
  \subsection{Numerical ODEs}
  \subsection{Geometric Numerical Integration}
  \subsection{Finite Difference PDE Methods}
  \subsection{Finite Element Methods}
  \subsection{Numerical SDEs}
  \subsection{Computational Stability Across ODE/PDE/SDE}
\section{Monte Carlo and Stochastic Computation}
  \subsection{Monte Carlo Foundations}
  \subsection{Variance Reduction}
  \subsection{Markov Chain Monte Carlo}
  \subsection{Sequential Monte Carlo}
  \subsection{Rare-Event Simulation}
  \subsection{Stochastic Optimization}
```

Current sources:

- `sections/dynamical_pde_systems/dynamical_systems_and_odes/*`
- `sections/dynamical_pde_systems/pde_and_evolution_equations/*`
- `sections/numerical_computational_mathematics/numerical_analysis/*`
- `sections/numerical_computational_mathematics/numerical_differential_systems/*`
- `sections/numerical_computational_mathematics/monte_carlo_and_stochastic_computation/*`

Notes:

- This is intentionally a broad systems/computation part.
- If PDE or numerical material grows substantially, split later into `Dynamical and PDE Systems` and `Numerical and Stochastic Computation`.

### 14. Statistics and Time Series

Target:

```tex
\part{Statistics and Time Series}
\section{Statistical Models and Estimation}
  \subsection{Models, Estimators, and Confidence}
  \subsection{Empirical Distributions and Functionals}
  \subsection{Bootstrap and Resampling}
\section{Inference, Testing, and Decision Theory}
  \subsection{Parametric Inference}
  \subsection{Hypothesis Testing and p-values}
  \subsection{Statistical Decision Theory}
\section{Bayesian Inference}
\section{Nonparametric Statistics}
  \subsection{Histograms}
  \subsection{Kernel Density Estimation}
  \subsection{Nonparametric Regression}
  \subsection{Orthogonal Series Density Estimation}
  \subsection{Orthogonal Series Regression}
  \subsection{Wavelet Smoothing}
\section{Time Series Models}
  \subsection{Time Series Foundations}
  \subsection{Stationary Time Series}
  \subsection{ARMA and ARIMA Structure}
  \subsection{Spectral Methods}
  \subsection{Nonlinear and Volatility Models}
  \subsection{Long Memory and Multiscale Structure}
\section{Sequential Inference and Filtering}
  \subsection{State-Space Models}
  \subsection{Sequential Inference and Filtering}
```

Current sources:

- `sections/statistical_learning_systems/statistical_learning/1_1_statistical_inference_foundations.tex`
- `sections/statistical_learning_systems/statistical_learning/1_11_nonparametric_curve_estimation.tex`
- `sections/statistical_learning_systems/statistical_learning/1_12_orthogonal_series_and_wavelet_smoothing.tex`
- `sections/statistical_learning_systems/time_series_and_sequential_systems/*`

Suggested split for `1_1_statistical_inference_foundations.tex`:

- `\section{Statistical Models and Estimation}`
  - `\subsection{Models, Estimators, and Confidence}`
  - `\subsection{Empirical Distributions and Functionals}`
  - `\subsection{Bootstrap and Resampling}`
- `\section{Inference, Testing, and Decision Theory}`
  - `\subsection{Parametric Inference}`
  - `\subsection{Hypothesis Testing and p-values}`
  - `\subsection{Statistical Decision Theory}`
- `\section{Bayesian Inference}`

Suggested split for nonparametric files:

- `\section{Nonparametric Statistics}`
  - `\subsection{Histograms}`
  - `\subsection{Kernel Density Estimation}`
  - `\subsection{Nonparametric Regression}`
  - `\subsection{Orthogonal Series Density Estimation}`
  - `\subsection{Orthogonal Series Regression}`
  - `\subsection{Wavelet Smoothing}`

Time series mapping:

- `3_1_time_series_foundations.tex` -> `\section{Time Series Models}`
- `3_2_arma_and_arima_structure.tex` -> `\section{Time Series Models}`
- `3_3_spectral_methods.tex` -> `\section{Time Series Models}` or a subsection inside it if expanded
- `3_4_state_space_models.tex` -> `\section{Sequential Inference and Filtering}`
- `3_5_nonlinear_and_volatility_models.tex` -> `\section{Time Series Models}`
- `3_6_long_memory_and_multiscale_structure.tex` -> `\section{Time Series Models}`
- `3_7_sequential_inference_and_filtering.tex` -> `\section{Sequential Inference and Filtering}`

Notes:

- The legacy `sections/time_series_analysis/*` tree duplicates active time-series material. Extract any unique content into this part, then retire the legacy tree after review.

### 15. Statistical Learning and Deep Learning

Target:

```tex
\part{Statistical Learning and Deep Learning}
\section{Statistical Learning Theory}
  \subsection{Risk Minimization}
  \subsection{Generalization Theory}
\section{Classical Learning Models}
  \subsection{Linear and Generalized Linear Models}
  \subsection{Linear Regression}
  \subsection{Regularization and Model Selection}
  \subsection{Regression Model Selection}
  \subsection{Kernels and Nonlinear Methods}
  \subsection{Trees, Ensembles, and Boosting}
\section{Graphical and Causal Models}
  \subsection{Association and Independence Inference}
  \subsection{Undirected Graphs and Log-Linear Models}
  \subsection{Counterfactual Causal Inference}
  \subsection{Directed Graphs and Interventions}
\section{Neural Network Foundations}
  \subsection{Deep Feedforward Networks}
  \subsection{Cost Functions and Output Units}
  \subsection{Hidden Units and Architecture Design}
  \subsection{Universal Approximation and Backpropagation}
\section{Training, Regularization, and Representation Learning}
  \subsection{Optimization for Deep Learning}
  \subsection{Regularization and Generalization}
  \subsection{Representation Learning}
\section{Modern Deep Models}
  \subsection{Sequence Models}
  \subsection{Generative Models}
  \subsection{Convolutional Neural Networks}
  \subsection{Modern Architecture and Systems View}
```

Current sources:

- `sections/statistical_learning_systems/statistical_learning/1_2_risk_minimization.tex`
- `sections/statistical_learning_systems/statistical_learning/1_3_linear_and_generalized_linear_models.tex`
- `sections/statistical_learning_systems/statistical_learning/1_3a_linear_regression_source_integration.tex`
- `sections/statistical_learning_systems/statistical_learning/1_4_regularization_and_model_selection.tex`
- `sections/statistical_learning_systems/statistical_learning/1_4a_regression_model_selection_source_integration.tex`
- `sections/statistical_learning_systems/statistical_learning/1_5_kernels_and_nonlinear_methods.tex`
- `sections/statistical_learning_systems/statistical_learning/1_6_trees_ensembles_and_boosting.tex`
- `sections/statistical_learning_systems/statistical_learning/1_7_generalization_theory.tex`
- `sections/statistical_learning_systems/statistical_learning/1_8_association_and_independence_inference.tex`
- `sections/statistical_learning_systems/statistical_learning/1_8a_undirected_graphs_and_loglinear_models.tex`
- `sections/statistical_learning_systems/statistical_learning/1_9_counterfactual_causal_inference.tex`
- `sections/statistical_learning_systems/statistical_learning/1_10_directed_graphs_and_interventions.tex`
- `sections/statistical_learning_systems/deep_learning_and_representation_systems/*`

Suggested mapping:

- `\section{Statistical Learning Theory}`
  - `1_2_risk_minimization.tex`
  - `1_7_generalization_theory.tex`
- `\section{Classical Learning Models}`
  - `1_3_linear_and_generalized_linear_models.tex`
  - `1_3a_linear_regression_source_integration.tex`
  - `1_4_regularization_and_model_selection.tex`
  - `1_4a_regression_model_selection_source_integration.tex`
  - `1_5_kernels_and_nonlinear_methods.tex`
  - `1_6_trees_ensembles_and_boosting.tex`
- `\section{Graphical and Causal Models}`
  - `1_8_association_and_independence_inference.tex`
  - `1_8a_undirected_graphs_and_loglinear_models.tex`
  - `1_9_counterfactual_causal_inference.tex`
  - `1_10_directed_graphs_and_interventions.tex`
- `\section{Neural Network Foundations}`
  - `2_1_neural_network_foundations.tex`
- `\section{Training, Regularization, and Representation Learning}`
  - `2_2_optimization_for_deep_learning.tex`
  - `2_3_regularization_and_generalization.tex`
  - `2_4_representation_learning.tex`
- `\section{Modern Deep Models}`
  - `2_5_sequence_models.tex`
  - `2_6_generative_models.tex`
  - `2_7_modern_architecture_and_systems_view.tex`

Notes:

- The legacy `sections/machine_learning/*` tree is not included by `math.tex`. Compare it against the active statistical/deep-learning material and extract unique items into this part before retiring it.

## Files That Need Content Extraction

These files are too large or too internally heterogeneous for long-term maintenance. During the
migration, copy their relevant source spans into the target numbered subsection files under
`parts/`. Preserve mathematical wording, labels, proofs, and displays while extracting. After the
target subsection files compile, delete the overlapping copied spans from the old `sections/...`
source files so there is no duplicate active content.

| Source | Current Role | Migration Action |
| --- | --- | --- |
| `sections/linear_algebra/matrix_analysis/4_1_matrix_classes_and_invariants.tex` | Many unrelated matrix topics | Extract into matrix invariants, positive/structured matrices, and matrix products/spectral radius subsection files |
| `sections/linear_algebra/structural_linear_algebra/1_3_linear_maps_and_representations.tex` | Linear maps plus matrices plus basis change | Extract by linear maps, rank, representations, basis change, equivalence/similarity |
| `sections/analysis/measure_and_integration_structure/5_1_sigma_algebras_and_measures.tex` | Measure construction plus examples plus Stieltjes measures | Extract by sigma-algebras, measures, extension, Borel/Lebesgue/Stieltjes |
| `sections/linear_algebra/geometric_linear_algebra/2_5_metric_vector_spaces_and_bilinear_forms.tex` | Forms, Witt theory, symplectic and classical groups | Extract into bilinear/quadratic forms, decompositions, symplectic, classical groups |
| `sections/analysis/differential_and_geometric_analysis/4_1_one_variable_differentiation_and_integration.tex` | Differentiation, Riemann, Stieltjes, improper, curves | Extract into calculus and Stieltjes/integration subsection files |
| `sections/linear_algebra/spectral_linear_algebra/3_2_polynomial_structure_of_operators.tex` | Characteristic/minimal polynomials plus primary decomposition | Extract by polynomial evaluation, characteristic/minimal polynomials, generalized eigenspaces |
| `sections/statistical_learning_systems/statistical_learning/1_1_statistical_inference_foundations.tex` | Statistics survey file | Extract into estimation, inference/testing/decision, Bayesian inference |
| `sections/statistical_learning_systems/statistical_learning/1_11_nonparametric_curve_estimation.tex` | Several nonparametric topics | Extract existing subsubsection content into subsection files |
| `sections/statistical_learning_systems/statistical_learning/1_12_orthogonal_series_and_wavelet_smoothing.tex` | Orthogonal and wavelet methods | Extract existing subsubsection content into subsection files |

## Subsection Requirement Review

The target structure should use subsection-level files more than the current tree does.
Many current files are written as single large `\subsection` files; during migration, their
content should be copied into numbered target subsection files when natural topic boundaries are
available.

Use this extraction rule:

- Required: create subsection files when a section is backed by a file over roughly 250 lines, contains existing `\subsubsection`s, or combines multiple current source files.
- Recommended: create subsection files when a section title joins several concepts, such as "Norms, Conditioning, Perturbation, and Stability".
- Optional: add subsections for 150-250 line sections if there are clear conceptual blocks.
- Avoid: do not add a single subsection under a section. Either keep the section un-subsectioned or split it into multiple sections.

Also avoid collapsing several existing well-ordered current sections into one broad target section.
If the current tree already has a clean sequence of sections with natural subsection files, preserve
that order unless there is a strong reason to merge.

Current-style ordering should be preserved or restored in these areas:

| Target part | Broad target section to avoid | Prefer this section ordering |
| --- | --- | --- |
| Mathematical Foundations | Sets, Logic, and Proofs | Keep `Sets`; `Logic and Proofs` as separate sections |
| Mathematical Foundations | Functions, Relations, Orders, and Counting | Keep `Counting and Finite Sums`; `Relations, Orders, and Lattices`; `Functions` as separate sections |
| Mathematical Foundations | Cardinality, Choice, and Axiomatic Set Theory | Keep `Cardinality, Choice, and Infinite Sets`; `Axiomatic and Advanced Set Theory` as separate sections |
| Groups, Rings, and Fields | Algebraic Language and Categories | Keep universal properties, categories/functors, algebraic structures as objects, and exactness as subsections |
| Groups, Rings, and Fields | Group Theory | Keep groups/subgroups, actions, normality, Sylow theory, and representation preview as subsections |
| Groups, Rings, and Fields | Fields and Galois Theory | Keep field extensions, splitting fields, Galois groups, applications, and scalar extension as subsections |
| Algebraic Geometry | Morphisms and Projective Geometry | Prefer separate `Morphisms and Coordinate Rings` and `Projective Geometry` sections if either grows |
| Real and Topological Analysis | Compactness, Completeness, and Connectedness | Prefer separate `Compactness and Completeness` and `Connectedness and Continuity` sections |
| Calculus, Series, and Approximation | Series, Uniform Convergence, and Power Series | Prefer current ordering: infinite series, uniform convergence, function-space compactness, power series |
| Measure, Integration, and Functional Analysis | Product Measures, Radon-Nikodym, and Differentiation | Prefer separate subsections, and split into separate sections if this grows |
| Probability and Stochastic Systems | Probability Spaces, Random Variables, and Expectation | Prefer probability spaces/random variables and expectation as separate subsections |
| Probability and Stochastic Systems | Probabilistic Convergence and Limit Theorems | Prefer modes of convergence, laws of large numbers, central limit theory, and probability on metric spaces as separate subsections or sections |
| Dynamical, PDE, and Numerical Systems | Partial Differential Equations | Prefer first-order, elliptic, parabolic, hyperbolic, Sobolev, weak solutions, and evolution equations as subsections while short, sections if expanded |

Likely sections that should be represented by subsection files during migration:

| Target part | Target section | Why subsection navigation is likely needed |
| --- | --- | --- |
| Structural Linear Algebra | Vector Spaces and Linear Structure | Current source is long enough to benefit from internal blocks |
| Structural Linear Algebra | Direct Sums, Quotients, and Decomposition | Current source is long enough to benefit from internal blocks |
| Structural Linear Algebra | Linear Maps and Matrix Representations | Current source is very large and heterogeneous |
| Structural Linear Algebra | Duality and Multilinear Structure | Current source is long enough to benefit from internal blocks |
| Geometric and Spectral Linear Algebra | Inner Product Geometry | Current source is very large |
| Geometric and Spectral Linear Algebra | Orthogonality, Projections, and Least Squares | Combines several geometric methods |
| Geometric and Spectral Linear Algebra | Bilinear and Quadratic Forms | Current source is very large and heterogeneous |
| Geometric and Spectral Linear Algebra | Eigenstructure and Invariant Subspaces | Current source is very large |
| Geometric and Spectral Linear Algebra | Polynomial Structure and Canonical Forms | Current source is very large and heterogeneous |
| Geometric and Spectral Linear Algebra | Spectral Theorems and Operator Functions | Combines several spectral/operator themes |
| Matrix Analysis and Numerical Linear Algebra | Trace, Determinant, Rank, and Matrix Invariants | Current source is very large and should be split internally |
| Matrix Analysis and Numerical Linear Algebra | Positive Definite and Structured Matrices | Several distinct matrix classes and criteria |
| Matrix Analysis and Numerical Linear Algebra | Matrix Products, Vectorization, and Spectral Radius | Several distinct constructions |
| Matrix Analysis and Numerical Linear Algebra | Matrix Decompositions | Current source is long enough to benefit from internal blocks |
| Matrix Analysis and Numerical Linear Algebra | Norms, Conditioning, Perturbation, and Stability | Combines several numerical-analysis concepts |
| Groups, Rings, and Fields | Rings, Ideals, and Polynomial Rings | Combines multiple algebraic structures |
| Groups, Rings, and Fields | Fields and Galois Theory | Current field-theory folder has several natural stages |
| Modules, Multilinear Algebra, and Homological Methods | Module Theory | Current module source is large |
| Modules, Multilinear Algebra, and Homological Methods | Noetherian Modules and PID Structure Theorems | Current source is large and already has many natural blocks |
| Modules, Multilinear Algebra, and Homological Methods | Linear Operators as Modules | Current source is large |
| Modules, Multilinear Algebra, and Homological Methods | Tensor Products | Current source is long enough to benefit from internal blocks |
| Modules, Multilinear Algebra, and Homological Methods | Symmetric and Exterior Algebras | Current source is long enough to benefit from internal blocks |
| Real and Topological Analysis | Number Systems and Completeness | Current source is long enough to benefit from internal blocks |
| Real and Topological Analysis | Metric Spaces and Euclidean Topology | Current source is large |
| Real and Topological Analysis | Compactness, Completeness, and Connectedness | Combines several major topological properties |
| Calculus, Series, and Approximation | One-Variable Differentiation and Riemann Integration | Current source is very large |
| Calculus, Series, and Approximation | Riemann-Stieltjes and Improper Integration | Current source is very large |
| Calculus, Series, and Approximation | Series, Uniform Convergence, and Power Series | Combines several convergence/approximation themes |
| Calculus, Series, and Approximation | Fourier Structure and Approximation | Likely to grow and has natural internal blocks |
| Measure, Integration, and Functional Analysis | Sigma-Algebras, Measures, and Extension | Current source is very large and heterogeneous |
| Measure, Integration, and Functional Analysis | Measurable Functions and Lebesgue Integration | Combines measurability, integration, and convergence |
| Measure, Integration, and Functional Analysis | Product Measures, Radon-Nikodym, and Differentiation | Combines several measure-theoretic tools |
| Measure, Integration, and Functional Analysis | Lp Spaces and Modes of Convergence | Combines two large themes |
| Measure, Integration, and Functional Analysis | Banach and Hilbert Spaces | Current Hilbert-space source is substantial |
| Probability and Stochastic Systems | Probability Spaces, Random Variables, and Expectation | Current probability foundation source is large |
| Probability and Stochastic Systems | Conditional Probability and Conditional Expectation | Current source is long enough to benefit from internal blocks |
| Probability and Stochastic Systems | Probabilistic Convergence and Limit Theorems | Combines convergence modes, LLN, and CLT |
| Probability and Stochastic Systems | Stochastic Processes | Combines several process classes |
| Probability and Stochastic Systems | Stochastic Calculus and SDEs | Will need subsections once currently short placeholder files are expanded |
| Statistics and Time Series | Statistical Models and Estimation | Existing statistics file has natural subsubsections |
| Statistics and Time Series | Inference, Testing, and Decision Theory | Existing statistics file has natural subsubsections |
| Statistics and Time Series | Nonparametric Statistics | Existing nonparametric files already have natural subsubsections |
| Statistics and Time Series | Time Series Models | Existing time-series files already have natural subsubsections/placeholders |
| Statistical Learning and Deep Learning | Statistical Learning Theory | Combines risk and generalization |
| Statistical Learning and Deep Learning | Classical Learning Models | Combines several model families |
| Statistical Learning and Deep Learning | Graphical and Causal Models | Combines graphical, causal, and intervention material |
| Statistical Learning and Deep Learning | Neural Network Foundations | Existing deep-learning file has natural subsubsection material |
| Statistical Learning and Deep Learning | Training, Regularization, and Representation Learning | Combines optimization, regularization, and representations |
| Statistical Learning and Deep Learning | Modern Deep Models | Combines sequence, generative, CNN/modern architecture material |

Sections that are currently short or placeholder-like can remain without subsection files until they grow.
Examples include much of the current dynamical/PDE/numerical tree, the short algebraic-geometry files,
and some foundational prerequisite files.

## Heading Migration Rules

Use these rules while extracting content into `parts/`:

0. Preserve mathematical content while copying. Do not rewrite proofs, theorem statements, definitions, labels, equations, or explanatory prose.

1. Existing broad repo-level section folders usually become target `parts/<part>/<section>/` folders.
2. Existing current `\subsection` files usually become target section folders with one `overview.tex` plus numbered subsection files.
3. Existing `\subsubsection` headings become target subsection files, not deeper headings.
4. If a current file has no explicit internal headings but is large, split it into numbered subsection files using natural theorem/definition blocks as boundaries.
5. Do not create a `\subsection` with only one siblingless child. Either keep the section body in `overview.tex` while short, or create two or more subsection files.
6. Keep theorem/definition labels stable.
7. After a target subsection file compiles, remove the overlapping copied span from the old `sections/...` source file.
8. Never leave the same mathematical body active in both `parts/...` and `sections/...`.

## Migration Phases

### Phase 0: Baseline Audit

- Compile the current document once and save the log.
- Record current heading depth:

```sh
rg -n '^\\(part|section|subsection|subsubsection|paragraph)\{' sections
```

- Record current `\input` graph:

```sh
rg -n '\\input\{' math.tex sections
```

### Phase 1: Create the `parts/` Skeleton

- Add the repo-level `parts/` directory.
- Add numbered named part folders.
- In each part folder, add `overview.tex` containing the `\part{...}` heading and inputs for section overviews.
- In each part folder, add numbered named section folders.
- In each section folder, add `overview.tex` containing the `\section{...}` heading and inputs for numbered subsection files.
- Create numbered subsection files only when content is copied into them.

Example:

```text
parts/14_statistics_time_series/
  overview.tex
  01_statistical_models_and_estimation/
    overview.tex
    01_models_estimators_and_confidence.tex
    02_empirical_distributions_and_functionals.tex
    03_bootstrap_and_resampling.tex
```

### Phase 2: Move Statistics and Learning First

This is the highest-value migration because it currently has the deepest headings.

- Copy each target subsection's content into the corresponding `parts/14_statistics_time_series/...` or `parts/15_statistical_learning_deep_learning/...` file.
- Convert current `\subsubsection{...}` boundaries into target subsection files.
- After each copied subsection compiles, delete the overlapping content span from the old `sections/statistical_learning_systems/...` file.
- Once all content in an old source file has been extracted, remove that old file from active old inputs or replace it with a short migration note.
- Review `sections/time_series_analysis/*` and `sections/machine_learning/*` for unique content before extracting or retiring them.

### Phase 3: Extract Linear Algebra Into `parts/`

- Create:
  - `parts/02_structural_linear_algebra/`
  - `parts/03_geometric_spectral_linear_algebra/`
  - `parts/04_matrix_analysis_numerical_linear_algebra/`
- Copy content into numbered subsection files.
- Delete overlapping copied spans from old `sections/linear_algebra/...` files after verification.
- Retire old linear algebra inputs only when all active content has a `parts/` owner.

### Phase 4: Extract Algebra and Algebraic Geometry Into `parts/`

- Create:
  - `parts/05_groups_rings_fields/`
  - `parts/06_modules_multilinear_homological/`
  - `parts/07_commutative_algebra/`
  - `parts/08_algebraic_geometry/`
- Copy content into numbered subsection files.
- Separate rings from modules at the destination file level.
- Delete overlapping copied spans from old algebra source files after verification.

### Phase 5: Extract Analysis Into `parts/`

- Create:
  - `parts/09_real_topological_analysis/`
  - `parts/10_calculus_series_approximation/`
  - `parts/11_measure_integration_functional_analysis/`
- Copy content into numbered subsection files.
- Move overlapping cardinality material from analysis into the Mathematical Foundations ownership model by extracting unique content or replacing with cross-references.
- Delete overlapping copied spans from old analysis source files after verification.

### Phase 6: Extract Probability, Dynamics, and Numerics Into `parts/`

- Create:
  - `parts/12_probability_stochastic_systems/`
  - `parts/13_dynamical_pde_numerical_systems/`
- Copy content into numbered subsection files.
- Delete overlapping copied spans from old probability, dynamics, PDE, and numerical source files after verification.

### Phase 7: Clean Up and Validate

- Remove stale old inputs only after new `parts/` owners compile.
- Delete empty or legacy old files/directories only after reviewing unique content and confirming no active inputs reference them.
- Rebuild the PDF.
- Search for remaining deep headings in the active tree:

```sh
rg -n '^\\subsubsection|^\\paragraph' math.tex parts sections
```

- Search for stale active old paths:

```sh
rg -n 'sections/(linear_algebra|analysis|algebraic_structures|algebraic_geometry_commutative_algebra|statistical_learning_systems|machine_learning|time_series_analysis)' math.tex parts sections
```

## Validation Checklist

Migration checklist:

- `math.tex` compiles.
- Every active mathematical content span appears in exactly one active location.
- New canonical content lives under `parts/`.
- Each part folder has an `overview.tex`.
- Each section folder has an `overview.tex`.
- Substantial sections are controlled through numbered subsection files.
- Copied mathematical content preserves labels, proofs, prose, equations, and theorem/definition statements unless a later explicit editing pass is requested.
- Old `sections/...` files no longer contain content that has already been copied into active `parts/...` files.
- Cross-references compile without unresolved labels.
- Figure paths still resolve.
- Lean mirror files under `MathNotes/sections` are updated only after the LaTeX structure stabilizes.

Later cleanup checklist:

- No active `\subsubsection` headings remain.
- No section has exactly one forced subsection.
- Legacy `sections/machine_learning` and `sections/time_series_analysis` content is either extracted into `parts/` or deliberately retired.

## Suggested First PR Scope

For the first migration PR, do only:

1. Add `parts/14_statistics_time_series/` and `parts/15_statistical_learning_deep_learning/`.
2. Add part `overview.tex` files and numbered section folders with section `overview.tex` files.
3. Extract `1_1_statistical_inference_foundations.tex` into numbered target subsection files, preserving content.
4. Extract nonparametric and orthogonal-series content into numbered target subsection files, preserving content.
5. Remove the extracted overlapping spans from the old `sections/statistical_learning_systems/...` source files.
6. Rewire only the old `Statistical and Learning Systems` include to the new `parts/` includes.
7. Compile and confirm the new structure builds.

This gives the biggest readability improvement while keeping the blast radius modest.
