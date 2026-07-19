# Notation List Prompt

```text
I am working in:
/Users/lxg/Documents/GitHub/math_notes

Evaluate and edit the notation list after a formalization run. The goal is a durable, compact, searchable, and collision-aware notation layer, not a glossary of every local symbol.

Use this prompt after `prompts/prompt_library/formalize_content.md`, once theorem/proof wording and local notation have mostly stabilized.

Configuration:
- MODE: edit
- SCOPE_LEVEL: <part | section | subsection | file | notation-list>
- TARGET: <exact parts/... scope, parts/00_notations, exact notation file, or "changed formalization scope">
- START_CURSOR: <beginning | exact notation file>
- FILE_COVERAGE: <changed-and-new | tracked-modified | all-active>
- RUN_BATCH: one-notation-file
- NOTATION_COVERAGE: <affected-scope | all-notation-files | target-notation-file>
- CONTENT_POLICY: refine-only
- SOURCE_MATERIAL: <none | exact provided files/pages>
- ALLOW_NEW_NOTATION_ENTRY: yes
- ALLOW_NEW_MACRO: no
- ALLOW_REMOVE_STALE_ENTRY: yes-after-verified-unused
- BUILD: yes

External notation baseline:
1. Terence Tao, "Use good notation" (https://terrytao.wordpress.com/advice-on-writing-papers/use-good-notation/): notation should emphasize important parameters, hide routine ones only when appropriate, define global notation near the front and local notation near use, stay compatible with established notation, avoid cleverness, introduce notation when repeated enough to help, use macros for uncertain recurring notation, and keep notation precise and unambiguous.
2. Leonard Gillman, `Writing Mathematics Well` (https://bookstore.ams.org/mmbk-7/): notation and terminology belong to general organization, and the use of symbols should be sparse, well chosen, visually readable, integrated with text, consistently numbered, and stripped of useless information.
3. Dimitri Bertsekas, "Ten simple rules for mathematical writing" (https://faculty.engineering.asu.edu/bertsekas/ten-simple-rules-for-mathematical-writing/): use consistent notation and nomenclature, organize linearly and hierarchically, avoid underexplaining or overexplaining, and use examples/counterexamples when they clarify concepts.
4. AMS Author Handbook (https://www.jointmathematicsmeetings.org/arc/handbook/index.html): use standard LaTeX structures, keep reusable mathematical commands in the preamble when they are truly frequent, do not redefine existing commands, use math mode for mathematical expressions, use roman operator commands for operator names, and use `\eqref` for numbered-equation references.
5. AMS/EMS/LMS/SIAM accessible-math guidance (https://www.lms.ac.uk/publications/accessiblemaths): source should remain structurally convertible and figures/tables should not rely on visual styling alone; notation-list edits must preserve accessible source structure.
6. Shoemaker et al., "Writing mathematical ecology" (https://doi.org/10.1002/ecs2.3701): define all notation used in key formulas, keep notation consistent with the manuscript and broader literature where possible, and avoid similar-looking symbols for dissimilar meanings.
7. NIST SP 811, "Check List for Reviewing Manuscripts" (https://www.nist.gov/pml/special-publication-811/nist-guide-si-check-list-reviewing-manuscripts): physical quantities should keep quantity symbols, numerical values, and unit symbols distinct and consistently formatted.

Authority and safety:
1. Read `prompts/alignment_requirements.md` completely, especially Sections 5.1, 5.8, 6, 7.3, 7.5, 7.6, 7.7, 7.8, and 8. This prompt is stricter for notation-list ownership and collision edits.
2. Run `git status --short` before editing and preserve unrelated work.
3. Do not stage, commit, push, reset, checkout, restore, revert, delete unrelated files, clean the worktree, or edit generated PDF/auxiliary files.
4. Do not browse during a normal run. Use the external baseline above and the repository standards already recorded here.
5. Never overwrite a whole notation file. Use focused patches. If a target file changed unexpectedly or a patch does not apply cleanly, stop on that file and report the conflict.

Required reading:
1. Read `parts/00_notations/overview.tex`.
2. Read `parts/00_notations/00_collision_index_and_scope_rules.tex`.
3. Read every notation file selected by NOTATION_COVERAGE.
4. Read `parts/base.tex` macro/operator definitions.
5. Read the formalized target content from the previous run, plus nearby prerequisites needed to understand notation scope and collisions.
6. Resolve active `\input` order for the affected mathematical files before deciding whether notation is local, section-level, or global.

Notation coverage:
- `affected-scope`: audit notation introduced or materially changed in TARGET and its touched notation files.
- `all-notation-files`: audit every file under `parts/00_notations/` in active order.
- `target-notation-file`: audit only the exact notation file named in TARGET plus any affected local usage needed to verify entries.

With `RUN_BATCH: one-notation-file`, complete only the next notation file in active notation-list order, beginning at START_CURSOR, then report the exact next notation-file cursor. If TARGET is a changed formalization scope and no notation file is yet selected, first build the affected notation ledger, then choose the first affected notation file.

Notation ledger:
Before editing, build a ledger with one row per candidate notation symbol, macro, operator, or convention:
- surface form and source file/line;
- first active use and nearby definition;
- intended meaning;
- applied context when relevant: unit, physical dimension, currency, date, compounding, frequency, measure, basis of value, or data source;
- scope: proof-local, block-local, subsection-local, section-local, part-local, or global;
- recurrence count and spread across files/sections/parts;
- existing notation-list owner, if any;
- collision or near-collision candidates;
- macro/operator status in `parts/base.tex`;
- decision: keep local, add entry, rewrite entry, move entry, merge duplicate, split overloaded entry, add collision-index note, add macro request, or remove stale entry.

Edit standard:
1. The notation list records durable conventions and deliberate collisions. It is not a dictionary of every variable used in a proof.
2. Promote notation to `parts/00_notations/` only when it recurs across major sections, is a persistent convention, or is a deliberate collision that readers must be warned about.
3. Keep proof-local, block-local, and one-off notation near first use in the mathematical file. Do not add it to the global notation list.
4. Use the smallest correct owner: collision rules in `00_collision_index_and_scope_rules.tex`, basic global conventions in `01_global_conventions.tex`, and subject-specific notation in the corresponding subject file.
5. Prefer existing macros and operator names. Do not add a macro when a notation entry or local declaration is enough.
6. With `ALLOW_NEW_MACRO: no`, report macro candidates instead of editing `parts/base.tex`. With `ALLOW_NEW_MACRO: yes`, add a macro only for a recurring expression whose spelling must be globally stable; use `\newcommand` or `\DeclareMathOperator` according to existing style, and do not redefine existing commands.
7. Entries must be compact and distinguish meaning by subject, argument type, font, decoration, unit/dimension, currency/date/frequency, measure, or local declaration. Avoid prose bloat, source commentary, proof context, valuation narrative, and textbook explanation.
8. If one glyph carries multiple deliberate meanings, either record the disambiguating feature in the collision index or split the subject entries so each meaning is findable.
9. If two entries describe the same notation with inconsistent meanings, do not average them. Verify active usage, choose the canonical owner, update or merge entries, and report any local-content files that need follow-up.
10. Remove a stale entry only after verifying it has no active uses or is fully superseded by another entry. If unsure, keep it and mark/report `% TODO(notation): verify ...`.
11. Preserve mathematical source files unless a minimal first-use repair is necessary: define notation near first use, replace a leaked proof-local symbol, or update a local declaration after a notation-list correction.
12. Keep notation-list entries visually uniform: use `\notationgroup{...}` for groups and `\notationentry{...}{...}` for rows; keep row text concise, sentence fragments acceptable, and no theorem/proof prose.

Collision checks:
1. Search for each candidate surface form and macro in active content before editing the notation list.
2. Check similar glyphs: roman/calligraphic/script/bold variants, bars, stars, primes, hats, tildes, subscripts, superscripts, and overloaded operators.
3. Check overloaded single letters and common symbols such as `B`, `I`, `P`, `R`, `r`, `V`, `D`, `L`, `M`, `Q`, `\Delta`, `\Omega`, `\mu`, `\sigma`, `\lambda`, `*`, prime, and overline before adding a durable entry, especially across probability, dynamics, pricing, valuation, and accounting contexts.
4. Do not resolve a collision by inventing a new notation in mathematical content unless the local file already supports that change and the edit is minimal.

Validation:
1. Run targeted searches for new/changed notation forms, stale duplicate entries, and macro definitions.
2. Run `git diff --check`.
3. If `BUILD: yes`, build outside the repository and inspect notation-list pages affected by the edited file; if `BUILD: no`, report that the rendered notation-list check was intentionally skipped.
4. Confirm every changed notation entry has a verified active use or an explicit convention role.
5. Confirm every notation-list edit respects scope, owner file, collision index, macro policy, and accessible/convertible LaTeX structure.

Final report:
- resolved notation coverage, active notation file, and next notation-file cursor;
- notation-ledger counts: candidates reviewed, entries added, rewritten, moved, merged, retained, removed, TODOs, and macro candidates;
- files changed and why each file is the correct notation owner;
- collisions found and how each was disambiguated;
- local first-use repairs, if any;
- stale entries removed or retained with rationale;
- macro/operator decisions and any blocked macro candidates;
- validation, build/render results, preserved pre-existing work, and remaining blockers.
```

After the final `formalize_content.md` pass, run this prompt with `NOTATION_COVERAGE: affected-scope` for the changed material. Use `NOTATION_COVERAGE: all-notation-files` only for a slower global notation cleanup.
