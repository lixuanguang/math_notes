# Notation List — Entry Point

```text
Repository: /Users/lxg/Documents/GitHub/math_notes

Goal: after formalization, make the notation layer durable, compact, searchable, scope-correct, and collision-aware. Do not turn it into a glossary of local variables.

Configuration:
- MODE: edit
- SCOPE_LEVEL: <part | section | subsection | file | notation-list>
- DOMAIN: <auto | math | quant-finance | fundamental-finance | physics | mixed>
- TARGET: <parts/... scope, parts/00_notations, exact notation file, or changed formalization scope>
- START_CURSOR: <beginning | exact notation file>
- FILE_COVERAGE: <changed-and-new | tracked-modified | all-active>
- RUN_BATCH: one-notation-file
- NOTATION_COVERAGE: <affected-scope | all-notation-files | target-notation-file>
- CONTENT_POLICY: refine-only
- SOURCE_MATERIAL: none
- ALLOW_NEW_NOTATION_ENTRY: yes
- ALLOW_NEW_MACRO: no
- ALLOW_REMOVE_STALE_ENTRY: yes-after-verified-unused
- MATH_LAYOUT: inline-strict
- BUILD: yes

Load before editing:
1. `prompts/standards/repository_and_scope.md`.
2. `prompts/standards/structure/notation_lifecycle.md`.
3. `prompts/standards/layout/math_layout.md` — notation pages and any first-use repair must still render without overflow.
4. `prompts/standards/validation.md` (full semantic/render profile, narrowed to notation work).
5. `prompts/standards/domains/README.md`, then only the configured or notation-ledger domain overlay(s).
6. Load `prompts/standards/writing/mathematical_style.md` only when a first-use mathematical clause must be repaired.

Coverage:
- `affected-scope`: notation introduced/materially changed in TARGET and its touched notation owners.
- `all-notation-files`: every active file under `parts/00_notations/`.
- `target-notation-file`: only the named notation file plus active usage required to verify entries.

Execution:
1. Run `git status --short`; read `parts/00_notations/overview.tex`, `00_collision_index_and_scope_rules.tex`, selected notation files, `parts/base.tex`, formalized TARGET, and nearby prerequisites.
2. Resolve active order and domain. Under `one-notation-file`, select the next affected/active notation file from START_CURSOR and report the next cursor afterward.
3. Build a notation ledger with: surface form/source; domain; first active use and definition; meaning; unit/dimension/currency/date/frequency/measure/basis/regime where relevant; scope; recurrence/spread; current owner; collision candidates; macro/operator status; and decision (`keep local`, `add`, `rewrite`, `move`, `merge`, `split`, `collision note`, `macro request`, or `remove stale`).
4. Apply `notation_lifecycle.md` completely. Search active usages and near-glyph variants before every durable change. Promote only recurring conventions; keep local notation local; use the smallest owner; never average conflicting meanings.
5. With `ALLOW_NEW_MACRO: no`, report macro candidates instead of editing `parts/base.tex`. If later enabled, add only stable recurring expressions in existing style without redefining commands.
6. Remove an entry only after verified non-use or full supersession. If uncertain, retain it with a precise notation TODO.
7. Preserve mathematical files except a necessary first-use definition, leaked local symbol repair, or declaration update following a verified correction.
8. Run targeted usage/duplicate/macro searches, `git diff --check`, an isolated build, edited notation-page log inspection, and readable rendering of every affected notation page. Fix any entry or formula overflow; verify accessible/convertible LaTeX structure.

Final report: coverage/domain/active file/next cursor; ledger counts; entries added/rewritten/moved/merged/retained/removed; collisions and disambiguation; local repairs; stale-entry rationale; TODOs and macro decisions; files changed; search/build/render results; preserved work; blockers.
```

Use `NOTATION_COVERAGE: affected-scope` after a formalization run. Reserve `all-notation-files` for an explicitly requested global cleanup.
