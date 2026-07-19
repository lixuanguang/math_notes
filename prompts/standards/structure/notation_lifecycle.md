# Notation Lifecycle and Notation-List Ownership

## Scope before promotion

Classify notation as proof-local, block-local, subsection-local, section-local, part-local, or global.

- Define local notation at first use and keep it within its scope.
- Promote to `parts/00_notations/` only a durable convention that recurs across major sections or a deliberate collision readers must know about.
- A repeated expression used at least three times in one argument is a candidate for local notation, not automatically a global entry.
- Use the smallest owner: collision rules in `00_collision_index_and_scope_rules.tex`, basic conventions in `01_global_conventions.tex`, and subject notation in its matching file.
- Reuse existing macros and operators. Add a macro only for a recurring expression whose spelling must remain globally stable, and only when configuration permits it. Follow existing style with `\newcommand` for notation and `\DeclareMathOperator` for operator names; never redefine an existing command.

## Entry quality

Notation-list entries are compact, durable, searchable conventions—not textbook explanations or a dictionary of proof variables.

- Use `\notationgroup{...}` and `\notationentry{...}{...}` in the existing style.
- Distinguish meanings by subject, argument type, font, decoration, unit/dimension, currency/date/frequency, probability measure, accounting/valuation basis, regime, or local declaration.
- Keep quantity symbols, numerical values, and unit symbols distinct.
- Define all notation in key formulas while avoiding similar-looking symbols for unrelated meanings.
- Do not add prose history, source commentary, proof context, or valuation narrative to an entry.

## Collision audit

Before adding or changing a durable entry:

1. search active content for the surface form, macro, and nearby variants;
2. check roman/calligraphic/script/bold forms, bars, stars, primes, hats, tildes, subscripts, superscripts, and overloaded operators;
3. pay special attention to `B`, `I`, `P`, `R`, `r`, `V`, `D`, `L`, `M`, `Q`, `\Delta`, `\Omega`, `\mu`, `\sigma`, `\lambda`, `*`, prime, and overline across algorithms/programs, circuits/signals, probability, dynamics, pricing, valuation, accounting, and physics;
4. disambiguate through existing context, font, decoration, arguments, or a local declaration; do not invent unrelated notation merely to make the global list look unique.

If two entries conflict, verify active use, choose the natural owner, and merge/split explicitly; never average meanings. Remove a stale entry only after proving no active use remains or another entry fully supersedes it. If uncertain, retain it and record `% TODO(notation): verify ...`.

## Minimal local repairs

During notation-list work, preserve mathematical source files except for a necessary first-use definition, leaked local symbol repair, or local declaration update following a verified notation correction. Report macro candidates when `ALLOW_NEW_MACRO: no`.
