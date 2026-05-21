# Math Notes Blueprint

This folder contains the LeanBlueprint source for tracking the formalization of
the LaTeX notes.

The blueprint inputs prepared source files from `sections/` rather than keeping
a duplicate copy of the mathematics. The normal notes PDF ignores LeanBlueprint
markers through no-op fallbacks in `sections/base.tex`; the blueprint web build
uses the same markers to produce dependency and formalization status data.

## Local Workflow

Install the external tools in the `py311` conda environment:

```sh
brew install graphviz
CFLAGS="-I/opt/homebrew/include" LDFLAGS="-L/opt/homebrew/lib" \
  conda run -n py311 python -m pip install pygraphviz
conda run -n py311 python -m pip install leanblueprint
```

Then run from the repository root:

```sh
lake build
conda run -n py311 leanblueprint web
conda run -n py311 leanblueprint checkdecls
conda run -n py311 leanblueprint serve
```

The current first linked item is `def:vector-space`, connected to the Lean
declaration
`MathNotes.LinearAlgebra.StructuralLinearAlgebra.VectorSpacesAndLinearStructure.vector_space_axioms`.
