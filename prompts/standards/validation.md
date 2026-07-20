# Validation Profiles

Mechanical checks support but never replace block-by-block semantic review.

## Common checks for every edit

1. Re-read every changed block against all loaded modules, enforcing notation-first wherever prose adds no meaning or context beyond the notation.
2. Check affected labels, references, input edges, hierarchy, notation ownership, domain context, source provenance, equation anchors, and typed TODOs.
3. For every theorem-style statement/proof, make a claim ledger and verify the exact canonical roman, direction, or implication-cycle mapping in `theorems_and_proofs.md`.
4. Run `git diff --check` and distinguish pre-existing problems from current edits.
5. Confirm unrelated work remains untouched.

## Content search gates

Run the applicable searches on each changed target and review every hit manually:

```sh
rg -n -i '\b(for all|for every|for each|at every( index)?|for some|there exists|there is a unique)\b' <target>
rg -n -i '\b(we|one) (apply|invoke|use|employ)\b|\b(apply|invoke|use|employ)(ing|s|ed)? (Theorem|Proposition|Lemma|Corollary|Definition|Assumption|part|claim)\b|\b(Theorem|Proposition|Lemma|Corollary|Definition|Assumption) \\ref\{[^}]+\} (gives?|yields?|shows?|makes?|implies|ensures?|provides?|proves?)\b' <target>
rg -n '\\\[|\\begin\{(displaymath|equation\*?|align\*?|gather\*?|multline\*?)\}|\$\$' <target>
rg -n '\\begin\{(smallmatrix|matrix|pmatrix|bmatrix|vmatrix|Vmatrix)\}' <target>
rg -n '\\begin\{(figure|illustrationfigure|visualizationfigure|schematicfigure|financialexhibitfigure|sourceimagefigure|tablevisualfigure)\}|\\includegraphics|\\begin\{tikzpicture\}|\\begin\{tikzcd\}|\\begin\{axis\}' <target>
rg -n '\b(Moreover|Furthermore|In addition|Also|In particular)\b' <target>
rg -n -i '\$[^$]*(\\forall|\\exists|\\exists!)[^$]*\$[^%\n.]*\b(for all|for every|for each|at every( index)?|for some|there exists|there is a unique)\b|\b(for all|for every|for each|at every( index)?|for some|there exists|there is a unique)\b[^%\n.]*\$[^$]*(\\forall|\\exists|\\exists!)[^$]*\$|\b(dummy parameter)\b' <target>
rg -n -i '\\[A-Za-z]+:[^.\n]*,\s*with \$?[A-Z][A-Za-z_0-9]*\\defeq|\$\\exists [^$]*\\ni [^$]*\$ (compact|open)' <target>
rg -n '\\hlt\{(Structural Commentary|Key Insight)\}:' <target>
rg -n '\\hlt\{Structural Commentary\}:[^%\n]*[^\\]$' <target>
rg -n '\\hlt\{Key Insight\}:[^%\n]*\\\\[[:space:]]*(%.*)?$' <target>
rg -n -U '\\end\{definition\}\s*\n\s*\\begin\{example\}' <target>
rg -n '\\\\[[:space:]]*(%.*)?$' <target>
ruby scripts/check_environment_title_breaks.rb <target>
ruby scripts/check_render_aligned_source_lines.rb <target>
ruby scripts/check_by_authority_style.rb <target>
ruby scripts/check_claim_proof_enumeration.rb <target>
```

Treat each verbal-quantifier hit as a presumptive notation-policy violation: use scoped `\forall`, `\exists`, or `\exists!` and retain prose only when it adds specific meaning or context not encoded symbolically. Cold-read every mathematical clause for other prose renderings of notation-capable content because regex gates cannot enumerate them. Rewrite every authority-language hit into a `by`-clause carrying its conclusion. Join every source-line hit unless the newline has genuine rendered or structural meaning, and remove every reported blank line; do not silence either checker by adding an unintended `\\`. The explicit-break census is exhaustive: before rendering, temporarily join the next complete unit at every hit and remove the break when the result remains within 100 horizontal character-equivalents; retain only over-cap cases and exact repository exceptions. The one final scoped render may justify a semantic break for a below-cap span that actually wraps. Review every adjacent definition/example hit against the environment-granularity rule; adjacency is a review trigger, not an automatic merge. Also review repeated parallel setup, long statement scaffolding, and each retained display/matrix exception. A hit may be valid; a clean search may still hide a semantic defect.

## Structural-only profile

Use for reorganization/dependency passes with `BUILD: no`:

- re-check active order, references, canonical labels, figure proximity, source ownership, domain context, and authority flow;
- confirm moved mathematical blocks remained verbatim except reported glue/reference edits;
- confirm no shortcut prerequisite paragraph hides an ordering problem;
- report that render/build validation was intentionally deferred.

## Targeted-block profile

Use for screenshot/named-block refinement:

- run target-file gates and `git diff --check`;
- build if configured;
- inspect the edited line range in the log and the exact rendered page/block;
- report any wider dependency that could not safely be repaired inside the target boundary.

## Fast formalization profile

Use only with `formalize_content.md`:

1. Keep a compact source-order ledger, including each theorem-style statement claim and its proof item(s); perform one semantic pass, then cold-read changed rows and their affected dependants only.
2. Enforce notation-first, then normalize scoped symbolic quantifiers, limits, fractions, scripts, stacked constructs, and local notation before applying the recursive 100-horizontal-character-equivalent rules to every changed prose–inline-math span. Greedily pack complete adjacent units and justify every retained `\\` by a cap/wrap result or an exact repository exception. References/citations count by printed form; flag forced display style and nested vertical stacks for the final render's height/collision check.
3. Run applicable search gates and `git diff --check` once after the target file stabilizes.
4. Select the narrow build owner: the changed numbered file for a subsection, its directory `overview.tex` for a section, or the part-level `overview.tex` for a part. With multiple authorized changed files, use their narrowest common owner within `SCOPE_LEVEL`; never widen to the full document.
5. Run one isolated scope build:

```sh
scope_build_dir="$(mktemp -d /private/tmp/math_notes_scope.XXXXXX)"
ruby scripts/build_latex_scope.rb <scope-owner.tex> "$scope_build_dir"
```

The helper copies the current pre-`\begin{document}` portion of `math.tex`, which preserves its document class, options, metadata, and `parts/base.tex` input; it restores path-derived counters and inputs only the selected owner. Do not substitute a hand-maintained preamble or compile `math.tex`. Inspect scope-local errors and warnings near changed lines. Diagnose unresolved external labels or citations statically without widening the build solely to resolve them.

6. Render every page of `scope_inspection.pdf` once and inspect the changed blocks and touched visuals. Repeat only for a concrete defect found in this final pass.

## Full semantic and render profile

Use for notation-list work with `BUILD: yes`, source intake, and any content workflow explicitly requesting the full profile.

1. Complete first-pass and cold second-pass ledgers.
2. Build outside the repository:

```sh
build_dir="$(mktemp -d /private/tmp/math_notes_alignment.XXXXXX)"
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir="$build_dir" math.tex
```

3. Inspect log warnings for every edited line range.
4. Render every affected page individually at readable resolution and inspect changed equations, inline formulas, commentary, matrices, figures, captions, page breaks, and surrounding text.
5. Repeat until there is no avoidable overflow, sparse tail, collision, weak/missing commentary, claim/proof mismatch, underformalized proof, repeated setup, invalid reference, figure overlap, or unreadable scaling.

Contact sheets and overfull-box scans are navigation aids, not final visual QA.

## Completion report

Report only fields relevant to the workflow, but include: resolved scope/domain/batch/coverage; ledger counts; files changed; substantive decisions; proof/commentary/display/matrix/figure exceptions; notation/source/collection effects; cold pass when required; searches, build/log/page-render results; preserved pre-existing work; blockers; and exact next cursor or completion.
