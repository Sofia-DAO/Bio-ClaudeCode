# Analyze Differential Expression

Comprehensive differential expression analysis for RNA-seq data using rigorous statistical methods.

## Agent Used

This command leverages the **Transcriptomics Analyst** agent for statistical analysis of gene expression differences.

## Description

Identifies genes showing significant expression changes between experimental conditions from RNA-seq count data. Implements appropriate statistical models accounting for biological variability, applies multiple testing correction, and generates comprehensive results including effect sizes and confidence intervals.

## Usage

```
/analyze-differential-expression
```

After invoking the command, provide:
- RNA-seq count matrix (genes x samples)
- Sample metadata indicating experimental groups
- Comparison design (which groups to compare)
- Optional: Covariates to adjust for (batch, sex, age, etc.)

## Inputs

**Required:**
- Count matrix: Raw or normalized read counts per gene per sample
- Sample information: Group assignments for each sample
- Comparison specification: Which groups to compare

**Optional:**
- Covariate information: Additional factors to adjust for
- Filtering thresholds: Minimum expression levels or sample coverage
- Statistical parameters: Significance threshold, effect size cutoff

## Process

The command performs:

1. **Data quality checks**: Validates input format and sample-group correspondence
2. **Filtering**: Removes lowly expressed genes unlikely to show reliable changes
3. **Normalization**: Applies appropriate normalization for library size and composition
4. **Statistical modeling**: Fits models accounting for biological variability
5. **Hypothesis testing**: Tests for differential expression with appropriate correction
6. **Effect size calculation**: Reports fold changes and confidence intervals
7. **Results annotation**: Adds gene information and biological context

## Outputs

**Primary results:**
- Table of differentially expressed genes with statistics
- Log fold changes and adjusted p-values
- Expression levels per group

**Visualizations:**
- MA plot showing fold change versus expression level
- Volcano plot displaying significance versus effect size
- Heatmap of top differentially expressed genes

**Quality metrics:**
- Number of genes passing filters
- Distribution of p-values
- Dispersion estimates

## Interpretation Guidelines

The command provides:
- Statistical significance (adjusted p-values accounting for multiple testing)
- Biological significance (fold change magnitudes)
- Expression context (baseline levels and variability)

For aging research specifically:
- Highlights age-related expression changes
- Identifies intervention effects on gene expression
- Recognizes aging-associated pathways and processes

## Example Use Cases

**Aging intervention study:**
Identify genes whose expression changes in response to dietary restriction, rapamycin, or other longevity interventions.

**Tissue aging:**
Characterize transcriptional changes in tissues across lifespan to understand age-related functional decline.

**Senescence comparison:**
Identify genes differentially expressed between senescent and non-senescent cells to understand senescence biology.

**Cross-species comparison:**
Compare expression changes across species with different lifespans to identify conserved aging signatures.

## Integration with Other Commands

Results can feed into:
- `/plot-volcano` for enhanced visualization
- Pathway enrichment for biological interpretation
- Integration with genomics data for eQTL analysis
- Comparison with proteomics for multi-omics analysis

## Best Practices

**Statistical considerations:**
- Ensure adequate biological replication (minimum 3 per group, more recommended)
- Consider batch effects and include in model if present
- Report both statistical and effect size measures
- Validate key findings with orthogonal methods

**Biological interpretation:**
- Consider expression magnitude alongside significance
- Examine consistency with known biology
- Validate unexpected findings experimentally
- Integrate with pathway and network analysis

## Technical Notes

Uses negative binomial models appropriate for RNA-seq count data. Estimates dispersion accounting for mean-variance relationship. Applies shrinkage to improve stability for genes with low counts. Implements false discovery rate control for multiple testing.

For aging studies, recognizes that biological variability may increase with age, potentially affecting power. Accounts for age as continuous covariate when appropriate rather than arbitrary age bins.

## Limitations

- Requires adequate sample size for reliable variance estimation
- Cannot detect changes in genes expressed below detection limits
- Statistical significance does not prove functional importance
- Expression changes may be consequences rather than causes of phenotypes

Experimental validation recommended for key findings, especially for novel associations or potential therapeutic targets.

---

This command enables rigorous identification of transcriptional changes in aging research while maintaining statistical validity and biological interpretability.