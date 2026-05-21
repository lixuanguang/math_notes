import Lake
open Lake DSL

package math_notes where

require "leanprover-community" / "mathlib" @ git "v4.29.1"
require checkdecls from git "https://github.com/PatrickMassot/checkdecls.git"

@[default_target]
lean_lib MathNotes where
