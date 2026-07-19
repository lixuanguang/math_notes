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

- [BIPM SI Brochure, 9th edition](https://www.bipm.org/en/publications/si-brochure/) is the authoritative SI reference; the English text and concise summary are current to 2026. It supports explicit quantity/unit distinctions and current SI names, symbols, and conventions.
- [NIST Special Publication 811](https://www.nist.gov/pml/special-publication-811) and its [manuscript checklist](https://www.nist.gov/pml/special-publication-811/nist-guide-si-check-list-reviewing-manuscripts) support keeping quantity symbols, numerical values, unit symbols, and SI conventions distinct and consistent.
- [NIST Technical Note 1297](https://www.nist.gov/pml/nist-technical-note-1297), especially [reporting uncertainty](https://www.nist.gov/pml/nist-technical-note-1297/nist-tn-1297-7-reporting-uncertainty), supports explicit uncertainty components, evaluation methods, coverage factors, interpretation basis, and current measurement-process documentation.

## Computer science

- [ACM Artifact Review and Badging, current version](https://www.acm.org/publications/policies/artifact-review-and-badging-current) defines computational artifacts and distinguishes repeatability, reproducibility, and replicability. Its functional/reusable/available criteria support artifact inventories, documentation, completeness, executability, validation evidence, archival identifiers, and precise status claims.
- [RFC 2119](https://www.rfc-editor.org/info/rfc2119/) and its update [RFC 8174](https://www.rfc-editor.org/info/rfc8174/) are the BCP 14 authority for requirement-level terms in IETF-style specifications. RFC 8174 clarifies that their special meanings apply only to the uppercase forms when the document declares the convention.
- [NIST SP 800-218, Secure Software Development Framework 1.1](https://csrc.nist.gov/pubs/sp/800/218/final) supports documenting software-security requirements, protecting development artifacts, verifying releases, recording provenance, and responding to residual vulnerabilities. The CS overlay applies these checks only to security-relevant content; it does not turn the notes into a compliance claim.

## Linguistics

- The [Leipzig Glossing Rules](https://www.eva.mpg.de/lingua/resources/glossing-rules.php) provide the baseline for interlinear morpheme-by-morpheme examples: aligned object-language and gloss lines, standard abbreviation handling, and a separate idiomatic translation.
- The [International Phonetic Association chart](https://www.internationalphoneticassociation.org/content/chart) is the first-party reference for IPA symbols. [ISO 639:2023](https://www.iso.org/standard/74575.html) supports stable language identifiers but does not replace the language/variety name or community context.
- The [Linguistic Society of America publications guidance](https://www.lsadc.org/publications) points authors to the Unified Style Sheet. The overlay retains source, speaker/corpus, judgment, transcription, translation, and ethics context beyond citation style alone.

## Philosophy and literature

- Harvard's [Brief Guide to Writing the Philosophy Paper](https://philosophy.fas.harvard.edu/resource/briefguidetowritingphilosophypaperpdf) supports explicit theses, argument reconstruction, premises, objections, replies, and fair treatment of opposing positions.
- The [Stanford Encyclopedia of Philosophy content guidelines](https://plato.stanford.edu/archives/win2025/guidelines.html) support clear scope, balanced treatment of important positions, primary and secondary references, and explicit handling of controversial material.
- The [MLA in-text citation overview](https://style.mla.org/in-text-citations-overview/) and [guidance for two editions](https://style.mla.org/citing-two-editions/) support author/work plus usable locators and edition-sensitive citation. The overlay additionally distinguishes author, narrator, speaker, character, quotation, and interpretation.
- [TEI P5, Critical Apparatus](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TC.html) supports explicit base text, witnesses, readings, omissions, additions, and variant-location methods for textual-critical notes.

## Political science, history, and economics

- The [APSA Style Manual](https://connect.apsanet.org/stylemanual/) and [APSA research ethics and transparency guidance](https://apsanet.org/publications/journals/ps-political-science-politics/faqs/research-ethics-and-transparency/) support precise sourcing, disclosure, research ethics, and transparency. The [AAPOR Transparency Initiative](https://aapor.org/standards-and-ethics/transparency-initiative/) supplies the corresponding survey-method disclosure baseline.
- The [AHA Statement on Standards of Professional Conduct](https://www.historians.org/resource/statement-on-standards-of-professional-conduct/) supports evidence-based interpretation, source integrity, acknowledgment, and openness to competing interpretations. The US National Archives [archival citation guidance](https://www.archives.gov/legislative/research/citation.html) supports repository-to-item locators rather than generic links.
- The [AEA Data and Code Availability Policy](https://www.aeaweb.org/journals/data/data-code-policy) supports documented data provenance, transformations, code and software versions, master instructions, output mapping, access restrictions, and reproducibility. The economics overlay also retains identification, data vintage, unit, welfare, and policy assumptions.

## Materials science, chemistry, and chemical engineering

- The [NIST Materials Science and Engineering Division](https://www.nist.gov/mml/materials-science-and-engineering-division) treats processing, structure, properties, and performance as linked concerns. The [NIST Materials Data Curation System](https://www.nist.gov/programs-projects/materials-data-curation-system) supports specimen, process, measurement, provenance, and uncertainty metadata, while [NIST AMS 500-1](https://www.nist.gov/publications/enabling-fair-data-additive-manufacturing-accelerate-industrialization) provides a FAIR-data example for additive manufacturing.
- [ISO 80000-12:2019](https://www.iso.org/standard/63480.html) is the quantities-and-units reference for condensed-matter physics. It complements, rather than replaces, exact material identity, processing history, test method, and uncertainty.
- The IUPAC [Green Book](https://iupac.org/what-we-do/books/greenbook/), [Gold Book](https://goldbook.iupac.org/), and [nomenclature resources](https://iupac.org/what-we-do/nomenclature/) support unambiguous chemical quantities, units, terms, names, formulae, and symbols. The ACS [compound characterization checklist](https://pubs.acs.org/page/joceah/submission/ccc.html) and [laboratory-safety guides](https://www.acs.org/about/governance/committees/chemical-safety/publications-resources/guides-and-tip-sheets.html) support characterization evidence and hazard-aware procedures.
- [ISO 10628-1:2014](https://www.iso.org/standard/51840.html) and [ISO 10628-2:2012](https://www.iso.org/standard/51841.html) govern classification, content, and graphical symbols for chemical and petrochemical process diagrams. AIChE/CCPS [risk-based process safety](https://publications.aiche.org/cep/2019/march/risk-based-process-safety) supports explicit process-safety context; it does not establish that a note or design is safe or compliant.

## Electronic engineering

- [IEEE Editorial Style Manual for Authors](https://journals.ieeeauthorcenter.ieee.org/your-role-in-article-production/ieee-editorial-style-manual/) provides first-party guidance for equations, numbers, abbreviations, quantities, units, and technical references in electrical/electronic writing. Repository-specific inline-first and no-overflow rules remain stricter and controlling.
- [IEC 60617 Graphical Symbols for Diagrams](https://library.iec.ch/grasymb/grasymb.nsf/welcome?OpenPage) is the official maintained source for standardized electrotechnical diagram symbols; the current database includes conductors, passive and semiconductor components, energy conversion, measurement, communications, and logic elements.
- [IEC 61082-1:2014](https://webstore.iec.ch/en/publication/4469), stable through 2029, establishes presentation rules for electrotechnical diagrams, drawings, and tables, including reference designations and wireless interconnections.
- The BIPM/NIST quantity and uncertainty sources above govern units and measurement reporting. They support recording setup-dependent uncertainty and conditions; they do not establish circuit performance, traceability, safety, or regulatory compliance by themselves.

## Nuclear science and engineering

- [ISO 80000-10:2019](https://www.iso.org/standard/64980.html) is the quantities-and-units reference for atomic and nuclear physics. The [IAEA Nuclear Safety and Security Glossary, 2022 edition](https://www-pub.iaea.org/MTCD/Publications/PDF/IAEA-NSS-GLOweb.pdf) supports consistent safety and security terminology without converting explanatory notes into requirements.
- The IAEA [EXFOR](https://nucleus.iaea.org/Pages/experimental-nuclear-reaction-data.aspx) database records experimental nuclear-reaction data, while the US National Nuclear Data Center [evaluated-data resources](https://www.nndc.bnl.gov/databases/) distinguish evaluated libraries from experiments and calculations. The overlay therefore requires data status, release, processing, and application context.
- The US NRC's [guidance-document overview](https://www.nrc.gov/reading-rm/doc-collections/nuregs/staff/sr1513/index.html) illustrates the distinction among regulations, guidance, and technical reports. The overlay forbids inferring safety, approval, or compliance from a calculation or citation alone.

## Music and fine arts

- The [MEI Guidelines 5.1](https://music-encoding.org/guidelines/) support explicit musical-source, notation, encoding, and validation context. [MusicXML 4.0](https://www.w3.org/2021/06/musicxml40/) is a W3C Music Notation Community Group final report, not a W3C Recommendation; the overlay records format version and validation without overstating standards status.
- The Music Library Association's [Notes contributor guidance](https://www.musiclibraryassoc.org/page/Notescontributors) supports edition-, score-, recording-, and music-specific citation conventions. The overlay separately requires exact work, source, movement, measure, performance, and timestamp identity as applicable.
- The Getty [Categories for the Description of Works of Art](https://www.getty.edu/publications/categories-description-works-art/general-guidelines/) and [vocabulary editorial guidelines](https://www.getty.edu/research/tools/vocabularies/guidelines/) support structured object identity, attribution, date, materials, location, provenance, and controlled vocabulary. The College Art Association's [Code of Best Practices in Fair Use](https://www.collegeart.org/programs/caa-fair-use/best-practices) supports recording purpose, amount, context, and attribution; it is not a legal determination.

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
