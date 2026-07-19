# Figure Roles, Accessibility, and Render Quality

Before adding, moving, or materially editing a figure, assign one primary role and use its typed wrapper:

1. `illustrationfigure`: conceptual, geometric, commutative, dependency, payoff-shape, balance-sheet-relationship, or qualitative diagram that explains structure but is not data evidence.
2. `visualizationfigure`: plot of mathematical, numerical, empirical, simulated, backtested, or model-implied values.
3. `schematicfigure`: physical, engineering, market-microstructure, trading-system, accounting-flow, or modeling setup.
4. `financialexhibitfigure`: valuation bridge, comparable-company plot, performance/factor chart, capital structure, waterfall, margin bridge, fan, or sensitivity grid.
5. `sourceimagefigure`: raster source image, experimental image, scanned diagram, screenshot, photograph, or externally generated graphic whose visual content is itself the source.
6. `tablevisualfigure`: a grid, matrix, term sheet, statement excerpt, assumptions panel, or results panel that must remain visual. Prefer searchable `table`/`tabular` whenever exact structured data can be represented textually.

These wrappers share ordinary Figure numbering. Keep generic `figure` only for untouched legacy content or a genuinely inseparable mixed role; report the exception.

## Common requirements

- Nearby textual callout using `Figure \ref{fig:...}`, not “above” or “below.”
- One stable descriptive `fig:` label.
- Succinct caption stating what is shown and why it matters.
- Caption or adjacent text defining symbols, units, panels, colors, line styles, and abbreviations needed to read it.
- Placement near the introducing/using text.
- Source/data/model provenance where applicable.
- No later formal result depending on facts, assumptions, data, or relations present only in the figure/caption. Promote those to an authoritative text/table/model/result owner.

## Role-specific requirements

**Illustration.** Prefer editable TikZ or `tikz-cd` when feasible. Show only needed objects, arrows, regions, symmetries, constraints, or correspondences. Keep labels short and close to their objects. Name the formal anchor and structural takeaway. An illustration does not prove a claim.

**Visualization.** Identify plotted quantity, axes, tick marks, units/dimensionless status, scale/transformation, parameter values, data/model/source, sample window or simulation regime, and uncertainty/sensitivity when relevant. Use a chart matched to the data: line for ordered paths/time series, scatter for relationships, histogram/density for distributions, heatmap/matrix for two indices, surface/contour for two variables, and phase portrait/vector field for dynamics. Use sequential, diverging, cyclic, or qualitative color maps according to the encoded quantity. Avoid decorative gradients, unexplained normalization, cherry-picked windows, and dual axes without strong justification.

**Schematic.** State the modeled system, coordinate/sign convention, boundary/interface conditions, inputs/outputs, and whether geometry is to scale. For physics, include units/dimensions and distinguish forces, fields, fluxes, constraints, and measurements. For computation/market systems, distinguish state, observation, decision, execution, data feed, and feedback.

**Financial exhibit.** State valuation/reporting date, currency, period/frequency, nominal/real basis when relevant, historical/forecast/simulated/model-implied status, source, benchmark/base index, and aggregation basis. Avoid axis truncation, selective windows, rebasing, smoothing, cumulative-return framing, or scenario colors that imply unsupported certainty. Put exact important values in text or a table.

**Source image.** Do not reproduce text screenshots or decorative images. Preserve provenance. For scientific images, include scale bars and acquisition/processing context when supported; disclose or avoid cropping, filtering, recoloring, and contrast changes that could alter interpretation.

## Accessibility and rendered inspection

- Do not rely on color alone; pair color with labels, line styles, markers, shapes, patterns, or annotations.
- Use sufficient contrast, consistent fonts, and readable line weights after final PDF scaling.
- Provide concise text alternatives in surrounding prose/caption for the essential relationship or evidence; a caption naming only the image is insufficient.
- No label, legend, axis, tick, caption, float, or neighboring text may overlap, clip, or overflow.
- Render every touched TikZ, `tikz-cd`, plot, or included image and inspect it at readable resolution. Source inspection and a successful build are not visual QA.
