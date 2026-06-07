# Phase 0: Source Intake

Use this phase when adding new notes from attached screenshots, source images, PDFs, or other provided source files.

## Goal

Convert provided source material into a conservative first-pass LaTeX draft that can then enter the normal workflow:

```text
Phase 0: Source Intake
-> Phase 1: Reorganize Content
-> Phase 2: Check Dependency Flow
-> Phase 3: Refine Section By Section
```

Do not treat source intake as final refinement. This phase should extract, classify, place, and insert supported content carefully, then leave deeper organization and polish to later phases. Work by section-bounded insertion batches rather than inserting one content piece at a time.

## Starting Command

The user may specify the source and cursor with:

```text
Source chapter/sections:
<state the chapter or sections extracted here>

Start from: <section number, file path, topic, or section heading>
```

Examples:

```text
Source chapter/sections:
Chapter 4, Sections 4.1-4.2

Start from: Section 2
```

```text
Source chapter/sections:
Screenshots on compactness and sequential compactness

Start from: topology/compactness
```

If the source files or screenshots are not accessible, stop and ask the user to attach them or provide file paths before proposing edits.

## Source Rules

- Use only the attached screenshots, source images, PDFs, and existing repository content.
- Do not search elsewhere.
- Do not add unsupported material from memory.
- Use the sources as mathematical guidance, not as text to copy.
- Do not paste or closely paraphrase long textbook passages.
- If the source is copyrighted, convert it into original notes in the repository's style.
- Mark uncertain OCR, unreadable formulas, missing hypotheses, unclear diagrams, and ambiguous proof steps clearly.

## Step 1: Extract

Read the provided screenshots, source images, or PDFs. Extract:

- Formulas.
- Definitions.
- Claims.
- Theorems.
- Propositions.
- Lemmas.
- Corollaries.
- Examples.
- Methods.
- Remarks.
- Exercises.
- Diagrams.
- Tables.
- Proof ideas.
- Notation.
- Dependencies and prerequisites.

For uncertain transcription, use a clear marker such as:

```latex
% TODO(source): verify transcription of ...
```

Do not silently guess missing mathematical content.

## Step 2: Classify

Classify each extracted block as one of:

- `definition`
- `theorem`
- `proposition`
- `lemma`
- `corollary`
- `example`
- `remark`
- `method`
- `proof`
- `motivation`
- `exercise`
- `notation`
- `figure`
- `table`
- `todo/source note`

If a block could belong to more than one class, report the ambiguity before insertion.

## Step 3: Inspect Existing Notes

Before proposing amendments, inspect the repository enough to understand:

- Repo structure and section organization.
- Earlier prerequisite material.
- Surrounding topic files.
- Existing style, notation, labels, and cross-references.
- Opening comments in relevant part, section, subsection, or topic files.
- Existing theorem/proof conventions and reusable macros.
- Relevant notation files.
- Relevant overview, `\input`, or `\include` files.
- Existing figures and figure directory conventions.

Do not assume the user has chosen the target location.

## Step 4: Place

Choose the most appropriate location yourself.

Check whether the extracted material:

- Fits an existing part, section, subsection, or topic file.
- Should create a new subsection or topic file under an existing part or section.
- Fills an existing placeholder.
- Duplicates existing notes.
- Depends on prerequisites that already exist.
- Requires prerequisite material to be placed, moved, or promoted into an appropriate earlier formal location.
- Should instead be recorded as a TODO/source note because prerequisites are missing or the source is unclear.

If a new file is needed, propose the file path and the relevant overview/input update before editing.

## Step 5: Present Proposed Insertion Batch

Do not insert content immediately. Present one small section-bounded insertion batch first.

A section-bounded insertion batch may contain several related extracted blocks for the same target section, such as definitions, propositions, examples, proof ideas, notation, and figures. Do not split a coherent section insertion into separate approvals for each individual content piece.

Before editing, report:

- Source chapter/sections used.
- Proposed topic name.
- Target file(s).
- New file(s), if any.
- Existing file(s) inspected.
- Extracted blocks to insert, grouped by classification.
- Where each block should be inserted and why.
- Whether the insertion fills a placeholder.
- Whether any content duplicates existing notes.
- Existing results or definitions that should be cited instead of duplicated.
- Missing prerequisites, uncertainties, or TODO/source notes.
- Whether missing or late prerequisites require structural reordering, promotion into formal exposition, or a new formal definition/result in an appropriate earlier location.
- Whether any figure, table, or TikZ redraw is useful.
- Whether new labels are needed, with proposed label names.
- Whether any theorem, proposition, lemma, corollary, or method would improperly depend on a remark or example.

Use small batches:

- One coherent topic per batch.
- One target section or subsection per batch unless the user approves a broader insertion.
- Prefer complete logical blocks.
- Avoid large multi-section integrations unless the user approves.

## Step 6: Approval Loop

After presenting a proposed insertion batch:

- If the user says `approve`, apply only that batch.
- If the user says `skip`, leave it untouched and ask whether to inspect another source batch.
- If the user says `revise`, adjust the proposal and present it again.
- If the user says `stop`, stop.
- If the user gives a new `Start from:` cursor, jump there and treat earlier material as intentionally skipped.

## Step 7: Insert Draft

When applying an approved insertion:

- Add a clean but minimally refined first-pass draft.
- Apply all approved items in the section-bounded insertion batch together.
- Preserve existing mathematical substance, labels, comments, and structure unless a local improvement is clearly needed for integration.
- Do not delete existing content.
- Do not overwrite or replace files wholesale.
- Do not reorganize unrelated material.
- Do not deep-polish prose in this phase.
- Do not rename existing labels unless explicitly approved.
- Do not duplicate earlier results; cite existing material with `\ref{...}` only when the reference is appropriate and already introduced.
- Do not resolve missing prerequisites by adding an ad hoc unnumbered prerequisite paragraph immediately before usage.
- If new material depends on missing prerequisites and the provided source supports them, propose the bigger-picture structural fix: place, move, or promote the prerequisite content into the appropriate earlier formal location, such as a definition, proposition, lemma, method, notation paragraph, or surrounding exposition.
- If prerequisites are missing or uncertain, leave a concise TODO/source note.

The inserted draft should cover supported:

- Definitions.
- Theorems.
- Propositions.
- Lemmas.
- Corollaries.
- Examples.
- Methods.
- Proof ideas.
- Cross-references.
- Notation.
- Useful figures.

## Figure Rule

If the source contains useful diagrams, geometric intuition, schematic relationships, tables, or visual proof ideas:

- Add a figure only when it genuinely clarifies the material.
- Prefer clean TikZ redraws for mathematical diagrams or structures.
- Do not add decorative figures.
- Do not reproduce screenshots that are merely text.
- Put TikZ files under the appropriate `figures/` directory.
- Use clear captions, labels, and nearby source comments.
- Keep figures close to the text that introduces, explains, or uses them.

## Style Rules

Follow the surrounding notes:

- Topic files should begin with the repository's established sectioning command.
- Use short guiding paragraphs.
- Use theorem environments naturally: definitions, propositions, lemmas, corollaries, theorems, examples, methods, remarks.
- Use `\hlt{...}`, labels, concise proofs, and proof commentary consistently with nearby files.
- Use existing macros such as `\N`, `\R`, `\mathcal{...}`, `\operatorname{...}`, and `\defeq`.
- Prefer repository-style `$...$` equation blocks for standalone displayed formulas whenever possible. Use `\[...\]`, `$$...$$`, `equation`, `equation*`, `align`, `align*`, `gather`, or `multline` only when numbering, labels, cross-references, alignment, multi-line layout, or another environment feature is actually needed.
- Add notation to a notation file only if it recurs across major sections.

## Validation

After applying an approved insertion:

- Re-check affected references and labels.
- Re-check relevant overview, `\input`, or `\include` updates.
- Re-check that inserted formal results and methods do not depend on remarks or examples.
- Re-check figure placement if figures were added.
- Do not build with LaTeX unless the user explicitly asks.

Report:

1. Where the new content was placed and why.
2. Which source chapter/sections were integrated.
3. Which files changed.
4. What major definitions, results, methods, examples, figures, or TODO/source notes were added.
5. Any remaining gaps or uncertainties.

Then ask:

```text
Next step: continue source intake, proceed to Phase 1 reorganization, jump to a specific cursor, or stop?
```
