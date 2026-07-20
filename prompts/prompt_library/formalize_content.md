# Formalize Content — Entry Point

```text
Repository: /Users/lxg/Documents/GitHub/math_notes

Goal: align the selected active LaTeX scope to the repository's canonical scholarly, technical, mathematical, structural, and rendered standard.

Configuration:
- MODE: edit
- SCOPE_LEVEL: <part | section | subsection | file>
- DOMAIN: <auto | registered domain from prompts/standards/domains/README.md | mixed>
- TARGET: <exact parts/... path or unambiguous active-tree cursor>
- START_CURSOR: <beginning | exact resume file>
- FILE_COVERAGE: <all-active | changed-and-new | tracked-modified | untracked-new>
- RUN_BATCH: one-numbered-file
- EXISTING_EDIT_POLICY: supersede-in-scope-unless-protected
- PROTECTED_EXISTING_EDITS: <none | exact paths/labels/blocks explicitly marked preserve>
- MATH_LAYOUT: inline-strict
- NOTATION_POLICY: notation-first-unless-prose-adds-meaning
- INLINE_LINE_BUDGET: 100-horizontal-character-equivalents
- MIN_CONTINUATION_OCCUPANCY: 20-percent
- LINE_BREAK_POLICY: greedy-minimum-hard-breaks
- COMMENTARY_POLICY: required-new-and-rewritten
- PROOF_REFERENCE_POLICY: earlier-theorem-style-only
- PROOF_REFERENCE_LANGUAGE: by-only
- PROOF_COMPLETENESS: full
- CLAIM_PROOF_ENUMERATION: strict-canonical-match
- LONG_PROOF_SEGMENTATION: required-over-half-rendered-page
- PROOFLESS_EXCEPTIONS: none
- CONTENT_POLICY: refine-only
- SOURCE_MATERIAL: <none | exact provided files/pages>
- ALLOW_NEW_SUBSECTION: no
- ALLOW_NEW_SECTION_OR_PART: no
- ALLOW_NEW_ENVIRONMENT_OR_FIGURE_TYPE: no
- BUILD: changed-scope

Load before editing:
1. `prompts/standards/repository_and_scope.md`.
2. `prompts/standards/layout/math_layout.md` — mandatory; preserve all inline/display and no-overflow requirements.
3. `prompts/standards/structure/organization_and_dependencies.md`.
4. `prompts/standards/structure/collection_quality.md`.
5. `prompts/standards/validation.md` (fast formalization profile).
6. Domain overlays: for one explicit DOMAIN, resolve only its row in `prompts/standards/domains/README.md`; for auto/mixed, read the router and load only ledger matches.

After the initial target census, load every applicable conditional module before editing its first matching row:
- mathematical prose/definition/result/calculation/notation -> `prompts/standards/writing/mathematical_style.md`;
- theorem/proof -> `prompts/standards/writing/theorems_and_proofs.md`;
- method/process/algorithm -> `prompts/standards/writing/methods_and_algorithms.md`;
- example/counterexample/intuition/remark/motivation/perspective/principle/exercise/qnbank -> `prompts/standards/writing/expository_environments.md`;
- assumption/convention/model/law/derivation/approximation/dimensionalcheck/empiricalstudy/valuationcase/warning -> `prompts/standards/writing/applied_environments.md`;
- figure/plot/diagram/image/table-like visual -> `prompts/standards/layout/figures.md`;
- durable notation, collision, or macro ownership -> `prompts/standards/structure/notation_lifecycle.md`;
- supplied source material -> `prompts/standards/sources/source_grounding.md`.

Execution:
1. Run `git status --short`; capture the current in-scope diff and any explicitly protected paths/labels/blocks. Read `STRUCTURE_MIGRATION_README.md`, `math.tex`, `parts/base.tex`, relevant notation/overview/target/prerequisite files, and resolve active input order and exact coverage.
2. Apply RUN_BATCH. For a file target, use that file; otherwise choose only the next active numbered subsection at START_CURSOR. Build a compact source-order ledger containing row identity/type/domain, proof or commentary status when applicable, and action. Review adjacent rows together and flag thin formal-owner/explanation pairs for consolidation under `collection_quality.md`.
3. Make one semantic pass in source order. Existing edits inside coverage are input, not wording or structure that must be preserved: rewrite or supersede them whenever the loaded standards support a better result, unless the user explicitly protected that edit. Enforce explicit claims, correct environment and authority, complete proof obligations, scoped notation, the domain overlay, source limits, and strictly `by`-only proof-reference language. Apply `CLAIM_PROOF_ENUMERATION` exactly: roman statement items for multiple conditions/claims; arrow-only items for a simple iff; repeated roman-plus-direction items for an iff within a claim list; cyclic roman implication items for equivalent conditions; and matching direct roman proof items for direct claims. Every claim must be covered in statement order. Apply `LONG_PROOF_SEGMENTATION`: preflight every single-claim proof by operative-stage census and projected height; if its final scoped proof body exceeds half a text page or crosses a page boundary, divide it into three to seven named roman operative-stage items, using alphabetic labels for any subordinate list. Do not itemize individual sentences or routine transitions. Consolidate an immediately adjacent explanatory environment into its short formal owner when it has no independent reference, verification, reusable takeaway, or distinct job; preserve substantive examples. In a titled theorem-style environment, put `\\` immediately after `\hlt{Title}` before body prose, but omit it when the first body construct is `\begin{enumerate}`. Keep patches atomic; do not emit per-row progress messages.
4. Apply NOTATION_POLICY before layout: use established notation by default for mathematical relations, predicates, quantifiers, maps, definitions, set builders, implications/equivalences, recurrences, convergence, and bounds. Retain prose only when it adds interpretation, context, scope, assumptions, proof architecture, or other meaning not encoded symbolically; use scoped `\forall`, `\exists`, or `\exists!` instead of verbal quantifier scaffolding. Then normalize required `\limits`, fractions, scripts, and stacked constructs, and apply the recursive 100-horizontal-character-equivalent preflight in `math_layout.md` to every changed prose–inline-math span. For a span expected to wrap, also preflight the terminal remainder and repair a projected remainder below 20 equivalents. Greedily pack consecutive complete units before rendering: remove each candidate `\\` when the joined span remains within the cap; retain or reposition it only when joining would exceed the cap or an exact structural exception requires it. Count printed references/citations, not command names or label keys; split or compress semantically when over budget or projected to create a sparse tail without omitting needed content. Flag borderline width, forced display style, or nested vertical stacks for the one final render.
5. Apply the render-aligned source-line rule in `mathematical_style.md`: join physical prose/item continuations that TeX would render as spaces, remove every blank line inside formal statements/proofs, retain newlines only for minimal explicit rendered breaks or genuine structure, and never add `\\` merely for source formatting, sentence endings, or proof-step boundaries. Census every retained `\\` with the validation search and remove it unless its joined-span test or an exact repository exception justifies it. Cold-read only changed rows and rows whose authority, notation, reference, or placement they affect. Run applicable search gates and `git diff --check` once after the file stabilizes.
6. Run exactly one isolated changed-scope build under the fast formalization profile; never build all of `math.tex`. Build the changed numbered file for a subsection, the owning `overview.tex` for a section, or the part `overview.tex` for a part, using the live `math.tex` preamble and `parts/base.tex`. Render that scope once and inspect its log and every produced page. Measure each reviewed single-claim proof against the available text height; a body over half a page or crossing a page boundary fails unless it has the required outer operative-stage enumeration. Inspect every wrapped paragraph/item tail against `MIN_CONTINUATION_OCCUPANCY`; a continuation under 20% fails even when it contains only a reference or formula fragment. If a greedily packed below-cap span nevertheless wraps, retain or reposition at most one `\\` at a complete semantic boundary. Rebuild or rerender only for that concrete wrap, a missing long-proof segmentation, a below-threshold continuation, or another actual current-edit overflow, collision, broken local reference, or unreadable visual.
7. Stop at the active file boundary and report the next cursor.

Final report: scope/domain/file and next cursor; pre-existing in-scope edits superseded and explicitly protected edits retained; rows changed and substantive proof/environment/notation/source decisions; display/matrix/figure exceptions; horizontal-budget preflight, search, diff, changed-scope build, log, and one-pass scope-render results; preserved out-of-scope work and genuine blockers.
```

For existing edits/new files only, use `FILE_COVERAGE: changed-and-new`. Use `COMMENTARY_POLICY: required-all-reviewed` when every reviewed theorem-style result needs the commentary pair. Keep `RUN_BATCH: one-numbered-file` unless the selected scope is already one small file and the user explicitly accepts a broader batch.
