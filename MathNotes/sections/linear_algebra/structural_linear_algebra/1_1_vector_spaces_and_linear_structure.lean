import MathNotes.sections.base

/-!
# 1 1 Vector Spaces And Linear Structure

Lean counterpart of `sections/linear_algebra/structural_linear_algebra/1_1_vector_spaces_and_linear_structure.tex`.
-/

namespace MathNotes.LinearAlgebra.StructuralLinearAlgebra.VectorSpacesAndLinearStructure

universe u

section VectorSpaceDefinition

variable {F V : Type*} [Field F] [AddCommGroup V] [Module F V]

/-!
## Vector Space

The LaTeX definition of a vector space over a field `F` is represented in
mathlib by the typeclass assumptions `[AddCommGroup V]` and `[Module F V]`.
The following lemmas record the displayed axioms from the notes in that
encoding.
-/

theorem vector_add_comm (u v : V) : u + v = v + u := by
  exact add_comm u v

theorem vector_add_assoc (u v w : V) : (u + v) + w = u + (v + w) := by
  exact add_assoc u v w

theorem vector_zero_add (v : V) : 0 + v = v := by
  exact zero_add v

theorem vector_add_left_neg (v : V) : v + (-v) = 0 := by
  simp

theorem vector_one_smul (v : V) : (1 : F) • v = v := by
  exact one_smul F v

theorem vector_mul_smul (a b : F) (v : V) : (a * b) • v = a • (b • v) := by
  exact mul_smul a b v

theorem vector_smul_add (a : F) (u v : V) : a • (u + v) = a • u + a • v := by
  exact smul_add a u v

theorem vector_add_smul (a b : F) (v : V) : (a + b) • v = a • v + b • v := by
  exact add_smul a b v

theorem vector_space_axioms :
    (∀ u v : V, u + v = v + u) ∧
      (∀ u v w : V, (u + v) + w = u + (v + w)) ∧
      (∀ v : V, 0 + v = v) ∧
      (∀ v : V, v + (-v) = 0) ∧
      (∀ v : V, (1 : F) • v = v) ∧
      (∀ (a b : F) (v : V), (a * b) • v = a • (b • v)) ∧
      (∀ (a : F) (u v : V), a • (u + v) = a • u + a • v) ∧
      (∀ (a b : F) (v : V), (a + b) • v = a • v + b • v) := by
  exact ⟨vector_add_comm, vector_add_assoc, vector_zero_add, vector_add_left_neg,
    vector_one_smul, vector_mul_smul, vector_smul_add, vector_add_smul⟩

end VectorSpaceDefinition

section FinitelyNonzeroSequenceSpace

/-!
## Finitely Nonzero Sequence Space

The notes write this space as `F^{(N)}`: sequences over `F` with only finitely
many nonzero entries. In mathlib this is the type of finitely supported
functions `ℕ →₀ F`.
-/

abbrev FinitelyNonzeroSequenceSpace (F : Type u) [Zero F] : Type u :=
  ℕ →₀ F

variable {F : Type u} [Field F]

theorem finitely_nonzero_sequence_support_smul_add_subset
    (a : F) (x y : FinitelyNonzeroSequenceSpace F) :
    (a • x + y).support ⊆ x.support ∪ y.support := by
  intro n hn
  rw [Finset.mem_union]
  by_contra h
  rw [not_or] at h
  rw [Finsupp.mem_support_iff] at hn
  have hx : x n = 0 := Finsupp.notMem_support_iff.mp h.1
  have hy : y n = 0 := Finsupp.notMem_support_iff.mp h.2
  exact hn (by simp [hx, hy])

theorem finitely_nonzero_sequences_vector_space :
    Nonempty (AddCommGroup (FinitelyNonzeroSequenceSpace F)) ∧
      Nonempty (Module F (FinitelyNonzeroSequenceSpace F)) := by
  exact ⟨⟨inferInstance⟩, ⟨inferInstance⟩⟩

end FinitelyNonzeroSequenceSpace

section BasicConsequences

/-!
## Basic Consequences of Vector Space Axioms

These are the first algebraic consequences extracted from the vector space
axioms in the notes: uniqueness of the additive identity and inverses, the two
zero-scalar identities, and the zero-product criterion for scalar
multiplication.
-/

variable {F V : Type*} [Field F] [AddCommGroup V] [Module F V]

theorem additive_identity_unique {z : V} (hz : ∀ v : V, z + v = v) : z = 0 := by
  simpa using hz 0

theorem additive_inverse_unique (v w : V) (hw : v + w = 0) : w = -v := by
  calc
    w = 0 + w := by simp
    _ = (-v + v) + w := by simp
    _ = -v + (v + w) := by rw [add_assoc]
    _ = -v + 0 := by rw [hw]
    _ = -v := by simp

theorem zero_smul_vector (v : V) : (0 : F) • v = 0 := by
  simp

theorem smul_zero_vector (a : F) : a • (0 : V) = 0 := by
  simp

theorem scalar_smul_eq_zero_iff (a : F) (v : V) :
    a • v = 0 ↔ a = 0 ∨ v = 0 := by
  constructor
  · intro h
    by_cases ha : a = 0
    · exact Or.inl ha
    · right
      calc
        v = (1 : F) • v := by simp
        _ = (a⁻¹ * a) • v := by rw [inv_mul_cancel₀ ha]
        _ = a⁻¹ • (a • v) := by rw [mul_smul]
        _ = 0 := by rw [h, smul_zero]
  · intro h
    rcases h with ha | hv
    · simp [ha]
    · simp [hv]

theorem basic_vector_space_consequences :
    (∀ z : V, (∀ v : V, z + v = v) → z = 0) ∧
      (∀ v w : V, v + w = 0 → w = -v) ∧
      (∀ v : V, (0 : F) • v = 0) ∧
      (∀ a : F, a • (0 : V) = 0) ∧
      (∀ (a : F) (v : V), a • v = 0 ↔ a = 0 ∨ v = 0) := by
  exact ⟨fun _ hz => additive_identity_unique hz, additive_inverse_unique, zero_smul_vector,
    smul_zero_vector, scalar_smul_eq_zero_iff⟩

end BasicConsequences

section NegativeOneActsAsInverse

/-!
## Scalar Multiplication by Negative One

The corollary in the notes identifies scalar multiplication by `-1` with the
additive inverse operation.
-/

variable {F V : Type*} [Field F] [AddCommGroup V] [Module F V]

theorem negative_one_smul_eq_neg_vector (v : V) : ((-1 : F) • v) = -v := by
  have h : v + (-1 : F) • v = 0 := by
    calc
      v + (-1 : F) • v = (1 : F) • v + (-1 : F) • v := by simp
      _ = ((1 : F) + (-1 : F)) • v := by rw [← add_smul]
      _ = 0 := by simp
  exact additive_inverse_unique v ((-1 : F) • v) h

end NegativeOneActsAsInverse

section SubspaceDefinition

/-!
## Subspace

The notes define a subspace as a subset that is itself a vector space under the
inherited operations. In mathlib this structure is `Submodule F V`.
-/

variable {F V : Type*} [Field F] [AddCommGroup V] [Module F V]

abbrev Subspace (F V : Type*) [Field F] [AddCommGroup V] [Module F V] : Type _ :=
  Submodule F V

theorem subspace_zero_mem (U : Subspace F V) : (0 : V) ∈ U := by
  exact U.zero_mem

theorem subspace_add_mem (U : Subspace F V) {u v : V} (hu : u ∈ U) (hv : v ∈ U) :
    u + v ∈ U := by
  exact U.add_mem hu hv

theorem subspace_smul_mem (U : Subspace F V) (a : F) {u : V} (hu : u ∈ U) :
    a • u ∈ U := by
  exact U.smul_mem a hu

theorem subspace_inherited_vector_space (U : Subspace F V) :
    Nonempty (AddCommGroup U) ∧ Nonempty (Module F U) := by
  exact ⟨⟨inferInstance⟩, ⟨inferInstance⟩⟩

end SubspaceDefinition

end MathNotes.LinearAlgebra.StructuralLinearAlgebra.VectorSpacesAndLinearStructure
