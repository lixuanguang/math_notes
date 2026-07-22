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
- SPARSE_TAIL_REPAIR: notation-and-semantic-compression-before-breaks
- LINE_BREAK_POLICY: greedy-minimum-hard-breaks
- COMMENTARY_POLICY: required-new-and-rewritten
- PROOF_REFERENCE_POLICY: earlier-theorem-style-only
- PROOF_REFERENCE_LANGUAGE: by-only
- PROOF_INFERENCE_LANGUAGE: by-only-no-give-yield
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

Authoritative pass order:
1. mathematical correctness, explicit scope, and complete proof obligations;
2. notation-first compression without loss of meaning;
3. statement/proof structure and exact claim matching;
4. deterministic line packing and render-aligned source;
5. proof-specific Structural Commentary and Key Insight;
6. mechanical, build, and visual validation.

Complete the passes in this order. A later pass may not undo an earlier one: layout cannot remove a hypothesis, brevity cannot replace a proof mechanism with a slogan, and source formatting cannot introduce a rendered break.

Execution:
1. Run `git status --short`; record the in-scope diff and protected blocks. Read `STRUCTURE_MIGRATION_README.md`, `math.tex`, `parts/base.tex`, and only the relevant overview, notation, target, and prerequisite files. Resolve active input order and exact coverage.
2. Apply RUN_BATCH: use the requested file, or only the next active numbered subsection at START_CURSOR. Make a compact source-order ledger of row/type/domain, claims, proof items or operative stages, commentary status, and action. Review adjacent owner/explanation pairs together under `collection_quality.md`.
3. Make one correctness-and-structure pass. Supersede in-scope existing edits unless explicitly protected. Enforce correct environment/authority, explicit claims, full proofs, domain and source limits, and the exact canonical enumeration in `theorems_and_proofs.md`. Cover every claim in statement order. Segment a single-claim proof into three to seven named roman operative stages when it has at least four substantial stages, projects beyond half a page, or crosses a page in the scoped render. Consolidate a dependent one-line adjacent explanation into its formal owner; preserve substantive examples. In every proof and commentary line, use conclusion-first direct notation or a `by`-clause; reject `give/gives/gave/yield/yields/yielded` and the other prohibited authority forms.
4. Make one notation-and-layout pass. Prefer established symbolic relations, predicates, quantifiers, maps, definitions, set builders, implications, equivalences, recurrences, convergence statements, and bounds whenever prose adds no meaning. Preserve prose that supplies assumptions, construction choices, architecture, interpretation, or scope. Normalize `\limits`, fractions, scripts, and stacked constructs. Then apply the authoritative line decision order in `math_layout.md` to every changed span: compress first, form complete semantic units, pack through the 100-equivalent cap, and break before the first unit that would exceed it. Never leave an over-cap multi-unit item for TeX to wrap; never separate a lead-in such as `Define` from its formula; never create a break for a sentence ending or source formatting. Apply sparse-tail repair to the whole governing unit before changing a break. Use the exact titled-environment opening rule and its direct-enumeration exception.
5. Draft Structural Commentary and Key Insight only after the proof stabilizes, from its actual proof ledger. Both lines must pass the proof-specificity tests in `theorems_and_proofs.md`; generic architecture slogans fail even when their length is compliant. Apply the render-aligned source-line rule, remove blank lines inside formal blocks, and retain physical newlines only for genuine structure or justified explicit breaks.
6. Cold-read changed rows and affected dependants, then run the applicable search gates, source-line/title/authority/claim checkers, and `git diff --check` once. Fix every orphaned lead-in, unjustified break, claim mismatch, prohibited inference phrase, and notation-cap or sparse-tail defect before building.
7. Run exactly one isolated changed-scope build under the fast profile—never full `math.tex`—using `scripts/build_latex_scope.rb`, which carries the live `math.tex` preamble and `parts/base.tex`. Render and inspect every produced page. A continuation below 20%, current-edit overflow/collision, unreadable inline stack, broken local reference, or unsegmented over-half-page proof fails. Rebuild only after repairing a concrete rendered defect.
8. Stop at the active file boundary and report the next cursor.

Final report: scope/domain/file and next cursor; pre-existing in-scope edits superseded and explicitly protected edits retained; rows changed and substantive proof/environment/notation/source decisions; display/matrix/figure exceptions; horizontal-budget preflight, search, diff, changed-scope build, log, and one-pass scope-render results; preserved out-of-scope work and genuine blockers.
```

For existing edits/new files only, use `FILE_COVERAGE: changed-and-new`. Use `COMMENTARY_POLICY: required-all-reviewed` when every reviewed theorem-style result needs the commentary pair. Keep `RUN_BATCH: one-numbered-file` unless the selected scope is already one small file and the user explicitly accepts a broader batch.
