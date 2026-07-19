# Math Notes Alignment Requirements

## 1. Objective and authority

Align `/Users/lxg/Documents/GitHub/math_notes` into a mathematically correct, explicit, formal, notation-aware, succinct, logically ordered, and visually consistent reference.

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
| `DOMAIN` | `auto` | `auto`, `math`, `quant-finance`, `fundamental-finance`, `physics`, or `mixed`; apply Section 7.11 overlays. |
| `TARGET` | required | Exact path or unambiguous part-scoped cursor. |
| `START_CURSOR` | `beginning` | Exact file when resuming. |
| `FILE_COVERAGE` | `all-active` | `all-active`, `changed-and-new`, `tracked-modified`, or `untracked-new`. |
| `RUN_BATCH` | `one-numbered-file` | Recommended high-assurance batch; source-intake prompts may use `all-source-supported`; `all-selected` is permitted only without relaxing environment-level review. |
| `MATH_LAYOUT` | `inline-strict` | `inline-strict`, `inline-first`, or `preserve-essential-displays`. |
| `COMMENTARY_POLICY` | `required-new-and-rewritten` | May be `required-all-reviewed` or `preserve-existing`. |
| `PROOF_REFERENCE_POLICY` | `earlier-theorem-style-only` | See Section 5.4. |
| `PROOF_COMPLETENESS` | `full` | Every reviewed theorem-style result needs a full proof unless its label is listed in `PROOFLESS_EXCEPTIONS`. |
| `PROOFLESS_EXCEPTIONS` | `none` | Exact labels intentionally allowed to remain proofless. |
| `CONTENT_POLICY` | `refine-only` | Use `source-grounded` for provided-source intake. |
| `ALLOW_NEW_SUBSECTION` | `no` | Permit only when explicitly set to `yes`. |
| `ALLOW_NEW_SECTION_OR_PART` | `no` | Requires explicit permission. |
| `ALLOW_NEW_ENVIRONMENT_OR_FIGURE_TYPE` | `no` | Permit only through an explicit source-intake gap protocol. |
| `BUILD` | `yes` | Build outside the repository. |

`FILE_COVERAGE` meanings:

- `all-active`: every `.tex` file reachable through active `\input` edges in scope, including active untracked files.
- `changed-and-new`: tracked modified plus untracked `.tex` files in scope.
- `tracked-modified` or `untracked-new`: only that Git-status class.

Inspect inactive untracked files for ownership, but do not add an input edge without permission. Capture the coverage set before editing.

`DOMAIN: auto` means infer the domain for each ledger row from the source, local owner, notation, and active content. Use `mixed` only when the scope truly combines domains; then apply the narrowest correct overlay row by row. A domain overlay changes required context and evidence standards, not repository safety rules or proof authority rules.

`MATH_LAYOUT` modes: `inline-strict` enforces Section 5.5; `inline-first` additionally permits a genuinely long derivation display when compression would harm clarity; `preserve-essential-displays` preserves useful existing displays but creates none without structural need.

`COMMENTARY_POLICY` modes: `required-new-and-rewritten` applies to new or materially rewritten theorem-style results; `required-all-reviewed` applies to every reviewed theorem-style result; `preserve-existing` adds none. A material rewrite changes the statement, claims, hypotheses, conclusion, proof argument, or result decomposition—not typography alone.

`RUN_BATCH: one-numbered-file` means a part or section target defines traversal, while one invocation completes only the next numbered subsection file and reports the exact next cursor. This is the default because broad section runs have repeatedly passed aggregate checks while missing environment-level defects. `RUN_BATCH: all-source-supported` is reserved for source-intake prompts: process every source-supported target file allowed by the configured structure and permissions in active order, without asking whether to continue to the next subsection, section, or part. `all-selected` must still stop at a file boundary rather than trade semantic quality for coverage.

## 3. Repository, structure, and safety

- `parts/` is the sole canonical LaTeX body. Do not recreate the retired `sections/` tree.
- `math.tex` is the entry point; `parts/base.tex` owns macros and environments; `parts/00_notations/` owns durable notation; `STRUCTURE_MIGRATION_README.md` owns placement.
- Ignore Lean, `MathNotes/`, and `blueprint/` unless requested.
- Visible book depth is exactly `\part -> \section -> \subsection`. Do not add book-body `\subsubsection` or `\paragraph`.
- Keep overview files structural. Extend the natural existing owner, keep prerequisites before dependants, prefer cross-references to duplication, and keep figures near their introducing text.
- Add no skeletons or placeholders. A new subsection requires `ALLOW_NEW_SUBSECTION: yes`; a new section or part requires explicit permission.
- Preserve intentional existing scaffolding. Do not rename a broad active subsection to the name of its current single content block merely because only that block is present today; subsection titles may reserve room for planned future material. Do not remove or deprecate active empty subsection inputs when they are existing placeholders. Remove or deprecate an active subsection only when the current reorganization moved its substantive content elsewhere and the emptied subsection is no longer the natural future owner.
- Outside-scope edits are limited to necessary input edges, affected labels/references, recurring notation, prerequisite promotion, or paired figure/text repairs; report them.

Before editing, run `git status --short` and read the structural references, target overviews/files, nearby prerequisites, labels, notation, and figures.

Preserve all unrelated tracked and untracked work. Do not reset, checkout, restore, revert, clean, delete, stage, commit, push, or edit repository-generated PDF/auxiliary files. Use focused patches. If an overlapping file changes unexpectedly or a patch fails, stop on that file and report the conflict.

## 4. Execution workflow

Traverse active `\input` order. The atomic unit of completion is one formal environment or figure, not a file, page, grep result, or environment count. Never replace semantic review with a part-wide regex sweep.

Before editing a numbered file, make an internal logical-unit ledger in source order. A theorem-style statement and its immediately following proof form one row; each definition, `method`, `proofmethod`, `computationmethod`, example, counterexample, remark, intuition, motivation, perspective, assumption, convention, model, law, derivation, approximation, dimensional check, empirical study, valuation case, warning, algorithm, and figure forms its own row. Record domain, type/label, `COMPONENT_COUNT` or `CLAIM_COUNT`, proof status, figure role when relevant, required commentary status, and final rendered page. Do not mark rows in bulk.

Process exactly one ledger row at a time. Read the whole environment, its proof, and the immediately relevant earlier owners; then apply:

1. **Census:** count independent definition components, claims, cases, or steps.
2. **Explicit:** expose objects, domains, hypotheses, quantifiers, conclusions, and proof mechanisms.
3. **Formal:** bind notation and replace vague prose with exact relations.
4. **Notation-aware:** audit every mathematical phrase; use bound, established notation when it improves precision or compression, and keep concise prose when notation would obscure the point.
5. **Reuse:** find any applicable earlier theorem-style result.
6. **Succinct:** remove repetition without losing meaning.
7. **Structure:** choose the correct environment and claim/proof items.
8. **Domain overlay:** apply Section 7.11 where the row's evidence, context, units, data, valuation, model, or experimental status is domain-specific.
9. **Pack:** optimize inline layout and semantic line breaks.
10. **Verify:** compile, render, inspect, and repeat until compliant.

After each row, perform this adversarial check before moving on:

1. Is every object, domain, hypothesis, quantifier, and conclusion explicit?
2. Would removing any sentence delete an independent component or claim that should be itemized?
3. Is setup repeated across items instead of factored into a preamble?
4. Does every proof line perform a stated obligation through an equation, estimate, construction, or applicable earlier result?
5. For a method row, does the block use the correct environment and identify the problem type, givens, target, approach-selection cue, operative steps, verification check, and limitation/transfer point appropriate to the source?
6. For an example, counterexample, intuition, remark, motivation, perspective, principle, process, exercise, or question-bank row, does the environment perform its proper role without becoming a hidden theorem, proof, method, prerequisite owner, or duplicate summary?
7. For a figure row, is the primary role clear, and does the caption, callout, labeling, source/data/model provenance, accessibility, and rendered placement satisfy the role-specific figure standard?
8. For an applied/scientific/finance row, is the role correct and are assumptions, units/currency/date/sample, inputs, outputs, validation, and limitations present when relevant?
9. Has every mathematical phrase been kept as concise prose or converted to notation for a clear reason, without hiding logic?
10. Do adjacent clauses repeat the same object, quantifier, hypothesis, conclusion, or induction assumption in both prose and notation?
11. Is every derived symbol defined before first use, and are parallel data such as neighborhoods, intervals, parameters, or domains factored into one ordered bundle?
12. If Structural Commentary / Key Insight is required or present, are the two lines adjacent, terminal, in the exact order, and immediately before the correct `\end{proof}` or theorem-style `\end{...}`, with `\\` at the end of both lines?
13. Are commentary lines genuinely structural/insightful and maximally concise?
14. Does the rendered block have clean semantic breaks and no sparse tail?

If any answer exposes a defect, rewrite the entire affected environment again. Do not stop at the longer explicit/formal draft, a surface copyedit, or a passing search.

Keep edits atomic: one patch should normally change one ledger row plus its necessary local labels/references. After each row, emit a concise progress checkpoint such as `[7/18] thm:... — rewritten; 2 claims; proof complete; commentary checked.` Do not announce file completion without row-level checkpoints.

After all ledger rows in the file are edited, perform a cold second pass in source order without relying on the first-pass decisions. Recount components and claims, reread every proof and commentary line, and inspect every affected rendered block. Only then may the file be complete. Selecting a scope authorizes continuous editing without approval pauses.

Under `refine-only`, preserve intended coverage, correct local defects, replace weak passages when necessary, move/split/promote content for structure, and add no unrelated theory.

For source intake, use only provided sources and existing repository content. Classify pages before editing:

- outline only: placement and coverage audit, no mathematical insertion;
- substantive: conservative source-supported integration;
- mixed: outline for placement, substantive pages for content.

Do not browse, guess unreadable content, or closely paraphrase long source passages. Mark genuine uncertainty with a concise `% TODO(source): ...`.

When a prompt-library workflow references this file, the workflow inherits the complete standards below unless it explicitly narrows scope, source material, or build behavior. A narrow target, source-grounded intake run, structural reorganization pass, or dependency-flow pass may restrict what is edited, but it does not relax the applicable writing, proof, layout, source-provenance, collection-level, safety, or validation standard for any environment it touches. New or materially amended source-grounded content must be finalized locally; do not leave a rough block for a later formalization prompt when the same source and earlier repository content already support the repair.

## 5. Canonical writing standard

### 5.0 External baseline for theorem-style writing

This section records the baseline used by all prompt-library workflows. It is distilled from:

- Steven L. Kleiman and Glenn P. Tesler, MIT, "Writing a Math Phase Two Paper": https://web.mit.edu/mathp2/www/piil.html
- Leonard Gillman, AMS/MAA, `Writing Mathematics Well`: https://bookstore.ams.org/mmbk-7/
- Stanford CS103 Proofwriting Checklist: https://web.stanford.edu/class/archive/cs/cs103/cs103.1262/proofwriting_checklist
- Donald E. Knuth, Tracy L. Larrabee, and Paul M. Roberts, `Mathematical Writing`: https://cs.stanford.edu/~knuth/klr.html
- AMS Author Handbook: https://www.jointmathematicsmeetings.org/arc/handbook/index.html
- Terence Tao, "Give appropriate amounts of detail": https://terrytao.wordpress.com/advice-on-writing-papers/give-appropriate-amounts-of-detail/
- Terence Tao, "Use good notation": https://terrytao.wordpress.com/advice-on-writing-papers/use-good-notation/
- UIUC NetMath, "Writing up proofs": https://new.math.uiuc.edu/netgeom/advice/howto-proofs.html

Baseline principles:

1. **State first, prove second.** A theorem-style result is a named mathematical assertion followed by its proof or an explicit proof-status exception. The proof must not be smuggled into the statement.
2. **Use theorem-style roles for information.** A theorem is a major result; a proposition is an independently useful smaller result; a lemma is a subsidiary result used to prove later results; a corollary follows with little extra proof from earlier theorem-style results. Do not inflate routine construction steps into theorems.
3. **Keep statements concise but usable.** A statement must bind the objects, hypotheses, and conclusions needed to use the result, but definitions, discussion, motivation, proof scaffolding, routine construction data, and source commentary belong outside the statement.
4. **Use generality deliberately.** State the result at the level of generality supported by the source and useful in the notes. Do not add parameters, constants, compact sets, iterates, or quantitative estimates merely because they appear in the proof.
5. **Make proof structure visible.** A nontrivial proof should begin with its operative plan when helpful: direct argument, contradiction, induction, fixed point, compactness, approximation, comparison, or reduction to an earlier result.
6. **Scope variables and assumptions.** Every proof variable must be introduced before use, with its domain and dependency clear. Avoid derived notation before its definition.
7. **Make every proof sentence load-bearing.** Each sentence should advance a stated obligation by a cited result, definition check, construction, equality, inequality, limit, compactness argument, or logical implication.
8. **Give appropriate detail.** Spend detail on the crucial or unfamiliar step; compress routine, expected, and standard steps only when the mathematical step remains checkable.
9. **Prefer conceptual proof flow.** Use calculations where they carry the argument, but do not list formulas without explanatory direction.
10. **Use notation sparingly and consistently.** Notation should reduce cognitive load, not encode too much at once. Separate adjacent formulas with words, keep notation simple, and suppress useless information.

These principles are a floor, not a license to weaken this file's stricter source-grounded, proof-completeness, layout, dependency, and validation rules.

### 5.1 Formal language and notation

- Bind every local symbol before use. Theorem-style statements must contain their own local objects, hypotheses, and conclusions without restating whole earlier theories.
- A theorem-style statement, definition, or typed-method preamble must not use a reference to a definition, theorem, proposition, lemma, corollary, example, or remark as a substitute for the actual local hypothesis or object. State the needed condition directly when it is short enough, e.g. a local Lipschitz condition, extension order, admissible-solution convention, graph notation, or compactness hypothesis. Use references in proof steps only when they supply a genuine earlier result.
- Formal definitions, claims, proofs, methods, and calculations must bind quantifier scope explicitly. Use `\forall`, `\exists`, and `\exists!` inside mathematical clauses when they improve precision or compactness; use concise prose quantifiers when they read better. Do not use symbols as English-word substitutes outside mathematical clauses.
- Prefer `\defeq`, maps, set-builder notation, recurrences, `\implies`, and `\iff` when clearer.
- During the explicit-formal-notation-succinct loop, inspect every sentence after the explicit draft. Replace vague or repetitive mathematical prose when notation improves readability: domains and membership by `x\in X`; quantifiers by `\forall`, `\exists`, or `\exists!`; maps by `f:X\to Y`; definitions by `\defeq`; conditions by relations; implication/equivalence by `\implies`/`\iff`; convergence by `\to`; bounds by inequalities; and parallel cases by symbolic items. Repeat this audit after compression because rewriting can reintroduce prose or over-symbolize a clear sentence.
- After formalization, deduplicate adjacent prose and notation. Do not write both a symbolic and verbal version of the same quantifier, scope, hypothesis, or conclusion. Prefer one bound sentence, e.g. `By Theorem \ref{...}(i) with parameter space $\{\ast\}$, $\mathsf H_{1,d}$ holds $\forall d$; assume $\mathsf H_{j,d}$ $\forall d$.` Avoid forms like `$\mathsf H_{1,d}$ holds $\forall d$. Assume $\mathsf H_{j,d}$ for all $d$.`
- For bundled existence or construction data, order symbols by dependency and factor parallel roles. State spaces, neighborhoods, intervals, and parameters first; define derived products or domains next; introduce maps or solutions using those domains last. Prefer `Then $\exists$ compact $I\ni t_0$ and open neighborhoods $B\subseteq\R^n$ of $x_0$, $\Lambda_0\subseteq\R^p$ of $\lambda_0$ such that, with $D\defeq I\times B\times\Lambda_0$, there is $\phi:D\to\R^n$.` Avoid forms like `$\phi:D\to\R^n$, with $D\defeq...$` and repeated clauses such as `$B\ni x_0$ open..., $\Lambda_0\ni\lambda_0$ open...` when a shared neighborhood phrase factors them.
- Prose should remain when it conveys motivation, interpretation, proof architecture, a necessary logical transition, or meaning that notation would obscure. Do not preserve vague prose merely because it is grammatical, and do not invent cryptic symbols or use `\text{...}` to disguise prose as notation.
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
| Theorem/proposition/lemma/corollary | Source-proportional setup before claims. One conclusion: no list. Two or more independent conclusions: claim items or a logical-weight split. Do not turn a result statement into a construction ledger. |
| Proof | Direct argument: compact prose. Multiple statement claims: matching proof items in the same order. Iff directions may remain inside their matching claim item when concise. |
| Proof/computation method/process | Transferable problem-solving pattern; see Section 5.6. Use `proofmethod` for proof patterns, `computationmethod` for computations/constructions/diagnostics, and legacy `method` only for justified hybrid/other cases. Setup first; enumerate genuine operative steps. A one-line convention remains prose. |
| Example | See Section 5.7. Name what it illustrates, bind exact data, verify the relevant property or computation, and end with the takeaway. Enumerate only distinct steps/cases/comparisons. |
| Counterexample | See Section 5.7. State the claim being refuted, bind exact admissible data, verify the hypotheses/ambient assumptions, verify the failing conclusion, and state the precise lesson. |
| Intuition | See Section 5.7. Give a source-supported mental model, picture, analogy, or heuristic bridge for a formal object, with scope and limitation. It is not proof authority. |
| Remark | See Section 5.7. One focused local aside with anchor, role, boundary, and no hidden authority. Convert hidden claims, proof obligations, or reusable procedures to the proper environment. |
| Motivation | See Section 5.7. Precede the formal object it motivates; state the obstruction/question, why the next object is natural, and the forward target. |
| Perspective | See Section 5.7. Synthesize already owned material through a viewpoint, dictionary, analogy, contrast, or conceptual map; do not introduce prerequisites. |
| Principle | See Section 5.7. Durable heuristic or organizing doctrine with scope and limitation; if it is proof authority, make it theorem-style. |
| Assumption/convention | See Section 5.8. State scope, objects, and effect on later use. An assumption is a declared hypothesis; a convention is a notational, sign, unit, or modeling choice. Neither is proof authority. |
| Model/law | See Section 5.8. State purpose/regime, quantities, equations/relations, assumptions, parameters, inputs/outputs, and limits. Use `law` only for a source-presented physical/economic law, conservation principle, or durable empirical relation. |
| Derivation/approximation/dimensional check | See Section 5.8. A derivation traces assumptions to a formula; an approximation states the expansion regime and retained/dropped terms; a dimensional check verifies consistency but does not prove truth. |
| Empirical study/valuation case | See Section 5.8. Record question, data/source/sample, method/model, assumptions, outputs, uncertainty/sensitivity, reproducibility, and limitations. Distinguish fact, estimate, and opinion. |
| Warning | See Section 5.8. One local pitfall: trigger, failure mode, consequence, and safe correction. Do not use it as theorem authority. |
| Algorithm | Use a prose method unless real pseudocode helps. Otherwise use repository `breakablealgorithm`/`algorithmic` style with supported inputs, outputs, claims, and `alg:...` label. |
| Exercise/question bank | Retain useful supported mathematics; otherwise a concise exercise or source TODO. Never make it the sole prerequisite for later formal results. |

### 5.4 Theorem-style results and proofs

The theorem-style category is exactly `theorem`, `proposition`, `lemma`, and `corollary`.

**Statement proportionality.** A theorem-style statement should be no more complicated than the source-supported mathematical result requires. Include only hypotheses, objects, and conclusions that the reader needs to use the result. Do not pull proof scaffolding into the statement merely because it was useful during formalization: auxiliary constants, compact boxes, Picard operators, iterates, error majorants, local domains, or chosen bounds belong in the proof, a method, an example, or a separate proposition only when they are independently reusable and source-supported. If the source states a concise existence/uniqueness theorem, keep the theorem concise; put the construction or quantitative estimate in the proof or in a separate result only if the source presents it as a result.

An overloaded theorem-style statement must be simplified or split when it contains several lines of `Set/Let/Put/Define/Choose` scaffolding before any conclusion, exposes iteration machinery such as `K`, `u_m`, `u_{m+1}`, or error constants only needed for the proof, bundles a theorem, method, and estimate into one environment, or has claim items whose main role is to record the proof construction rather than reusable conclusions. The statement may retain explicit constants only when they appear in the final bound, define the domain of the conclusion, or are part of the source theorem's actual payload.

**Claim census.** A conclusion is distinct if it can be removed without changing another conclusion, has another logical type, or needs its own proof obligation. Characterization, existence, uniqueness, bound, measurability, convergence, representation, and continuity are distinct types. `Moreover`, `Furthermore`, `In addition`, `Also`, conclusion-bearing `In particular`, or an `and` joining different conclusion types trigger a recount. If `CLAIM_COUNT >= 2`, use claim items or split the result. Proof items must cover statement items one-for-one in the same order and conceptual labels.

Split a heavy result by logical weight: keep the main proof mechanism as the theorem/proposition and immediate consequences as corollaries rather than peer theorems.

**Proof completeness.** Under `PROOF_COMPLETENESS: full`, every reviewed theorem-style result must have a complete proof unless its exact label appears in `PROOFLESS_EXCEPTIONS`. Complete means every logical obligation is justified and checkable; it does not mean every routine algebraic simplification or standard epsilon manipulation must be expanded when no new idea is hidden. Convert “Proof idea,” “Sketch,” “standard argument,” bare theorem-name invocations, and hand-wavy transitions into explicit proofs using definitions or applicable earlier results, then formalize and compress them. Do not delete a weak proof merely because it is difficult. If a proof needs unavailable prerequisite machinery, repair the earlier ownership when authorized or report the exact blocker; do not mark the result complete. A listed proofless exception must still have a mathematically complete statement and required commentary.

Proof preambles and proof items undergo the same explicit-formal-notation-succinct loop as statements. When the proof is not immediate, begin by naming the operative plan or reduction if it will orient the reader. A proof item is not complete merely because its conclusion is plausible: show the operative equality, inequality, limit, construction, or hypothesis check. Handle degenerate cases when notation would otherwise divide by zero, invoke an empty family, or assume uniqueness implicitly.

For induction, bootstrap, or parameter-uniform proofs, name the predicate once, then state the base case and induction hypothesis in compact symbolic form. Do not restate the same uniformity in prose and notation, and do not introduce placeholder language such as “dummy parameter” when a precise object such as parameter space $\{\ast\}$ or a singleton family is available.

**Earlier-result reuse.** After explicit formalization, search only earlier active theorems, propositions, lemmas, and corollaries. Cite one only when it precedes the current result, its hypotheses hold, its conclusion supplies the exact step, and citation is clearer or shorter than repetition. Never use a later result or a definition, example, counterexample, intuition, remark, motivation, method, perspective, applied environment, or algorithm as proof authority. Keep short calculations inline; if no result applies, prove the step directly.

Use result references as `$P$ by Theorem \ref{...}.` or `By Lemma \ref{...}, $P$.` Never make a result the subject of “gives,” “yields,” “shows,” “makes,” “implies,” “ensures,” or “provides.”

**End commentary.** The Structural Commentary / Key Insight pair is a local annotation convention, not an external theorem-writing baseline. It is justified by the external writing baseline: good exposition makes the proof plan, big picture, crucial detail, and significance visible without weakening proof rigor. Under `required-new-and-rewritten`, every new or materially rewritten theorem-style result requires both lines.

Placement is strict. If the result has a proof, the pair must be the final two content lines of the proof, immediately before `\end{proof}`. If the result is an allowed proofless exception, the pair must be the final two content lines of the theorem-style environment, immediately before `\end{theorem}`, `\end{proposition}`, `\end{lemma}`, or `\end{corollary}`. Do not place these labels in the statement, before the proof, after the proof, in the middle of a proof, inside an example/remark/intuition/method/applied environment, or in surrounding prose.

Use the exact line form, including `\\` on both lines:

```tex
\hlt{Structural Commentary}: <proof architecture or dependency>.\\
\hlt{Key Insight}: <intuition or invariant>.\\
```

Structural Commentary names the actual architecture or dependency pattern: direct verification, two directions, induction, compactness extraction, fixed point, approximation, energy estimate, diagonalization, reduction to an earlier result, or similar proof structure. It should identify how the proof is organized, not repeat the theorem statement, summarize every step, or say only "by definition" / "standard argument." Key Insight states the one invariant, obstruction, mechanism, choice, or mental picture that makes the proof work. It should answer "why this proof works" in one line, not restate the conclusion or add a new hypothesis.

Apply the explicit-formal-notation-succinct loop to both lines. Structural Commentary should normally contain at most 18 lexical words; Key Insight should normally contain at most 12 lexical words. Each should fit one rendered line when feasible. Neither line may carry required hypotheses, conclusions, proof obligations, or source claims that are not already owned by the statement/proof. A short proof is not an exception. `COMMENTARY_POLICY` does not automatically add this pair to non-theorem environments. Use a separate `intuition` block only when the reader needs more than this one-line proof-level insight.

### 5.5 Inline mathematics and rendered layout

Under `inline-strict`:

- Single definitions, identities, inequalities, set-builder expressions, integral formulas, and finite equality/proof chains must be inline after compression.
- Retain a display only for a matrix with at least four rows, an irreducible two-dimensional/multiline structure, an actually referenced numbered equation, or a specialized environment requiring display behavior. Length or emphasis alone is not an exception.
- Matrices with at most three rows use inline `smallmatrix` with delimiters, e.g. `$A=\left(\begin{smallmatrix}a&b\\c&d\end{smallmatrix}\right)$`. A displayed matrix must have at least four rows; record its row count.
- Inventory every retained display and record its exact exception.

Prefer inline formulas, but preserve readability through notation and semantic sentences. Use `\limits` on bounded/indexed large operators (`\sum`, `\prod`, `\coprod`, `\bigoplus`, `\bigcup`, `\bigcap`, `\bigsqcup`, `\lim`, `\limsup`, `\liminf`, `\inf`, `\sup`, `\min`, `\max`). Convert arithmetic slash fractions to `\frac{...}{...}` while preserving quotient notation such as `G/H`. Do not use `\quad`/`\qquad` as prose separators or `\text{...}` merely to force prose into math.

`inline-strict` is a local layout preference, not an external mathematical-writing baseline. It must not override statement proportionality, proof clarity, or source fidelity. If inline layout pressure causes added notation, bundled hypotheses, or construction machinery to migrate into a theorem-style statement, simplify the statement first; if the formula is still important, long, or badly broken, use the narrowest documented display exception or switch to the configured less-strict layout mode.

Use deliberate `\\` only between complete semantic units, not inside a sentence/equality chain. Dense prose should separate setup, contrast, construction, consequence, and interpretation, then be re-rendered.

Any continuation line with fewer than five lexical words—or a comparably short mathematical tail—triggers this repair order:

1. remove repetition;
2. use established notation or a local abbreviation;
3. join needlessly separated premise and conclusion;
4. split genuine logical units;
5. use a display only if the active layout exception independently applies.

It may remain only as an intentional irreducible unit whose alternatives reduce clarity. Never repair layout by shrinking fonts, changing margins, arbitrary spacing, mid-expression breaks, or unnecessary displays. If rendered lines overflow or become sparse, first introduce compact semantic notation or a local relation/order/convention, then reread the statement and proof with that notation.

### 5.6 Method environments and problem-solving approaches

This method standard is distilled from:

- G. Polya, `How to Solve It`, as excerpted at Buffalo State: https://math.buffalostate.edu/jcushman/MED383polya.html
- Johns Hopkins Mathematics Survival Guide, "How To Solve It": https://math.jhu.edu/~wsw/guide/node5.html
- Common Core Standards for Mathematical Practice, MP1: https://www.thecorestandards.org/Math/Practice/MP1/
- Terence Tao, "245A: Problem solving strategies": https://terrytao.wordpress.com/2010/10/21/245a-problem-solving-strategies/
- Dimitri Bertsekas, "Ten simple rules for mathematical writing": https://faculty.engineering.asu.edu/bertsekas/ten-simple-rules-for-mathematical-writing/
- Stanford CS103, "Proofwriting Checklist": https://web.stanford.edu/class/archive/cs/cs103/cs103.1262/proofwriting_checklist
- Montana State University, "Proof Guidelines": https://math.montana.edu/courses/m242/proof-guidelines.html
- Chalmers/GU DSABook, "Invariants, preconditions, and postconditions": https://chalmersgu-data-structure-courses.github.io/dsabook/html/section-2.2.html
- Texas A&M CSCE 481, "Algorithm Description": https://people.engr.tamu.edu/schaefer/teaching/481_Spring2017/assignments/algorithm_description.html
- Victorian Curriculum and Assessment Authority, "Pseudocode": https://www.vcaa.vic.edu.au/curriculum/vce-curriculum/vce-study-designs/pseudocode

The typed method environments record reusable ways to attack classes of problems. They are not theorem statements, proofs, worked examples, glossary entries, or pseudocode by default. Use a typed method when the source or existing repository content supports a transferable approach: a proof pattern, computation pattern, diagnostic workflow, construction recipe, approximation/decomposition scheme, or algorithm preview. Use an example for a one-off worked problem; use theorem-style environments for claims; use `breakablealgorithm` only when executable pseudocode is the point.

Use these LaTeX environments:

- `proofmethod`: a reusable proof strategy for a class of claims. Its output is a proof route, reduction, obligation checklist, or recognition criterion, not a numerical value or implementation. It prints as "Proof Method".
- `computationmethod`: a reusable procedure for computing, constructing, estimating, approximating, diagnosing, or testing an object. Its output is a mathematical object, value, approximation, decomposition, certificate, or diagnostic. It prints as "Computation Method".
- `method`: legacy/fallback only. Use it for a short convention, classification workflow, or source-presented hybrid that cannot be split cleanly. State the reason in the edit report.

During formalization, an existing unclassified `method` must be converted to `proofmethod` or `computationmethod` whenever the subtype is clear. If it is hybrid, split it into two typed methods, a typed method plus theorem/proof, or a typed method plus algorithm unless the source presents the pieces as inseparable. Keep `method` only for a justified residual case.

Make the subtype searchable. Prefer a descriptive `meth:` label containing the subtype or mathematical role, such as `meth:compactness-proof-pattern`, `meth:picard-iteration-computation`, or `meth:spectral-diagnostic`. Keep titles precise, e.g. `\hlt{Compactness Extraction}` in `proofmethod` or `\hlt{Picard Iteration}` in `computationmethod`; do not duplicate the printed environment name in every title unless it reduces ambiguity.

Before writing or rewriting a method, extract the problem-solving core:

1. **Problem type:** what kind of task the method addresses.
2. **Data and target:** the given objects, constraints, unknown, desired conclusion, or computable output.
3. **Entry cue:** the feature that suggests this method rather than another one.
4. **Approach choice:** the theorem, transformation, normal form, invariant, estimate, induction, contradiction, compactness/fixed-point argument, decomposition, approximation, special case, symmetry, coordinate change, equation, diagram, or model that drives the solution.
5. **Operative steps:** the actual mathematical actions needed to get from data to target.
6. **Verification:** the check that the output satisfies the goal and hypotheses; include boundary, degenerate, convergence, dimensional, uniqueness, or consistency checks when relevant.
7. **Look-back/transfer:** the reusable idea, limitation, or alternate approach supported by the source.

The final method need not display these seven labels. It must, however, contain their supported mathematical content when the method is nontrivial. A compact form is:

```tex
\begin{proofmethod} \label{meth:...} \hlt{...}\\
\hlt{Use When}: <problem type, data, and target>.\\
\hlt{Key Idea}: <approach cue and driver>.
\begin{enumerate}[label=\roman*.]
\setlength{\itemsep}{0pt}
\item ...
\end{enumerate}
\end{proofmethod}
```

For a computational method, use `computationmethod` with a precise searchable title such as `\hlt{Picard Iteration}`, `\hlt{Spectral Diagnostic}`, or `\hlt{Normal-Form Construction}`.

Use `\hlt{Use When}` and `\hlt{Key Idea}` only when they reduce ambiguity; omit them for a one-line convention or a very short computational recipe. If several approaches are genuinely available, state a short selection rule before the steps, e.g. choose a direct theorem when its hypotheses are visible, reduce to a special case when the target is invariant under approximation, or split into cases when the obstruction is local. Do not list a menu of generic tactics unless each branch has a source-supported cue and consequence.

Method steps must be operative and ordered. Generic steps such as "understand the problem," "apply the theorem," "simplify," or "check the answer" are too vague unless specialized into the actual givens, theorem hypotheses, simplification, or verification. Conversely, do not turn a typed method into a full worked example: keep sample calculations in an `example`, proof obligations in a proof, and detailed iteration code in an algorithm.

When adding or formalizing theorem-style results, examples, or algorithms, audit nearby existing `proofmethod`, `computationmethod`, and legacy `method` blocks. If the new material reveals a reusable proof route, computational recipe, verification checklist, construction step, diagnostic, or limitation that complements an existing method, update the existing method instead of duplicating prose. If no suitable method exists and the source supports a transferable pattern, add the smallest appropriate typed method near the first place it becomes useful. Do not invent methods merely to summarize every new result.

For a proof-pattern method, require:

1. the claim form or problem type it applies to;
2. the hypotheses, objects, or conclusion features that cue the pattern;
3. the proof architecture: direct proof, contrapositive, contradiction, induction, cases, two inclusions/inequalities, construction plus verification, compactness, limiting argument, fixed point, energy estimate, approximation, normal form, or other source-supported driver;
4. the earlier definitions, lemmas, theorems, invariants, or estimates that may be invoked;
5. the proof obligations in the order they must be discharged;
6. the endpoint check: the exact conclusion now proved, plus boundary, degenerate, equality-case, uniqueness, or quantifier-scope checks when relevant.

Proof-pattern steps should be proof actions: choose an arbitrary object, reduce to a definition, prove each direction, construct a witness, establish an invariant, close an estimate, pass to a limit, invoke a prior result, or verify hypotheses. Do not present proof-pattern methods as recipes for computing an output, do not include implementation-style loops, and do not replace the actual proof of a nearby theorem with a vague method block.

For a computational method, require:

1. the input data and admissibility assumptions;
2. the output object, quantity, approximation, certificate, or diagnostic;
3. the setup, normalization, initialization, or representation choice;
4. the update rule, construction step, recurrence, solve step, decomposition, or test;
5. the stopping, selection, branch, or termination criterion when the source supports one;
6. the postcondition or verification check that the output satisfies the target;
7. error bounds, convergence, stability, uniqueness, or complexity only when the source or earlier repository results support them.

Computational method steps may contain formulas and short ordered procedures, but if the source supports executable step-by-step pseudocode with inputs and outputs, use `breakablealgorithm` instead or add a compact algorithm after the conceptual method. Keep one statement per algorithmic step, keep nesting readable, and record preconditions/postconditions or invariants at the method or algorithm boundary rather than burying them inside prose.

When extracting methods from source material, prefer the source's natural level of generality. Do not invent alternative approaches, success criteria, convergence guarantees, complexity claims, or edge cases. If a useful method is only implicit, include only the shortest source-grounded abstraction needed to make the approach reusable.

### 5.7 Examples, counterexamples, intuition, remarks, and expository environments

This environment standard is distilled from:

- MIT, "Writing a Math Phase Two Paper" checklist: https://web.mit.edu/mathp2/www/checklist.html
- University of Minnesota School of Mathematics Writing Across the Curriculum plan: https://wac.umn.edu/wec-program/academic-units/mathematics
- MIT OpenCourseWare 18.821, "Criteria for Good Writing": https://ocw.mit.edu/courses/18-821-project-laboratory-in-mathematics-spring-2013/pages/writing/
- University of Texas, "Guidelines for Writing Up Problems": https://web.ma.utexas.edu/users/mks/360M04/write.html
- `The Manual of Scientific Style`, "Style and Usage for Mathematics": https://www.sciencedirect.com/science/chapter/edited-volume/abs/pii/B9780123739803500101
- Montana State University, "Proof Guidelines": https://math.montana.edu/courses/m242/proof-guidelines.html
- Oxford Mathematical Institute, "Introduction to University Mathematics: Logic and Proof": https://courses.maths.ox.ac.uk/mod/page/view.php?id=65664
- Millersville University, "Counterexamples": https://sites.millersville.edu/bikenaga/math-proof/counterexamples/counterexamples.html
- Lancaster University, "Counterexamples": https://www.lancaster.ac.uk/~prendivs/accessible/math111/doth3.S5.html
- Terence Tao, "Give appropriate amounts of detail": https://terrytao.wordpress.com/advice-on-writing-papers/give-appropriate-amounts-of-detail/
- Dimitri Bertsekas, "Ten simple rules for mathematical writing": https://faculty.engineering.asu.edu/bertsekas/ten-simple-rules-for-mathematical-writing/
- Virginia Tech Proofs Project, "Heuristics": https://math.vt.edu/proofs-project/Instructional_Modules/heuristics.html
- American Mathematical Society, `How to Write Mathematics`: https://bookstore.ams.org/hwm
- AMS Notices, "Why YOU Should Write an Article for the Notices!": https://jointmathematicsmeetings.org/journals/notices/202602/noti3300/noti3300.html
- American Meteorological Society, "Significance Statements": https://www.ametsoc.org/AMS/publications/author-information/significance-statements/

Examples, counterexamples, intuitions, remarks, motivations, perspectives, principles, processes, exercises, and question-bank blocks are explanatory or pedagogical environments. They may clarify, test, warn, motivate, compare, or organize mathematics, but they must not own prerequisites needed by later formal results. The common standard is: anchor the block to a nearby formal owner, state one clear expository job, include only the detail needed for that job, and leave no reusable claim, definition, proof obligation, construction, method, or algorithm hidden inside the block. If such formal content appears, promote or split that content into the appropriate environment and leave only the explanatory residue.

A standard `example` should do at least one clear non-refutational job: instantiate a definition, verify a hypothesis, compute an invariant, test a theorem in a positive case, exhibit a model case, show a boundary case that still satisfies the intended property, compare two nearby notions, or show a method in action. Use `counterexample`, not `example`, when the purpose is to disprove a statement, show that a hypothesis is necessary, or exhibit failure of a proposed identity/implication. A nontrivial example has four supported components:

1. **Target:** the concept, hypothesis, result, or method being illustrated.
2. **Data:** the concrete object, parameters, map, space, sequence, matrix, equation, or probability model.
3. **Verification:** the calculation, membership check, hypothesis check, computation, or comparison that makes the example meaningful.
4. **Takeaway:** the exact positive lesson, model behavior, boundary, contrast, or reusable intuition.

Do not include all four labels unless they reduce ambiguity; the content must still be present. If an example is merely a source-stated object with no verification or lesson, either add the source-supported check or keep it as a short sentence near the definition. If the example proves a general assertion, convert that assertion to a theorem-style result and keep the example as an illustration. If the example is a worked computation with a reusable procedure, extract or cross-reference a `computationmethod`.

Use `counterexample` for refutational examples. A counterexample has five supported components:

1. **Claim tested:** the exact universal statement, implication, identity, equivalence, uniqueness claim, hypothesis-removal claim, or informal conjecture being refuted.
2. **Admissible data:** exact objects or values inside the claimed domain. Do not use undefined or out-of-domain values as counterexamples.
3. **Hypothesis check:** for a conditional statement, verify that the "if" part and all ambient assumptions hold.
4. **Failure check:** verify that the claimed conclusion, equality, implication, uniqueness, inclusion, convergence, or property fails.
5. **Lesson:** state exactly which statement or hypothesis fails; do not claim a broader failure.

Do not include all five labels unless they reduce ambiguity; the content must still be present. Prefer simple exact objects, particular values for all variables, and extreme cases such as zero objects, empty sets, constants, degenerate dimensions, or boundary parameters when they reveal the issue. A single counterexample can refute a universal statement or conditional claim, but it cannot prove a universal theorem or disprove a bare existence statement without proving the negation. If a source gives several counterexamples for the same failure, keep the minimal one unless different examples show genuinely different failure modes. Use label prefix `cex:` for counterexample anchors.

Use `intuition` for a source-supported mental model, picture, analogy, heuristic, or informal explanation that helps a reasonably prepared reader know what to look for before or after the formal statement. A nontrivial intuition block has five supported components:

1. **Anchor:** the definition, theorem, method, model, or calculation being explained.
2. **Mental model:** the picture, analogy, familiar special case, limiting regime, physical interpretation, probabilistic story, financial meaning, or geometric view.
3. **Correspondence:** which formal objects, hypotheses, or terms in the block match the pieces of the mental model.
4. **Scope:** where the intuition is reliable, where it can mislead, and which hypotheses or examples mark the boundary.
5. **Formal bridge:** the exact formal owner that later work must use instead of the intuition.

Do not include all five labels unless they reduce ambiguity; the content must still be present. An intuition block must be concise, honest about its scope, and close to the formal object it explains. It may use a diagram, model case, analogy, or limiting picture, but it must not introduce unsupported claims, hide a proof step, replace hypothesis verification, or be cited as authority in proofs. Use `motivation` when the main job is why the next object is introduced, `perspective` when the main job is to synthesize established material, `principle` for a durable rule of thumb, `example` or `counterexample` for concrete data, and `remark` for a short local aside. Use label prefix `int:` for intuition anchors.

A `remark` records one local caveat, interpretation, comparison, variant, notation clarification, boundary condition, or source-proportional aside. A nontrivial remark should have:

1. **Anchor:** the exact nearby definition, result, method, model, or notation it comments on.
2. **Role:** caveat, comparison, convention note, boundary, interpretation, variant, or local consequence.
3. **Scope:** where the aside applies and where it should not be used.
4. **Non-authority:** no later theorem-style proof should need the remark as a premise.

It should normally be one compact paragraph. Use `warning` for a dedicated pitfall with a trigger and correction, and use `convention` for a durable notation, sign, unit, or modeling choice. Do not enumerate inside a remark unless the source gives a short list whose point is still a single local aside; otherwise split multiple independent points into separate remarks or convert them to examples, typed methods, definitions, applied environments, or theorem-style results. A remark may contain a short formula, but a result-like sentence with quantifiers, equivalences, existence, uniqueness, or a proof obligation must be promoted unless it is explicitly a non-authoritative intuition.

A `motivation` block explains why the next definition, result, method, model, or section is natural. It belongs before the object it motivates. A nontrivial motivation should have:

1. **Need:** the obstruction, gap, recurring pattern, problem pressure, model case, or guiding question.
2. **Natural move:** why the next formal object addresses that need.
3. **Forward target:** what the reader should expect the next object to do.
4. **Boundary:** no hidden theorem, proof step, or prerequisite needed later.

Keep it short enough that the reader reaches the formal object quickly. Do not use motivation to summarize an entire subsection, duplicate an overview, or state results before their formal owners. If the material answers "how to solve this class of problems," use a typed method; if it explains a mental model for an already introduced object, use `intuition`. Use label prefix `mot:` for motivation anchors.

A `perspective` block synthesizes or reinterprets already established material. It belongs after the relevant formal owners. A nontrivial perspective should have:

1. **Anchors:** the earlier definitions, results, methods, models, examples, or conventions being connected.
2. **Viewpoint:** dictionary, analogy, change of coordinates, hierarchy, duality, limiting picture, comparison, or conceptual map.
3. **Synthesis:** what becomes simpler, comparable, or unified from this viewpoint.
4. **Boundary:** what the perspective does not prove or where the analogy breaks.

It may point to earlier formal owners but cannot introduce prerequisites for later use. If the perspective contains a classification, theorem, reusable workflow, or domain assumption that later arguments need, split that content into the formal owner first. Use label prefix `per:` for perspective anchors.

A `principle` records a durable heuristic, organizing doctrine, or source-supported rule of thumb. It is not a theorem. State its scope, use case, and limitation; if it is universally true and used as proof authority, recast it as a theorem-style result with proof.

A `process` records an organizational workflow or document-level procedure. Use `proofmethod` or `computationmethod` for mathematical problem-solving patterns, and use `breakablealgorithm` for executable pseudocode. Do not duplicate the same process as a method.

Exercises and `qnbank` items should specify givens and the task precisely. Retain them only when they add source-supported practice, examples, counterexamples, or useful mathematical prompts. They must not be the sole source of a definition, theorem, method, notation, or prerequisite; promote any needed mathematical content before later use. Avoid answerless exercises during source-grounded integration unless the source itself is an exercise list and the item is worth preserving.

### 5.8 Applied, scientific, empirical, and finance environments

This applied-environment standard is distilled from:

- NIST SP 811, "Check List for Reviewing Manuscripts": https://www.nist.gov/pml/special-publication-811/nist-guide-si-check-list-reviewing-manuscripts
- AIP Publishing, "Author Instructions": https://publishing.aip.org/resources/researchers/author-instructions/
- OpenStax University Physics, "Dimensional Analysis": https://openstax.org/books/university-physics-volume-1/pages/1-4-dimensional-analysis
- Federal Reserve, "Supervisory Guidance on Model Risk Management": https://www.federalreserve.gov/frrs/guidance/supervisory-guidance-on-model-risk-management.htm
- American Economic Association, "Data and Code Policies and Guidance": https://www.aeaweb.org/journals/data
- Sandve et al., "Ten Simple Rules for Reproducible Computational Research": https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1003285
- International Valuation Standards Council, "International Standards for International Markets": https://ivsc.org/standards/
- CFA Institute, "Equity Valuation: Applications and Processes": https://www.cfainstitute.org/insights/professional-learning/refresher-readings/2026/equity-valuation-applications-and-processes
- CFA Institute, "Standard V(A) Diligence and Reasonable Basis": https://www.cfainstitute.org/standards/professionals/code-ethics-standards/standards-of-practice-v-a
- CFA Institute, "Standard V(B) Communication with Clients and Prospective Clients": https://www.cfainstitute.org/standards/professionals/code-ethics-standards/standards-of-practice-v-b

Use these environments only when their role is genuinely clearer than an existing definition, theorem-style result, typed method, example, counterexample, or remark. They are formal exposition environments, not proof authority by default. If an applied block contains a universal mathematical claim, split the claim into a theorem-style result with proof and leave the applied environment for assumptions, interpretation, validation, or domain meaning.

`assumption` records a standing or local hypothesis. State the scope, objects, domains, regularity/distributional/market/physical conditions, and where the assumption is used. Do not hide conclusions, definitions, or model equations inside an assumption. If the assumption is source-specific, keep it near the source block; if it recurs across a section or future PDF, place it before all dependent material and cross-reference it sparingly.

`convention` records a deliberate notational, sign, coordinate, unit, discounting, compounding, frequency, calendar, or modeling convention. State the scope and any exceptions. Use it for choices such as Fourier-transform normalization, metric signature, risk-neutral vs physical measure notation, currency/period conventions, or nominal vs real quantities. A convention is not a result and should not carry proof obligations.

`model` records a physical, stochastic, economic, financial, or computational model. A nontrivial model should identify:

1. **Purpose:** the phenomenon, instrument, system, decision, or question the model addresses.
2. **State space and variables:** objects, dimensions, units/currency/frequency, measures, dates, and parameters.
3. **Assumptions:** idealizations, market/physical/statistical conditions, boundary or initial conditions, and admissible regimes.
4. **Equations or structure:** laws, constraints, dynamics, objective functions, accounting identities, or data-generating relations.
5. **Inputs and outputs:** required data/parameters and produced observables, prices, risks, forecasts, diagnostics, or qualitative behavior.
6. **Validation and limitations:** calibration, benchmarks, dimensional checks, empirical tests, failure modes, and intended-use boundary when the source supports them.

Do not overload a model block with proofs or worked computations. Put reusable computations in `computationmethod`, pseudocode in `breakablealgorithm`, source-supported empirical checks in `empiricalstudy`, and mathematical consequences in theorem-style environments.

`law` records a source-presented physical law, conservation principle, accounting relation treated as a lawlike identity, no-arbitrage principle, or durable empirical relation. State the quantities with units/currency/date/frequency, the regime of validity, the assumptions or idealizations, and the consequence. Use `law` sparingly: if the repository proves it mathematically, use theorem-style; if it is only a modeling choice, use `model` or `assumption`; if it is a heuristic, use `principle`.

`derivation` records a disciplined chain from assumptions, laws, definitions, or models to a formula. State the starting point and target, then keep each transformation checkable. Include unit/dimensional consistency for physical formulas when relevant, and sign/date/frequency/currency consistency for finance formulas. A derivation may motivate a theorem or model equation, but it is not a substitute for a proof when a theorem-style claim is made.

`approximation` records an asymptotic, perturbative, linearized, discretized, numerical, or modeling approximation. State the small/large parameter or limit, baseline expression/model, retained terms, discarded terms, validity regime, and error/order/stability claim only when source-supported. If the approximation is a reusable procedure, pair or replace it with a `computationmethod`. If it is a formal limit theorem, use theorem-style.

`dimensionalcheck` records a unit or dimension audit. State dimensions for all active physical quantities, verify each additive term has the same dimension, verify both sides of equations agree, verify function arguments are dimensionless, and conclude only consistency or inconsistency. Do not present dimensional consistency as proof that an equation, model, or law is true; it is an error screen and sometimes a guide to form.

`empiricalstudy` records a data-backed result, backtest, simulation study, calibration exercise, or numerical experiment. A nontrivial empirical study should identify the question, dataset/source/sample window, preprocessing, model/strategy/computation, parameters and random seeds when relevant, metric or test, uncertainty/robustness or sensitivity check, reproducibility handle, result, and limitation. Do not turn a backtest into a forecast or recommendation. Distinguish observed fact, simulated output, statistical estimate, model-implied value, and interpretation.

`valuationcase` records a fundamental-finance or asset-valuation application. State valuation purpose, subject asset/company/security, valuation date, currency, basis of value, approach and method, key operating/financial assumptions, input sources, forecast horizon, discount/growth/multiple choices, sensitivity or scenario checks, value conclusion, and risks/limitations. Distinguish historical financial facts from forecasts, estimates, and opinions. Do not label a valuation output as exact, and do not imply investment advice unless the source explicitly frames it as a recommendation and the educational context is clear.

`warning` records one pitfall, misuse, or boundary hazard. State the trigger, failure mode, consequence, and safe correction or reference. A warning should normally be one compact paragraph. Use `counterexample` when the warning is demonstrated by a refutation, `remark` when it is only a local aside, and theorem-style when it is a proved impossibility.

## 6. Dependencies, labels, notation, and figures

- Definitions, notation, and prerequisites precede use. Formal results and typed methods must not depend on examples, counterexamples, intuitions, remarks, motivations, perspectives, warnings, empirical studies, valuation cases, or other non-authoritative expository/applied blocks; promote or move essential content.
- Resolve ownership structurally by reordering, moving, splitting, promoting, or citing the correct earlier owner—not by an ad hoc prerequisite paragraph.
- Use one stable descriptive label per anchor with established prefixes (`def:`, `thm:`, `prop:`, `lem:`, `cor:`, `meth:`, `ex:`, `cex:`, `int:`, `rem:`, `mot:`, `per:`, `assump:`, `conv:`, `model:`, `law:`, `der:`, `approx:`, `dim:`, `emp:`, `val:`, `warn:`, `fig:`, `alg:`). Update every affected reference and remove stale, missing, or duplicate labels.
- Read the collision index and relevant notation file. Disambiguate reused glyphs by font, decoration, arguments, or local declaration. Reuse base macros; add global notation/macros only when durable across major sections.

### 6.1 Figure roles and standards

The figure standard is distilled from:

- AMS, "AMS Author Handbook, Journals": https://www.ams.org/publications/authors/tex/Author_Handbook_Journals.pdf
- SIAM, "Macro Instructions for LaTeX": https://www.siam.org/publications/journals/about-siam-journals/information-for-authors/macro-instructions-for-latex
- AIP Publishing, "Author Instructions": https://publishing.aip.org/resources/researchers/author-instructions/
- Nature Research, "Preparing your figures": https://research-figure-guide.nature.com/figures/preparing-figures-our-specifications/
- Matplotlib, "Choosing Colormaps": https://matplotlib.org/stable/users/explain/colors/colormaps.html
- Consumer Financial Protection Bureau, "Data Visualization": https://cfpb.github.io/design-system/foundation/data-visualization
- SEC, "Plain English Handbook": https://www.sec.gov/files/handbook.pdf
- CFA Institute, "Global Investment Performance Standards for Firms": https://www.gipsstandards.org/standards/gips-standards-for-firms/

A figure is a visual float or visual asset. Before adding, moving, or editing one, classify exactly one primary role and report it:

1. **Illustration** uses `illustrationfigure`: a conceptual, geometric, commutative, dependency, payoff-shape, balance-sheet-relationship, or qualitative diagram that explains structure but is not data evidence.
2. **Visualization** uses `visualizationfigure`: a plot of mathematical, numerical, empirical, simulated, backtested, or model-implied values: function graph, phase portrait, vector field, trajectory, histogram, scatterplot, heatmap, sensitivity curve, return series, or error plot.
3. **Schematic** uses `schematicfigure`: a physics, engineering, market-microstructure, trading-system, accounting-flow, or modeling setup diagram with objects, coordinates, signs, interfaces, or information flows.
4. **Financial exhibit** uses `financialexhibitfigure`: a finance/accounting visual such as a valuation bridge, comparable-company plot, performance chart, factor exposure chart, capital-structure diagram, revenue/cost waterfall, margin bridge, scenario fan, or sensitivity grid.
5. **Image** uses `sourceimagefigure`: a raster source image, experimental image, scanned diagram, screenshot, photograph, or externally generated graphic whose visual content itself is the source.
6. **Table-like visual** uses `tablevisualfigure` only when the material must remain a visual: a grid, matrix, term sheet, financial statement excerpt, assumptions table, or results panel. Prefer `table`/`tabular` for searchable structured data; use a figure only when layout, graphics, or source fidelity is essential.

Use these typed figure wrappers for every new or materially touched figure. They share the ordinary `figure` counter and `Figure` caption style; the environment name records the semantic role in source. Keep a generic `figure` only for untouched legacy content or a genuinely mixed visual that cannot be cleanly split; report that exception.

Common standard. A figure must have a nearby textual callout, one stable `fig:` label, and a succinct caption that states what is being shown and why it matters. The caption or adjacent prose must define symbols, units, panels, colors, line styles, and abbreviations needed to read the figure. Do not rely on "above" or "below"; use `Figure \ref{fig:...}`. Keep figures near the text that introduces or uses them, and do not make later formal results depend on information that exists only inside a figure. If a visual owns data, assumptions, a reusable construction, or a formal relation needed later, promote that content into text, a table, a method, an applied environment, or a theorem-style owner.

Illustration standard. Prefer editable TikZ or `tikz-cd` for mathematical diagrams and conceptual illustrations when feasible. Show only the objects, arrows, regions, symmetries, constraints, or correspondences needed for the local point. Labels should be mathematical, short, and close to the object they name. The caption should name the formal anchor and the structural takeaway. Do not use illustrations as proof authority unless the proof also gives a rigorous argument.

Visualization standard. A visualization must identify the plotted quantity, horizontal and vertical axes, units or dimensionless status, scale or transformation, parameter values, data/model/source, sample window or simulation regime, and uncertainty/sensitivity when relevant. Choose the chart type for the data structure: line for ordered paths or time series, scatter for relationships, histogram/density for distributions, heatmap/matrix for two-index quantities, surface/contour for two-variable functions, and phase portrait/vector field for dynamical systems. Use sequential, diverging, cyclic, or qualitative colormaps according to the encoded quantity. Avoid decorative gradients, unlabeled axes, unexplained normalization, cherry-picked windows, dual axes without strong justification, and visual claims unsupported by the source or computation.

Schematic standard. A schematic must state the modeled system, coordinate/sign convention, boundary or interface conditions, inputs/outputs, and whether geometry is to scale. For physics, include units or dimensions for displayed quantities and distinguish forces, fields, fluxes, constraints, and measurements. For computational or market-structure schematics, distinguish state, observation, decision, execution, data feed, and feedback edges.

Financial-exhibit standard. A financial visual must state valuation/reporting date, currency, period or frequency, nominal/real basis when relevant, historical versus forecast versus simulated versus model-implied status, data source, benchmark or base index, and aggregation basis. Do not allow axis truncation, selective windows, rebasing, smoothing, cumulative returns, or scenario colors to imply more certainty than the source supports. If exact values matter, provide them in text or table rather than only as plotted pixels.

Image standard. Do not reproduce text screenshots or decorative source images. Use raster images only when the image content itself matters. Preserve source provenance in the report or caption as appropriate. For scientific images, include scale bars, acquisition or processing context when source-supported, and avoid undisclosed cropping, filtering, recoloring, or contrast changes that alter interpretation.

Accessibility and render checks. Figures must remain legible after scaling in the PDF. Do not rely on color alone; use labels, line styles, markers, shapes, or annotations in addition to color. Use sufficient contrast, consistent fonts, and line weights matching nearby figures. No labels, legends, axes, tick marks, captions, or neighboring text may overlap. Every touched TikZ, `tikz-cd`, PGFPlots-style plot, or included image requires rendered inspection; source inspection alone is insufficient.

## 7. Collection-level standards

Local environment quality is necessary but not sufficient. A proper notes collection must also preserve orientation, provenance, notation hygiene, examples, referenceability, and unfinished-work discipline across parts and sections.

### 7.1 Reader orientation and overview hygiene

- Each part and section overview should be a concise navigation map, not a duplicate mini-chapter. When touched for structural reasons, it should state the role of the unit, main prerequisites, main objects/results, and forward dependencies when that helps placement.
- Overviews own structure and route-finding. Put mathematical substance in numbered subsection files unless the existing local convention clearly uses the overview for a short orienting paragraph.
- A new subsection must have a real mathematical payload, an active input edge, and a clear local owner. Do not add empty future headings, broad skeletons, or source-table placeholders.
- Existing active empty subsections may be intentional placeholders. Preserve their overview/input references and broad titles unless the current reorganization moved their content elsewhere and made the active placeholder misleading.
- When moving or adding material, preserve a readable path: definition or notation before first use, examples near the definitions they test, and major results after their prerequisites.

### 7.2 Source provenance and coverage

- For `CONTENT_POLICY: source-grounded`, maintain a source-to-target ledger for the run. Each source block should have an exact source identifier, mathematical or applied type, target owner, and status: `covered`, `partial`, `missing`, `misplaced`, `unsupported`, `needs later file`, `needs-new-environment-or-figure-type`, or `blocked-new-section-or-part`.
- Distinguish `source-stated`, `source-derived`, and `repo-derived` material. Source-stated material is explicitly present in SOURCE_MATERIAL; source-derived material is a direct formalization or short consequence needed to make the source statement usable; repo-derived material comes from earlier active results used to complete a proof or avoid duplication.
- Do not litter the LaTeX with source bookkeeping. Put provenance in the edit report unless a local `% TODO(source): ...` is necessary because the mathematical content is genuinely unreadable, ambiguous, or incomplete.
- A source-grounded pass is incomplete if it merely adds the easiest visible result and leaves other supported source blocks unclassified.

### 7.3 Notation lifecycle

- The notation baseline is: define global notation near the front, define local notation near first use, prefer established conventions, use notation only when it reduces cognitive load, keep symbols precise and unambiguous, and use stable macros/operators only for recurring durable expressions.
- Classify new notation as proof-local, block-local, subsection-local, section-local, or global before introducing it. Proof-local notation must not be used later as if it were durable.
- Put durable notation in `parts/00_notations/` only when it recurs across major sections. Put section-local notation near its first section-level use. Put one-off notation inside the smallest block that needs it.
- Before adding notation, check nearby files, active notation files, and base macros for existing symbols and naming patterns. Resolve collisions by context, font, decoration, arguments, or a local declaration.
- A repeated expression used three or more times in a local argument is a candidate for notation; a one-off expression normally is not. Do not introduce notation that is cleverer than the concept or hides the active variables.
- For applied material, record unit, dimension, currency, date, compounding, frequency, measure, and convention choices at the smallest durable scope. Never let a financial symbol such as $r$, $R$, $P$, $V$, or $D$ silently change meaning across pricing, accounting, probability, and dynamics contexts.

### 7.4 Examples, counterexamples, and boundary tests

- Major definitions and nontrivial hypotheses should have a nearby source-supported example, nonexample, counterexample, or test computation when the source or existing repository content provides one.
- An example should do mathematical work: instantiate a definition, verify a hypothesis, compute an invariant, show a boundary case, or distinguish two similar concepts. Avoid decorative examples.
- Counterexamples and nonexamples are especially valuable when a hypothesis is easy to overlook. Do not invent them during source-grounded intake.
- An intuition block is especially useful before an abstraction, after a surprising result, or beside a model/approximation whose meaning is not visible from formulas alone. Do not invent intuition during source-grounded intake unless it is directly supported by the source or by already established repository material.
- In physics, computation, and finance material, prefer a nearby source-supported dimensional check, sanity check, benchmark case, limiting case, or sensitivity check when it clarifies a model, approximation, empirical result, or valuation assumption.
- Exercises may be kept only when they add useful source-supported mathematics or practice. They must not be the sole owner of a prerequisite needed by later formal results.

### 7.5 Equation numbering and referenceability

- Number and label only equations that are referenced later or are central enough to deserve an anchor. Use `\eqref{...}` for equation references.
- Do not label one-off displays, decorative derivations, or formulas that can remain inline under the active layout mode.
- Use stable descriptive labels. In addition to the environment prefixes in Section 6, use `eq:` for referenced equations when the surrounding file has no stronger local convention.
- When moving content, update every affected reference and remove stale labels. A formula should not have multiple labels unless the labels denote genuinely distinct anchors.

### 7.6 TODO and errata discipline

- Use TODO comments sparingly and with a type: `% TODO(source):`, `% TODO(proof):`, `% TODO(structure):`, `% TODO(notation):`, or `% TODO(build):`.
- A TODO must name the missing object, source uncertainty, proof gap, structure issue, notation collision, or build/render issue precisely enough that a later run can resolve it.
- Do not use a TODO as a substitute for a proof required under `PROOF_COMPLETENESS: full`, except to report an explicit blocker outside the authorized scope or SOURCE_MATERIAL.
- Report every new or retained TODO in the final report. Remove obsolete TODOs when the issue is resolved.

### 7.7 Searchability and naming consistency

- Use stable result titles, environment labels, and canonical terms so concepts can be found by `rg`.
- Do not introduce multiple synonymous names for the same concept inside a local development unless the distinction is mathematically meaningful and stated.
- If the repository later adopts an index or glossary convention, add entries only for durable recurring concepts, not every local symbol.

### 7.8 Subject expansion and multi-PDF readiness

- Keep shared environments and prompt standards domain-neutral. Future physics, quant-finance, and fundamental-finance PDFs may add subject-specific notation files or preamble layers, but they should inherit the same environment roles unless a subject-specific style file explicitly overrides them.
- Before adding a new environment, ask whether an existing environment already owns the role. Prefer the smallest stable vocabulary: definitions/results/proofs for mathematics, typed methods/algorithms for procedures, examples/counterexamples for pedagogy, and Section 5.8 environments for applied assumptions, models, checks, empirical studies, and valuation cases.
- Add a new environment or typed figure wrapper only for a durable role that existing environments cannot represent without distortion. Source-intake prompts may use the explicit gap protocol: search reputable web standards for the role, propose the minimum standard, update `parts/base.tex` and prompt standards if authorized, then use the new role only for source-supported material. Web searches in this protocol justify role and format standards only; they must not supply subject content, examples, claims, proofs, data, or assumptions.
- Record future cross-volume dependencies explicitly in overviews or reports when a subsection will rely on material that may move to another PDF. Keep local labels stable and descriptive enough that cross-PDF references can later be mapped or duplicated intentionally.
- Separate universal mathematical content from domain applications. A stochastic-process theorem should remain in the mathematics owner; a Black-Scholes model, calibration, backtest, or valuation case belongs in the applied owner and cites the mathematical prerequisites.
- Distinguish source types in reports and local prose when relevant: textbook theorem, model assumption, physical law, empirical dataset, simulated output, market convention, accounting identity, valuation input, analyst forecast, and author interpretation.
- Applied blocks must be date/context aware. Physical constants need units and source context; market data, statements, forecasts, valuations, and performance results need date, currency, frequency, and data source when available.

### 7.9 Further research recommendations

Further research is a recommendation phase, not a content-insertion or bibliography-editing phase. It is based on:

- Cornell University Library, "Getting Started with Library Research": https://www.library.cornell.edu/study/introduction-to-research/
- University of Arizona Libraries, "Conduct a literature review": https://lib.arizona.edu/research/sources/lit-review
- Purdue Global Academic Success Center, "Writing an Annotated Bibliography": https://purdueglobalwriting.center/writing-an-annotated-bibliography/
- PRISMA 2020 statement: https://www.prisma-statement.org/prisma-2020
- Crossref, "Metadata Retrieval": https://www.crossref.org/documentation/retrieve-metadata/
- DataCite Metadata Schema, "Citation": https://datacite-metadata-schema.readthedocs.io/en/4.6/introduction/citation/
- OCLC WorldCat support, "WorldCat": https://help.oclc.org/Discovery_and_Reference/FirstSearch/FirstSearch_databases/WorldCat

Use further research only to identify books, papers, surveys, monographs, standards, or authoritative technical references that could improve a part, section, or subsection in a later source-grounded run. Do not add mathematical content, citations, `\nocite`s, or BibTeX entries during this phase.

Maintain recommendations in `Content_Enhancement_Recommendations.md`. Each entry must be scoped to an exact target path or active part/section, tied to a concrete local gap or enrichment opportunity, and annotated with the source's role, authority, fit, and how it could enhance the notes. Record search terms, search venues, date searched, and enough metadata to later add a BibTeX entry: authors/editors, title, year, edition/version if applicable, publisher or journal, DOI/ISBN/arXiv/URL when available, and candidate BibTeX key.

Before adding a recommendation, check `references.bib` by normalized title, authors/editors, year, DOI, ISBN, arXiv identifier, URL, and plausible BibTeX key. If the reference is already in the bibliography, do not add it to `Content_Enhancement_Recommendations.md`; report it as skipped because already bibliographed. Also check the recommendation file itself and update an existing recommendation rather than duplicating it.

Prefer authoritative references in this order when available: standard graduate or advanced undergraduate books, peer-reviewed survey articles, landmark papers, official standards or regulator/publisher documents for applied topics, and well-maintained open course notes only when no stronger citable source exists. Exclude low-authority webpages, unreviewed summaries, link farms, inaccessible metadata-only records without enough bibliographic information, and sources whose proposed value is vague.

### 7.10 Research-paper ingestion

Research-paper ingestion is a critical-content extraction phase, not a paper-summary phase. It is based on:

- MIT, "Writing a Math Phase Two Paper": https://web.mit.edu/mathp2/www/piil.html
- Terence Tao, "Give appropriate amounts of detail": https://terrytao.wordpress.com/advice-on-writing-papers/give-appropriate-amounts-of-detail/
- AIP Publishing, "Author Instructions": https://publishing.aip.org/resources/researchers/author-instructions/
- APS, "Editorial Policies and Practices": https://journals.aps.org/authors/editorial-policies
- Nature Portfolio, "Reporting standards and availability of data, materials, code and protocols": https://www.nature.com/nm/editorial-policies/reporting-standards
- PLOS ONE, "Criteria for Publication": https://journals.plos.org/plosone/s/criteria-for-publication
- Journal of Financial Economics, "Data and Code Sharing Policy": https://www.jfinec.com/data-and-code-sharing-policy
- American Finance Association, "Submission to the Journal of Finance": https://afajof.org/submissions/
- Federal Reserve, "Supervisory Guidance on Model Risk Management": https://www.federalreserve.gov/frrs/guidance/supervisory-guidance-on-model-risk-management.htm
- FASB, "The Conceptual Framework": https://fasb.org/the-conceptual-framework
- CFA Institute, "Equity Valuation: Applications and Processes": https://www.cfainstitute.org/insights/professional-learning/refresher-readings/2026/equity-valuation-applications-and-processes
- SEC, "Commission Guidance Regarding Management's Discussion and Analysis": https://www.sec.gov/rules-regulations/2003/12/commission-guidance-regarding-managements-discussion-analysis-financial-condition-results-operations

For every paper, record bibliographic metadata, paper type, local target, and extraction decision. Read abstract, introduction, main results/methods, figures/tables, discussion/conclusion, appendices or supplemental material only as needed to decide what is critical. Do not ingest the literature review, rhetorical framing, broad background, routine derivations, exhaustive robustness tables, implementation minutiae, or appendices unless they contain a definition, assumption, method, proof, dataset, diagnostic, limitation, or figure needed by the notes.

The critical-content filter is: include only material that creates or repairs a durable local owner, such as a definition, main theorem/result, transferable proof method, computational method, model, law, derivation, approximation, empirical study, valuation case, counterexample, example, source-supported intuition, central figure/table, notation, or limitation. Exclude one-off narrative, paper-specific wording, duplicated preliminaries already owned earlier, and any result whose hypotheses, proof, data, or source status cannot be made explicit.

For mathematics papers, preserve the main definitions, main theorem-style results, sharp hypotheses, named constructions, essential examples/counterexamples, and proof architecture. Include auxiliary lemmas only when they are reused locally or are the cleanest owner of a needed idea. Prefer a `proofmethod`, `intuition`, or `perspective` block for a transferable proof idea rather than copying a long proof. Do not import every lemma in a technical proof chain, every notation convention, or general preliminaries already covered by the notes.

For quantitative-finance papers, classify the paper as theoretical, empirical, computational, or mixed. Preserve the problem type, market/asset universe, model dynamics or statistical model, measure/probability convention, admissibility and no-arbitrage assumptions, objective or loss function, pricing/hedging/risk/backtest/calibration method, inputs and outputs, benchmark, performance or error metric, transaction-cost/liquidity/constraint treatment, validation or robustness check, data/code availability, and limitations. Distinguish model-implied, simulated, empirical, backtested, and interpretive claims. Do not ingest strategy performance as investment advice or omit costs, sample window, rebalancing frequency, look-ahead/survivorship/data-snooping controls, or model-use limitations when the paper's result depends on them.

For fundamental-finance, accounting, and valuation papers, preserve the research question or valuation purpose, entity/security/industry scope, reporting or valuation date, currency, accounting basis, fiscal period, data source, variable definitions and adjustments, valuation/accounting method, key assumptions and drivers, historical versus forecast status, scenarios or sensitivities, quality and variability of earnings/cash-flow discussion, risk factors, conflicts or independence limits, and conclusion only at the level supported by the source. Distinguish fact, estimate, forecast, opinion, and recommendation. Do not turn an empirical association, valuation estimate, or analyst conclusion into a general theorem or investment recommendation.

For physics papers, preserve the physical system, regime, quantities with units/dimensions, governing laws or equations, assumptions, boundary/initial conditions, approximations and retained/dropped terms, dimensionless parameters, derivation route, experimental/simulation setup, uncertainty/error estimates, data/code/material availability, and validity limits. Use `law`, `model`, `derivation`, `approximation`, `dimensionalcheck`, `empiricalstudy`, `schematicfigure`, or `visualizationfigure` as appropriate. Do not ingest apparatus details, exploratory discussion, or full computational pipelines unless they are needed to understand, reproduce, or bound the result.

For all domains, keep paper-stated, source-derived, and repo-derived content distinct. A paper's abstract or discussion may motivate ingestion, but it is not proof authority for a formal claim unless the formal result, method, data, or derivation is supported in the paper body or supplement.

### 7.11 Domain specialization overlays

This domain-specialization standard is distilled from the mathematical-writing, proof, and notation sources in Sections 5.0-5.7; the applied, scientific, finance, figure, further-research, and paper-ingestion sources in Sections 5.8, 6.1, 7.9, and 7.10; and these additional domain baselines:

- Knuth, Larrabee, and Roberts, `Mathematical Writing`: https://cs.stanford.edu/~knuth/klr.html
- Stanford CS103, "Proofwriting Checklist": https://web.stanford.edu/class/archive/cs/cs103/cs103.1262/proofwriting_checklist
- NIST Technical Note 1297, "Guidelines for Evaluating and Expressing the Uncertainty of NIST Measurement Results": https://www.nist.gov/pml/nist-technical-note-1297
- SEC, "Plain English Handbook": https://www.sec.gov/files/handbook.pdf
- CFA Institute, "Global Investment Performance Standards for Firms": https://www.gipsstandards.org/standards/gips-standards-for-firms/

Do not maintain four duplicate standards for every environment. Separate standards only when the domain changes at least one of:

1. the evidence object: proof, model, law, derivation, approximation, dataset, experiment, backtest, filing, valuation input, or visual evidence;
2. the context needed to read notation: unit, dimension, currency, date, compounding, frequency, probability measure, accounting basis, physical regime, or sample window;
3. the authority of a claim: theorem/proof, source-stated law, model assumption, empirical estimate, simulated output, valuation opinion, or educational interpretation;
4. the reproducibility burden: proof details, data/code/materials availability, calibration/backtest protocol, uncertainty/error, sensitivity, or audit trail.

Keep these standards universal across mathematics, quantitative finance, fundamental finance/accounting/valuation, and physics:

- repository safety, Git discipline, scope control, source-grounded content boundaries, and active `parts/` ownership;
- structural hierarchy, overview hygiene, placeholder preservation, dependency order, labels, references, TODO taxonomy, and searchability;
- theorem-style proportionality, proof completeness, statement/proof item matching, proof-reference policy, and the rule that only theorem-style results with proofs can serve as mathematical proof authority;
- definition quality, local notation binding, global notation lifecycle, equation numbering, inline/display layout, commentary placement, and semantic deduplication;
- the roles of examples, counterexamples, intuitions, remarks, motivations, perspectives, principles, processes, typed methods, algorithms, and figures.

Apply domain overlays to these standards instead of rewriting them:

- notation and context: add units/dimensions for physics, currency/date/frequency/accounting basis for fundamental finance, measure/filtration/model/date/frequency for quantitative finance, and object/domain/hypothesis scope for pure mathematics;
- methods: keep the `proofmethod` versus `computationmethod` distinction universal, but specialize entry cues, admissibility checks, verification, and limitations by domain;
- examples and counterexamples: preserve the universal target/data/verification/takeaway or claim/admissibility/failure/lesson structure, but choose data and checks that match the domain;
- intuitions, motivations, perspectives, and remarks: keep the anchor/scope/non-authority rules universal, but state the domain-specific mental model or boundary precisely;
- applied environments, figures, research-paper ingestion, and further-research recommendations: use the domain-specific evidence and reproducibility standards below.

Use this domain matrix when `DOMAIN` is `auto`, `mixed`, or explicitly set:

| Domain | Evidence and owner | Required overlay |
| --- | --- | --- |
| `math` | Definitions, theorem-style results, proofs, examples, counterexamples, proof methods, and computations. | State exact objects, domains, hypotheses, quantifiers, conclusions, proof architecture, and reusable constructions. Use theorem-style only for claims that can be proved from earlier results or source-supported proof. Keep empirical, physical, and valuation claims out of theorem-style environments unless converted to mathematical assumptions and proved conclusions. |
| `quant-finance` | Mathematical pricing/risk theory, stochastic models, calibration, optimization, backtests, simulations, data studies, and trading or risk workflows. | Identify market or asset universe, time/indexing convention, probability measure and filtration when relevant, model dynamics or statistical model, admissibility/no-arbitrage constraints, objective/loss/payoff, input data and sample window, calibration/backtest protocol, transaction costs, liquidity, constraints, benchmark, metric, uncertainty/robustness, code/data availability, model-risk limitation, and whether the claim is model-implied, simulated, empirical, backtested, or interpretive. Never turn backtest performance into a theorem, forecast, or investment recommendation. |
| `fundamental-finance` | Accounting identities, financial statement analysis, valuation cases, corporate-finance models, filings, estimates, forecasts, scenarios, and analyst-style interpretation. | Identify entity/security/industry scope, reporting or valuation date, currency, fiscal period, accounting standard or basis, data source, variable definitions and adjustments, historical versus forecast versus estimate status, valuation/accounting method, assumptions and drivers, discount/growth/multiple choices, scenario/sensitivity checks, risk/quality/conflict limitations, and conclusion status. Never make a valuation estimate look exact or convert an empirical association, accounting convention, or analyst opinion into a theorem. |
| `physics` | Physical laws, models, derivations, approximations, dimensional checks, simulations, experiments, measurements, and visualizations. | Identify physical system, regime, coordinates/sign convention, quantities with units and dimensions, governing equations or laws, assumptions/idealizations, boundary or initial conditions, retained and dropped terms, dimensionless parameters, derivation route, experiment or simulation setup, uncertainty/error, data/code/material availability, and validity limits. Dimensional consistency is a check, not proof that a law/model is true. |

Standard-by-standard separation decision:

| Standard family | Separate by domain? | Rule |
| --- | --- | --- |
| Safety, scope, structure, labels, TODOs, searchability | No. | Use one universal standard. Domain only affects placement and terminology in reports. |
| Theorem-style statements and proofs | Mostly no. | Universal proof standard applies. Add a domain overlay only to keep non-mathematical claims out of theorem-style or to state domain hypotheses as mathematical assumptions before proving consequences. |
| Definitions and notation | Overlay. | Universal clarity rules apply; add unit/dimension/currency/date/measure/basis/regime context when the domain needs it. |
| Typed methods and algorithms | Overlay. | Universal `proofmethod`/`computationmethod` distinction applies; verification, admissibility, stopping, backtest, sensitivity, dimensional, or proof-obligation checks depend on domain. |
| Examples and counterexamples | Overlay. | Universal role standard applies; domain decides what counts as admissible data, verification, and a meaningful boundary case. |
| Intuition, motivation, perspective, remark, key insight, structural commentary | Overlay. | Universal non-authority and placement rules apply; domain-specific mental models, limitations, and significance must be explicit and source-supported. |
| Applied environments | Yes. | Use Section 5.8 plus the domain matrix. These blocks are where finance/physics/empirical standards diverge most. |
| Figures and tables | Yes by visual role and overlay by domain. | Use Section 6.1 figure roles, then add axes/units/source/window for visualizations, date/currency/basis for financial exhibits, scale/uncertainty/acquisition context for scientific images, and formal anchors for mathematical illustrations. |
| Research-paper ingestion | Yes. | Use Section 7.10 critical-content filters by domain. Preserve only durable owners, methods, evidence, limitations, and reproducibility context. |
| Further research recommendations | Overlay. | Use Section 7.9 format universally, but choose source authority by domain: canonical books/surveys for mathematics, peer-reviewed or regulatory/model-risk sources for quant finance, filings/accounting/valuation standards and finance literature for fundamental finance, and peer-reviewed/scientific society/standards sources for physics. |

When a row does not fit an existing environment because a domain has a durable evidence object not represented here, use the new environment or figure-type gap protocol in Section 7.8. Web research in that protocol may define the missing standard, but it must not supply subject content for the notes.

## 8. Validation and completion

Before marking a file complete, inspect every formal environment and review matches for:

```sh
rg -n -i '\b(for all|for every|for each|there exists|there is a unique)\b' <target>
rg -n -i '(Theorem|Proposition|Lemma|Corollary) \\ref\{[^}]+\} (gives|give|yields|shows|makes|implies|ensures|provides)\b' <target>
rg -n '\\\[|\\begin\{(displaymath|equation\*?|align\*?|gather\*?|multline\*?)\}|\$\$' <target>
rg -n '\\begin\{(smallmatrix|matrix|pmatrix|bmatrix|vmatrix|Vmatrix)\}' <target>
rg -n '\\begin\{(figure|illustrationfigure|visualizationfigure|schematicfigure|financialexhibitfigure|sourceimagefigure|tablevisualfigure)\}|\\includegraphics|\\begin\{tikzpicture\}|\\begin\{tikzcd\}|\\begin\{axis\}' <target>
rg -n '\b(Moreover|Furthermore|In addition|Also|In particular)\b' <target>
rg -n -i '\$[^$]*(\\forall|\\exists|\\exists!)[^$]*\$[^%\n.]*\b(for all|for every|for each|there exists|there is a unique)\b|\b(for all|for every|for each|there exists|there is a unique)\b[^%\n.]*\$[^$]*(\\forall|\\exists|\\exists!)[^$]*\$|\b(dummy parameter)\b' <target>
rg -n -i '\\[A-Za-z]+:[^.\n]*,\s*with \$?[A-Z][A-Za-z_0-9]*\\defeq|\$\\exists [^$]*\\ni [^$]*\$ (compact|open)' <target>
rg -n '\\hlt\{(Structural Commentary|Key Insight)\}:' <target>
rg -n '\\hlt\{(Structural Commentary|Key Insight)\}:[^%\n]*[^\\]$' <target>
```

These are review gates, not blind replacements and not evidence that the semantic ledger is complete. In particular, a prose-quantifier hit may be acceptable when its scope is clear and prose is more readable; a symbolic-quantifier hit may still fail if the symbol is being used as an English-word substitute or makes the sentence harder to parse. For commentary hits, manually verify adjacency, terminal placement, exact order, and the required `\\` on both lines.

Also manually review every theorem-style statement that spans many source lines before its first conclusion, contains several `Set`, `Let`, `Put`, `Define`, or `Choose` clauses, or exposes construction machinery such as Picard operators, iterates, local boxes, suprema/maxima, or error constants. Confirm each such item is a source-supported reusable part of the result rather than proof scaffolding. If not, simplify the statement and move the machinery into the proof, a method, an example, or a separate source-supported proposition.

At scope completion:

1. Reconcile the environment ledger: every row received an individual first pass and cold second pass; report reviewed, rewritten, retained, split, and proofless-exception counts.
2. Reconcile `FILE_COVERAGE`: every eligible file in the active batch was reviewed.
3. Reconcile domain classification, component/claim counts, typed-method environment choice/problem-type/data/target/approach/verification extraction, example target/data/verification/takeaway checks, counterexample claim/admissibility/hypothesis/failure/lesson checks, intuition anchor/mental-model/correspondence/scope/formal-bridge checks, applied-environment checks from Section 5.8 and domain overlays from Section 7.11, remark/expository role checks, factored list preambles, the sentence-by-sentence prose-to-notation audit, proof completeness, and one-to-one statement/proof coverage.
4. Reconcile every proof citation: earlier order, theorem-style category, matching hypotheses/conclusion, and genuine usefulness.
5. Reconcile `COMMENTARY_POLICY` for quality, exact syntax, and placement, not merely matching counts: the pair must be adjacent, terminal, ordered Structural Commentary then Key Insight, and both lines must end with `\\`.
6. Reconcile displays and matrix row counts under `MATH_LAYOUT`.
7. Reconcile figure roles and quality: every touched figure has a primary role, the corresponding typed wrapper unless a reported exception applies, callout, `fig:` label, caption, source/data/model provenance when relevant, axes/units/date/currency/window/context where applicable, accessibility checks, and rendered inspection.
8. Reconcile collection-level standards: overview orientation, source provenance and coverage ledger, notation lifecycle, source-supported examples/counterexamples/applied checks, equation numbering, TODO taxonomy, naming/searchability, and multi-PDF readiness.
9. Check dependency order, labels/references, notation, input edges, structural depth, retired `sections/` inputs, and touched figures.
10. Run `git diff --check` and distinguish pre-existing failures from current edits.
11. Build outside the repository:

```sh
build_dir="$(mktemp -d /private/tmp/math_notes_alignment.XXXXXX)"
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir="$build_dir" math.tex
```

12. Render every affected page individually at readable resolution and inspect each changed environment. Also inspect the build log for the edited line range, distinguishing unrelated warnings elsewhere. Contact sheets and overfull-box scans are navigation aids, not final visual QA. Iterate until no avoidable display, sparse tail, missing or weak commentary, underformalized proof, missed enumeration, repeated item setup, claim mismatch, invalid reference, overfull edited line, or figure collision remains.

The active batch is complete only when all selected files satisfy these rules, the isolated build passes unless disabled, unrelated work is preserved, and only genuine out-of-scope/source/authorization issues remain. Under `RUN_BATCH: one-numbered-file`, completing one file is success even when the wider part or section remains; report the exact next cursor. Under `all-selected`, stop at a file boundary if rigor would otherwise fall.

The final report must state: scope, domain setting, active batch, and coverage completed; ledger counts; files changed; main structural/mathematical/environment/notation/figure changes; source-provenance and collection-level decisions when applicable; result splits, proof additions, proofless exceptions, and proof-reference changes; commentary, display, equation-numbering, and matrix exceptions; cold-pass and build results; preserved pre-existing work; remaining blockers; and the exact next cursor or explicit wider-scope completion.
