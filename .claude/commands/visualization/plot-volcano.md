# Plot Volcano

Generate publication-quality volcano plots visualizing differential analysis results from omics studies.

## Agents Used

This command leverages the **Data Analyst** agent for visualization and **Transcriptomics Analyst** for context-specific interpretation.

## Description

Creates comprehensive volcano plots displaying statistical significance versus effect size for differential analysis results. Highlights significant features, labels genes of interest, applies appropriate thresholds, and produces publication-ready figures with clear visual hierarchy and biological annotations.

## Usage

```
/plot-volcano
```

After invoking the command, provide:
- Differential analysis results (fold changes and p-values)
- Significance thresholds (p-value and fold change cutoffs)
- Optional: Genes or features to highlight
- Optional: Pathway or functional annotations

## Inputs

**Required:**
- Feature identifiers: Gene names or other feature IDs
- Log fold changes: Effect sizes from differential analysis
- P-values or adjusted p-values: Statistical significance measures

**Optional:**
- Highlight list: Specific genes to label or emphasize
- Significance thresholds: Custom cutoffs for calling changes
- Pathway information: For color-coding by biological function
- Expression levels: For point sizing by abundance

## Process

The command performs:

1. **Data validation**: Checks input format and value ranges
2. **Threshold application**: Identifies significantly changed features
3. **Point coloring**: Applies color scheme based on significance and direction
4. **Label placement**: Positions gene labels to avoid overlap
5. **Threshold lines**: Adds visual guides for significance cutoffs
6. **Legend creation**: Provides clear key for interpretation
7. **Figure optimization**: Adjusts spacing and sizing for clarity

## Outputs

**Volcano plot:**
- Scatter plot with log fold change on x-axis
- Negative log p-value on y-axis
- Color-coded points (up, down, not significant)
- Labeled genes of interest
- Threshold lines indicating significance cutoffs
- Count annotations for significantly changed features

**Summary statistics:**
- Number of significantly upregulated features
- Number of significantly downregulated features
- Total features analyzed
- Threshold values applied

**Enhanced visualizations:**
- Interactive version with hover information
- Pathway-colored variant highlighting biological processes
- Expression-weighted version with point sizes

## Interpretation Guidelines

The command produces:
- Visual summary of differential analysis scale and scope
- Identification of most significant and large-magnitude changes
- Balance between statistical and biological significance
- Comparison of upregulated versus downregulated features

For aging research specifically:
- Highlights aging-associated gene expression changes
- Identifies intervention effects on transcriptome
- Shows senescence-associated transcriptional signatures
- Compares magnitude of changes to known aging genes

## Example Use Cases

**Aging transcriptomics:**
Visualize age-related gene expression changes showing both direction and magnitude.

**Intervention response:**
Display transcriptional effects of dietary restriction, rapamycin, or other longevity interventions.

**Senescence comparison:**
Show genes differentially expressed between senescent and proliferating cells.

**Multi-omics comparison:**
Create matched volcano plots for transcriptomics, proteomics, and metabolomics for integrated view.

## Integration with Other Commands

Results complement:
- `/analyze-differential-expression` provides input data
- Pathway enrichment interprets biological meaning
- Heatmaps show expression patterns for top hits
- Multi-omics plots compare across molecular layers

## Best Practices

**Visual design:**
- Use colorblind-friendly color schemes
- Apply transparency for overlapping points
- Label top hits without overcrowding
- Include clear axis labels with units

**Statistical display:**
- Show both fold change and p-value dimensions
- Include threshold lines with values
- Report adjusted p-values accounting for multiple testing
- Indicate number of features in each category

**Biological context:**
- Highlight known aging-related genes
- Color-code by pathway or functional category
- Label unexpected or novel findings
- Provide context for effect size interpretation

## Technical Notes

Plots negative log10 transformed p-values for intuitive interpretation where higher points are more significant. Uses log2 fold changes for symmetric display of up and down regulation. Applies label repulsion algorithms to prevent text overlap while maintaining proximity to points.

For aging studies, recognizes that modest fold changes in key regulatory genes may be more biologically important than large changes in responsive genes. Considers both magnitude and significance when prioritizing genes for follow-up.

## Comparison Across Data Types

The command adapts for different omics types:

**Transcriptomics:** Gene expression fold changes
**Proteomics:** Protein abundance changes  
**Metabolomics:** Metabolite concentration differences
**Epigenomics:** Methylation or histone modification differences

Visualization principles remain consistent while interpretation adjusts for data type characteristics.

## Limitations

- Cannot convey baseline expression levels
- Binary categorization may miss graded responses
- Static version loses interactive exploration capability
- Labels limited by space constraints

For comprehensive understanding, pair with complementary visualizations including heatmaps, expression profiles, and pathway diagrams.

## Advanced Features

**Pathway overlay:**
Color-code points by pathway membership to reveal coordinated regulation.

**Expression weighting:**
Size points by baseline expression to emphasize abundant genes.

**Quadrant analysis:**
Divide plot into regions for systematic categorization of response patterns.

**Multiple comparison:**
Create side-by-side volcano plots for related experiments showing consistency.

---

This command enables effective visualization of differential analysis results while maintaining statistical rigor and biological interpretability for aging research.