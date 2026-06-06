import MathNotes.sections.base

/-!
# Notation List

Lean counterpart of `sections/notation_list.tex`.

The LaTeX notation list treats undecorated Latin and calligraphic letters as
local, and reserves decorated forms for persistent meanings.  Recent
collision-cleanup conventions include:

* `\mathcal{P}(X)` for power sets, but `\mathscr{P} = C[x]` only for the umbral
  polynomial algebra in the TeX source.
* `\mathcal{F}` for local families, but `\mathscr{F} = C[[t]]` only for the umbral
  formal-series algebra in the TeX source.
* `LS(A, y)` for least-squares solution sets, avoiding the same glyph as
  linear-map spaces and Lebesgue measurable sets.
* `\Phi_n` for cyclotomic polynomials, leaving `Q_n` available for normalized
  Fourier matrices.
* `\mathbb{F}_0` for prime subfields, avoiding `\mathbb{P}`.
-/

namespace MathNotes

end MathNotes
