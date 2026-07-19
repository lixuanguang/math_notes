# Content Enhancement Recommendations

This file records proposed reference books, papers, surveys, standards, and other authoritative sources that could enhance `math_notes` in later source-grounded runs.

Do not add a recommendation here if the source is already present in `references.bib`. Before adding an entry, check `references.bib` by normalized title, author/editor names, year, DOI, ISBN, arXiv identifier, URL, and plausible BibTeX key. Also check this file for an existing recommendation and update that entry rather than duplicating it.

Recommendations are not source grounding for current LaTeX content. A later add-content run must use the actual source material before adding mathematics, examples, methods, figures, citations, or bibliography entries.

## Entry Template

```markdown
### <target path or active scope>

- Status: proposed
- Candidate key: `<bibtex-key>`
- Reference: <authors/editors>, *<title>*, <edition/version if any>, <publisher or journal>, <year>.
- Identifiers: DOI <...>; ISBN <...>; arXiv <...>; URL <...>.
- Type: <book | monograph | survey | paper | standard | regulator document | course notes | dataset documentation | other>
- Local gap/enhancement: <specific subsection/section/part gap this could improve>
- Fit rationale: <why the source is authoritative and suitable>
- Usage plan: <theorem/proof enrichment | examples/counterexamples | methods | applied models | figures | notation | historical context | exercises | bibliography expansion only>
- Duplicate check: `references.bib` checked by title/authors/year/identifier/key; recommendation file checked for duplicates.
- Search log: searched <venues> on <YYYY-MM-DD> using <terms>.
```
