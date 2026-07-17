# Math Notes Alignment Requirements

## 1. Objective and authority

Align `/Users/lxg/Documents/GitHub/math_notes` into a mathematically correct, explicit, formal, notation-driven, succinct, logically ordered, and visually consistent reference.

Canonical editing sequence:

> Make the mathematics explicit, formalize it, replace boilerplate with notation, reuse applicable earlier results, then compress and verify the rendered page.

Never obtain succinctness by hiding hypotheses, skipping proof logic, or using opaque notation.

A successful build, clean searches, correct environment counts, and a visually tidy page are necessary but not sufficient. Completion is semantic: every formal environment must independently pass the explicit-formal-notation-succinct review below.

Instruction precedence is: current user prompt; safety and mathematical correctness; this file; `STRUCTURE_MIGRATION_README.md`, `math.tex`, `parts/base.tex`, and active `parts/` content; nearby style; legacy prompts.

## 2. Run configuration

| Setting | Default | Meaning |
| --- | --- | --- |
| `MODE` | `edit` | Use `audit-only` only when requested. |
| `SCOPE_LEVEL` | required | `part`, `section`, `subsection`, or `file`. |
| `TARGET` | required | Exact path or unambiguous part-scoped cursor. |
| `START_CURSOR` | `beginning` | Exact file when resuming. |
| `FILE_COVERAGE` | `all-active` | `all-active`, `changed-and-new`, `tracked-modified`, or `untracked-new`. |
| `RUN_BATCH` | `one-numbered-file` | Recommended high-assurance batch; `all-selected` is permitted only without relaxing environment-level review. |
| `MATH_LAYOUT` | `inline-strict` | `inline-strict`, `inline-first`, or `preserve-essential-displays`. |
| `COMMENTARY_POLICY` | `required-new-and-rewritten` | May be `required-all-reviewed` or `preserve-existing`. |
| `PROOF_REFERENCE_POLICY` | `earlier-theorem-style-only` | See Section 5.4. |
| `PROOF_COMPLETENESS` | `full` | Every reviewed theorem-style result needs a full proof unless its label is listed in `PROOFLESS_EXCEPTIONS`. |
| `PROOFLESS_EXCEPTIONS` | `none` | Exact labels intentionally allowed to remain proofless. |
| `CONTENT_POLICY` | `refine-only` | Use `source-grounded` for provided-source intake. |
| `ALLOW_NEW_SUBSECTION` | `no` | Permit only when explicitly set to `yes`. |
| `ALLOW_NEW_SECTION_OR_PART` | `no` | Requires explicit permission. |
| `BUILD` | `yes` | Build outside the repository. |

`FILE_COVERAGE` meanings:

- `all-active`: every `.tex` file reachable through active `\input` edges in scope, including active untracked files.
- `changed-and-new`: tracked modified plus untracked `.tex` files in scope.
- `tracked-modified` or `untracked-new`: only that Git-status class.

Inspect inactive untracked files for ownership, but do not add an input edge without permission. Capture the coverage set before editing.

`MATH_LAYOUT` modes: `inline-strict` enforces Section 5.5; `inline-first` additionally permits a genuinely long derivation display when compression would harm clarity; `preserve-essential-displays` preserves useful existing displays but creates none without structural need.

`COMMENTARY_POLICY` modes: `required-new-and-rewritten` applies to new or materially rewritten theorem-style results; `required-all-reviewed` applies to every reviewed theorem-style result; `preserve-existing` adds none. A material rewrite changes the statement, claims, hypotheses, conclusion, proof argument, or result decomposition—not typography alone.

`RUN_BATCH: one-numbered-file` means a part or section target defines traversal, while one invocation completes only the next numbered subsection file and reports the exact next cursor. This is the default because broad section runs have repeatedly passed aggregate checks while missing environment-level defects. `all-selected` must still stop at a file boundary rather than trade semantic quality for coverage.

## 3. Repository, structure, and safety

- `parts/` is the sole canonical LaTeX body. Do not recreate the retired `sections/` tree.
- `math.tex` is the entry point; `parts/base.tex` owns macros and environments; `parts/00_notations/` owns durable notation; `STRUCTURE_MIGRATION_README.md` owns placement.
- Ignore Lean, `MathNotes/`, and `blueprint/` unless requested.
- Visible book depth is exactly `\part -> \section -> \subsection`. Do not add book-body `\subsubsection` or `\paragraph`.
- Keep overview files structural. Extend the natural existing owner, keep prerequisites before dependants, prefer cross-references to duplication, and keep figures near their introducing text.
- Add no skeletons or placeholders. A new subsection requires `ALLOW_NEW_SUBSECTION: yes`; a new section or part requires explicit permission.
- Outside-scope edits are limited to necessary input edges, affected labels/references, recurring notation, prerequisite promotion, or paired figure/text repairs; report them.

Before editing, run `git status --short` and read the structural references, target overviews/files, nearby prerequisites, labels, notation, and figures.

Preserve all unrelated tracked and untracked work. Do not reset, checkout, restore, revert, clean, delete, stage, commit, push, or edit repository-generated PDF/auxiliary files. Use focused patches. If an overlapping file changes unexpectedly or a patch fails, stop on that file and report the conflict.

## 4. Execution workflow

Traverse active `\input` order. The atomic unit of completion is one formal environment, not a file, page, grep result, or environment count. Never replace semantic review with a part-wide regex sweep.

Before editing a numbered file, make an internal logical-unit ledger in source order. A theorem-style statement and its immediately following proof form one row; each definition, method, example, remark, perspective, and algorithm forms its own row. Record type/label, `COMPONENT_COUNT` or `CLAIM_COUNT`, proof status, required commentary status, and final rendered page. Do not mark rows in bulk.

Process exactly one ledger row at a time. Read the whole environment, its proof, and the immediately relevant earlier owners; then apply:

1. **Census:** count independent definition components, claims, cases, or steps.
2. **Explicit:** expose objects, domains, hypotheses, quantifiers, conclusions, and proof mechanisms.
3. **Formal:** bind notation and replace vague prose with exact relations.
4. **Notation-driven:** audit every mathematical phrase and replace prose with bound, established notation wherever possible without becoming opaque.
5. **Reuse:** find any applicable earlier theorem-style result.
6. **Succinct:** remove repetition without losing meaning.
7. **Structure:** choose the correct environment and claim/proof items.
8. **Pack:** optimize inline layout and semantic line breaks.
9. **Verify:** compile, render, inspect, and repeat until compliant.

After each row, perform this adversarial check before moving on:

1. Is every object, domain, hypothesis, quantifier, and conclusion explicit?
2. Would removing any sentence delete an independent component or claim that should be itemized?
3. Is setup repeated across items instead of factored into a preamble?
4. Does every proof line perform a stated obligation through an equation, estimate, construction, or applicable earlier result?
5. Has every replaceable mathematical phrase become established notation without hiding logic?
6. Are commentary lines genuinely structural/insightful and maximally concise?
7. Does the rendered block have clean semantic breaks and no sparse tail?

If any answer exposes a defect, rewrite the entire affected environment again. Do not stop at the longer explicit/formal draft, a surface copyedit, or a passing search.

Keep edits atomic: one patch should normally change one ledger row plus its necessary local labels/references. After each row, emit a concise progress checkpoint such as `[7/18] thm:... — rewritten; 2 claims; proof complete; commentary checked.` Do not announce file completion without row-level checkpoints.

After all ledger rows in the file are edited, perform a cold second pass in source order without relying on the first-pass decisions. Recount components and claims, reread every proof and commentary line, and inspect every affected rendered block. Only then may the file be complete. Selecting a scope authorizes continuous editing without approval pauses.

Under `refine-only`, preserve intended coverage, correct local defects, replace weak passages when necessary, move/split/promote content for structure, and add no unrelated theory.

For source intake, use only provided sources and existing repository content. Classify pages before editing:

- outline only: placement and coverage audit, no mathematical insertion;
- substantive: conservative source-supported integration;
- mixed: outline for placement, substantive pages for content.

Do not browse, guess unreadable content, or closely paraphrase long source passages. Mark genuine uncertainty with a concise `% TODO(source): ...`.

When a prompt-library workflow references this file, the workflow inherits the complete standards in Sections 4-7 unless it explicitly narrows scope, source material, or build behavior. A narrow target, source-grounded intake run, structural reorganization pass, or dependency-flow pass may restrict what is edited, but it does not relax the applicable writing, proof, layout, citation, safety, or validation standard for any environment it touches. New or materially amended source-grounded content must be finalized locally; do not leave a rough block for a later formalization prompt when the same source and earlier repository content already support the repair.

## 5. Canonical writing standard

### 5.1 Formal language and notation

- Bind every local symbol before use. Theorem-style statements must contain their own local objects, hypotheses, and conclusions without restating whole earlier theories.
- A theorem-style statement, definition, or method preamble must not use a reference to a definition, theorem, proposition, lemma, corollary, example, or remark as a substitute for the actual local hypothesis or object. State the needed condition directly when it is short enough, e.g. a local Lipschitz condition, extension order, admissible-solution convention, graph notation, or compactness hypothesis. Use references in proof steps only when they supply a genuine earlier result.
- Formal definitions, claims, proofs, methods, and calculations use `\forall`, `\exists`, and `\exists!` instead of mathematical “for all/every/each” and “there exists/is a unique.” Keep prose quantifiers only in genuine exposition.
- Prefer `\defeq`, maps, set-builder notation, recurrences, `\implies`, and `\iff` when clearer.
- During the explicit-formal-notation-succinct loop, inspect every sentence after the explicit draft. Replace mathematical prose wherever possible: domains and membership by `x\in X`; quantifiers by `\forall`, `\exists`, or `\exists!`; maps by `f:X\to Y`; definitions by `\defeq`; conditions by relations; implication/equivalence by `\implies`/`\iff`; convergence by `\to`; bounds by inequalities; and parallel cases by symbolic items. Repeat this audit after compression because rewriting can reintroduce prose.
- Prose may remain only when it conveys motivation, interpretation, proof architecture, a necessary logical transition, or meaning that notation would obscure. Do not preserve a verbal mathematical relation merely because it is grammatical, and do not invent cryptic symbols or use `\text{...}` to disguise prose as notation.
- Avoid “obvious,” “clearly,” unexplained “similarly,” and vague symmetry shortcuts. State the shortest operative equality, implication, bound, construction, or limit argument.
- Prefer one complete sentence per source line. Do not split a sentence or equation merely for source wrapping.

### 5.2 Enumeration

Enumeration is semantic, not decorative. Shared setup, motivation, interpretation, caveats, and summaries stay outside lists.

Run a component census for definitions and other non-theorem environments. Two parallel objects, constructions, characterizations, cases, or independently referable components normally require items even when they occur in a postamble. If a postamble introduces two or more parallel families or tests, use a second compact list when clearer than enlarging the first.

Factor every phrase, domain, tuple, parameter, or hypothesis shared by all items into the preamble. Each item should contain only its distinguishing notation or condition. After drafting a list, compare the items token by token and factor repeated setup before accepting it.

Use:

```tex
\begin{enumerate}[label=(\roman*)]
\setlength{\itemsep}{0pt}
\item ...
\end{enumerate}
```

Items may be distinct definitions, claims, conditions, proof stages/directions/cases, executable steps, computational cases, or named variants.

For a simple iff proof:

```tex
\begin{enumerate}[label=\roman*.]
\setlength{\itemsep}{0pt}
\item[$(\Rightarrow)$] ...
\item[$(\Leftarrow)$] ...
\end{enumerate}
```

For equivalent conditions, use flat items such as `\item[$(i)$]$\Rightarrow(ii)$ ...`. Do not create label-only outer items or unnecessary nested lists.

### 5.3 Environment decisions

| Environment | Required form |
| --- | --- |
| Definition | One component: compact prose/formula. Two or more parallel objects, constructions, characterizations, or tests: itemize them; factor common setup first. A parallel postamble may be a second list. After `\item \hlt{Keyword}:` begin with notation or a condition and do not echo the keyword. |
| Theorem/proposition/lemma/corollary | Setup before claims. One conclusion: no list. Two or more independent conclusions: claim items or a logical-weight split. |
| Proof | Direct argument: compact prose. Multiple statement claims: matching proof items in the same order. Iff directions may remain inside their matching claim item when concise. |
| Method/process | Setup first; enumerate genuine operative steps. A one-line convention remains prose. |
| Example | Setup, computation, conclusion. Enumerate only distinct steps/cases/comparisons. |
| Remark | One compact paragraph; no enumerate or commentary labels. |
| Perspective/motivation/principle | Concise prose; use semantic `\\` breaks between context, setup/contrast, consequence, and interpretation when several roles occur. |
| Algorithm | Use a prose method unless real pseudocode helps. Otherwise use repository `breakablealgorithm`/`algorithmic` style with supported inputs, outputs, claims, and `alg:...` label. |
| Exercise/question bank | Retain useful supported mathematics; otherwise a concise exercise or source TODO. Never make it the sole prerequisite for later formal results. |

### 5.4 Theorem-style results and proofs

The theorem-style category is exactly `theorem`, `proposition`, `lemma`, and `corollary`.

**Claim census.** A conclusion is distinct if it can be removed without changing another conclusion, has another logical type, or needs its own proof obligation. Characterization, existence, uniqueness, bound, measurability, convergence, representation, and continuity are distinct types. `Moreover`, `Furthermore`, `In addition`, `Also`, conclusion-bearing `In particular`, or an `and` joining different conclusion types trigger a recount. If `CLAIM_COUNT >= 2`, use claim items or split the result. Proof items must cover statement items one-for-one in the same order and conceptual labels.

Split a heavy result by logical weight: keep the main proof mechanism as the theorem/proposition and immediate consequences as corollaries rather than peer theorems.

**Proof completeness.** Under `PROOF_COMPLETENESS: full`, every reviewed theorem-style result must have a complete proof unless its exact label appears in `PROOFLESS_EXCEPTIONS`. Convert “Proof idea,” “Sketch,” “standard argument,” bare theorem-name invocations, and hand-wavy transitions into explicit proofs using definitions or applicable earlier results, then formalize and compress them. Do not delete a weak proof merely because it is difficult. If a proof needs unavailable prerequisite machinery, repair the earlier ownership when authorized or report the exact blocker; do not mark the result complete. A listed proofless exception must still have a mathematically complete statement and required commentary.

Proof preambles and proof items undergo the same explicit-formal-notation-succinct loop as statements. A proof item is not complete merely because its conclusion is plausible: show the operative equality, inequality, limit, construction, or hypothesis check. Handle degenerate cases when notation would otherwise divide by zero, invoke an empty family, or assume uniqueness implicitly.

**Earlier-result reuse.** After explicit formalization, search only earlier active theorems, propositions, lemmas, and corollaries. Cite one only when it precedes the current result, its hypotheses hold, its conclusion supplies the exact step, and citation is clearer or shorter than repetition. Never use a later result or a definition, example, remark, method, perspective, or algorithm as proof authority. Keep short calculations inline; if no result applies, prove the step directly.

Use result references as `$P$ by Theorem \ref{...}.` or `By Lemma \ref{...}, $P$.` Never make a result the subject of “gives,” “yields,” “shows,” “makes,” “implies,” “ensures,” or “provides.”

**Commentary.** Under `required-new-and-rewritten`, every new or materially rewritten theorem-style result requires both lines after proof items and immediately before `\end{proof}`:

```tex
\hlt{Structural Commentary}: <proof architecture or dependency>.\\
\hlt{Key Insight}: <intuition or invariant>.
```

For a proofless result, place both before the result ends. Apply the explicit-formal-notation-succinct loop to both lines. Structural Commentary names the actual proof architecture or dependency, uses notation when it shortens the mechanism, and should normally contain at most 18 lexical words. Key Insight states one invariant or idea, normally in at most 12 lexical words. Each should fit one rendered line when feasible. Neither may restate the result or carry required hypotheses or conclusions. A short proof is not an exception. `COMMENTARY_POLICY` does not automatically add this pair to non-theorem environments.

### 5.5 Inline mathematics and rendered layout

Under `inline-strict`:

- Single definitions, identities, inequalities, set-builder expressions, integral formulas, and finite equality/proof chains must be inline after compression.
- Retain a display only for a matrix with at least four rows, an irreducible two-dimensional/multiline structure, an actually referenced numbered equation, or a specialized environment requiring display behavior. Length or emphasis alone is not an exception.
- Matrices with at most three rows use inline `smallmatrix` with delimiters, e.g. `$A=\left(\begin{smallmatrix}a&b\\c&d\end{smallmatrix}\right)$`. A displayed matrix must have at least four rows; record its row count.
- Inventory every retained display and record its exact exception.

Prefer inline formulas, but preserve readability through notation and semantic sentences. Use `\limits` on bounded/indexed large operators (`\sum`, `\prod`, `\coprod`, `\bigoplus`, `\bigcup`, `\bigcap`, `\bigsqcup`, `\lim`, `\limsup`, `\liminf`, `\inf`, `\sup`, `\min`, `\max`). Convert arithmetic slash fractions to `\frac{...}{...}` while preserving quotient notation such as `G/H`. Do not use `\quad`/`\qquad` as prose separators or `\text{...}` merely to force prose into math.

Use deliberate `\\` only between complete semantic units, not inside a sentence/equality chain. Dense prose should separate setup, contrast, construction, consequence, and interpretation, then be re-rendered.

Any continuation line with fewer than five lexical words—or a comparably short mathematical tail—triggers this repair order:

1. remove repetition;
2. use established notation or a local abbreviation;
3. join needlessly separated premise and conclusion;
4. split genuine logical units;
5. use a display only if the active layout exception independently applies.

It may remain only as an intentional irreducible unit whose alternatives reduce clarity. Never repair layout by shrinking fonts, changing margins, arbitrary spacing, mid-expression breaks, or unnecessary displays. If rendered lines overflow or become sparse, first introduce compact semantic notation or a local relation/order/convention, then reread the statement and proof with that notation.

## 6. Dependencies, labels, notation, and figures

- Definitions, notation, and prerequisites precede use. Formal results/methods must not depend on remarks or examples; promote or move essential content.
- Resolve ownership structurally by reordering, moving, splitting, promoting, or citing the correct earlier owner—not by an ad hoc prerequisite paragraph.
- Use one stable descriptive label per anchor with established prefixes (`def:`, `thm:`, `prop:`, `lem:`, `cor:`, `meth:`, `ex:`, `rem:`, `per:`, `fig:`, `alg:`). Update every affected reference and remove stale, missing, or duplicate labels.
- Read the collision index and relevant notation file. Disambiguate reused glyphs by font, decoration, arguments, or local declaration. Reuse base macros; add global notation/macros only when durable across major sections.
- Figures must clarify mathematics. Prefer editable TikZ, nearby house colors/weights, essential labels only, and succinct captions; move explanatory prose, legends, and equations into a succinct color-coded caption when clearer.
- Every touched TikZ figure requires a temporary standalone compile, rendered preview, visual inspection, and iteration. Source or compile inspection alone is insufficient.

## 7. Validation and completion

Before marking a file complete, inspect every formal environment and review matches for:

```sh
rg -n -i '\b(for all|for every|for each|there exists|there is a unique)\b' <target>
rg -n -i '(Theorem|Proposition|Lemma|Corollary) \\ref\{[^}]+\} (gives|give|yields|shows|makes|implies|ensures|provides)\b' <target>
rg -n '\\\[|\\begin\{(displaymath|equation\*?|align\*?|gather\*?|multline\*?)\}|\$\$' <target>
rg -n '\\begin\{(smallmatrix|matrix|pmatrix|bmatrix|vmatrix|Vmatrix)\}' <target>
rg -n '\b(Moreover|Furthermore|In addition|Also|In particular)\b' <target>
```

These are review gates, not blind replacements and not evidence that the semantic ledger is complete.

At scope completion:

1. Reconcile the environment ledger: every row received an individual first pass and cold second pass; report reviewed, rewritten, retained, split, and proofless-exception counts.
2. Reconcile `FILE_COVERAGE`: every eligible file in the active batch was reviewed.
3. Reconcile component/claim counts, factored list preambles, the sentence-by-sentence prose-to-notation audit, proof completeness, and one-to-one statement/proof coverage.
4. Reconcile every proof citation: earlier order, theorem-style category, matching hypotheses/conclusion, and genuine usefulness.
5. Reconcile `COMMENTARY_POLICY` for quality and placement, not merely matching counts.
6. Reconcile displays and matrix row counts under `MATH_LAYOUT`.
7. Check dependency order, labels/references, notation, input edges, structural depth, retired `sections/` inputs, and touched figures.
8. Run `git diff --check` and distinguish pre-existing failures from current edits.
9. Build outside the repository:

```sh
build_dir="$(mktemp -d /private/tmp/math_notes_alignment.XXXXXX)"
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir="$build_dir" math.tex
```

10. Render every affected page individually at readable resolution and inspect each changed environment. Also inspect the build log for the edited line range, distinguishing unrelated warnings elsewhere. Contact sheets and overfull-box scans are navigation aids, not final visual QA. Iterate until no avoidable display, sparse tail, missing or weak commentary, underformalized proof, missed enumeration, repeated item setup, claim mismatch, invalid reference, overfull edited line, or figure collision remains.

The active batch is complete only when all selected files satisfy these rules, the isolated build passes unless disabled, unrelated work is preserved, and only genuine out-of-scope/source/authorization issues remain. Under `RUN_BATCH: one-numbered-file`, completing one file is success even when the wider part or section remains; report the exact next cursor. Under `all-selected`, stop at a file boundary if rigor would otherwise fall.

The final report must state: scope, active batch, and coverage completed; ledger counts; files changed; main structural/mathematical/environment/notation/figure changes; result splits, proof additions, proofless exceptions, and proof-reference changes; commentary, display, and matrix exceptions; cold-pass and build results; preserved pre-existing work; remaining blockers; and the exact next cursor or explicit wider-scope completion.
