# Further-Research Recommendations

This is a recommendation phase, not content ingestion or bibliography editing.

Maintain recommendations in `Content_Enhancement_Recommendations.md`. Do not edit LaTeX, `references.bib`, `references.tex`, citations, or `\nocite` entries. Web results identify candidate sources only; they are not authority for current note content.

## Search and selection

1. Read the target, nearby active owners, `references.bib`, and the existing recommendation file.
2. Resolve each local gap's exact path and domain before searching.
3. Make a concise search plan: concepts, prerequisites, adjacent topics, desired source types, venues, and exclusions.
4. Search authoritative primary metadata/host pages first: publishers, authors, DOI/Crossref/DataCite, arXiv, university catalogs/WorldCat, professional societies, official standards/regulators, and journal pages.
5. Prefer, when available: established graduate/advanced-undergraduate books; peer-reviewed surveys; landmark papers; official standards/regulatory material for applied topics; stable open course notes only when no stronger citable source exists.
6. Apply the domain authority order:
   - math: canonical books, surveys, and landmark papers;
   - computer science: exact normative specifications and official documentation, peer-reviewed texts/surveys/landmark papers, and archived artifact or benchmark records;
   - electronic engineering: current standards-body records, exact manufacturer datasheets for component claims, standard texts, peer-reviewed work, and metrology/simulation/measurement documentation;
   - quantitative finance: peer-reviewed texts/papers plus regulator, exchange, reproducibility, and model-risk sources;
   - fundamental finance: accounting/valuation standards, official filings/regulators, and peer-reviewed finance/accounting;
   - physics: peer-reviewed work, standard texts, societies, NIST/unit/uncertainty standards, and experiment/simulation documentation.
7. Reject low-authority summaries, link farms, vague-fit sources, and metadata too thin for reliable identification.

## Duplicate gate

Before adding a candidate, check `references.bib` and the recommendation file by normalized title, authors/editors, year, DOI, ISBN, arXiv identifier, URL, and plausible BibTeX key.

- Already in the bibliography: do not recommend; report as skipped.
- Already recommended: update the existing entry when new metadata or rationale adds value.
- Insufficient metadata: reject and report.

## Entry schema

Place each entry under the narrowest stable target and include:

- status: `proposed`, `deferred`, `rejected`, or `superseded`;
- exact target path/scope and domain;
- candidate BibTeX key;
- authors/editors, title, year, edition/version, publisher or journal;
- DOI, ISBN, arXiv, URL, or stable catalog/publisher identifier;
- source type;
- concrete local gap/enhancement;
- authority/fit rationale;
- later usage plan: theorem/proof, examples, methods, models, empirical study, valuation, figures, notation, history, exercises, or bibliography only;
- duplicate-check statement;
- date searched, venues, and key terms.

Recommend 3–7 high-quality sources per target batch unless the user requests a broad survey. Keep entries concise but actionable; omit broad wish lists without a local owner.
