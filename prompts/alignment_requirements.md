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
| `BUILD` | `yes` | Build outside the repository. |

`FILE_COVERAGE` meanings:

- `all-active`: every `.tex` file reachable through active `\input` edges in scope, including active untracked files.
- `changed-and-new`: tracked modified plus untracked `.tex` files in scope.
- `tracked-modified` or `untracked-new`: only that Git-status class.

Inspect inactive untracked files for ownership, but do not add an input edge without permission. Capture the coverage set before editing.

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
4. **Notation-aware:** audit every mathematical phrase; use bound, established notation when it improves precision or compression, and keep concise prose when notation would obscure the point.
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
5. For a method row, does the block identify the problem type, givens, target, approach-selection cue, operative steps, verification check, and limitation/transfer point appropriate to the source?
6. Has every mathematical phrase been kept as concise prose or converted to notation for a clear reason, without hiding logic?
7. Do adjacent clauses repeat the same object, quantifier, hypothesis, conclusion, or induction assumption in both prose and notation?
8. Is every derived symbol defined before first use, and are parallel data such as neighborhoods, intervals, parameters, or domains factored into one ordered bundle?
9. Are commentary lines genuinely structural/insightful and maximally concise?
10. Does the rendered block have clean semantic breaks and no sparse tail?

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
- A theorem-style statement, definition, or method preamble must not use a reference to a definition, theorem, proposition, lemma, corollary, example, or remark as a substitute for the actual local hypothesis or object. State the needed condition directly when it is short enough, e.g. a local Lipschitz condition, extension order, admissible-solution convention, graph notation, or compactness hypothesis. Use references in proof steps only when they supply a genuine earlier result.
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
| Method/process | Transferable problem-solving pattern; see Section 5.6. Setup first; enumerate genuine operative steps. A one-line convention remains prose. |
| Example | Setup, computation, conclusion. Enumerate only distinct steps/cases/comparisons. |
| Remark | One compact paragraph; no enumerate or commentary labels. |
| Perspective/motivation/principle | Concise prose; use semantic `\\` breaks between context, setup/contrast, consequence, and interpretation when several roles occur. |
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

**Earlier-result reuse.** After explicit formalization, search only earlier active theorems, propositions, lemmas, and corollaries. Cite one only when it precedes the current result, its hypotheses hold, its conclusion supplies the exact step, and citation is clearer or shorter than repetition. Never use a later result or a definition, example, remark, method, perspective, or algorithm as proof authority. Keep short calculations inline; if no result applies, prove the step directly.

Use result references as `$P$ by Theorem \ref{...}.` or `By Lemma \ref{...}, $P$.` Never make a result the subject of “gives,” “yields,” “shows,” “makes,” “implies,” “ensures,” or “provides.”

**Commentary.** The Structural Commentary / Key Insight pair is a local annotation convention, not an external theorem-writing baseline. Under `required-new-and-rewritten`, every new or materially rewritten theorem-style result requires both lines after proof items and immediately before `\end{proof}`:

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

A `method` environment records a reusable way to attack a class of problems. It is not a theorem statement, a proof, a worked example, a glossary entry, or pseudocode by default. Use a method when the source or existing repository content supports a transferable approach: a proof pattern, computation pattern, diagnostic workflow, construction recipe, approximation/decomposition scheme, or algorithm preview. Use an example for a one-off worked problem; use theorem-style environments for claims; use `breakablealgorithm` only when executable pseudocode is the point.

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
\begin{method} \label{meth:...} \hlt{...}\\
\hlt{Use When}: <problem type, data, and target>.\\
\hlt{Key Idea}: <approach cue and driver>.
\begin{enumerate}[label=\roman*.]
\setlength{\itemsep}{0pt}
\item ...
\end{enumerate}
\end{method}
```

Use `\hlt{Use When}` and `\hlt{Key Idea}` only when they reduce ambiguity; omit them for a one-line convention or a very short computational recipe. If several approaches are genuinely available, state a short selection rule before the steps, e.g. choose a direct theorem when its hypotheses are visible, reduce to a special case when the target is invariant under approximation, or split into cases when the obstruction is local. Do not list a menu of generic tactics unless each branch has a source-supported cue and consequence.

Method steps must be operative and ordered. Generic steps such as "understand the problem," "apply the theorem," "simplify," or "check the answer" are too vague unless specialized into the actual givens, theorem hypotheses, simplification, or verification. Conversely, do not turn a method into a full worked example: keep sample calculations in an `example`, proof obligations in a proof, and detailed iteration code in an algorithm.

When extracting methods from source material, prefer the source's natural level of generality. Do not invent alternative approaches, success criteria, convergence guarantees, complexity claims, or edge cases. If a useful method is only implicit, include only the shortest source-grounded abstraction needed to make the approach reusable.

## 6. Dependencies, labels, notation, and figures

- Definitions, notation, and prerequisites precede use. Formal results/methods must not depend on remarks or examples; promote or move essential content.
- Resolve ownership structurally by reordering, moving, splitting, promoting, or citing the correct earlier owner—not by an ad hoc prerequisite paragraph.
- Use one stable descriptive label per anchor with established prefixes (`def:`, `thm:`, `prop:`, `lem:`, `cor:`, `meth:`, `ex:`, `rem:`, `per:`, `fig:`, `alg:`). Update every affected reference and remove stale, missing, or duplicate labels.
- Read the collision index and relevant notation file. Disambiguate reused glyphs by font, decoration, arguments, or local declaration. Reuse base macros; add global notation/macros only when durable across major sections.
- Figures must clarify mathematics. Prefer editable TikZ, nearby house colors/weights, essential labels only, and succinct captions; move explanatory prose, legends, and equations into a succinct color-coded caption when clearer.
- Every touched TikZ figure requires a temporary standalone compile, rendered preview, visual inspection, and iteration. Source or compile inspection alone is insufficient.

## 7. Collection-level standards

Local environment quality is necessary but not sufficient. A proper notes collection must also preserve orientation, provenance, notation hygiene, examples, referenceability, and unfinished-work discipline across parts and sections.

### 7.1 Reader orientation and overview hygiene

- Each part and section overview should be a concise navigation map, not a duplicate mini-chapter. When touched for structural reasons, it should state the role of the unit, main prerequisites, main objects/results, and forward dependencies when that helps placement.
- Overviews own structure and route-finding. Put mathematical substance in numbered subsection files unless the existing local convention clearly uses the overview for a short orienting paragraph.
- A new subsection must have a real mathematical payload, an active input edge, and a clear local owner. Do not add empty future headings, broad skeletons, or source-table placeholders.
- When moving or adding material, preserve a readable path: definition or notation before first use, examples near the definitions they test, and major results after their prerequisites.

### 7.2 Source provenance and coverage

- For `CONTENT_POLICY: source-grounded`, maintain a source-to-target ledger for the run. Each source block should have an exact source identifier, mathematical type, target owner, and status: `covered`, `partial`, `missing`, `misplaced`, `unsupported`, `needs later file`, or `blocked-new-section-or-part`.
- Distinguish `source-stated`, `source-derived`, and `repo-derived` material. Source-stated material is explicitly present in SOURCE_MATERIAL; source-derived material is a direct formalization or short consequence needed to make the source statement usable; repo-derived material comes from earlier active results used to complete a proof or avoid duplication.
- Do not litter the LaTeX with source bookkeeping. Put provenance in the edit report unless a local `% TODO(source): ...` is necessary because the mathematical content is genuinely unreadable, ambiguous, or incomplete.
- A source-grounded pass is incomplete if it merely adds the easiest visible result and leaves other supported source blocks unclassified.

### 7.3 Notation lifecycle

- The notation baseline is: define global notation near the front, define local notation near first use, prefer established conventions, use notation only when it reduces cognitive load, keep symbols precise and unambiguous, and use stable macros/operators only for recurring durable expressions.
- Classify new notation as proof-local, block-local, subsection-local, section-local, or global before introducing it. Proof-local notation must not be used later as if it were durable.
- Put durable notation in `parts/00_notations/` only when it recurs across major sections. Put section-local notation near its first section-level use. Put one-off notation inside the smallest block that needs it.
- Before adding notation, check nearby files, active notation files, and base macros for existing symbols and naming patterns. Resolve collisions by context, font, decoration, arguments, or a local declaration.
- A repeated expression used three or more times in a local argument is a candidate for notation; a one-off expression normally is not. Do not introduce notation that is cleverer than the concept or hides the active variables.

### 7.4 Examples, counterexamples, and boundary tests

- Major definitions and nontrivial hypotheses should have a nearby source-supported example, nonexample, counterexample, or test computation when the source or existing repository content provides one.
- An example should do mathematical work: instantiate a definition, verify a hypothesis, compute an invariant, show a boundary case, or distinguish two similar concepts. Avoid decorative examples.
- Counterexamples and nonexamples are especially valuable when a hypothesis is easy to overlook. Do not invent them during source-grounded intake.
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

## 8. Validation and completion

Before marking a file complete, inspect every formal environment and review matches for:

```sh
rg -n -i '\b(for all|for every|for each|there exists|there is a unique)\b' <target>
rg -n -i '(Theorem|Proposition|Lemma|Corollary) \\ref\{[^}]+\} (gives|give|yields|shows|makes|implies|ensures|provides)\b' <target>
rg -n '\\\[|\\begin\{(displaymath|equation\*?|align\*?|gather\*?|multline\*?)\}|\$\$' <target>
rg -n '\\begin\{(smallmatrix|matrix|pmatrix|bmatrix|vmatrix|Vmatrix)\}' <target>
rg -n '\b(Moreover|Furthermore|In addition|Also|In particular)\b' <target>
rg -n -i '\$[^$]*(\\forall|\\exists|\\exists!)[^$]*\$[^%\n.]*\b(for all|for every|for each|there exists|there is a unique)\b|\b(for all|for every|for each|there exists|there is a unique)\b[^%\n.]*\$[^$]*(\\forall|\\exists|\\exists!)[^$]*\$|\b(dummy parameter)\b' <target>
rg -n -i '\\[A-Za-z]+:[^.\n]*,\s*with \$?[A-Z][A-Za-z_0-9]*\\defeq|\$\\exists [^$]*\\ni [^$]*\$ (compact|open)' <target>
```

These are review gates, not blind replacements and not evidence that the semantic ledger is complete. In particular, a prose-quantifier hit may be acceptable when its scope is clear and prose is more readable; a symbolic-quantifier hit may still fail if the symbol is being used as an English-word substitute or makes the sentence harder to parse.

Also manually review every theorem-style statement that spans many source lines before its first conclusion, contains several `Set`, `Let`, `Put`, `Define`, or `Choose` clauses, or exposes construction machinery such as Picard operators, iterates, local boxes, suprema/maxima, or error constants. Confirm each such item is a source-supported reusable part of the result rather than proof scaffolding. If not, simplify the statement and move the machinery into the proof, a method, an example, or a separate source-supported proposition.

At scope completion:

1. Reconcile the environment ledger: every row received an individual first pass and cold second pass; report reviewed, rewritten, retained, split, and proofless-exception counts.
2. Reconcile `FILE_COVERAGE`: every eligible file in the active batch was reviewed.
3. Reconcile component/claim counts, method problem-type/data/target/approach/verification extraction, factored list preambles, the sentence-by-sentence prose-to-notation audit, proof completeness, and one-to-one statement/proof coverage.
4. Reconcile every proof citation: earlier order, theorem-style category, matching hypotheses/conclusion, and genuine usefulness.
5. Reconcile `COMMENTARY_POLICY` for quality and placement, not merely matching counts.
6. Reconcile displays and matrix row counts under `MATH_LAYOUT`.
7. Reconcile collection-level standards: overview orientation, source provenance and coverage ledger, notation lifecycle, source-supported examples/counterexamples, equation numbering, TODO taxonomy, and naming/searchability.
8. Check dependency order, labels/references, notation, input edges, structural depth, retired `sections/` inputs, and touched figures.
9. Run `git diff --check` and distinguish pre-existing failures from current edits.
10. Build outside the repository:

```sh
build_dir="$(mktemp -d /private/tmp/math_notes_alignment.XXXXXX)"
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir="$build_dir" math.tex
```

11. Render every affected page individually at readable resolution and inspect each changed environment. Also inspect the build log for the edited line range, distinguishing unrelated warnings elsewhere. Contact sheets and overfull-box scans are navigation aids, not final visual QA. Iterate until no avoidable display, sparse tail, missing or weak commentary, underformalized proof, missed enumeration, repeated item setup, claim mismatch, invalid reference, overfull edited line, or figure collision remains.

The active batch is complete only when all selected files satisfy these rules, the isolated build passes unless disabled, unrelated work is preserved, and only genuine out-of-scope/source/authorization issues remain. Under `RUN_BATCH: one-numbered-file`, completing one file is success even when the wider part or section remains; report the exact next cursor. Under `all-selected`, stop at a file boundary if rigor would otherwise fall.

The final report must state: scope, active batch, and coverage completed; ledger counts; files changed; main structural/mathematical/environment/notation/figure changes; source-provenance and collection-level decisions when applicable; result splits, proof additions, proofless exceptions, and proof-reference changes; commentary, display, equation-numbering, and matrix exceptions; cold-pass and build results; preserved pre-existing work; remaining blockers; and the exact next cursor or explicit wider-scope completion.
