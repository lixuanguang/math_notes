# Phase 0 Baseline Audit

Generated from the current working tree on 2026-06-14.

## Commands

```sh
latexmk -g -pdf -interaction=nonstopmode -halt-on-error math.tex
rg -n '^\\(part|section|subsection|subsubsection|paragraph)\{' sections
rg -n '\\input\{' math.tex sections
```

## Artifacts

- `baseline_math.log`: fresh LaTeX build log.
- `heading_depth.txt`: current heading-depth scan for `sections/`.
- `input_graph.txt`: current `\input{...}` scan for `math.tex` and `sections/`.

## Summary

- Build result: success.
- Output: `math.pdf` written with 431 pages.
- Build warning: `thm:monotone-convergence` is multiply defined.
- Heading declarations found: 229.
- Input declarations found: 448.

Heading counts:

| Heading | Count |
| --- | ---: |
| `\part` | 10 |
| `\section` | 32 |
| `\subsection` | 180 |
| `\subsubsection` | 7 |
