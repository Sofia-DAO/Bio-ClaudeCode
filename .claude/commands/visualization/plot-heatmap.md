# Plot Heatmap

Generate publication-quality heatmaps visualizing expression, abundance, or similarity patterns across samples and features in aging research.

## Agent Used

This command leverages the **Data Analyst** agent for heatmap visualization and clustering.

## Description

Creates comprehensive heatmaps displaying gene expression, protein abundance, or other quantitative measurements across samples and features. Implements hierarchical clustering to reveal patterns, provides customizable color schemes, includes dendrograms showing relationships, and produces publication-ready figures with appropriate annotations.

## Usage

```
/plot-heatmap
```

After invoking the command, provide:
- Data matrix (features x samples)
- Sample metadata for annotation
- Optional: Features to highlight or subset
- Optional: Clustering preferences

## Inputs

**Required:**
- Data matrix: Quantitative measurements (genes/proteins x samples)
- Feature names: Gene symbols, protein IDs, etc.
- Sample names: Sample identifiers

**Optional:**
- Sample annotations: Groups, conditions, covariates
- Feature annotations: Pathways, functional categories
- Clustering options: Distance metrics, linkage methods
- Color scheme: Diverging, sequential, or custom palettes
- Data transformation: Log scaling, z-scores, percentiles

## Process

The command performs:

1. **Data validation**: Checks matrix format and completeness
2. **Data transformation**: Applies scaling or normalization
3. **Clustering analysis**: Hierarchical clustering of samples and features
4. **Dendrogram calculation**: Computes clustering relationships
5. **Color mapping**: Assigns colors representing values
6. **Annotation addition**: Includes sample and feature metadata
7. **Figure optimization**: Adjusts layout and labeling

## Outputs

**Heatmap figure:**
- Color-coded matrix showing values
- Hierarchical clustering dendrograms
- Sample annotation tracks
- Feature annotation labels
- Color scale legend
- Clustering relationships displayed

**Cluster assignments:**
- Sample clusters from dendrogram
- Feature clusters grouping co-regulated genes
- Optimal cluster number suggestions
- Cluster stability assessments

**Quality metrics:**
- Clustering quality scores
- Silhouette coefficients
- Cophenetic correlation
- Gap statistics

## Interpretation Guidelines

The command produces:
- Visual summary of expression or abundance patterns
- Sample relationships through clustering
- Co-regulated feature modules
- Batch effects or outliers if present

For aging research specifically:
- Clusters separating age groups or interventions
- Co-expressed aging-related gene modules
- Senescence-associated expression signatures
- Intervention response patterns

## Example Use Cases

**Differential expression visualization:**
Display genes significantly changed across aging or treatment groups.

**Sample quality assessment:**
Cluster samples to identify outliers or batch effects before analysis.

**Time series patterns:**
Show gene expression trajectories across aging time course.

**Multi-omics integration:**
Create matched heatmaps for transcriptomics, proteomics, and metabolomics.

## Integration with Other Commands

Results complement:
- `/analyze-differential-expression` identifies genes to display
- `/pathway-enrichment` provides feature annotations
- `/check-rnaseq-quality` informs sample filtering
- PCA plots show similar relationships in reduced dimensions

## Best Practices

**Data preparation:**
- Scale or transform data appropriately
- Filter for most variable features if large datasets
- Handle missing values consistently
- Consider batch correction if applicable

**Clustering choices:**
- Select distance metrics appropriate for data type
- Choose linkage methods matching biological question
- Cluster samples and features separately if needed
- Consider alternative orderings beyond hierarchical

**Visual design:**
- Use colorblind-friendly diverging palettes
- Include clear color scale legends
- Label features and samples legibly
- Annotate clusters or groups clearly

## Technical Notes

Implements hierarchical clustering using various distance metrics including Euclidean, correlation, and Manhattan distances. Supports complete, average, and Ward linkage methods. Applies data transformations including z-score normalization, log scaling, and rank transformation.

For aging studies, recognizes that expression magnitudes may differ across age groups even after normalization. Interprets patterns considering biological variation increases with age.

## Clustering Methods

**Hierarchical clustering:**
Builds tree-like structures showing nested groupings. Enables visualization at multiple resolution levels.

**Distance metrics:**
- Euclidean: Geometric distance in expression space
- Correlation: Based on expression pattern similarity
- Manhattan: City-block distance robust to outliers

**Linkage methods:**
- Complete: Maximum distance between clusters
- Average: Mean distance between clusters
- Ward: Minimizes within-cluster variance

## Color Schemes

**Diverging:**
Two colors representing extremes with neutral middle. Ideal for fold changes centered at zero.

**Sequential:**
Single color gradient from low to high. Appropriate for non-negative measurements like expression levels.

**Custom:**
User-defined colors for specific visualization needs or journal requirements.

## Annotations

**Sample annotations:**
Track bars showing experimental groups, batches, clinical variables alongside heatmap.

**Feature annotations:**
Labels or colors indicating gene pathways, protein families, functional categories.

**Significance markers:**
Symbols or colors highlighting significantly changed features.

## Data Transformations

**Z-score normalization:**
Centers and scales features to mean zero, unit variance. Emphasizes patterns over absolute magnitudes.

**Log transformation:**
Compresses dynamic range, making fold changes symmetric and normally distributed.

**Rank transformation:**
Converts values to ranks, robust to outliers and non-normal distributions.

**Row or column centering:**
Removes feature or sample means to focus on deviations from average.

## Limitations

- Can become cluttered with many features or samples
- Hierarchical clustering order somewhat arbitrary
- Color perception varies among individuals
- Static visualization loses interactive exploration

For large datasets, consider subsetting to most variable features or using interactive versions with zooming and filtering.

## Advanced Features

**Interactive heatmaps:**
Web-based versions allowing zooming, hovering for values, filtering, and reordering.

**Multiple clustering:**
Try different distance metrics and linkage methods to assess robustness.

**Bootstrap clustering:**
Assess cluster stability through resampling to identify robust groupings.

**Optimal cluster determination:**
Gap statistics, silhouette analysis, or dendrogram cutting to find meaningful cluster numbers.

## Aging-Specific Patterns

**Age progression:**
Samples ordered by age showing gradual expression changes or threshold effects.

**Intervention response:**
Treated versus control samples clustering by response magnitude.

**Senescence signatures:**
Gene modules associated with cellular senescence marking affected samples.

**Pathway coherence:**
Features grouped by pathway showing coordinated regulation or disruption with age.

---

This command enables effective visualization of high-dimensional omics data while revealing biological patterns relevant to aging research through appropriate clustering and annotation.