# External Research Basis

Last revalidated: 2026-07-19.

This file records the current first-party basis for the segmented standards. It is not normally loaded during editing; the operational requirements live in the other modules.

Repository-specific choices are deliberately stricter than generic publication guidance: `MATH_LAYOUT: inline-strict`, the four-row displayed-matrix threshold, `\limits` preference, sparse-tail repair order, Structural Commentary / Key Insight pair, one-row-at-a-time ledger, and `one-numbered-file` batch default are user standards. External sources do not override them.

## Mathematical writing and proofs

- [MIT, Writing a Math Phase Two Paper](https://web.mit.edu/mathp2/www/piil.html) supports stating a theorem before its proof, keeping statements concise, defining terms, explaining the status and significance of assertions, using consistent/simple notation, and distinguishing theorem/proposition/lemma/corollary/definition/remark roles.
- [Stanford CS103 Proofwriting Checklist](https://web.stanford.edu/class/archive/cs/cs103/cs103.1262/proofwriting_checklist) supports explicit assumptions and goals, load-bearing proof sentences, scoped variables, specific claims, and complete proof endpoints.
- [Terence Tao, Give appropriate amounts of detail](https://terrytao.wordpress.com/advice-on-writing-papers/give-appropriate-amounts-of-detail/) supports expanding crucial or unfamiliar steps while leaving routine details compact but locally checkable.
- [Terence Tao, Use good notation](https://terrytao.wordpress.com/advice-on-writing-papers/use-good-notation/) supports global notation near the front, local notation near use, consistency with established notation, precision, avoiding cleverness, and considering notation after roughly three meaningful repetitions.
- [Knuth, Larrabee, and Roberts, Mathematical Writing](https://cs.stanford.edu/~knuth/klr.html) remains a primary mathematical-writing reference covering notation, algorithms, diagrams, tables, and manuscript revision.
- [Common Core Mathematical Practice MP1](https://www.thecorestandards.org/Math/Practice/MP1/) supports method entries that identify givens, constraints, goals, entry points, solution paths, checks, special cases, and correspondences among representations.

## LaTeX structure and rendered presentation

- [AMS Author Handbook for Journals](https://www.ams.org/arc/journals/packages/proc/proc_amslatex/Author_Handbook_Journals.pdf) supports standard LaTeX structures, consistent figure numbering, TeX-set captions, and publication-ready graphics.
- [amsmath User's Guide](https://mirrors.ctan.org/macros/latex/required/amsmath/amsldoc.pdf) is the package authority for `equation`, `align`, `gather`, `multline`, `split`, and equation-number behavior. The repository's stronger inline-first policy remains local.

No external guide can verify this repository's no-overflow requirement; it must be enforced by isolated compilation, edited-line log inspection, and readable rendering of every changed page.

## Figures and accessibility

- [W3C WCAG 2.2](https://www.w3.org/TR/WCAG22/) supports equivalent-purpose text alternatives for non-text content.
- [W3C Understanding Use of Color](https://www.w3.org/WAI/WCAG22/Understanding/use-of-color) supports the rule that color is not the only visual carrier of information.
- [Nature Research Figure Guide](https://research-figure-guide.nature.com/figures/preparing-figures-our-specifications/) supports labeled axes with units, tick marks, accessible color, legible/editable text, non-overlap, scale bars, and avoiding decorative or misleading visual elements.
- [Matplotlib, Choosing Colormaps](https://matplotlib.org/stable/tutorials/colors/colormaps.html) supports choosing sequential, diverging, cyclic, or qualitative maps according to the data's ordering and critical values.

## Physical quantities and uncertainty

- [NIST Special Publication 811](https://www.nist.gov/pml/special-publication-811) and its [manuscript checklist](https://www.nist.gov/pml/special-publication-811/nist-guide-si-check-list-reviewing-manuscripts) support keeping quantity symbols, numerical values, unit symbols, and SI conventions distinct and consistent.
- [NIST Technical Note 1297](https://www.nist.gov/pml/nist-technical-note-1297), especially [reporting uncertainty](https://www.nist.gov/pml/nist-technical-note-1297/nist-tn-1297-7-reporting-uncertainty), supports explicit uncertainty components, evaluation methods, coverage factors, interpretation basis, and current measurement-process documentation.

## Empirical and model-based work

- [AEA Data and Code Availability Policy](https://www.aeaweb.org/journals/data/data-code-policy) supports data provenance, code/computation detail, trusted repositories, reproducibility checks, and disclosure of access constraints. The current policy is dated February 2026.
- [Nature Portfolio reporting and availability standards](https://www.nature.com/ncomms/editorial-policies/reporting-standards) support transparent experimental/analytical design, data/code/material/protocol availability, access restrictions, and sufficient information to replicate or build on claims.
- [Federal Reserve revised model-risk guidance (SR 26-2)](https://www.federalreserve.gov/supervisionreg/srletters/SR2602.htm) and the [current consolidated guidance](https://www.federalreserve.gov/frrs/guidance/supervisory-guidance-on-model-risk-management.htm) support purpose- and materiality-sensitive validation, conceptual soundness, outcome analysis, monitoring, limitations, intended use, and governance. SR 26-2 superseded SR 11-7 in April 2026; prompts should not cite SR 11-7 as current guidance.

## Accounting, disclosure, and valuation

- [FASB Conceptual Framework](https://fasb.org/the-conceptual-framework) supports distinguishing reporting objectives and concepts from operative GAAP requirements.
- [SEC MD&A guidance](https://www.sec.gov/rules-regulations/2003/12/commission-guidance-regarding-managements-discussion-analysis-financial-condition-results-operations) supports clear, non-duplicative, material, context-rich discussion of trends, uncertainties, liquidity, cash flow, accounting estimates, and historical versus prospective information.
- [SEC guidance on key performance indicators and metrics](https://www.sec.gov/rules-regulations/2020/01/commission-guidance-managements-discussion-analysis-financial-condition-results-operations) supports explicit definitions, calculation method, reasons for use, and change disclosure for nonstandard metrics.
- [International Valuation Standards, effective 31 January 2025](https://ivsc.org/new-edition-of-the-international-valuation-standards-ivs-published/) add explicit Data & Inputs, Documentation, and Financial Instruments coverage and support transparent, comparable valuation work.
- [CFA Institute, Equity Valuation: Applications and Processes (2026)](https://www.cfainstitute.org/insights/professional-learning/refresher-readings/2026/equity-valuation-applications-and-processes) supports recording valuation scope, process, model choice, analyst responsibilities, and effective communication.

## Literature search and metadata

- [Crossref Metadata Retrieval](https://www.crossref.org/documentation/retrieve-metadata/) and its [REST API](https://www.crossref.org/documentation/retrieve-metadata/rest-api/) support DOI/title/author/identifier verification using open publisher-deposited metadata.
- [DataCite Metadata Schema 4.7](https://datacite-metadata-schema.readthedocs.io/en/4.7/) is the current 2026 schema for citation metadata for datasets and other research outputs; it supersedes the previously cited 4.6 documentation.
- [PRISMA 2020](https://www.prisma-statement.org/prisma-2020) supports transparent search/reporting checklists and flow diagrams for systematic reviews. In this repository it informs search-log discipline only; ordinary targeted recommendation runs are not claimed to be systematic reviews.
