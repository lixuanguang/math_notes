# Inline Mathematics and Rendered Layout

This is a user-specific repository standard. Do not weaken it for brevity, generic style advice, or source convenience.

## Layout modes

- `inline-strict` is the default and follows every rule below.
- `inline-first` also permits a genuinely long derivation display when inline compression would harm clarity.
- `preserve-essential-displays` may preserve useful existing displays, but creates no new display without structural need.

The selected mode must not hide hypotheses, force cryptic notation, overload a theorem statement, break proof logic, or cause overflow. Simplify content before changing layout mode.

## Inline-strict standard

- Single definitions, identities, inequalities, set-builder expressions, integral formulas, and finite equality/proof chains remain inline after semantic compression.
- Retain a display only for:
  1. a matrix with at least four rows;
  2. an irreducible two-dimensional or multiline structure;
  3. an equation that is actually referenced and therefore numbered/labeled;
  4. a specialized environment that requires display behavior.
- Length or visual emphasis alone is not an exception. Inventory every retained display and record its exact exception.
- Matrices with at most three rows use inline `smallmatrix` with delimiters, for example `$A=\left(\begin{smallmatrix}a&b\\c&d\end{smallmatrix}\right)$`.
- A displayed matrix must have at least four rows; record its row count.

Use `\limits` on bounded/indexed large operators such as `\sum`, `\prod`, `\coprod`, `\bigoplus`, `\bigcup`, `\bigcap`, `\bigsqcup`, `\lim`, `\limsup`, `\liminf`, `\inf`, `\sup`, `\min`, and `\max`. Convert arithmetic slash fractions to `\frac{...}{...}` while preserving quotient notation such as `G/H`. Do not use `\quad` or `\qquad` as prose separators, and do not put prose in `\text{...}` merely to force it into math mode.

## Line breaking, packing, and overflow

- Use deliberate `\\` only between complete semantic units—never inside a sentence, formula, or equality chain.
- Separate dense setup, contrast, construction, consequence, and interpretation into semantic sentences, then render again.
- A continuation line with fewer than five lexical words, or a comparably short mathematical tail, triggers this repair order:
  1. remove repeated prose or duplicated notation;
  2. use established notation or bind a readable local abbreviation;
  3. join a needlessly separated premise and conclusion;
  4. split genuine logical units at semantic boundaries;
  5. use a display only when the active mode supplies an independent exception.
- A sparse tail may remain only when it is an irreducible intentional unit and alternatives reduce clarity.
- Never repair layout by shrinking fonts, changing margins, adding arbitrary spacing, inserting mid-expression breaks, or creating unnecessary displays.
- If inline pressure introduces extra notation or proof construction into a theorem statement, restore statement proportionality first. If the resulting formula still breaks badly, use the narrowest documented display exception or the configured less-strict mode.

## No-overflow requirement

No changed equation, inline formula, display, matrix, commentary line, caption, or neighboring text may extend into the margin, collide, or become unreadably dense when rendered. Source inspection and successful compilation are insufficient.

For every changed page:

1. inspect the build log for overfull/underfull boxes near the edited lines;
2. render the affected page at readable resolution;
3. inspect the exact changed block, including page boundaries and continuation lines;
4. apply the semantic repair order above and repeat until no avoidable overflow or sparse tail remains.

Do not dismiss a small overfull box in edited content as cosmetic. Distinguish and report unrelated pre-existing warnings elsewhere.

## Equation numbering

- Number and label only equations referenced later or central enough to require a stable anchor.
- Use one descriptive `eq:` label and `\eqref{...}`.
- Do not label one-off displays or decorative derivations.
- When moving content, update every affected reference and remove stale or duplicate equation labels.
