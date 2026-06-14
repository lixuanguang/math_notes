# Structure Migration Plan

This README maps the current `sections/` tree to a cleaner `parts/` tree with explicit
part, section, and subsection granularity. It is a planning artifact only: no LaTeX source
files are moved by this document.

Important migration constraint: the migration is content-copying, not rewriting. Each target
part/section/subsection file should receive copied mathematical content with wording, labels,
proofs, and displays preserved. Each migration phase follows one numbered target part from the
Target Structure and Source Mapping below. After each copied content span is verified in its new
`parts/` location, immediately remove the overlapping body from the old repo-level
`sections/...` source file so there is only one active owner for that piece of mathematics.
If the old `sections/...` file is still needed by the current active include graph, replace the
removed body with a temporary forwarding `\input{parts/...}` or a short placeholder comment, not
with duplicated mathematical content.

## Goals

- Use fewer, expandable parts than a one-specialty-per-part outline.
- Avoid giant umbrella parts that become hard to maintain.
- Keep visible depth to `\part`, `\section`, and `\subsection`.
- Use `parts/` as the canonical new content tree.
- Keep part, section, and subsection content controlled by separate files.
- Preserve mathematical content while copying; do not rewrite mathematics during migration.
- Remove overlapping old content immediately after verifying each copied target span.
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
\input{parts/13_dynamical_pde_systems/overview}
\input{parts/14_numerical_stochastic_computation/overview}
\input{parts/15_statistics_time_series/overview}
\input{parts/16_statistical_learning_deep_learning/overview}
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
| Probability spaces and limit theorems | Probability and Stochastic Systems | Future inference chapters can specialize it |
| ODEs, dynamical systems, and PDE | Dynamical and PDE Systems | Reference analysis, functional analysis, and probability where needed |
| Numerical algorithms and stochastic computation | Numerical and Stochastic Computation | Apply linear algebra, analysis, probability, and dynamics without redeveloping them |
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

### 13. Dynamical and PDE Systems

Target:

```tex
\part{Dynamical and PDE Systems}
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
```

Current sources:

- `sections/dynamical_pde_systems/dynamical_systems_and_odes/*`
- `sections/dynamical_pde_systems/pde_and_evolution_equations/*`

Notes:

- Keep analytic existence, uniqueness, stability, weak-solution, and evolution-equation theory in this part.
- Numerical methods for ODEs, PDEs, and SDEs belong to Part 14, with cross-references back here for the equations being discretized.

### 14. Numerical and Stochastic Computation

Target:

```tex
\part{Numerical and Stochastic Computation}
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

- `sections/numerical_computational_mathematics/numerical_analysis/*`
- `sections/numerical_computational_mathematics/numerical_differential_systems/*`
- `sections/numerical_computational_mathematics/monte_carlo_and_stochastic_computation/*`

Notes:

- Keep numerical approximation, discretization, simulation, Monte Carlo, and computational stability here.
- Reference Part 13 for the continuous dynamical/PDE/SDE systems being approximated, and Part 12 for probabilistic foundations.

### 15. Statistics and Time Series (Deferred Rebuild)

Target:

```tex
\part{Statistics and Time Series}
\section{Statistical Models and Experiments}
  \subsection{Statistical Models, Experiments, and Identifiability}
  \subsection{Dominated Families, Likelihoods, and Scores}
  \subsection{Sufficiency, Ancillarity, and Exponential Families}
\section{Estimation Theory}
  \subsection{Estimators, Risk, Bias, Variance, and Consistency}
  \subsection{Minimum-Variance and Cramer-Rao Theory}
  \subsection{Maximum Likelihood and M-Estimation}
  \subsection{Asymptotic Normality and Delta Methods}
  \subsection{Robust and Semiparametric Estimation}
\section{Hypothesis Testing and Confidence}
  \subsection{Neyman-Pearson Theory}
  \subsection{Likelihood Ratio, Score, and Wald Tests}
  \subsection{Confidence Sets, Duality, and Coverage}
  \subsection{Multiple Testing and Error Rates}
\section{Decision Theory}
  \subsection{Loss, Risk, Bayes Risk, and Minimax Risk}
  \subsection{Admissibility, Complete Classes, and Invariance}
  \subsection{Shrinkage and Empirical Bayes Methods}
\section{Bayesian Inference}
  \subsection{Priors, Posteriors, and Predictive Distributions}
  \subsection{Conjugate Families and Hierarchical Models}
  \subsection{Bayesian Asymptotics and Bernstein-von Mises Theory}
  \subsection{Posterior Computation and Diagnostics}
\section{Nonparametric and High-Dimensional Statistics}
  \subsection{Empirical Processes and Concentration}
  \subsection{Density and Regression Function Estimation}
  \subsection{Smoothing, Regularization, and Model Complexity}
  \subsection{Sparse and High-Dimensional Estimation}
\section{Time Series Models}
  \subsection{Stationarity, Dependence, and Ergodicity}
  \subsection{ARMA, ARIMA, and Linear Prediction}
  \subsection{Spectral Analysis}
  \subsection{State-Space Models and Kalman Filtering}
  \subsection{Nonlinear, Volatility, and Long-Memory Models}
\section{Sequential Inference and Resampling}
  \subsection{Bootstrap, Jackknife, and Permutation Methods}
  \subsection{Sequential Testing and Online Estimation}
  \subsection{Particle Filters and Sequential Monte Carlo}
```

Current sources:

- No active current source tree. The previous statistics and time-series material has been retired.

Notes:

- Rebuild this part from specialized statistics and time-series sources before adding it back to the active document.
- Use the existing probability, measure, functional-analysis, and stochastic-process material by reference instead of redeveloping prerequisites.
- Keep inference, decision, and uncertainty quantification here; move prediction-system and representation-learning material to Part 16.

### 16. Statistical Learning and Deep Learning (Source-Vetted Migration and Rebuild)

Target:

```tex
\part{Statistical Learning and Deep Learning}
\section{Learning Problems and Risk}
  \subsection{Prediction, Loss Functions, and Risk}
  \subsection{Empirical Risk Minimization}
  \subsection{Surrogate Losses and Calibration}
  \subsection{Bias-Variance and Approximation-Estimation Tradeoffs}
\section{Generalization Theory}
  \subsection{Uniform Convergence and VC Theory}
  \subsection{Rademacher Complexity and Covering Numbers}
  \subsection{Concentration and Stability}
  \subsection{PAC-Bayes and Information-Theoretic Bounds}
\section{Classical Supervised Learning}
  \subsection{Linear Prediction and Generalized Linear Models}
  \subsection{Regularization and Model Selection}
  \subsection{Kernel Methods and RKHS Theory}
  \subsection{Support Vector Machines and Margin Methods}
  \subsection{Trees, Forests, and Boosting}
\section{Unsupervised and Latent-Variable Learning}
  \subsection{Clustering and Mixture Models}
  \subsection{Dimension Reduction and Manifold Learning}
  \subsection{Matrix Factorization and Topic Models}
  \subsection{Representation Learning Objectives}
\section{Probabilistic Graphical and Causal Learning}
  \subsection{Directed and Undirected Graphical Models}
  \subsection{Inference and Learning in Graphical Models}
  \subsection{Causal Graphs, Interventions, and Identifiability}
  \subsection{Counterfactuals and Policy Evaluation}
\section{Neural Network Foundations}
  \subsection{Network Architectures and Expressivity}
  \subsection{Backpropagation and Automatic Differentiation}
  \subsection{Optimization for Deep Learning}
  \subsection{Regularization, Normalization, and Generalization}
\section{Modern Deep Models}
  \subsection{Convolutional and Geometric Architectures}
  \subsection{Sequence Models and Attention}
  \subsection{Transformers and Large-Scale Training}
  \subsection{Generative Models}
  \subsection{Reinforcement Learning and Decision Systems}
\section{Learning Systems and Evaluation}
  \subsection{Data Splitting, Validation, and Benchmarking}
  \subsection{Robustness, Shift, and Distributional Uncertainty}
  \subsection{Interpretability, Fairness, and Safety}
  \subsection{Deployment, Monitoring, and Feedback Loops}
```

Current sources:

- `machine_learning/overallstruct.tex`
- `machine_learning/cml/overview.tex`
- `machine_learning/cml/ensemble.tex`
- `machine_learning/dl/overview.tex`
- `machine_learning/dl/dfn.tex`
- `machine_learning/dl/reg.tex`
- `machine_learning/dl/opt.tex`
- `machine_learning/dl/cnn.tex`
- `sections/machine_learning/...` currently mirrors the root `machine_learning/...` material and should be checked before migration; prefer the root `machine_learning/...` tree as the source of record unless the mirror contains newer edits.

Notes:

- Use the root `machine_learning/...` tree as migration input for existing classical-machine-learning and deep-learning material, but vet it against the new Part 16 target structure before copying.
- Treat the current root machine-learning material as draft source content: split it into the target subsections, preserve usable mathematical content, and replace or defer material that is too informal, underspecified, or structurally misplaced.
- Supplement or rebuild missing Part 16 topics from specialized statistical-learning, machine-learning, and deep-learning sources before adding them back to the active document.
- Avoid duplicating Part 15's inference foundations; introduce statistical tools here only when they are used for prediction, representation, or learning-system analysis.
- Keep optimization details that are broadly numerical in Part 14, and reference them here when training algorithms use those tools.

## Files That Need Content Extraction

These files are too large or too internally heterogeneous for long-term maintenance. During the
migration, copy their relevant source spans into the target numbered subsection files under
`parts/`. Preserve mathematical wording, labels, proofs, and displays while extracting. After each
target span is copied, audit its inbound and outbound references, verify local compilation or
lightweight structural checks, then delete the overlapping copied span from the old `sections/...`
source file in the same migration step so there is no duplicate active content.

| Source | Current Role | Migration Action |
| --- | --- | --- |
| `sections/linear_algebra/matrix_analysis/4_1_matrix_classes_and_invariants.tex` | Many unrelated matrix topics | Extract into matrix invariants, positive/structured matrices, and matrix products/spectral radius subsection files |
| `sections/linear_algebra/structural_linear_algebra/1_3_linear_maps_and_representations.tex` | Linear maps plus matrices plus basis change | Extract by linear maps, rank, representations, basis change, equivalence/similarity |
| `sections/analysis/measure_and_integration_structure/5_1_sigma_algebras_and_measures.tex` | Measure construction plus examples plus Stieltjes measures | Extract by sigma-algebras, measures, extension, Borel/Lebesgue/Stieltjes |
| `sections/linear_algebra/geometric_linear_algebra/2_5_metric_vector_spaces_and_bilinear_forms.tex` | Forms, Witt theory, symplectic and classical groups | Extract into bilinear/quadratic forms, decompositions, symplectic, classical groups |
| `sections/analysis/differential_and_geometric_analysis/4_1_one_variable_differentiation_and_integration.tex` | Differentiation, Riemann, Stieltjes, improper, curves | Extract into calculus and Stieltjes/integration subsection files |
| `sections/linear_algebra/spectral_linear_algebra/3_2_polynomial_structure_of_operators.tex` | Characteristic/minimal polynomials plus primary decomposition | Extract by polynomial evaluation, characteristic/minimal polynomials, generalized eigenspaces |
| `machine_learning/dl/dfn.tex` | Deep feedforward networks, cost functions, output/hidden units, universal approximation, backpropagation | Extract into neural-network architecture, expressivity, output/loss, and backpropagation subsection files |
| `machine_learning/dl/reg.tex` | Deep-learning regularization, penalties, augmentation, early stopping, dropout, adversarial and tangent methods | Extract into regularization, normalization/generalization, robustness, and representation-learning subsections as appropriate |
| `machine_learning/dl/opt.tex` | Deep-learning optimization, SGD variants, adaptive methods, second-order methods, batch normalization, curriculum learning | Extract optimization algorithms carefully; keep broadly numerical optimization in Part 14 and reference it from Part 16 |
| `machine_learning/dl/cnn.tex` | Convolution, cross-correlation, pooling, padding, multi-channel and locally connected layers | Extract into convolutional/geometric architectures and representation-learning subsections |

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
| Dynamical and PDE Systems | Partial Differential Equations | Prefer first-order, elliptic, parabolic, hyperbolic, Sobolev, weak solutions, and evolution equations as subsections while short, sections if expanded |
| Numerical and Stochastic Computation | Numerical Differential Systems | Combines numerical ODEs, geometric integration, PDE discretizations, numerical SDEs, and computational stability |
| Numerical and Stochastic Computation | Monte Carlo and Stochastic Computation | Combines Monte Carlo, MCMC, sequential Monte Carlo, rare-event simulation, and stochastic optimization |

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
| Statistics and Time Series | Statistical Models and Experiments | Deferred rebuild; separates model language from estimation and testing |
| Statistics and Time Series | Estimation Theory | Deferred rebuild; substantial enough for estimator, efficiency, asymptotic, and robust-estimation subsections |
| Statistics and Time Series | Hypothesis Testing and Confidence | Deferred rebuild; tests, confidence, and multiplicity need separate navigation |
| Statistics and Time Series | Decision Theory and Bayesian Inference | Deferred rebuild; decision-theoretic and Bayesian material should remain visible |
| Statistics and Time Series | Nonparametric, High-Dimensional, and Time-Series Methods | Deferred rebuild; broad methods sections need internal topic files |
| Statistical Learning and Deep Learning | Learning Problems and Risk | Source-vetted migration plus rebuild; core prediction language should be isolated from statistical inference |
| Statistical Learning and Deep Learning | Generalization Theory | Source-vetted migration plus rebuild; complexity, concentration, and stability tools need separate subsections |
| Statistical Learning and Deep Learning | Classical Supervised and Unsupervised Learning | Use root `machine_learning/cml` where appropriate, but do not collapse model families into one large file |
| Statistical Learning and Deep Learning | Probabilistic Graphical and Causal Learning | Mostly rebuild; graph, inference, and intervention topics need separate navigation |
| Statistical Learning and Deep Learning | Neural Network Foundations and Modern Deep Models | Use root `machine_learning/dl` where appropriate; architectures, training, and evaluation should be separated |

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
7. For every copied content span, collect the labels it defines and the labels/files it references.
8. Before deleting the old span, check inbound references to the moved labels and outbound references from the moved span:
   - inbound: `\ref`, `\eqref`, `\autoref`, `\cref`, `\Cref`, `\pageref`, and `\nameref` occurrences elsewhere still resolve to the preserved labels;
   - outbound: referenced labels already exist in an active owner or are intentionally forward references;
   - file references: figure, TikZ, and `\input` paths used by the moved span still resolve.
9. After the copied target span passes reference and structural validation, immediately remove the overlapping body from the old `sections/...` source file. If the old file remains in the active include graph before global rewiring, replace the removed body with a temporary forwarding `\input{parts/...}` or a short placeholder comment.
10. Never leave the same mathematical body active in both `parts/...` and `sections/...`.

## Migration Phases by Target Part

Phase numbering follows the numbered Target Structure and Source Mapping exactly. Phase 1
migrates Part 1, Phase 2 migrates Part 2, and so on. Structure setup is preflight work, not a
numbered migration phase.

### Phase 0: Baseline and Skeleton Preflight

- Compile the current document once and save the log.
- Record current heading depth:

```sh
rg -n '^\\(part|section|subsection|subsubsection|paragraph)\{' sections
```

- Record current `\input` graph:

```sh
rg -n '\\input\{' math.tex sections
```

- Record duplicate labels before migration:

```sh
rg -n '\\label\{' sections | sort
```

- Ensure the repo-level `parts/` skeleton exists for all sixteen target parts and their section folders.
- Create numbered subsection files only when content is actually copied into them.

### Per-Phase Migration Loop

For each target part phase, process the part in the section order listed in the Target Structure
and Source Mapping above. Work in small content batches, usually one target subsection or one
short target section at a time.

For each content batch:

1. Identify the target part, section, subsection file, source file, and exact source span.
2. Inspect the copied span's outbound references: labels, figures, TikZ files, and nested inputs.
3. Search for inbound references to labels defined by the copied span.
4. Copy the mathematical body into the target `parts/...` file, preserving wording, labels,
   proofs, displays, and figure placement.
5. Wire the target section `overview.tex` to the new subsection file.
6. Validate the affected target files:
   - every new `\input` target resolves;
   - every moved figure/TikZ path resolves;
   - every outbound label reference resolves or is intentionally forward;
   - every inbound reference still points to the preserved label;
   - no formal theorem/proposition/lemma/corollary/method depends on a remark or example.
7. Remove the copied mathematical body from the old `sections/...` source file immediately after
   validation. If the old file is still active before the global `math.tex` rewire, replace the
   removed body with a temporary forwarding `\input{parts/...}` or with a short placeholder comment.
8. Re-check the affected old and new files for duplicate active content, duplicate labels in the
   active include path, and unresolved references.
9. Record the next cursor within the same target part.

Do not start the next numbered phase until the current target part's mapped current sources are
migrated, removed from old owners, or explicitly marked as deferred/rebuild-only.

### Phase 1: Migrate Part 1, Mathematical Foundations

- Target: `parts/01_mathematical_foundations/`.
- Source mapping: `sections/foundational_prerequisites.tex` and
  `sections/mathematical_language_sets_and_logic/...`.
- Also inspect `sections/analysis/foundations_of_analysis/1_2_cardinality_and_infinite_sets.tex`;
  move unique cardinality/choice content here or replace the old analysis body with cross-references.
- Completion condition: foundational content has a single active owner under Part 1, and later
  analysis/algebra files reference it instead of redeveloping it.

### Phase 2: Migrate Part 2, Structural Linear Algebra

- Target: `parts/02_structural_linear_algebra/`.
- Source mapping: `sections/linear_algebra/structural_linear_algebra/...`.
- Split large source files according to the Structural Linear Algebra target subsections.
- Completion condition: structural vector spaces, maps, direct sums, block operations, duality,
  and finite-dimensional TVS material have Part 2 owners; old structural source bodies are removed
  or temporarily forward to Part 2.

### Phase 3: Migrate Part 3, Geometric and Spectral Linear Algebra

- Target: `parts/03_geometric_spectral_linear_algebra/`.
- Source mapping: geometric and spectral linear algebra sources listed in Part 3 above.
- Keep geometry, inner products, forms, eigenstructure, polynomial operator structure, canonical
  forms, and spectral theorems in this part.
- Completion condition: later matrix-analysis, functional-analysis, and module sections reference
  this part instead of duplicating spectral development.

### Phase 4: Migrate Part 4, Matrix Analysis and Numerical Linear Algebra

- Target: `parts/04_matrix_analysis_numerical_linear_algebra/`.
- Source mapping: matrix-analysis and numerical-linear-algebra sources listed in Part 4 above.
- Extract large matrix-class, invariant, decomposition, norm, conditioning, and stability files
  into numbered subsection files.
- Completion condition: matrix algorithms and matrix-analysis results have Part 4 owners, with
  spectral theory referenced from Part 3 where appropriate.

### Phase 5: Migrate Part 5, Groups, Rings, and Fields

- Target: `parts/05_groups_rings_fields/`.
- Source mapping:
  - `sections/algebraic_structures/algebraic_language_and_categories/...`;
  - `sections/algebraic_structures/group_theory/...`;
  - `sections/algebraic_structures/rings_ideals_and_modules/3_1_rings_and_ideals.tex`;
  - `sections/algebraic_structures/rings_ideals_and_modules/3_2_polynomial_rings_and_factorization.tex`;
  - `sections/algebraic_structures/fields_and_galois_theory/...`.
- Separate rings from modules at the destination file level: rings stay in Part 5; modules move in
  Phase 6.
- Completion condition: group/ring/field content has Part 5 owners, and old algebra source bodies
  are removed or forward to Part 5.

### Phase 6: Migrate Part 6, Modules, Multilinear Algebra, and Homological Methods

- Target: `parts/06_modules_multilinear_homological/`.
- Source mapping:
  - `sections/algebraic_structures/rings_ideals_and_modules/3_3_modules.tex`;
  - `sections/algebraic_structures/rings_ideals_and_modules/3_4_structure_theorems.tex`;
  - `sections/algebraic_structures/rings_ideals_and_modules/3_5_linear_operators_as_modules.tex`;
  - `sections/algebraic_structures/rings_ideals_and_modules/3_6_associative_algebras.tex`;
  - `sections/algebraic_structures/tensor_exterior_and_homological_algebra/...`.
- Split module theory, PID structure, operator modules, associative algebras, tensor products,
  exterior/symmetric algebras, and homology according to the Part 6 target sections.
- Completion condition: all module and multilinear material has Part 6 owners, and old mixed
  rings/modules source bodies no longer duplicate Part 5 or Part 6 content.

### Phase 7: Migrate Part 7, Commutative Algebra

- Target: `parts/07_commutative_algebra/`.
- Source mapping: `sections/algebraic_geometry_commutative_algebra/commutative_algebra/...`.
- Keep commutative ring theory here; reference Part 6 for general module foundations when possible.
- Completion condition: spectra, localization, Noetherian commutative algebra, dimension,
  integral dependence, regularity, and singularity-preview material have Part 7 owners.

### Phase 8: Migrate Part 8, Algebraic Geometry

- Target: `parts/08_algebraic_geometry/`.
- Source mapping: `sections/algebraic_geometry_commutative_algebra/algebraic_geometry/...`.
- Keep affine/projective geometry, morphisms, schemes, sheaves, smoothness, divisors, line bundles,
  and curves here; reference Part 7 for commutative algebra.
- Completion condition: algebraic geometry content has Part 8 owners and old geometry source bodies
  are removed or forward to Part 8.

### Phase 9: Migrate Part 9, Real and Topological Analysis

- Target: `parts/09_real_topological_analysis/`.
- Source mapping: analysis foundations, number systems, order/completeness, metric, topological,
  compactness, connectedness, and continuity sources listed in Part 9 above.
- Move cardinality/choice overlap to Part 1 instead of duplicating it here.
- Completion condition: real and topological foundations have Part 9 owners and reference Part 1
  for set-theoretic foundations.

### Phase 10: Migrate Part 10, Calculus, Series, and Approximation

- Target: `parts/10_calculus_series_approximation/`.
- Source mapping: one-variable calculus, Riemann/Stieltjes/improper integration, series, uniform
  convergence, power series, Fourier, and approximation sources listed in Part 10 above.
- Keep classical calculus and approximation here; abstract measure integration belongs to Part 11.
- Completion condition: calculus and approximation source bodies have Part 10 owners.

### Phase 11: Migrate Part 11, Measure, Integration, and Functional Analysis

- Target: `parts/11_measure_integration_functional_analysis/`.
- Source mapping: measure theory, Lebesgue integration, product measure, Radon-Nikodym,
  differentiation, `Lp` spaces, Banach/Hilbert, and operator-theoretic functional analysis sources
  listed in Part 11 above.
- Keep probability-specific specialization in Part 12.
- Completion condition: measure/integration/functional-analysis material has Part 11 owners and
  probability notes cross-reference it rather than redeveloping it.

### Phase 12: Migrate Part 12, Probability and Stochastic Systems

- Target: `parts/12_probability_stochastic_systems/`.
- Source mapping: probability, conditional expectation, convergence, limit theorem, process,
  Markov, martingale, stochastic calculus, and SDE sources listed in Part 12 above.
- Keep measure foundations in Part 11 and reference them here.
- Completion condition: probability and stochastic-system material has Part 12 owners.

### Phase 13: Migrate Part 13, Dynamical and PDE Systems

- Target: `parts/13_dynamical_pde_systems/`.
- Source mapping: ODE, dynamical systems, qualitative dynamics, PDE, weak solution, and evolution
  equation sources listed in Part 13 above.
- Keep numerical discretization and stochastic computation in Part 14.
- Completion condition: dynamics and PDE theory have Part 13 owners.

### Phase 14: Migrate Part 14, Numerical and Stochastic Computation

- Target: `parts/14_numerical_stochastic_computation/`.
- Source mapping: numerical ODE/PDE, discretization, Monte Carlo, stochastic simulation, MCMC,
  sequential Monte Carlo, stochastic optimization, and computational stability sources listed in
  Part 14 above.
- Reference linear algebra, analysis, probability, and dynamics rather than redeveloping them.
- Completion condition: numerical and stochastic computation material has Part 14 owners.

### Phase 15: Rebuild Part 15, Statistics and Time Series

- Target: `parts/15_statistics_time_series/`.
- Source mapping: no active current source tree; the old statistics/time-series material has been
  retired.
- Populate this part only from new specialized statistics and time-series sources.
- Keep prerequisites as cross-references to probability, measure theory, stochastic processes,
  optimization, and numerical computation.
- Completion condition: rebuilt statistics/time-series content compiles section by section before
  becoming active.

### Phase 16: Migrate and Rebuild Part 16, Statistical Learning and Deep Learning

- Target: `parts/16_statistical_learning_deep_learning/`.
- Source mapping:
  - `machine_learning/overallstruct.tex`;
  - `machine_learning/cml/overview.tex`;
  - `machine_learning/cml/ensemble.tex`;
  - `machine_learning/dl/overview.tex`;
  - `machine_learning/dl/dfn.tex`;
  - `machine_learning/dl/reg.tex`;
  - `machine_learning/dl/opt.tex`;
  - `machine_learning/dl/cnn.tex`.
- Prefer the root `machine_learning/...` tree as the source of record; inspect
  `sections/machine_learning/...` only to confirm whether it is an identical mirror or contains
  newer edits.
- Migrate usable existing machine-learning and deep-learning material after vetting it against the
  target Part 16 structure.
- Rebuild missing, weak, or structurally misplaced topics from specialized statistical-learning,
  machine-learning, and deep-learning sources.
- Avoid duplicating Part 15's inference foundations; introduce statistical tools only when they are
  used for prediction, representation, or learning-system analysis.
- Completion condition: migrated or rebuilt learning/deep-learning content compiles section by
  section before becoming active, and the old root/mirror machine-learning owners no longer
  duplicate active Part 16 content.

### Final Activation and Global Validation

- Replace the body include sequence in `math.tex` with the Target Include Order once target parts
  have active owners.
- Remove temporary forwarding `sections/...` shims after their corresponding `parts/...` owners are
  directly active.
- Delete empty or legacy old files/directories only after reviewing unique content and confirming no
  active inputs reference them.
- Rebuild the PDF.
- Search for remaining deep headings in the active tree:

```sh
rg -n '^\\subsubsection|^\\paragraph' math.tex parts sections
```

- Search for stale active old paths:

```sh
rg -n 'sections/(linear_algebra|analysis|algebraic_structures|algebraic_geometry_commutative_algebra)' math.tex parts sections
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
- Any old `sections/...` file that remains active after content removal is only a temporary forwarding shim or placeholder.
- Each migrated content span has inbound references, outbound references, and file/figure inputs checked before the old body is removed.
- Cross-references compile without unresolved labels.
- Figure paths still resolve.
- Lean mirror files under `MathNotes/sections` are updated only after the LaTeX structure stabilizes.

Later cleanup checklist:

- No temporary forwarding shim remains once `math.tex` directly uses the target `parts/...` include order.
- No active `\subsubsection` headings remain.
- No section has exactly one forced subsection.
