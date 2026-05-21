import MathNotes.sections.base

/-!
# 1 1 Vector Spaces And Linear Structure

Lean counterpart of `sections/linear_algebra/structural_linear_algebra/1_1_vector_spaces_and_linear_structure.tex`.
-/

namespace MathNotes

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

end VectorSpaceDefinition

end MathNotes
