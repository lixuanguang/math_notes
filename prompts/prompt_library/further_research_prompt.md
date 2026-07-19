# Further Research — Entry Point

```text
Repository: /Users/lxg/Documents/GitHub/math_notes

Goal: identify authoritative books, papers, surveys, standards, or technical sources that could improve the selected scope in a later source-grounded run. Maintain `Content_Enhancement_Recommendations.md`; do not insert current note content.

Configuration:
- MODE: edit
- SCOPE_LEVEL: <part | section | subsection | file>
- DOMAIN: <auto | math | computer-science | electronic-engineering | quant-finance | fundamental-finance | physics | mixed>
- TARGET: <exact parts/... path or unambiguous active scope>
- START_CURSOR: <beginning | exact resume file>
- FILE_COVERAGE: <all-active | changed-and-new | tracked-modified | untracked-new>
- RUN_BATCH: one-scope
- CONTENT_POLICY: recommendation-only
- SOURCE_MATERIAL: web-reference-search
- RECOMMENDATION_FILE: Content_Enhancement_Recommendations.md
- BIBLIOGRAPHY_FILE: references.bib
- BUILD: no

Load before editing:
1. `prompts/standards/repository_and_scope.md` (repository safety/ownership only; no LaTeX edit is authorized).
2. `prompts/standards/sources/research_recommendations.md`.
3. `prompts/standards/domains/README.md`, then only the configured or gap-matched domain overlay(s).

Execution:
1. Run `git status --short`; read `STRUCTURE_MIGRATION_README.md`, `math.tex`, TARGET and nearby active owners, `references.bib`, `references.tex`, and the existing recommendation file.
2. Resolve exact scope/domain and identify concrete local gaps before browsing.
3. Follow the search, authority, metadata, and duplicate gates in `prompts/standards/sources/research_recommendations.md`. Prefer primary publisher/author/journal/DOI/standard/regulator/catalog records and verify metadata from authoritative pages.
4. Record search terms, venues, date, and meaningful exclusions. Add/update only concise, actionable, non-duplicate recommendations under the narrowest target.
5. Edit only `Content_Enhancement_Recommendations.md` (create it only if absent). Do not edit LaTeX, bibliography files, citations, or generated outputs; do not build.
6. Recheck every added identifier/link and duplicate decision against the authoritative metadata page, then run `git diff --check` on the recommendation file.

Final report: resolved target/domain; repository files and web venues checked; recommendations added/updated; candidates skipped because already bibliographed/recommended; candidates rejected and reasons; duplicate/metadata checks; changed file; preserved pre-existing work; confirmation that no subject content, bibliography, citation, build, or Git publication action occurred.
```
