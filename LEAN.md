# Lean Setup

Lean files mirror the canonical LaTeX source tree under `parts/`.

For every file

```text
parts/<path>/<name>.tex
```

the corresponding newly scaffolded Lean file should be

```text
MathNotes/parts/<path>/<name>.lean
```

Examples:

```text
parts/02_structural_linear_algebra/01_vector_spaces_and_linear_structure/01_vector_spaces.tex
MathNotes/parts/02_structural_linear_algebra/01_vector_spaces_and_linear_structure/01_vector_spaces.lean

parts/09_real_topological_analysis/03_metric_spaces_and_euclidean_topology/01_metrics_open_sets_and_euclidean_topology.tex
MathNotes/parts/09_real_topological_analysis/03_metric_spaces_and_euclidean_topology/01_metrics_open_sets_and_euclidean_topology.lean
```

Some mirrored filenames begin with numbers. They stay unchanged on disk, but imports use Lean escaped identifiers:

```lean
import MathNotes.parts.«02_structural_linear_algebra».«01_vector_spaces_and_linear_structure».«01_vector_spaces»
```

Existing formalization modules under `MathNotes/sections/` are legacy modules
from before the LaTeX migration. They remain importable so existing Lean work is
not lost, but new generated stubs should target `MathNotes/parts/`.

## Setup

Install Lean using the official VS Code extension setup or `elan`, then run:

```sh
lake update
lake exe cache get
lake build
```

The project pins Lean and mathlib to `v4.29.1`.

## Adding New Sections

After adding a new `.tex` file under `parts/`, run:

```sh
python3 scripts/scaffold_lean_sections.py
```

The script creates only missing mirrored Lean files under `MathNotes/parts/` and
updates `MathNotes.lean`. It does not overwrite existing Lean files, and it
keeps legacy `MathNotes/sections/` modules imported while they remain in the
repository.

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
from `parts/`, so the notes remain the source of truth.

Use the `py311` conda environment for LeanBlueprint commands:

```sh
conda run -n py311 leanblueprint web
conda run -n py311 leanblueprint checkdecls
conda run -n py311 leanblueprint pdf
```
