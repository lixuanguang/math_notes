# Further Research Prompt

```text
I am working in:
/Users/lxg/Documents/GitHub/math_notes

Search for possible reference books, papers, surveys, standards, or authoritative technical sources that could enhance the selected part, section, subsection, or file in a later source-grounded run. Maintain recommendations in `Content_Enhancement_Recommendations.md`.

Configuration:
- MODE: edit
- SCOPE_LEVEL: <part | section | subsection | file>
- TARGET: <exact parts/... path or unambiguous active scope>
- START_CURSOR: <beginning | exact resume file>
- FILE_COVERAGE: <all-active | changed-and-new | tracked-modified | untracked-new>
- RUN_BATCH: one-scope
- CONTENT_POLICY: recommendation-only
- SOURCE_MATERIAL: web-reference-search
- RECOMMENDATION_FILE: Content_Enhancement_Recommendations.md
- BIBLIOGRAPHY_FILE: references.bib
- BUILD: no

Authority and safety:
1. Read `prompts/alignment_requirements.md` Section 7.9 and treat it as canonical.
2. This prompt searches for references only. Do not add mathematical content to `parts/`, do not edit `references.bib` or `references.tex`, do not add `\cite` or `\nocite`, and do not build LaTeX.
3. Run `git status --short` before editing. Preserve unrelated changes. Do not stage, commit, push, reset, checkout, restore, revert, delete files, clean the worktree, or edit generated PDF/auxiliary files.
4. Use web results only to identify and evaluate candidate references. Do not import claims, proofs, examples, data, assumptions, or exposition from the web into the notes.

Required reading:
1. Read `STRUCTURE_MIGRATION_README.md`, `math.tex`, `references.bib`, `references.tex`, and `Content_Enhancement_Recommendations.md` if it exists.
2. Read the target overview/file(s) and nearby active files enough to identify local gaps, missing perspectives, weak coverage, source-light areas, applied extensions, or future subsection needs.
3. Resolve the exact active scope and record the target path(s) in the recommendation entry.

Search standard:
1. Build a short search plan before browsing: target concepts, prerequisites, adjacent fields, possible source types, and exclusion criteria.
2. Search reputable sources first: publisher pages, author pages, arXiv, DOI/Crossref/DataCite records, MathSciNet/Zentralblatt-style metadata when accessible, university library catalog pages, WorldCat, official standards/regulators, and professional society pages.
3. Prefer references in this order when available: standard graduate or advanced undergraduate books, peer-reviewed survey articles, landmark papers, official standards/regulatory documents for applied topics, and stable open course notes only when no stronger citable source exists.
4. Record the search terms, search venues, date searched, and any significant exclusion reason when a tempting source is rejected.
5. For every candidate, collect enough metadata for later bibliography work: authors/editors, title, year, edition/version when relevant, publisher or journal, DOI/ISBN/arXiv/URL when available, and a candidate BibTeX key.

Duplicate and bibliography gate:
1. Before adding a recommendation, check `references.bib` using normalized title words, author/editor names, year, DOI, ISBN, arXiv identifier, URL, and plausible BibTeX key.
2. If the candidate already appears in `references.bib`, do not add it to `Content_Enhancement_Recommendations.md`. Mention it only in the final report under `Skipped because already in bibliography`.
3. Check `Content_Enhancement_Recommendations.md` for an existing matching recommendation. Update the existing entry when the new search adds metadata, scope, or rationale; do not add a duplicate entry.
4. If metadata is too thin to identify the source reliably, do not add it as a recommendation. Report it as `rejected-insufficient-metadata`.

Recommendation entry standard:
Add or update recommendations under the narrowest stable target heading. Each entry must include:
- status: `proposed`, `deferred`, `rejected`, or `superseded`;
- target path or active scope;
- candidate BibTeX key;
- full reference metadata;
- identifiers: DOI, ISBN, arXiv, URL, or stable publisher/catalog URL when available;
- type: book, monograph, survey, paper, standard, regulator document, course notes, dataset documentation, or other;
- local gap/enhancement: what this would improve in the target notes;
- fit rationale: why this source is authoritative and appropriate;
- usage plan: theorem/proof enrichment, examples/counterexamples, methods, applied models, figures, notation, historical context, exercises, or bibliography expansion only;
- duplicate check: exact statement that `references.bib` and the recommendation file were checked;
- search log: date, search venues, and key terms.

Edit rules:
1. Edit only `Content_Enhancement_Recommendations.md` unless the file is missing, in which case create it.
2. Do not recommend more than 3-7 high-quality sources per target batch unless the user explicitly requests a broad bibliography survey.
3. Keep recommendations concise but complete enough to act on later.
4. Do not add broad wish-list references with no local target or no clear enhancement role.
5. Do not use recommendations as proof authority or source grounding for current LaTeX content. A later add-content run must use the actual source material.

Final report:
- resolved target and scope;
- files read and web venues searched;
- recommendations added or updated;
- candidates skipped because already in `references.bib`;
- candidates rejected and why;
- duplicate checks performed;
- file changed;
- confirmation that no LaTeX content, bibliography, citation, build, staging, commit, push, reset, checkout, revert, delete, or clean action was performed.
```
