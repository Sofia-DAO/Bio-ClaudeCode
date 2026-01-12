# Analyze Splicing

Alternative splicing analysis identifying differential isoform usage, splicing changes in aging, and regulatory mechanisms controlling transcript diversity.

## Agent Used

This command leverages the **Transcriptomics Analyst** agent for splicing analysis.

## Description

Performs comprehensive alternative splicing analysis from RNA-seq data. Quantifies isoform expression, detects differential splicing events, identifies splicing factors regulating changes, maps age-related splicing alterations, and characterizes functional consequences. Essential for understanding post-transcriptional regulation in aging and tissue-specific gene expression control.

## Usage

```
/analyze-splicing
```

After invoking the command, provide:
- RNA-seq data (BAM files or junction counts)
- Sample metadata (age, tissue, treatment)
- Transcript annotations
- Analysis goals (differential splicing, factors, functional impact)

## Inputs

**Required:**
- Aligned RNA-seq reads: BAM files
- Sample information: Groups, replicates
- Gene/transcript annotations: GTF or GFF

**Optional:**
- Splice junction coordinates
- Known splicing events database
- Splicing factor expression
- Protein domain annotations

## Process

The command performs:

1. **Junction quantification**: Counts reads supporting splicing
2. **Isoform estimation**: Quantifies transcript abundances
3. **Event detection**: Identifies alternative splicing events
4. **Differential splicing**: Tests changes across conditions
5. **Splicing factor analysis**: Identifies regulators
6. **Functional annotation**: Predicts protein consequences
7. **Pathway enrichment**: Affected biological processes
8. **Regulatory analysis**: Motifs and binding sites

## Outputs

**Splice junction analysis:**
- Novel junction discovery
- Junction read counts
- Splice site strength scores
- Cryptic splicing detection

**Alternative splicing events:**
- Exon skipping
- Alternative 5'/3' splice sites
- Intron retention
- Mutually exclusive exons
- Alternative first/last exons

**Differential splicing:**
- Events changing between conditions
- Percent spliced in (PSI) values
- Statistical significance
- Effect sizes
- Age-associated splicing changes

**Isoform quantification:**
- Transcript-level expression
- Isoform switching
- Dominant isoform identification
- Tissue-specific isoforms

**Splicing factors:**
- Regulators of differential events
- Splicing factor-target networks
- RNA binding motifs
- Splicing factor expression changes

**Functional consequences:**
- Protein domain alterations
- Frameshift effects
- Nonsense-mediated decay targets
- Functional isoform changes

## Interpretation Guidelines

The command reveals:
- Alternative splicing patterns genome-wide
- Condition-specific isoform usage
- Splicing regulatory mechanisms
- Functional impacts of splicing changes

For aging research specifically:
- Age-related splicing decline
- Tissue-specific aging splicing
- Splicing factor dysregulation
- Isoform switches affecting function

## Example Use Cases

**Aging splicing:**
Characterize global splicing changes across lifespan identifying accumulating splicing errors.

**Tissue-specific regulation:**
Map tissue-specific alternative splicing revealing functional specialization.

**Splicing factor targets:**
Identify genes regulated by key splicing factors like SRSF proteins or hnRNPs.

**Intervention effects:**
Determine whether longevity interventions restore youthful splicing patterns.

## Integration with Other Commands

Results complement:
- `/analyze-differential-expression` for gene-level changes
- `/build-grn` for splicing factor regulatory networks
- `/pathway-enrichment` for functional interpretation
- `/predict-protein-structure` for isoform structural differences

## Best Practices

**RNA-seq requirements:**
- Sufficient read length (≥75bp)
- Adequate depth (30M+ reads)
- Strand-specific preferred
- Multiple biological replicates

**Analysis choices:**
- Use appropriate tools for data type
- Validate novel junctions
- Consider read coverage biases
- Account for isoform complexity

**Statistical testing:**
- Adjust for multiple testing
- Report effect sizes
- Validate key events with RT-PCR
- Consider technical variability

**Biological interpretation:**
- Consider protein consequences
- Integrate with protein data
- Validate functional impacts
- Relate to phenotypes

## Technical Notes

Implements multiple splicing analysis approaches including rMATS, LeafCutter, SUPPA2, or DEXSeq. Quantifies isoforms with Salmon, kallisto, or RSEM. Identifies splicing factors using sequence motifs and expression correlations.

For aging splicing, recognizes declining fidelity with age causing intron retention and cryptic splicing. Understands tissue-specific splicing factors and age-related changes in splicing machinery.

## Splicing Event Types

**Exon skipping (SE):**
Most common event. Exon included or excluded from mature transcript.

**Alternative 5' splice site (A5SS):**
Different donor sites used creating longer or shorter exons.

**Alternative 3' splice site (A3SS):**
Different acceptor sites used.

**Intron retention (IR):**
Intron remains in mature transcript. Common aging defect.

**Mutually exclusive exons (MXE):**
Two exons where only one appears in transcript.

## Quantification Methods

**Junction-based:**
Counts reads spanning splice junctions. Fast but incomplete.

**Exon-level:**
Counts reads in exons to infer splicing. DEXSeq approach.

**Isoform-level:**
Estimates full-length transcript abundances. Most complete but challenging.

**Event-centric:**
Focuses on specific splicing events. MISO, rMATS, MAJIQ approaches.

## Differential Splicing

**Percent spliced in (PSI / Ψ):**
Proportion of transcripts including an exon. PSI=1 (always included), PSI=0 (always skipped).

**Inclusion ratio:**
Similar to PSI but accounts for expression level.

**Delta PSI (ΔPSI):**
Change in PSI between conditions. |ΔPSI| > 0.1 typically meaningful.

**Statistical testing:**
Tests whether splicing differs significantly beyond expression changes.

## Splicing Factors

**SR proteins:**
SRSF1-12. Promote exon inclusion by binding ESEs (exonic splicing enhancers).

**hnRNPs:**
hnRNPA1, hnRNPC, etc. Often promote exon skipping via ESSs (silencers).

**Tissue-specific:**
RBFOX, MBNL, NOVA, PTBP. Control tissue-specific splicing programs.

**U2AF, SF3B1:**
Core spliceosome components. Mutations cause splicing defects.

## RNA Binding Motifs

**Splicing enhancers (ESE, ISE):**
Sequences promoting exon inclusion or splice site usage.

**Splicing silencers (ESS, ISS):**
Sequences inhibiting inclusion or promoting skipping.

**Branch point:**
Adenosine upstream of 3' splice site. Required for splicing.

**Polypyrimidine tract:**
U/C-rich region between branch point and 3' splice site.

## Functional Consequences

**Domain addition/removal:**
Alters protein function by changing domain composition.

**Frameshift:**
Changes reading frame creating different C-terminus or truncation.

**Nonsense-mediated decay:**
Premature stop codons trigger mRNA degradation.

**Localization signals:**
Splicing affects subcellular targeting sequences.

**Regulatory regions:**
Affects phosphorylation sites, binding domains, regulatory elements.

## Aging Splicing Defects

**Intron retention increase:**
Declining splicing fidelity causes increased intron retention with age.

**Cryptic splicing:**
Use of non-canonical splice sites increases with aging.

**Splicing factor decline:**
Expression or activity of splicing factors decreases.

**Spliceoso me dysfunction:**
Age-related defects in spliceosome components.

## Tissue Specificity

**Brain:**
Extensive alternative splicing for neuronal diversity. Particularly susceptible to age-related changes.

**Muscle:**
Developmental splicing switches. Age-related changes affect sarcomere proteins.

**Immune:**
Antibody diversity through splicing. Age-related immune splicing changes.

**Liver:**
Metabolic enzyme isoforms. Splicing affects drug metabolism.

## Limitations

- Requires high sequencing depth
- Low-abundance isoforms difficult to quantify
- Short reads may miss full-length transcripts
- Computational complexity for genome-wide analysis
- Validation often needed for key findings

Long-read sequencing (PacBio, Nanopore) addresses some limitations by capturing full-length transcripts.

## Advanced Features

**Long-read sequencing:**
Sequences full-length transcripts eliminating assembly ambiguity.

**Single-cell splicing:**
Reveals cell-type-specific splicing and heterogeneity.

**Temporal dynamics:**
Time-course analysis shows splicing changes during aging progression.

**Splicing QTLs (sQTLs):**
Genetic variants affecting splicing. Links genetics to RNA phenotypes.

**Protein validation:**
Confirms predicted isoforms at protein level with proteomics.

## Therapeutic Targeting

**Splicing modulators:**
Small molecules altering splicing (e.g., risdiplam for SMN2).

**Antisense oligonucleotides:**
Target splice sites to modulate splicing (e.g., nusinersen, eteplirsen).

**Splicing factor inhibitors:**
Target dysregulated splicing in cancer.

**Correcting defects:**
Restore youthful splicing in aging tissues.

---

This command enables comprehensive alternative splicing analysis revealing post-transcriptional regulatory complexity and age-related splicing defects contributing to functional decline.