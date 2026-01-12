# Analyze scRNA-seq

Comprehensive single-cell RNA sequencing analysis for cell type identification, marker discovery, and aging-related cellular changes.

## Agent Used

This command leverages the **Transcriptomics Analyst** agent for single-cell analysis.

## Description

Performs end-to-end single-cell RNA-seq analysis from quality-filtered count matrices through biological interpretation. Implements dimensionality reduction, clustering, cell type identification, differential expression between cell types, and analysis of age-related changes in cellular composition and state. Essential for understanding tissue heterogeneity and cell-type-specific aging processes.

## Usage

```
/analyze-scrna-seq
```

After invoking the command, provide:
- Single-cell count matrix (cells x genes)
- Cell metadata (sample, batch, experimental group)
- Expected cell types for tissue
- Research questions (composition, states, aging effects)

## Inputs

**Required:**
- Count matrix: Gene expression per cell
- Cell barcodes: Unique cell identifiers
- Sample information: Which sample each cell came from

**Optional:**
- Cell cycle genes: For regression if needed
- Mitochondrial genes: For quality filtering
- Reference dataset: For automated cell type annotation
- Known markers: For manual cell type identification

## Process

The command performs:

1. **Quality control**: Filters low-quality cells and genes
2. **Normalization**: Accounts for sequencing depth differences
3. **Feature selection**: Identifies highly variable genes
4. **Dimensionality reduction**: PCA, UMAP, t-SNE
5. **Clustering**: Identifies cell populations
6. **Cell type annotation**: Assigns biological identities
7. **Differential expression**: Finds cell type markers
8. **Biological interpretation**: Relates findings to aging

## Outputs

**Cell clustering:**
- UMAP/t-SNE plots showing cell populations
- Cluster assignments for each cell
- Quality metrics per cluster
- Silhouette scores assessing cluster separation

**Cell type identification:**
- Annotated cell types per cluster
- Marker genes defining each type
- Expression heatmaps of markers
- Cell type proportions per sample

**Differential expression:**
- Marker genes for each cell type
- Statistical significance and fold changes
- Volcano plots per cell type
- Gene lists for pathway analysis

**Composition analysis:**
- Cell type frequencies across samples
- Age-related composition changes
- Intervention effects on populations
- Statistical tests for proportion differences

**Quality assessment:**
- Cells passing filters per sample
- Genes detected distributions
- Doublet detection results
- Batch effect visualization

## Interpretation Guidelines

The command provides:
- Cell type identities and proportions
- Molecular signatures defining cell states
- Age-related changes in composition or state
- Cell-type-specific intervention responses

For aging research specifically:
- Identifies senescent cell populations
- Tracks stem cell exhaustion
- Maps immune cell infiltration
- Reveals cell type vulnerability to aging

## Example Use Cases

**Tissue aging:**
Map cell type composition changes across lifespan to understand which cell types are most affected.

**Senescence detection:**
Identify senescent cells within tissues using transcriptional signatures and quantify accumulation with age.

**Intervention response:**
Determine which cell types respond to longevity interventions and how cellular states change.

**Stem cell aging:**
Track stem cell population changes and functional decline across aging in regenerative tissues.

## Integration with Other Commands

Results feed into:
- `/trajectory-analysis` for differentiation studies
- `/build-grn` for cell-type-specific networks
- `/pathway-enrichment` for functional interpretation
- `/integrate-multiomics` with spatial or proteomics

## Best Practices

**Quality control:**
- Remove low-quality cells and doublets
- Filter genes detected in few cells
- Assess mitochondrial content thresholds
- Evaluate sequencing saturation

**Normalization:**
- Account for sequencing depth per cell
- Consider cell cycle regression if needed
- Evaluate batch correction necessity
- Validate normalization effectiveness

**Clustering:**
- Try multiple resolutions to assess stability
- Validate clusters with marker genes
- Check for over-clustering artifacts
- Ensure biological coherence

**Cell type annotation:**
- Use established markers from literature
- Validate with reference datasets
- Consider novel cell states carefully
- Document annotation rationale

## Technical Notes

Implements standard scRNA-seq workflows including normalization methods appropriate for UMI count data. Uses graph-based clustering with Louvain or Leiden algorithms. Applies UMAP or t-SNE for visualization while maintaining PCA for downstream analysis.

For aging studies, recognizes that cell quality may decrease in aged tissues, requiring careful QC to distinguish biological from technical effects. Understands age-related composition changes are biologically meaningful requiring statistical testing beyond visualization.

## Analysis Stages

**Stage 1: Quality Control**
Filters cells by gene count, UMI count, and mitochondrial percentage. Removes ambient RNA and doublets. Evaluates whether samples show batch effects requiring correction.

**Stage 2: Normalization and Scaling**
Normalizes for sequencing depth, log-transforms counts, identifies variable features, scales data centering at zero.

**Stage 3: Dimensionality Reduction**
Computes principal components capturing major variation. Projects cells into lower dimensions for visualization and clustering.

**Stage 4: Clustering**
Constructs k-nearest neighbor graph. Applies community detection to identify cell populations. Evaluates optimal resolution.

**Stage 5: Cell Type Identification**
Finds marker genes for each cluster. Compares to known cell type markers. Assigns biological identities. Validates annotations.

**Stage 6: Differential Expression**
Tests for genes differentially expressed between cell types, age groups, or conditions within cell types.

**Stage 7: Biological Interpretation**
Relates findings to aging biology. Interprets composition and state changes. Generates hypotheses for validation.

## Cell Type Identification Strategies

**Marker-based:**
Uses known marker genes from literature to assign identities. Works well for characterized cell types but may miss novel states.

**Reference-based:**
Projects cells onto reference atlas with known annotations. Transfers labels to query dataset. Accuracy depends on reference quality.

**Hybrid approach:**
Combines marker genes with reference mapping. Validates automated annotations manually. Most robust for complex tissues.

## Aging-Specific Considerations

**Senescent cells:**
Identifies using senescence-associated secretory phenotype markers, cell cycle arrest signatures, and senescence pathways.

**Immune infiltration:**
Quantifies immune cell types and activation states that increase with tissue aging.

**Stem cell exhaustion:**
Tracks stem cell populations and their gene expression changes indicating functional decline.

**Cell type loss:**
Identifies cell types depleted with age and mechanisms of loss.

## Limitations

- Requires adequate cell numbers per type for reliable detection
- Rare cell types may be missed or under-sampled
- Batch effects can confound biological signal
- Cell dissociation may alter gene expression
- Limited to RNA, missing protein and metabolite information

Integration with spatial transcriptomics and proteomics provides more complete cellular characterization.

## Advanced Features

**Subclustering:**
Focuses on specific cell type, re-clusters to identify subtypes within major populations.

**Doublet removal:**
Identifies cells representing technical artifacts from multiple cells captured together.

**Cell cycle scoring:**
Assigns cell cycle phase to each cell. Option to regress out cell cycle effects if not of interest.

**Batch correction:**
Integrates datasets from multiple batches or technologies while preserving biological variation.

**Differential abundance:**
Statistical testing for cell type proportion changes across conditions accounting for biological and technical replication structure.

---

This command enables comprehensive single-cell analysis revealing cell-type-specific aging processes and intervention responses essential for understanding tissue-level aging mechanisms.