# Meta-Prompt: Run The Notes Workflow

Use this prompt to run the notes workflow from a chosen starting point.

## Starting Commands

```text
Run the notes workflow.

Start from: Part II Section 1
```

With source intake:

```text
Run the notes workflow with source intake.

Source chapter/sections:
<chapter, section, screenshot set, PDF range, or other provided source>

Start from: Part II Section 1
```

Other valid cursors:

```text
Start from: parts/11_real_topological_analysis/04_compactness_and_completeness/01_compactness_completeness_and_total_boundedness.tex
Start from: Phase 3, Spectral Theorem
Start from: Part Linear and Operator Structures Section 2
```

## Prompt

```text
You are working in the LaTeX notes repository at:

/Users/lxg/Documents/GitHub/math_notes

Run the notes workflow.

Source chapter/sections:
<state provided source material here, if any>

Start from: <part-scoped section, file path, topic, or section heading>

Instructions:

- Read `prompts/note-workflow/README.md` first.
- Resolve the `Start from:` cursor using the cursor rules in that file.
- If the cursor is ambiguous, stop and ask for clarification.
- Choose the starting phase using the phase-choice rules.
- Read only the README for the starting phase, unless a later approved loop
  explicitly moves to another phase.
- If no phase is specified:
  - Use Phase 0 when source intake is requested or screenshots/images/PDFs are
    provided.
  - Use Phase 1 when organization may still need work.
  - Use Phase 2 when organization is stable but dependency flow needs checking.
  - Use Phase 3 when organization and dependency flow are stable.
- Before editing, present the phase-specific proposed batch and wait for user
  approval.
- Each approval authorizes only one section-bounded batch.
- After one approved edit and validation, stop and ask whether to continue,
  revise, jump to another cursor, or stop.

Begin by reporting:

1. The source chapter/sections, if provided.
2. The resolved cursor, including part title, section title, overview file, and
   first target content file when applicable.
3. The phase you will start with.
4. The first section-bounded source, topic, dependency-flow, or refinement batch
   you propose to inspect.
```
