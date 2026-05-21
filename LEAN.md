# Lean Setup

Lean files mirror the LaTeX source tree.

For every file

```text
sections/<path>/<name>.tex
```

the corresponding Lean file should be

```text
MathNotes/sections/<path>/<name>.lean
```

Examples:

```text
sections/linear_algebra/structural_linear_algebra/1_1_vector_spaces_and_linear_structure.tex
MathNotes/sections/linear_algebra/structural_linear_algebra/1_1_vector_spaces_and_linear_structure.lean

sections/analysis/topological_analysis/2_1_metric_spaces_and_euclidean_topology.tex
MathNotes/sections/analysis/topological_analysis/2_1_metric_spaces_and_euclidean_topology.lean
```

Some mirrored filenames begin with numbers. They stay unchanged on disk, but imports use Lean escaped identifiers:

```lean
import MathNotes.sections.linear_algebra.structural_linear_algebra.«1_1_vector_spaces_and_linear_structure»
```

## Setup

Install Lean using the official VS Code extension setup or `elan`, then run:

```sh
lake update
lake exe cache get
lake build
```

The project pins Lean and mathlib to `v4.29.1`.

## Adding New Sections

After adding a new `.tex` file under `sections/`, run:

```sh
python3 scripts/scaffold_lean_sections.py
```

The script creates only missing mirrored Lean files and updates `MathNotes.lean`. It does not overwrite existing section Lean files.

## LaTeX Linking Convention

Lean links are tracked with LeanBlueprint. When a LaTeX theorem, definition,
lemma, proposition, or corollary has a corresponding Lean declaration, add
LeanBlueprint markers inside the surrounding LaTeX environment:

```tex
\lean{MathNotes.Section.Namespace.declaration_name}
\leanok
```

Use `\uses{label-a,label-b}` when the blueprint dependency graph should record
statement or proof dependencies.

The blueprint source lives in `blueprint/src` and currently inputs prepared files
from `sections/`, so the notes remain the source of truth.

Use the `py311` conda environment for LeanBlueprint commands:

```sh
conda run -n py311 leanblueprint web
conda run -n py311 leanblueprint checkdecls
conda run -n py311 leanblueprint pdf
```
