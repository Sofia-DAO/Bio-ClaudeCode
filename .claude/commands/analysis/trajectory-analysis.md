# Trajectory Analysis

Pseudotime and differentiation trajectory analysis for understanding cellular transitions in aging and development.

## Agent Used

This command leverages the **Transcriptomics Analyst** agent for trajectory inference.

## Description

Infers cellular differentiation trajectories and pseudotime ordering from single-cell RNA-seq data. Maps cells along continuous developmental or aging paths, identifies branch points where cells commit to different fates, discovers genes driving transitions, and characterizes how trajectories are affected by age or interventions. Essential for understanding stem cell aging, differentiation capacity changes, and cellular state transitions.

## Usage

```
/trajectory-analysis
```

After invoking the command, provide:
- Single-cell data (from analyze-scrna-seq)
- Cell type of interest for trajectory
- Expected trajectory structure (linear, branched, cyclical)
- Starting cell population if known

## Inputs

**Required:**
- Single-cell expression data: Normalized counts
- Dimensionality reduction: PCA or other embeddings
- Cell metadata: Types, samples, conditions

**Optional:**
- Root cells: Known starting population
- Branch structure: Expected differentiation paths
- Gene sets: Pathways expected to change
- Time information: Real time if available

## Process

The command performs:

1. **Data preparation**: Selects cells and genes for trajectory
2. **Trajectory inference**: Learns developmental path structure
3. **Pseudotime calculation**: Orders cells along trajectories
4. **Branch identification**: Detects fate decision points
5. **Gene dynamics**: Identifies genes changing along path
6. **Functional interpretation**: Maps processes to trajectory stages
7. **Comparison analysis**: Tests aging or intervention effects

## Outputs

**Trajectory visualization:**
- Cells plotted along inferred paths
- Pseudotime coloring showing progression
- Branch structure with decision points
- Multiple trajectory views (2D/3D)

**Pseudotime ordering:**
- Pseudotime values per cell
- Trajectory assignments for branched paths
- Confidence scores for ordering
- Real time correlation if available

**Dynamic genes:**
- Genes changing significantly along trajectory
- Expression patterns (upregulated, downregulated, transient)
- Peak expression timing
- Gene modules with coordinated dynamics

**Functional dynamics:**
- Pathway activities along trajectory
- Transcription factor activities
- Cell cycle progression
- Metabolic state changes

**Comparative analysis:**
- Trajectory differences between ages
- Intervention effects on progression
- Branch probability changes
- Pseudotime distribution shifts

## Interpretation Guidelines

The command reveals:
- Continuous cellular transitions between states
- Critical decision points in differentiation
- Molecular programs driving state changes
- How aging affects differentiation capacity

For aging research specifically:
- Stem cell differentiation trajectory changes
- Lineage commitment alterations with age
- Transdifferentiation in aging tissues
- Cellular reprogramming by interventions

## Example Use Cases

**Stem cell aging:**
Map hematopoietic stem cell differentiation trajectories comparing young versus aged to identify aging-related blocks.

**Senescence progression:**
Infer trajectory from proliferating to senescent cells revealing intermediate states and drivers.

**Reprogramming:**
Track cellular rejuvenation trajectories during experimental reprogramming interventions.

**Tissue regeneration:**
Characterize differentiation paths during tissue repair and how aging impairs regenerative capacity.

## Integration with Other Commands

Results complement:
- `/analyze-scrna-seq` provides input data
- `/build-grn` identifies regulators driving transitions
- `/pathway-enrichment` interprets functional changes
- `/train-classifier` predicts pseudotime or branch assignments

## Best Practices

**Method selection:**
- Choose algorithm appropriate for expected structure
- Linear for simple progressions
- Branching for fate decisions
- Cyclic for cell cycle or circadian

**Root definition:**
- Use biological knowledge to set starting cells
- Validate root choice with markers
- Consider multiple roots if uncertain
- Check trajectory reversal plausibility

**Gene selection:**
- Focus on highly variable genes
- Exclude cell cycle genes unless of interest
- Include known lineage markers
- Avoid dominant batch effect genes

**Validation:**
- Compare to known markers and timing
- Check biological plausibility of ordering
- Validate key findings experimentally
- Test robustness to parameter choices

## Technical Notes

Implements multiple trajectory inference algorithms for different topologies. Calculates pseudotime as progress measure along inferred paths. Identifies genes with significant expression changes using appropriate statistical tests accounting for pseudotemporal ordering.

For aging studies, recognizes that aged cells may show altered trajectory structures with blocked differentiation or aberrant paths. Distinguishes developmental trajectories from aging-induced state transitions.

## Trajectory Algorithms

**Diffusion-based:**
Models cell transitions as diffusion process. Suitable for complex branching structures. Robust to noise but computationally intensive.

**Graph-based:**
Constructs cell-to-cell graph, finds paths through graph. Efficient and intuitive. May struggle with very complex topologies.

**RNA velocity:**
Uses nascent versus mature RNA ratios to predict cell fate. Provides directionality information. Requires unspliced counts.

**Optimal transport:**
Models cells moving along optimal paths minimizing transport cost. Principled framework handling unbalanced data.

## Dynamic Gene Analysis

**Identification:**
Tests each gene for significant expression changes along pseudotime using appropriate regression models.

**Pattern characterization:**
Classifies genes by temporal pattern: early, late, transient, biphasic.

**Module detection:**
Groups genes with correlated dynamics into functional modules representing coherent biological programs.

**Regulatory inference:**
Identifies transcription factors with expression patterns preceding target genes suggesting regulatory relationships.

## Branch Analysis

**Branch detection:**
Identifies points where trajectory splits into alternative fates using topology optimization.

**Branch assignment:**
Assigns cells to specific branches based on gene expression and pseudotime.

**Fate probability:**
Calculates probability of cells reaching each endpoint useful for understanding commitment timing.

**Branch markers:**
Identifies genes differentially expressed between branches defining alternative fates.

## Aging-Specific Applications

**Differentiation capacity:**
Quantifies whether aged stem cells follow same trajectories as young or show altered paths indicating impaired differentiation.

**Lineage bias:**
Identifies whether aging shifts branch probabilities favoring certain lineages over others.

**Transdifferentiation:**
Detects aberrant trajectories where cells adopt inappropriate fates common in aged tissues.

**Rejuvenation trajectories:**
Maps reverse trajectories induced by reprogramming or rejuvenation interventions.

## Limitations

- Pseudotime is relative ordering, not absolute time
- Trajectory structure assumptions may not match biology
- Rare cell states may be missed
- Requires sufficient cells along entire trajectory
- Batch effects can create artificial trajectories

Experimental validation with time-course data or lineage tracing essential for confirming computational trajectories.

## Advanced Features

**Multiple trajectories:**
Analyzes datasets with multiple independent trajectories or disconnected components.

**Trajectory alignment:**
Aligns trajectories from different conditions to identify altered paths or timing.

**Driver gene identification:**
Prioritizes genes most influential in determining cell fate decisions for functional validation.

**Integration with RNA velocity:**
Combines trajectory inference with RNA velocity for enhanced directionality inference.

**Spatial trajectories:**
Incorporates spatial location information when available to constrain biologically plausible trajectories.

## Comparison Across Conditions

**Trajectory structure:**
Tests whether aging or interventions alter path topology creating new branches or eliminating paths.

**Progression speed:**
Compares pseudotime distributions to identify slowed or accelerated differentiation.

**Gene dynamics:**
Identifies genes with altered temporal patterns across conditions.

**Branch probabilities:**
Quantifies shifts in fate decisions with condition.

---

This command enables understanding of continuous cellular state transitions and how aging affects differentiation capacity, essential for stem cell aging research and regenerative medicine applications.