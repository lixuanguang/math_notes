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
   - linguistics: language-community and primary-data records, reference grammars/dictionaries/corpora, LSA/IPA/ISO conventions, and peer-reviewed descriptive or theoretical work;
   - philosophy: primary texts in identified editions/translations, peer-reviewed arguments and surveys, and established reference works;
   - literature: primary texts and critical editions/translations, MLA/TEI textual standards, peer-reviewed criticism, and archival or reception records;
   - history: primary archival/oral/material records and finding aids, scholarly editions, and peer-reviewed monographs, articles, and historiography;
   - political science: official legal/institutional records, APSA/AAPOR transparency standards, trusted datasets, and peer-reviewed theoretical or empirical work;
   - economics: official statistical series with methodology and vintage, peer-reviewed work, AEA data/code records, and applicable standards or regulators;
   - chemistry: IUPAC/ACS/NIST authorities, exact primary experimental or computational data, standard references, and peer-reviewed work;
   - materials science and engineering: exact test standards and sourced property data, NIST/standards-body metrology and metadata, standard texts, and peer-reviewed studies;
   - chemical engineering: current process/industry standards, exact property and vendor data, standard texts, peer-reviewed studies, and CCPS safety guidance;
   - electronic engineering: current standards-body records, exact manufacturer datasheets for component claims, standard texts, peer-reviewed work, and metrology/simulation/measurement documentation;
   - nuclear science and engineering: IAEA/ISO and the applicable regulator, exact evaluated/experimental nuclear-data releases, standard texts, and peer-reviewed work;
   - quantitative finance: peer-reviewed texts/papers plus regulator, exchange, reproducibility, and model-risk sources;
   - fundamental finance: accounting/valuation standards, official filings/regulators, and peer-reviewed finance/accounting;
   - physics: peer-reviewed work, standard texts, societies, NIST/unit/uncertainty standards, and experiment/simulation documentation;
   - music: primary scores/manuscripts/recordings, critical editions and catalogues, MLA/MEI/MusicXML conventions, and peer-reviewed scholarship;
   - fine arts: direct object, repository, conservation, and provenance records; Getty vocabularies/CDWA; archival and peer-reviewed scholarship; and CAA rights guidance.
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
