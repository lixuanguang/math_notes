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

When a LaTeX theorem has a corresponding Lean declaration, add a nearby comment:

```tex
% Lean: MathNotes.sections.analysis.topological_analysis.«2_1_metric_spaces_and_euclidean_topology».metric_space_example
```

This keeps the human exposition in LaTeX and the checked formalization in Lean aligned without forcing all notes to become literate Lean.
