# Analyze ChIP-seq

Chromatin immunoprecipitation sequencing analysis for histone modifications, transcription factor binding, and chromatin state changes in aging.

## Agent Used

This command leverages the **Genomics Analyst** agent for ChIP-seq analysis.

## Description

Performs comprehensive ChIP-seq analysis from aligned reads through biological interpretation. Implements peak calling, differential binding analysis, motif discovery, chromatin state annotation, and integration with gene expression. Identifies age-related changes in histone modifications, transcription factor binding, and chromatin accessibility revealing epigenetic mechanisms of aging.

## Usage

```
/analyze-chip-seq
```

After invoking the command, provide:
- Aligned ChIP-seq reads (BAM files)
- Input control samples
- Target protein (histone mark or TF)
- Sample metadata (age, treatment, tissue)

## Inputs

**Required:**
- ChIP-seq BAM files: Aligned reads
- Input controls: Background binding
- Target specification: Histone mark or transcription factor
- Sample metadata: Groups, replicates

**Optional:**
- Reference peaks: Known binding sites
- Blacklist regions: Artifactual regions to exclude
- Motif databases: For TF analysis
- Gene annotations: For functional interpretation

## Process

The command performs:

1. **Quality assessment**: Read quality and library complexity
2. **Peak calling**: Identifies enriched regions
3. **Peak annotation**: Maps to genes and genomic features
4. **Differential binding**: Tests changes across conditions
5. **Motif analysis**: Discovers binding motifs
6. **Chromatin states**: Infers regulatory states
7. **Integration**: Relates to gene expression
8. **Biological interpretation**: Connects to aging mechanisms

## Outputs

**Quality metrics:**
- Fragment size distributions
- Library complexity estimates
- Cross-correlation plots
- Fraction of reads in peaks (FRiP)
- Signal-to-noise ratios

**Peak analysis:**
- Called peak coordinates
- Peak summit locations
- Peak confidence scores
- Genomic feature distribution
- Consensus peak sets across replicates

**Differential binding:**
- Differentially bound regions
- Fold changes and significance
- MA plots and heatmaps
- Age-associated binding changes
- Intervention effects on binding

**Motif discovery:**
- Enriched sequence motifs
- Transcription factor matches
- Motif locations in peaks
- Co-occurring motifs
- Motif evolution across conditions

**Chromatin states:**
- Active promoters
- Strong enhancers
- Weak enhancers
- Transcribed regions
- Heterochromatin
- State transitions with age

**Functional annotation:**
- Target genes per peak
- Pathway enrichment
- Gene ontology terms
- Regulatory element types
- Aging hallmark associations

## Interpretation Guidelines

The command reveals:
- Genome-wide binding patterns for target protein
- Age-related changes in chromatin modifications
- Transcription factor activity changes
- Regulatory element state transitions

For aging research specifically:
- H3K27ac loss at enhancers with age
- H3K4me3 changes at promoters
- Heterochromatin spreading (H3K9me3)
- TF binding alterations driving aging programs

## Example Use Cases

**Histone modification aging:**
Map H3K27ac or H3K4me3 changes across lifespan identifying enhancers and promoters with altered activity.

**TF binding dynamics:**
Characterize how key aging transcription factors (FOXOs, NF-κB, p53) change binding patterns with age.

**Chromatin state transitions:**
Track conversion of active chromatin to heterochromatin or loss of enhancer marks with aging.

**Intervention effects:**
Determine how longevity interventions restore youthful chromatin patterns or TF binding.

## Integration with Other Commands

Results complement:
- `/analyze-methylation` for multi-layer epigenetics
- `/analyze-differential-expression` for binding-expression relationships
- `/build-grn` for regulatory network context
- `/integrate-multiomics` for comprehensive regulation

## Best Practices

**Experimental design:**
- Include adequate biological replicates
- Use matched input controls
- Sequence to sufficient depth
- Validate key findings with ChIP-qPCR

**Peak calling:**
- Use appropriate algorithms for target type
- Consider peak shape (sharp for TFs, broad for histones)
- Validate peak overlap between replicates
- Filter blacklist regions

**Differential analysis:**
- Normalize for sequencing depth and efficiency
- Account for peak width differences
- Use appropriate statistical models
- Validate top hits experimentally

**Biological interpretation:**
- Consider genomic context
- Integrate with expression data
- Validate motifs experimentally
- Relate to known aging biology

## Technical Notes

Implements standard ChIP-seq workflows using MACS2 or similar for peak calling. Applies DiffBind or csaw for differential binding analysis. Performs motif discovery with HOMER or MEME. Annotates peaks to nearest genes accounting for distal regulatory elements.

For aging ChIP-seq, recognizes common patterns including enhancer decommissioning, heterochromatin expansion, and altered TF binding. Understands tissue-specific chromatin states and cell composition effects.

## Target Types

**Histone modifications:**
H3K4me3 (active promoters), H3K27ac (active enhancers), H3K27me3 (polycomb repression), H3K9me3 (heterochromatin), H3K36me3 (transcribed regions).

**Transcription factors:**
Sequence-specific binding proteins regulating gene expression. Sharp, narrow peaks at motifs.

**Chromatin proteins:**
Structural proteins (CTCF, cohesin) organizing genome architecture. Context-dependent binding.

**RNA polymerase:**
Pol II ChIP-seq reveals actively transcribed genes and paused promoters.

## Peak Calling

**Sharp peaks:**
For transcription factors. Identifies narrow regions of enrichment at specific motifs.

**Broad peaks:**
For histone modifications. Calls wider domains covering regulatory regions or chromatin domains.

**Consensus peaks:**
Merges overlapping peaks from replicates requiring presence in multiple samples.

**IDR analysis:**
Irreproducible discovery rate assesses reproducibility between replicates.

## Differential Binding

**Count-based:**
Counts reads in peaks, applies differential expression-style statistics (DESeq2, edgeR).

**Window-based:**
Slides windows across genome, tests for differential enrichment. Less dependent on peak definitions.

**Affinity-based:**
Uses peak intensity rather than counts. May be more sensitive to subtle changes.

## Chromatin States

**ChromHMM:**
Hidden Markov model learns chromatin states from combinations of histone marks.

**Segway:**
Dynamic Bayesian network for genome segmentation into functional states.

**State interpretation:**
States defined by mark combinations: active promoters (H3K4me3+H3K27ac), enhancers (H3K4me1+H3K27ac), etc.

**State transitions:**
Age-related shifts from active to poised or repressed states reveal chromatin aging.

## Motif Analysis

**De novo discovery:**
Finds enriched sequence patterns in peaks without prior knowledge. Reveals actual binding sequences.

**Known motif enrichment:**
Tests whether known TF motifs are enriched in peaks. Identifies likely binding factors.

**Co-occurring motifs:**
Discovers motif combinations suggesting TF cooperation or sequential binding.

**Motif conservation:**
Evolutionarily conserved motifs more likely to be functional.

## Aging Chromatin Patterns

**Enhancer decommissioning:**
Loss of H3K27ac at enhancers with age reduces regulatory activity.

**Promoter changes:**
H3K4me3 alterations affecting gene expression capacity.

**Heterochromatin spreading:**
H3K9me3 expansion into euchromatin silencing previously active regions.

**TF binding loss:**
Reduced binding of key regulators due to chromatin closure or TF decline.

## Functional Validation

**ChIP-qPCR:**
Validates binding at specific loci using quantitative PCR.

**CUT&Tag:**
Alternative method with lower input requirements and better signal-to-noise.

**Reporter assays:**
Tests whether identified enhancers drive gene expression.

**CRISPR screens:**
Systematically tests regulatory element importance.

## Limitations

- Requires substantial input material (1-10M cells)
- Antibody quality critical for success
- Cannot detect all binding sites (detection limits)
- Bulk tissue reflects mixed cell types
- Temporal resolution limited (steady-state snapshot)

Single-cell chromatin assays (scChIP-seq, CUT&Tag) address some limitations.

## Advanced Features

**CUT&RUN / CUT&Tag:**
Lower background, less input material required. Increasingly replacing traditional ChIP-seq.

**ChIP-exo / ChIP-nexus:**
Higher resolution mapping of binding sites to near base-pair resolution.

**Time-course:**
Captures dynamic changes in binding during aging progression or intervention.

**Allele-specific:**
Analyzes parent-of-origin specific binding important for imprinting and cis-regulation.

**Spatial:**
Emerging methods preserve tissue architecture during chromatin profiling.

## Integration Strategies

**ChIP + RNA-seq:**
Correlates binding changes with expression effects revealing functional binding events.

**ChIP + ATAC-seq:**
Combines binding with accessibility showing where chromatin is open for binding.

**Multi-mark ChIP:**
Profiles multiple histone marks in same samples defining complete chromatin states.

**3D genome:**
Integrates ChIP with Hi-C showing long-range interactions between regulatory elements and genes.

---

This command enables comprehensive chromatin analysis revealing epigenetic regulatory mechanisms in aging and identifying chromatin changes driving age-related transcriptional dysregulation.