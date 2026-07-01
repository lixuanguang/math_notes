# Math Notes

A consolidated mathematics notes project. The primary source is LaTeX, with
Lean formalizations and LeanBlueprint tracking maintained alongside the notes.

## Current Structure

The completed structure migration makes `parts/` the canonical LaTeX source
tree. The former repo-level LaTeX `sections/` tree has been removed; new LaTeX
content should not recreate it.

- `math.tex`: main document entry point.
- `parts/base.tex`: shared preamble, packages, theorem environments, and macros.
- `parts/00_notations/`: front-matter notation.
- `parts/01_...` through `parts/17_...`: mathematical body content.
- `references.tex` and `references.bib`: bibliography entry point and BibTeX
  database.
- `figures/`: figure assets used by the notes.
- `MathNotes/` and `MathNotes.lean`: Lean project files.
- `blueprint/`: LeanBlueprint sources and generated output.
- `prompts/`: reusable note workflow prompts.
- `reference/`: source and reference material.
- `scripts/`: repository maintenance scripts.

## Editing LaTeX

Add and move LaTeX content under `parts/`.

Each numbered part owns an `overview.tex` file with one `\part{...}` and inputs
for its section folders. Each section folder owns an `overview.tex` file with
one `\section{...}` and inputs for numbered subsection files. Numbered
subsection files are the deepest visible book-body level and contain
`\subsection{...}` plus content.

Use `STRUCTURE_MIGRATION_README.md` for the current part and section index,
ownership rules, content-adding guidance, content-moving guidance, and
formalization-loop guidance.

## Building

Build the PDF from the project root:

```sh
pdflatex -recorder -interaction=nonstopmode -halt-on-error math.tex
bibtex math
pdflatex -recorder -interaction=nonstopmode -halt-on-error math.tex
pdflatex -recorder -interaction=nonstopmode -halt-on-error math.tex
```

For a quick compile check after a local edit, one `pdflatex` pass is usually
enough to catch syntax and missing-input errors.

## Lean And Blueprint

Lean files mirror the canonical LaTeX source tree under `parts/`. Newly
scaffolded files target `MathNotes/parts/`; existing legacy Lean modules under
`MathNotes/sections/` remain importable so earlier formalization work is not
lost.

After adding a new `.tex` file under `parts/`, scaffold any missing mirrored
Lean files with:

```sh
python3 scripts/scaffold_lean_sections.py
```

Use `LEAN.md` for Lean setup, import naming, LeanBlueprint markers, and
LeanBlueprint commands.

## Useful Checks

```sh
lake build
rg -n "\\\\input\\{sections/|sections/" math.tex parts references.tex blueprint/src
rg -n "\\\\subsubsection|\\\\paragraph" parts
```

## Reference Coverage

Coverage is organized by the active `parts/` tree. The table below records the
current reference spine and nearby source library; it is not meant to certify
that every local reference file has already been integrated into the notes.

`references.bib` contains the bibliography currently surfaced by the document.
The `reference/` directory also contains working source material for future
expansion.

| Parts | Area | Current reference spine |
| ----- | ---- | ----------------------- |
| `01` | Set theory, logic, and foundations | Source library includes set theory, logic, proof, computability, and philosophy of mathematics texts. Bibliography expansion pending. |
| `02`-`04` | Linear algebra, spectral theory, and matrix analysis | Garcia-Horn, Axler, Strang, and Roman are in the active bibliography. |
| `05`-`08` | Abstract algebra, commutative algebra, and algebraic geometry | Structured notes tree is in place. Bibliography expansion pending as these parts are developed. |
| `09`-`10` | Real analysis, topology, calculus, series, and approximation | Rudin, Grinberg, Abbott, Ross, Pugh, and Tao I-II are in the active bibliography. |
| `11` | Measure, integration, and functional analysis | Bartle is in the active bibliography. The source library also includes Royden, Rudin real/complex analysis, Oxtoby, Dunford-Schwartz, and functional analysis references. |
| `12` | Probability and stochastic systems | Source library includes Ross, Lamperti, Billingsley, and stochastic calculus references. Bibliography expansion pending. |
| `13`-`14` | Dynamical systems, PDEs, numerical analysis, and stochastic computation | Structured notes tree is in place. Bibliography expansion pending as these parts are developed. |
| `15`-`16` | Statistics, time series, statistical data analysis, and applied models | Hamilton and Rice are in the active bibliography. The source library also includes Casella-Berger, Lehmann-Casella, Lehmann-Romano, van der Vaart, Schervish, Berger, nonparametric statistics texts, and resampling references. |
| `17` | Statistical learning and deep learning | Hastie-Tibshirani-Friedman, Mazur, and Granziol-Wan-Albanie-Roberts are in the active bibliography. Broader learning references remain expansion material. |

When adding a source to the notes, prefer this order:

1. Add or confirm the BibTeX entry in `references.bib`.
2. Add the appropriate `\nocite{...}` or local citation in `references.tex` or
   the relevant `parts/...` file.
3. Place the mathematical content according to the ownership rules in
   `STRUCTURE_MIGRATION_README.md`.
