# Phase 0: Source Intake

Use this phase to turn provided screenshots, source images, PDFs, or other
source files into a conservative first-pass LaTeX draft.

Read `prompts/note-workflow/README.md` before this file.

## Goal

Extract, classify, place, and insert source-supported material so it can later
enter:

```text
Phase 1 -> Phase 2 -> Phase 3
```

Do not polish deeply in this phase.

## Source Rules

- Use only attached/provided source material and existing repository content.
- Do not search elsewhere.
- Do not add unsupported material from memory.
- Use sources as mathematical guidance, not text to copy.
- Do not paste or closely paraphrase long textbook passages.
- For copyrighted sources, write original notes in the repository's style.
- Do not silently guess missing mathematical content.
- Mark uncertain OCR, unreadable formulas, missing hypotheses, unclear diagrams,
  and ambiguous proof steps with comments such as:

```latex
% TODO(source): verify transcription of ...
```

If source files are inaccessible, stop and ask for attachments or paths.

## Workflow

1. Extract formulas, definitions, claims, theorems, propositions, lemmas,
   corollaries, examples, methods, remarks, exercises, diagrams, tables, proof
   ideas, notation, and prerequisites.
2. Classify each block as `definition`, `theorem`, `proposition`, `lemma`,
   `corollary`, `example`, `remark`, `method`, `proof`, `motivation`,
   `exercise`, `notation`, `figure`, `table`, or `todo/source note`.
   Report ambiguous classifications before insertion.
3. Inspect existing notes around the cursor: section organization, nearby topic
   files, comments, notation, labels, theorem style, figures, and overview/input
   files.
4. Choose the target location. Check for duplicates, placeholders, missing
   prerequisites, and whether a new file or overview/input update is needed.
5. Present one section-bounded insertion batch and wait for approval.
6. If approved, insert a clean first-pass draft only for that batch.
7. Validate and report.

## Proposal Must Include

- Source chapter/sections used.
- Proposed topic name.
- Target file(s), and new file(s) if any.
- Existing files inspected.
- Extracted blocks grouped by classification.
- Where each block would be inserted and why.
- Whether the batch fills a placeholder or duplicates existing notes.
- Existing results or definitions that should be cited instead of duplicated.
- Missing prerequisites, uncertainties, and TODO/source notes.
- Needed structural fixes for missing or late prerequisites.
- Whether any figure, table, or TikZ redraw is useful.
- Proposed new labels.
- Whether any formal result or method would improperly depend on a remark or
  example.

## Approved Edit Rules

- Apply all approved items in the batch together.
- Preserve existing content, labels, comments, and structure unless a local
  integration change is needed.
- Do not delete existing content.
- Do not overwrite files wholesale.
- Do not reorganize unrelated material.
- Do not rename existing labels unless explicitly approved.
- Do not duplicate earlier results; cite existing material only when the
  reference is appropriate and already introduced.
- If prerequisites are missing or unclear, leave a concise TODO/source note or
  propose the structural fix for a later approved batch.

## Figures

- Add a figure only when it clarifies the mathematics.
- Prefer clean TikZ redraws for mathematical diagrams.
- Do not add decorative figures or reproduce text screenshots.
- Put TikZ files under the appropriate `figures/` directory.
- Keep figures near the text that introduces or uses them.

## Validation Report

After insertion, report:

1. Where the content was placed and why.
2. Which source material was integrated.
3. Which files changed.
4. Major definitions, results, methods, examples, figures, or TODO notes added.
5. Remaining gaps or uncertainties.

Then ask:

```text
Next step: continue source intake, proceed to Phase 1, jump to a cursor, or stop?
```
