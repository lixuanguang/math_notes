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

## Titled environment line break

- Every titled theorem-style environment must end its opening `\hlt{Title}` immediately with `\\`, before any body prose, even when the title and prose would fit on one rendered line. Use the canonical opening `\begin{example} \label{...} \hlt{Title}\\` and apply the same rule to every other titled custom environment.
- This rule governs environment titles only. It does not apply to untitled environments or inline semantic labels such as `\item \hlt{Keyword}: ...`.
- Run `ruby scripts/check_environment_title_breaks.rb <target>` after formalization; the checker handles nested braces inside titles.

## Mixed prose–math line budget

For formalization, use 100 horizontal character-equivalents as the preflight cap for one intended prose–inline-math span. This is calibrated to the current 8pt body and 175mm text block. It reduces repeated rendering but does not authorize overfull output.

- Normalize layout before counting, including required `\limits`, `\frac`, established notation, and inline `smallmatrix` where applicable.
- Count horizontally composed printed letters, digits, punctuation, spaces, and math symbols once. Count `\ref`, `\eqref`, and citations by expected printed text; do not count command names, braces, comments, or label keys.
- Let `H(X)` denote the estimated horizontal character-equivalents of rendered object `X`, computed recursively. Serial material adds; vertically stacked layers take a maximum; right-side upper/lower scripts add only their wider script column.

| Construct | Horizontal-equivalent estimate |
| --- | --- |
| Serial `A B` | `H(A) + H(B)` plus visible spacing or delimiters. |
| Ordinary `A_{B}^{C}` | `H(A) + max(H(B), H(C))`. |
| `\operatorname*{op}\limits_{B}^{C}` | `max(H(op), H(B), H(C)) + 1`. This includes `\sum`, `\prod`, `\lim`, and the other required large operators. |
| `\frac{A}{B}` or `\tfrac{A}{B}` | `max(H(A), H(B)) + 2`; never add numerator and denominator serially. |
| `\binom{A}{B}` | `max(H(A), H(B)) + 2` for the delimiters. |
| `\sqrt[B]{A}` | `H(A) + 2 + ceil(H(B)/2)`; omit the index term when absent. |
| `\overset{B}{A}`, `\underset{B}{A}`, `\stackrel{B}{A}`, accents, or braces | `max(H(A), H(B)) + 1`, omitting a nonexistent annotation. |
| `\substack`, inline matrix, array, or cases-like stack | Widest rendered row plus delimiters and intercolumn gaps; do not sum rows. |

Apply the table recursively to nesting. Inline `\dfrac`, `\cfrac`, cases, and aligned multirow structures are vertical-risk constructs: prefer ordinary `\frac`/`\tfrac`, bind readable notation, or use an existing irreducible-two-dimensional display exception. Any forced display style or nested stack deeper than one level must receive a line-height/collision check in the single final render even when its horizontal count is below 100.
- If a span exceeds 100, remove duplication, reuse established notation, or split at a genuine semantic boundary. Do not delete hypotheses, quantifiers, conclusions, source qualifiers, or required commentary.
- Treat the cap as an early trigger, not a geometric proof. Radicals, long arrows, wide bounds, URLs, identifiers, and dense bold/calligraphic math can overflow below 100; the final TeX overfull-box check remains decisive.

## No-overflow requirement

No changed equation, inline formula, display, matrix, commentary line, caption, or neighboring text may extend into the margin, collide, or become unreadably dense when rendered. The character budget is preflight, not proof.

After the selected batch stabilizes, build once, inspect overfull/underfull boxes near edited lines, and render each affected page once at readable resolution. Rebuild or rerender only if that final pass finds a current-edit overflow, sparse tail, collision, or unreadable visual; repair the defect and verify the repaired page.

Do not dismiss a small overfull box in edited content as cosmetic. Distinguish and report unrelated pre-existing warnings elsewhere.

## Equation numbering

- Number and label only equations referenced later or central enough to require a stable anchor.
- Use one descriptive `eq:` label and `\eqref{...}`.
- Do not label one-off displays or decorative derivations.
- When moving content, update every affected reference and remove stale or duplicate equation labels.
