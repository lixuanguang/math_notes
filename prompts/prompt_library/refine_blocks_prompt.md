# Refine Selected Blocks — Entry Point

```text
Repository: /Users/lxg/Documents/GitHub/math_notes

Goal: refine only the blocks explicitly named by the user or visible in attached screenshots. Do not perform source intake, broad-file formalization, or unrelated cleanup.

Configuration:
- MODE: edit
- DOMAIN: <auto | math | computer-science | electronic-engineering | quant-finance | fundamental-finance | physics | mixed>
- TARGET: <exact parts/... file and block/label, or screenshot-selected block>
- MATH_LAYOUT: inline-strict
- COMMENTARY_POLICY: required-new-and-rewritten
- PROOF_REFERENCE_POLICY: earlier-theorem-style-only
- PROOF_COMPLETENESS: full
- BUILD: yes

Load before editing:
1. `prompts/standards/repository_and_scope.md`.
2. `prompts/standards/writing/mathematical_style.md`.
3. `prompts/standards/layout/math_layout.md` — mandatory, including rendered no-overflow checks.
4. `prompts/standards/validation.md` (targeted-block profile).
5. `prompts/standards/domains/README.md`, then only the configured or target-matched domain overlay(s).
6. Load only the block modules present in TARGET: `prompts/standards/writing/theorems_and_proofs.md`, `prompts/standards/writing/methods_and_algorithms.md`, `prompts/standards/writing/expository_environments.md`, `prompts/standards/writing/applied_environments.md`, and/or `prompts/standards/layout/figures.md`.
7. Load `prompts/standards/structure/organization_and_dependencies.md`, `prompts/standards/structure/notation_lifecycle.md`, or `prompts/standards/structure/collection_quality.md` only when the local repair affects those concerns.

Execution:
1. Run `git status --short`; read the target file, complete target environment/proof, nearby style, and earlier owners needed to check authority and notation. Preserve unrelated work.
2. Keep the boundary tight: edit only the named/visible block plus necessary local labels, references, first-use notation, proof/commentary lines, or paired figure callout.
3. Apply the selected environment module completely. Preserve source-proportional claims, full proof obligations, semantic enumeration, correct authority, and readable compact notation. Choose typed methods by output; distinguish examples from counterexamples and intuition; keep applied evidence in its proper owner; classify a materially touched figure by role.
4. For theorem-style targets, enforce the exact Structural Commentary / Key Insight policy, placement, order, quality, and terminal `\\` syntax.
5. Use proof items only for independent claims, directions, implications, real cases, or named stages. Keep a single direct argument as compact prose.
6. If the screenshot/request reveals a dependency or placement defect that cannot safely be fixed inside TARGET, complete safe local repairs and report the exact wider blocker.
7. Run target search gates, `git diff --check`, the configured build, edited-line warning inspection, and rendered inspection of the exact changed block/page. Iterate until changed math and text have no avoidable overflow, collision, or sparse tail.

Report the exact block changed, DOMAIN, main statement/proof/environment/commentary/figure decisions, any necessary local collection effects, validation/render results, preserved pre-existing work, and wider blockers.
```
