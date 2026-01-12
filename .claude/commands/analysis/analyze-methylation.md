# Analyze Methylation

Comprehensive DNA methylation analysis for epigenetic aging clocks, age-related methylation changes, and intervention effects on the epigenome.

## Agent Used

This command leverages the **Genomics Analyst** agent for methylation analysis.

## Description

Performs end-to-end DNA methylation analysis from array or bisulfite sequencing data. Implements quality control, normalization, differential methylation testing, epigenetic clock calculation, regional analysis, and biological interpretation. Identifies age-related methylation changes, calculates epigenetic age acceleration, and characterizes intervention effects on DNA methylation patterns.

## Usage

```
/analyze-methylation
```

After invoking the command, provide:
- Methylation data (array beta values or bisulfite coverage)
- Sample metadata (age, treatment, tissue)
- Platform information (450K, EPIC, WGBS, RRBS)
- Analysis goals (clocks, DMPs, regions, pathways)

## Inputs

**Required:**
- Methylation matrix: Beta values or coverage per CpG
- Sample information: Age, groups, covariates
- Platform type: Array platform or sequencing method

**Optional:**
- Reference epigenome: For comparison
- Genomic annotations: Gene, regulatory elements
- Known clock CpGs: For age prediction
- Cell type estimates: For deconvolution

## Process

The command performs:

1. **Quality control**: Detects failed probes and samples
2. **Normalization**: Corrects technical biases
3. **Filtering**: Removes problematic CpGs
4. **Differential methylation**: Tests individual CpGs
5. **Regional analysis**: Tests genomic regions (DMRs)
6. **Epigenetic clocks**: Calculates biological age
7. **Functional annotation**: Maps to genes and pathways
8. **Biological interpretation**: Relates to aging processes

## Outputs

**Quality metrics:**
- Detection rates per sample
- Beta value distributions
- Control probe performance
- Batch effect assessment
- Cell type composition estimates

**Differential methylation:**
- Differentially methylated positions (DMPs)
- Differentially methylated regions (DMRs)
- Volcano plots and Manhattan plots
- Heatmaps of top sites
- Genomic context enrichment

**Epigenetic clocks:**
- Horvath clock age estimates
- Hannum clock predictions
- PhenoAge calculations
- GrimAge predictions
- Age acceleration metrics

**Regional analysis:**
- Promoter methylation changes
- Enhancer methylation
- Gene body patterns
- CpG island analysis
- Regulatory element enrichment

**Functional interpretation:**
- Gene ontology enrichment
- Pathway analysis
- Transcription factor binding enrichment
- Tissue-specific patterns
- Aging hallmark associations

## Interpretation Guidelines

The command provides:
- CpG sites changing with age or treatment
- Epigenetic age versus chronological age
- Genomic regions with coordinated changes
- Biological processes affected by methylation

For aging research specifically:
- Epigenetic age acceleration
- Age-related hypermethylation and hypomethylation
- Intervention effects on epigenetic aging
- Clock CpG changes with longevity interventions

## Example Use Cases

**Epigenetic aging:**
Calculate epigenetic age acceleration identifying individuals aging faster biologically than chronologically.

**Intervention effects:**
Assess whether longevity interventions slow epigenetic aging or reverse age-related methylation changes.

**Age-related DMPs:**
Identify CpG sites with methylation changes across lifespan revealing epigenetic aging mechanisms.

**Clock development:**
Build tissue or condition-specific epigenetic clocks using methylation data.

## Integration with Other Commands

Results complement:
- `/analyze-differential-expression` for methylation-expression relationships
- `/pathway-enrichment` for biological interpretation
- `/train-classifier` for custom clock development
- `/integrate-multiomics` for multi-layer analysis

## Best Practices

**Quality control:**
- Remove failed probes and samples
- Check for batch effects
- Validate normalization
- Assess cell type heterogeneity

**Statistical testing:**
- Adjust for covariates appropriately
- Correct for multiple testing
- Report effect sizes with p-values
- Consider regional analysis alongside individual CpGs

**Clock application:**
- Use appropriate clock for tissue and question
- Report multiple clocks for robustness
- Calculate age acceleration correctly
- Validate in independent cohorts

**Biological interpretation:**
- Consider genomic context
- Integrate with gene expression
- Validate key findings
- Relate to known aging mechanisms

## Technical Notes

Implements appropriate normalization for Illumina arrays (noob, quantile, SWAN) or bisulfite sequencing. Handles missing values and cross-reactive probes. Applies limma-based testing for differential methylation accounting for technical factors.

For aging methylation, recognizes canonical patterns including CpG island hypermethylation, promoter changes, and clock CpG behavior. Understands tissue-specific methylation and cell type composition confounding.

## Methylation Platforms

**Illumina 450K:**
450,000 CpGs genome-wide. Established clock data. Lower coverage than EPIC.

**Illumina EPIC:**
850,000 CpGs with enhanced regulatory regions. Current standard array. Most clocks applicable.

**Whole genome bisulfite sequencing (WGBS):**
Complete methylome coverage. Gold standard but expensive. Single base resolution.

**Reduced representation bisulfite sequencing (RRBS):**
Enriches CpG-rich regions. Cost-effective alternative to WGBS. Variable coverage.

## Epigenetic Clocks

**Horvath clock:**
Multi-tissue clock using 353 CpGs. Predicts chronological age accurately across tissues.

**Hannum clock:**
Blood-specific clock with 71 CpGs. Strong mortality associations.

**PhenoAge:**
Phenotypic aging clock incorporating clinical biomarkers. Predicts healthspan outcomes.

**GrimAge:**
Mortality predictor using DNA methylation. Strongest mortality associations. Incorporates smoking and multiple aging indicators.

**DunedinPACE:**
Pace of aging clock measuring rate rather than state. Tracks aging progression over time.

## Differential Methylation

**Position-level:**
Tests individual CpGs for methylation differences. High resolution but requires correction for many tests.

**Region-level:**
Tests genomic regions (promoters, enhancers) for coordinated changes. More biologically interpretable, fewer tests.

**Gene-level:**
Aggregates CpGs per gene. Facilitates pathway analysis but loses specific information.

**Functional regions:**
Focuses on regulatory elements (promoters, enhancers, insulators) where methylation affects function.

## Age-Related Patterns

**CpG island hypermethylation:**
Promoter CpG islands gain methylation with age, often silencing tumor suppressors.

**Hypomethylation:**
Gene bodies and intergenic regions lose methylation with age contributing to instability.

**Clock CpG behavior:**
Clock sites show predictable methylation changes used for age prediction.

**Tissue-specific:**
Aging methylation patterns vary by tissue reflecting tissue-specific aging mechanisms.

## Cell Type Deconvolution

**Reference-based:**
Uses cell type methylation references to estimate proportions in heterogeneous samples.

**Reference-free:**
Estimates underlying components without prior references. Less accurate but more flexible.

**Importance:**
Cell composition changes with age can confound methylation analyses requiring adjustment or interpretation.

## Limitations

- Array coverage incomplete, missing many functional sites
- Bulk tissue reflects mixed cell types
- Technical artifacts from cross-reactive probes
- Causality unclear for methylation-phenotype associations
- Clock performance varies by population and tissue

Integration with single-cell methylation and functional validation improves interpretation.

## Advanced Features

**5-hydroxymethylation:**
Distinguishes 5mC from 5hmC important for active demethylation and gene regulation.

**Allele-specific methylation:**
Analyzes parent-of-origin specific methylation important for imprinting.

**Methylation QTL:**
Identifies genetic variants affecting methylation patterns (meQTLs).

**Integration with chromatin:**
Combines methylation with histone modifications and accessibility for regulatory interpretation.

**Temporal dynamics:**
Analyzes methylation changes in longitudinal studies tracking epigenetic aging trajectories.

## Aging Mechanisms

**Epigenetic drift:**
Stochastic methylation changes accumulating with age reducing cellular identity.

**Clock CpG selection:**
Clock CpGs may reflect maintained regulatory sites or passive drift depending on clock type.

**Interventions:**
Longevity interventions may slow clock ticking or reverse specific age-related changes.

**Reprogramming:**
Cellular rejuvenation can reset epigenetic age suggesting age is partially reversible.

---

This command enables comprehensive DNA methylation analysis revealing epigenetic aging mechanisms and providing accurate biological age estimates essential for aging research and intervention studies.