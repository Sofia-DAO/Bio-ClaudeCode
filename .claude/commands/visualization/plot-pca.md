# Plot PCA

Principal component analysis visualization for exploratory analysis of high-dimensional omics data in aging research.

## Agent Used

This command leverages the **Data Analyst** agent for dimensionality reduction and visualization.

## Description

Performs principal component analysis to reduce high-dimensional omics data to two or three dimensions for visualization. Identifies major sources of variation, detects outlier samples, reveals batch effects, and assesses experimental group separation. Produces publication-quality PCA plots with appropriate annotations and variance explained metrics.

## Usage

```
/plot-pca
```

After invoking the command, provide:
- Data matrix (features x samples)
- Sample metadata for coloring and annotation
- Optional: Features to include or exclude
- Optional: Number of components to compute

## Inputs

**Required:**
- Data matrix: Expression, abundance, or other quantitative measurements
- Sample identifiers: Unique names for each sample

**Optional:**
- Sample metadata: Groups, batches, covariates for coloring
- Feature selection: Subset of most variable features
- Scaling option: Standardization or normalization
- Number of PCs: How many components to calculate

## Process

The command performs:

1. **Data preparation**: Filters and transforms data appropriately
2. **Feature selection**: Identifies most informative features if needed
3. **PCA calculation**: Computes principal components
4. **Variance explanation**: Determines variance captured per PC
5. **Score plotting**: Visualizes samples in PC space
6. **Loading analysis**: Identifies features driving PCs
7. **Statistical testing**: Assesses group separation significance

## Outputs

**PCA plots:**
- 2D scatter plot (PC1 vs PC2)
- 3D visualization if requested
- Color-coded by experimental groups
- Confidence ellipses around groups
- Variance explained percentages on axes
- Sample labels or identifiers

**Variance metrics:**
- Scree plot showing variance per PC
- Cumulative variance explained
- Percentage variance by each PC
- Kaiser criterion assessment

**Loadings:**
- Features contributing most to each PC
- Loading plots showing feature importance
- Biplot combining scores and loadings
- Gene lists defining each component

**Quality assessment:**
- Outlier sample identification
- Batch effect detection
- Group separation quantification
- Sample clustering patterns

## Interpretation Guidelines

The command reveals:
- Major sources of variation in dataset
- Whether experimental groups separate clearly
- Presence of outlier samples requiring investigation
- Batch effects confounding biological signal

For aging research specifically:
- Age as continuous gradient in PC space
- Intervention effects relative to age variation
- Tissue heterogeneity or cell type differences
- Individual variation versus group trends

## Example Use Cases

**Exploratory analysis:**
Visualize overall data structure before detailed statistical testing.

**Quality control:**
Identify outlier samples or batch effects requiring correction.

**Sample relationships:**
Assess similarity between biological replicates and separation of groups.

**Intervention effects:**
Visualize whether treatments shift samples along specific axes.

## Integration with Other Commands

Results complement:
- `/check-rnaseq-quality` for comprehensive QC
- `/analyze-differential-expression` for understanding variation
- Heatmaps showing similar relationships
- Clustering analyses revealing sample groups

## Best Practices

**Data preparation:**
- Use appropriate transformation (log for expression data)
- Center and scale features for comparability
- Filter lowly expressed or uninformative features
- Consider batch correction before PCA

**Visualization:**
- Color by experimental factor of interest
- Include variance explained on axes
- Add confidence ellipses for groups
- Label outliers or samples of particular interest

**Interpretation:**
- Don't over-interpret later PCs with low variance
- Consider multiple factors affecting variation
- Validate outliers before removal
- Relate PC axes to biological factors

## Technical Notes

Implements singular value decomposition for efficient PCA calculation. Handles missing values through imputation or complete case analysis. Scales features appropriately for different data types.

For aging studies, recognizes that age may be the dominant source of variation, potentially masking other effects in early PCs. May need to regress out age to visualize treatment effects clearly.

## Principal Components

**PC1:**
Typically captures largest source of variation, often biological factor of interest or confounding batch effect.

**PC2:**
Second largest variation source, may represent secondary biological effect or technical artifact.

**Later PCs:**
Capture progressively smaller variance, may represent subtle effects or noise.

## Variance Explained

**Scree plot:**
Visualizes variance per component to determine how many PCs capture meaningful variation versus noise.

**Kaiser criterion:**
Suggests retaining components with eigenvalues greater than one (more variance than single original variable).

**Cumulative variance:**
Shows total variation captured by top N components, often targeting 80-90% cumulative variance.

## Loading Analysis

**Top loadings:**
Features with largest magnitude loadings drive PC direction and can be interpreted as defining that component.

**Loading plots:**
Visualize feature contributions to two PCs simultaneously, revealing which features cluster together.

**Pathway enrichment:**
Analyze genes with high loadings to interpret biological meaning of PCs.

## Group Separation

**Statistical testing:**
Assess whether groups separate significantly using MANOVA, permutation tests, or classifier performance.

**Ellipse visualization:**
Confidence ellipses show spread of each group, with non-overlapping ellipses indicating separation.

**Distance metrics:**
Quantify separation between group centroids in PC space.

## Outlier Detection

**Distance-based:**
Identify samples far from cluster centers as potential outliers or unique biological states.

**Influence-based:**
Detect samples disproportionately affecting PC structure through leave-one-out analysis.

**Biological validation:**
Confirm whether outliers represent technical failures or genuine biological variation requiring inclusion.

## Limitations

- Linear method may miss nonlinear relationships
- Assumes variation is important (not always true)
- Interpretation of PCs can be challenging
- Outliers can disproportionately affect results

Consider complementary methods including t-SNE or UMAP for nonlinear dimensionality reduction or robust PCA for outlier resistance.

## Advanced Features

**3D PCA:**
Visualize three principal components simultaneously for richer representation.

**Animated PCA:**
Show time series data as trajectory through PC space over aging progression.

**Supervised PCA:**
Weight features by association with outcome to focus on relevant variation.

**Sparse PCA:**
Limit features contributing to each PC for improved interpretability.

## Aging-Specific Patterns

**Age gradient:**
Samples arrange along PC axis by age showing continuous aging trajectory.

**Intervention effects:**
Treatments shift samples perpendicular to age axis or reverse age trajectory.

**Threshold effects:**
Discontinuous jumps in PC space indicating critical age transitions.

**Individual variation:**
Spread within age groups revealing heterogeneous aging rates.

## Comparison Across Omics

**Transcriptomics:**
Major variation often from tissue type, then age, then treatment.

**Proteomics:**
May show stronger batch effects due to MS run variability.

**Metabolomics:**
Often dominated by dietary and metabolic state variation.

**Multi-omics:**
Integrated PCA reveals concordance across molecular layers.

---

This command enables effective exploratory visualization of high-dimensional data while revealing technical and biological patterns critical for aging research interpretation.