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
- `parts/01_...` through `parts/16_...`: mathematical body content.
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

| Section | Reference Book | Author | Progress |
| ----- | ----- | ----- | ----- |
| Linear and Operator Structures | A Second Course in Linear Algebra | Stephan Ramon Garcia | Completed |
| Linear and Operator Structures | Linear Algebra Done Right | Sheldon Axler | Completed |
| Linear and Operator Structures | Linear Algebra and Its Applications | Gilbert Strang | Completed |
| Linear and Operator Structures | Advanced Linear Algebra, Third Edition | Steven Roman | Completed |
| Analysis and Continuous Structure | Principles of Mathematical Analysis (Baby Rudin) | Walter Rudin | Completed |
| Analysis and Continuous Structure | The Real Analysis Lifesaver | Raffi Grinberg | Completed |
| Analysis and Continuous Structure | Understanding Analysis | Stephen Abbott | Completed |
| Analysis and Continuous Structure | Elementary Analysis | Kenneth A. Ross | Completed |
| Analysis and Continuous Structure | Real Mathematical Analysis | Charles Chapman Pugh | Completed |
| Analysis and Continuous Structure | Analysis I | Terence Tao | Completed |
| Analysis and Continuous Structure | Analysis II | Terence Tao | Completed |
| Analysis and Continuous Structure | The Elements of Integration and Lebesgue Measure | Robert G. Bartle | Completed |
