# Analyze CNV

Copy number variation analysis for detecting genomic deletions, duplications, and structural alterations in aging and cancer.

## Agent Used

This command leverages the **Genomics Analyst** agent for CNV analysis.

## Description

Performs comprehensive copy number variation analysis from array or sequencing data. Detects genomic deletions and amplifications, segments genomes into regions of constant copy number, identifies recurrent CNVs, assesses cancer clonal evolution, and characterizes age-related chromosomal instability. Essential for understanding somatic mosaicism, cancer evolution, and genomic instability in aging.

## Usage

```
/analyze-cnv
```

After invoking the command, provide:
- CNV input data (array intensities or sequencing coverage)
- Sample information (normal vs tumor, age, tissue)
- Platform type (SNP array, WGS, WES, targeted panels)
- Analysis goals (somatic vs germline, clonality, evolution)

## Inputs

**Required:**
- CNV data: Array log ratios or sequencing coverage
- Sample identifiers and metadata

**Optional:**
- Matched normal: For somatic CNV detection
- Germline reference: For comparison
- Gene annotations: For impact assessment
- Known cancer genes: For oncogene/TSG analysis

## Process

The command performs:

1. **Data preprocessing**: Normalizes signals, corrects biases
2. **Segmentation**: Identifies breakpoints and CNV regions
3. **Copy number calling**: Estimates integer copy numbers
4. **Recurrence analysis**: Finds shared CNVs across samples
5. **Gene-level analysis**: Maps CNVs to genes
6. **Clonality estimation**: Tumor purity and subclones
7. **Pathway analysis**: Affected biological processes
8. **Clinical interpretation**: Therapeutic relevance

## Outputs

**CNV calls:**
- Genomic coordinates of altered regions
- Copy number estimates (loss, gain, amplification)
- Confidence scores
- Breakpoint locations
- Size distributions

**Segmentation:**
- Genome-wide CNV profiles
- Chromosome ideograms with CNVs
- Focal vs broad alterations
- Chromothripsis detection
- Copy number transitions

**Recurrent CNVs:**
- Regions altered across multiple samples
- GISTIC-style significance
- Focal peaks of recurrence
- Likely driver vs passenger events

**Gene impact:**
- Genes affected by CNVs
- Oncogene amplifications
- Tumor suppressor deletions
- Dosage-sensitive genes
- Pathway disruption

**Clonality:**
- Tumor purity estimates
- Clonal vs subclonal events
- Temporal ordering
- Phylogenetic trees
- Clonal evolution dynamics

**Clinical relevance:**
- Actionable alterations
- Prognostic markers
- Therapy resistance
- Druggable targets

## Interpretation Guidelines

The command provides:
- Genome-wide copy number alterations
- Recurrent cancer driver events
- Clonal architecture of tumors
- Therapeutic implications

For aging research specifically:
- Somatic mosaicism accumulation with age
- Clonal hematopoiesis CNVs
- Age-related chromosomal instability
- Cancer evolution with aging

## Example Use Cases

**Cancer genomics:**
Identify driver amplifications (oncogenes) and deletions (tumor suppressors) in age-related cancers.

**Clonal hematopoiesis:**
Detect clonal expansions with specific CNVs in blood of aging individuals.

**Somatic mosaicism:**
Characterize tissue-specific CNV accumulation across lifespan.

**Treatment monitoring:**
Track CNV changes during therapy revealing resistance mechanisms.

## Integration with Other Commands

Results complement:
- `/analyze-gwas` for germline CNV associations
- `/annotate-variants` for point mutation context
- `/analyze-differential-expression` for expression-CNV relationships
- `/pathway-enrichment` for functional impact

## Best Practices

**Quality control:**
- Assess signal quality and noise
- Validate with orthogonal methods
- Check for artifacts and biases
- Evaluate tumor purity

**Segmentation:**
- Try multiple algorithms
- Validate breakpoints
- Consider ploidy
- Account for aneuploidy

**Interpretation:**
- Distinguish driver from passenger
- Consider recurrence across samples
- Integrate with expression data
- Validate key findings

**Clinical application:**
- Report actionable alterations
- Check therapy guidelines
- Consider resistance mechanisms
- Update with new evidence

## Technical Notes

Implements segmentation algorithms (CBS, ASCAT, FACETS) appropriate for data type. Corrects for GC bias, mappability, and technical artifacts. Estimates ploidy and tumor purity for accurate copy number calling.

For aging CNV analysis, recognizes increasing somatic mosaicism with age. Distinguishes benign age-related changes from pathological alterations. Understands clonal hematopoiesis as aging phenotype.

## CNV Types

**Deletions:**
Loss of genomic material. Homozygous deletions eliminate gene function. Common in tumor suppressors.

**Duplications:**
Gain of genomic material. Can increase gene dosage. Amplifications dramatically increase oncogene expression.

**Balanced rearrangements:**
Translocations or inversions without net copy change. May create fusion genes or disrupt regulation.

**Complex rearrangements:**
Chromothripsis, chromoplexy. Catastrophic events creating multiple rearrangements.

## Detection Methods

**SNP arrays:**
Genotyping arrays providing copy number from intensity ratios. Lower resolution than sequencing.

**Array CGH:**
Comparative genomic hybridization. Direct CN measurement but becoming obsolete.

**Whole genome sequencing:**
Read depth reveals CN. High resolution, detects breakpoints precisely.

**Whole exome sequencing:**
Exome-focused CN calling. Limited to coding regions, uneven coverage.

## Segmentation Algorithms

**Circular binary segmentation (CBS):**
Classic algorithm using recursive splits. Robust but computationally intensive.

**Hidden Markov models:**
Probabilistic approach modeling CN states. Handles noise well.

**ASCAT:**
Allele-specific CN analysis of tumors. Separates copy number from loss of heterozygosity.

**FACETS:**
Fraction and allele-specific CN estimates. Infers purity and ploidy jointly.

## Recurrence Analysis

**GISTIC:**
Identifies recurrent focal alterations likely to be drivers. Accounts for background CN variation.

**Frequency-based:**
Simply counts alterations across samples. Less statistically rigorous but interpretable.

**Pathway-centric:**
Tests whether specific pathways are recurrently disrupted by CNVs.

## Clonality and Evolution

**Purity estimation:**
Fraction of tumor cells in sample. Low purity reduces detection power.

**Subclone detection:**
Identifies multiple tumor cell populations with different CNV profiles.

**Temporal ordering:**
Clonal events occur first, subclonal later. Infers evolutionary history.

**Phylogenetic reconstruction:**
Builds tree showing tumor evolution and branching.

## Cancer Drivers

**Oncogene amplification:**
ERBB2, MYC, CCND1 amplifications driving proliferation.

**Tumor suppressor deletion:**
TP53, CDKN2A, PTEN deletions removing brakes.

**Whole chromosome changes:**
Aneuploidy common in cancer, contributes to instability.

**Chromothripsis:**
Massive chromosome shattering and reassembly in single event. Poor prognosis marker.

## Aging-Related CNVs

**Clonal hematopoiesis:**
Clonal expansions with CNVs (del(20q), trisomy 8) in elderly blood.

**Somatic mosaicism:**
Tissue mosaicism increases with age through replication errors and damage.

**Chromosomal instability:**
Aging cells show increased mis-segregation and aneuploidy.

**Cancer predisposition:**
Age-related CNV accumulation increases cancer risk.

## Therapeutic Implications

**Targeted therapy:**
ERBB2 amplification → trastuzumab, EGFR amplification → cetuximab.

**Synthetic lethality:**
BRCA deletion → PARP inhibitor sensitivity.

**Resistance mechanisms:**
Amplification of drug targets or resistance genes.

**Prognosis:**
High CNV burden often indicates poor prognosis and genomic instability.

## Limitations

- Resolution limited by platform
- Balanced rearrangements not detected by CN alone
- Low-level mosaicism difficult to detect
- Tumor heterogeneity complicates interpretation
- GC bias and artifacts can create false positives

Integration with whole-genome sequencing and single-cell methods addresses limitations.

## Advanced Features

**Chromothripsis detection:**
Identifies catastrophic shattering events with specific CN oscillation patterns.

**Kataegis:**
Localized hypermutation near breakpoints indicating specific mutational processes.

**Copy-neutral LOH:**
Loss of heterozygosity without CN change through gene conversion or mitotic recombination.

**Allele-specific CNV:**
Tracks parent-of-origin, identifies uniparental disomy.

**Single-cell CNV:**
Reveals cellular heterogeneity and clonal structure at single-cell resolution.

## Clinical Reporting

**Actionable alterations:**
CNVs with therapeutic or prognostic implications following clinical guidelines.

**Variant classification:**
Pathogenic, likely pathogenic, uncertain significance, benign.

**Treatment recommendations:**
Evidence-based therapy suggestions for actionable CNVs.

**Monitoring:**
CNVs to track during treatment for resistance or response.

---

This command enables comprehensive CNV analysis revealing chromosomal instability in aging, cancer driver events, and clonal evolution dynamics essential for precision oncology and aging research.