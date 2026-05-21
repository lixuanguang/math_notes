# Math Notes Blueprint

This folder contains the LeanBlueprint source for tracking the formalization of
the LaTeX notes.

The blueprint inputs prepared source files from `sections/` rather than keeping
a duplicate copy of the mathematics. The normal notes PDF ignores LeanBlueprint
markers through no-op fallbacks in `sections/base.tex`; the blueprint web build
uses the same markers to produce dependency and formalization status data.

## Local Workflow

Install the external tools when you are ready to build the blueprint output:

```sh
pip install leanblueprint
```

LeanBlueprint also needs Graphviz/PyGraphviz support; on macOS this usually
means installing Graphviz first, then installing LeanBlueprint.

Then run from the repository root:

```sh
lake build
leanblueprint web
leanblueprint checkdecls
leanblueprint serve
```

The current first linked item is `def:vector-space`, connected to the Lean
declaration
`MathNotes.LinearAlgebra.StructuralLinearAlgebra.VectorSpacesAndLinearStructure.vector_space_axioms`.
