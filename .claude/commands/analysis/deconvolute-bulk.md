# Deconvolute Bulk

Cell type deconvolution from bulk RNA-seq revealing cellular composition changes in aging tissues and interventions.

## Agent Used

This command leverages the **Transcriptomics Analyst** agent for deconvolution analysis.

## Description

Estimates cell type proportions from bulk tissue RNA-seq data using computational deconvolution. Infers cellular composition from gene expression signatures, detects age-related composition changes, characterizes intervention effects on cell populations, and validates predictions against single-cell data. Essential for understanding tissue heterogeneity and distinguishing cell-intrinsic from compositional changes in aging.

## Usage

```
/deconvolute-bulk
```

After invoking the command, provide:
- Bulk RNA-seq expression data
- Tissue type for analysis
- Reference signatures or single-cell data
- Sample metadata (age, treatment)

## Inputs

**Required:**
- Bulk expression matrix: Gene expression values
- Sample information: Metadata for samples
- Tissue type: For appropriate reference selection

**Optional:**
- Reference signatures: Pre-defined cell type markers
- Single-cell reference: scRNA-seq from same tissue
- Custom marker genes: User-defined signatures
- Known cell types: Expected populations

## Process

The command performs:

1. **Reference preparation**: Selects or builds cell type signatures
2. **Marker identification**: Finds cell-type-specific genes
3. **Deconvolution**: Estimates proportions per sample
4. **Quality assessment**: Validates deconvolution reliability
5. **Statistical testing**: Tests composition differences
6. **Correlation analysis**: Relates composition to phenotypes
7. **Visualization**: Displays composition patterns
8. **Biological interpretation**: Interprets composition changes

## Outputs

**Cell type proportions:**
- Estimated fractions per cell type per sample
- Confidence intervals
- Deconvolution quality metrics
- Proportion variability across samples

**Statistical testing:**
- Composition differences between groups
- Age-associated proportion changes
- Intervention effects on cell types
- Correlation with phenotypes

**Visualization:**
- Stacked bar plots showing composition
- Proportion distributions
- Correlation heatmaps
- PCA colored by dominant cell types

**Quality metrics:**
- Marker gene correlation
- Sum-to-one constraint satisfaction
- Residual analysis
- Comparison to flow cytometry if available

**Biological interpretation:**
- Dominant cell type shifts
- Rare population changes
- Tissue remodeling patterns
- Aging composition signatures

## Interpretation Guidelines

The command reveals:
- Cellular composition of bulk tissues
- Which cell types change with age
- How interventions affect tissue cellularity
- Whether expression changes are cell-intrinsic or compositional

For aging research specifically:
- Immune cell infiltration with age
- Stem cell depletion
- Fibroblast accumulation
- Adipocyte infiltration in muscle

## Example Use Cases

**Aging immune infiltration:**
Quantify T cell, macrophage, and other immune cell increases in aged tissues.

**Stem cell exhaustion:**
Track stem cell population decline across lifespan in regenerative tissues.

**Fibrosis:**
Measure fibroblast and myofibroblast accumulation with aging.

**Intervention effects:**
Determine whether treatments change tissue composition or cell-intrinsic gene expression.

## Integration with Other Commands

Results complement:
- `/analyze-differential-expression` distinguishes composition from intrinsic changes
- `/analyze-scrna-seq` provides reference signatures
- `/pathway-enrichment` interprets cell-type-specific processes
- `/train-classifier` predicts composition as biomarkers

## Best Practices

**Reference selection:**
- Use tissue-matched references when possible
- Validate reference quality
- Include expected cell types
- Update references with new data

**Marker genes:**
- Use highly specific markers
- Avoid ubiquitous genes
- Validate marker expression
- Consider multiple markers per type

**Validation:**
- Compare to orthogonal methods (flow, IHC)
- Check biological plausibility
- Validate in independent cohorts
- Use single-cell data when available

**Statistical analysis:**
- Account for compositional data properties
- Use appropriate tests (Dirichlet, ALDEx2)
- Correct for multiple testing
- Consider relative vs absolute changes

## Technical Notes

Implements multiple deconvolution algorithms including CIBERSORT, MuSiC, Bisque, DWLS, or regression-based methods. Handles compositional data constraints. Validates against single-cell ground truth when available.

For aging deconvolution, recognizes major changes including immune infiltration, stem cell decline, and fibrosis. Distinguishes these compositional changes from cell-intrinsic transcriptional aging.

## Deconvolution Methods

**Signature-based:**
CIBERSORT, xCell. Uses pre-defined cell type signatures. Fast but limited to signature cell types.

**Reference-based:**
MuSiC, Bisque. Uses single-cell reference data. Most accurate when reference matches tissue.

**Marker-based:**
DWLS, dtangle. Selects cell-type-specific markers. Balance between signature and reference methods.

**Regression:**
Linear or robust regression solving for proportions. Simple but effective for well-defined types.

## Reference Sources

**Pre-defined signatures:**
LM22 (22 immune types), TME (tumor microenvironment), tissue-specific panels.

**Single-cell atlases:**
Human Cell Atlas, Tabula Muris, tissue-specific studies. Most accurate references.

**Flow cytometry:**
Validates deconvolution against gold standard measurements.

**Custom references:**
Build from pilot single-cell experiments or literature markers.

## Quality Control

**Marker correlation:**
High correlation between predicted and observed marker expression indicates good deconvolution.

**Sum constraints:**
Proportions should sum to 1 (or close with regularization).

**Residual analysis:**
Low residuals indicate good fit to reference signatures.

**Biological plausibility:**
Proportions should match known tissue composition.

## Statistical Testing

**Compositional data analysis:**
Proportions are constrained to sum to 1 requiring special statistics.

**Dirichlet regression:**
Models compositional data explicitly accounting for constraints.

**ALDEx2:**
Analyzes compositional data using centered log-ratios.

**Permutation tests:**
Non-parametric tests appropriate for compositional data.

## Aging Composition Changes

**Immune infiltration:**
CD8 T cells, macrophages, B cells increase in aged tissues.

**Stem cell depletion:**
Muscle satellite cells, HSCs, neural progenitors decline.

**Fibrosis:**
Fibroblasts and myofibroblasts accumulate in aged tissues.

**Adipose infiltration:**
Ectopic fat in muscle and other tissues with aging.

**Neuronal loss:**
Neuron proportions decrease in aged brain.

## Tissue-Specific Patterns

**Muscle:**
Satellite cell decline, immune infiltration, adipocyte infiltration, fibrosis.

**Brain:**
Neuronal loss, microglial activation, astrocyte changes, oligodendrocyte alterations.

**Liver:**
Hepatocyte changes, Kupffer cell activation, stellate cell activation in fibrosis.

**Blood:**
Myeloid skewing, lymphocyte subset changes, clonal hematopoiesis expansion.

## Limitations

- Accuracy depends on reference quality
- Rare cell types difficult to detect
- Closely related types may not separate
- Assumes linear mixing of expression profiles
- Cannot resolve novel or undefined cell types

Single-cell validation and orthogonal quantification methods address limitations.

## Advanced Features

**Spatial deconvolution:**
Combines bulk expression with spatial information inferring cell locations.

**Time-resolved:**
Tracks composition changes across aging or intervention time courses.

**Multi-tissue:**
Compares composition across multiple tissues simultaneously.

**Disease context:**
Specialized references for disease states (cancer, inflammation, fibrosis).

**Absolute quantification:**
Combines with spike-ins or total RNA to estimate absolute cell numbers.

## Distinguishing Composition from Intrinsic

**Confounded analysis:**
Age-associated genes may reflect composition changes not cell-intrinsic aging.

**Adjusted analysis:**
Include cell proportions as covariates in differential expression to find cell-intrinsic changes.

**Cell-type-specific:**
Analyze each cell type separately (from single-cell or sorted cells) to understand intrinsic changes.

**Interaction analysis:**
Test for age-by-cell-type interactions revealing cell-type-specific aging.

## Clinical Applications

**Biomarkers:**
Cell proportions predict disease risk, outcomes, treatment response.

**Monitoring:**
Track immune infiltration during immunotherapy or inflammation.

**Mechanistic insights:**
Identify which cell types drive tissue dysfunction.

**Target identification:**
Cell types changing most are potential therapeutic targets.

---

This command enables cell type composition inference from bulk data revealing tissue remodeling in aging and distinguishing compositional from cell-intrinsic changes essential for accurate aging biology interpretation.