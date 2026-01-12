# Check RNA-seq Quality

Comprehensive quality control assessment for RNA sequencing data ensuring reliable downstream analysis.

## Agent Used

This command leverages the **Transcriptomics Analyst** agent for quality assessment.

## Description

Performs systematic quality control evaluation of RNA-seq data from raw reads through aligned data. Identifies technical issues, assesses biological quality, detects outlier samples, and provides recommendations for filtering or reprocessing. Ensures data meets quality standards before differential expression or other downstream analyses.

## Usage

```
/check-rnaseq-quality
```

After invoking the command, provide:
- Raw sequencing files (FASTQ format)
- Aligned read files (BAM format)
- Count matrix (if quantification complete)
- Sample metadata for biological context

## Inputs

**Required (one or more):**
- FASTQ files: Raw sequencing reads
- BAM files: Aligned reads to genome/transcriptome
- Count matrix: Gene-level read counts

**Optional:**
- Sample metadata: Experimental groups, batch information
- Expected library characteristics: Library type, strandedness
- Reference information: Genome/transcriptome annotations

## Quality Metrics Assessed

### Raw Read Quality

**Sequence quality scores:**
- Per-base quality score distributions
- Quality score degradation along reads
- Proportion of bases below quality thresholds

**Sequence content:**
- GC content and deviation from expected
- Adapter contamination detection
- Overrepresented sequences
- Sequence duplication levels

**Library characteristics:**
- Read length distributions
- Insert size distributions for paired-end
- Complexity assessment

### Alignment Quality

**Mapping statistics:**
- Overall alignment rate
- Uniquely mapped reads proportion
- Multi-mapping read frequency
- Unmapped read characteristics

**Alignment accuracy:**
- Mismatch rates
- Soft-clipping frequency
- Properly paired reads for paired-end data

**Coverage patterns:**
- Gene body coverage uniformity
- 3-prime/5-prime bias assessment
- Coverage of annotated features

### Biological Quality

**RNA integrity:**
- Ribosomal RNA contamination
- Intronic versus exonic read ratios
- Signs of RNA degradation

**Library composition:**
- Expressed gene count
- Library complexity and saturation
- Proportion of reads in features

**Sample relationships:**
- Correlation between biological replicates
- Principal component analysis clustering
- Outlier sample identification

## Process

The command performs:

1. **Raw read assessment**: Evaluates sequence quality and content
2. **Alignment evaluation**: Checks mapping statistics and accuracy
3. **Count-level analysis**: Assesses biological signal quality
4. **Between-sample comparison**: Identifies outliers and batch effects
5. **Failure mode detection**: Recognizes specific quality issues
6. **Recommendation generation**: Suggests filtering or reprocessing
7. **Report creation**: Compiles comprehensive quality report

## Outputs

**Quality report:**
- Pass/fail assessment for each quality metric
- Visualizations of quality distributions
- Sample-level quality scores
- Recommendations for problematic samples

**Diagnostic plots:**
- Quality score heatmaps
- GC content distributions
- Mapping rate comparisons
- PCA plots showing sample relationships
- Correlation matrices between samples

**Summary statistics:**
- Per-sample read counts and mapping rates
- Overall library quality metrics
- Batch effect assessments
- Outlier sample identification

**Action recommendations:**
- Samples recommended for exclusion
- Trimming or filtering suggestions
- Batch correction necessity
- Resequencing recommendations

## Interpretation Guidelines

The command evaluates:
- Whether data quality supports reliable differential expression
- Which samples may be technical outliers requiring exclusion
- Whether batch effects require correction
- If resequencing of failed samples is warranted

For aging studies specifically:
- Distinguishes RNA degradation in aged samples from technical issues
- Recognizes that aged tissue may show different expression patterns
- Identifies when age itself creates apparent quality differences
- Assesses if age-related effects confound with technical factors

## Example Use Cases

**Pre-analysis QC:**
Assess data quality before differential expression to identify problematic samples.

**Batch integration:**
Evaluate whether samples from different sequencing runs can be combined after batch correction.

**Troubleshooting:**
Diagnose why expected biological signals are not detected in analysis.

**Method validation:**
Confirm new library preparation or sequencing protocols produce high-quality data.

## Integration with Other Commands

Results inform:
- Sample inclusion decisions for `/analyze-differential-expression`
- Batch correction requirements for downstream analysis
- Covariate inclusion in statistical models
- Need for additional sequencing of failed samples

## Quality Standards

**Minimum acceptable:**
- Alignment rate above 70%
- Genes detected above 10,000
- Library complexity adequate (low duplication)
- Biological replicates cluster together

**High quality:**
- Alignment rate above 90%
- Genes detected above 15,000
- Minimal adapter contamination
- Clear separation of biological groups

## Common Failure Modes

**Technical failures:**
- Adapter contamination from incomplete trimming
- Low complexity from PCR over-amplification
- Poor mapping from wrong reference genome
- High duplication from low input material

**Biological concerns:**
- RNA degradation from sample handling
- Ribosomal contamination from depletion failure
- Genomic DNA contamination
- Wrong tissue or sample mix-up

**Experimental design issues:**
- Confounding of biological and technical factors
- Inadequate biological replication
- Batch effects overwhelming biological signal

## Best Practices

**Proactive QC:**
- Assess quality before investing in deep analysis
- Identify problematic samples early
- Catch systematic issues affecting multiple samples
- Document quality metrics for publication

**Statistical considerations:**
- Don't remove outliers solely on statistical grounds
- Investigate biological reasons for apparent outliers
- Balance sample size versus quality tradeoffs
- Document all QC decisions and exclusions

**Biological validation:**
- Confirm unexpected patterns with orthogonal methods
- Consider biological explanations before assuming technical failure
- Validate key findings in samples passing QC

## Technical Notes

Implements standard RNA-seq QC metrics from community best practices. Recognizes platform-specific characteristics including Illumina quality score encoding, strand-specific library protocols, and UMI-based quantification approaches.

For aging tissue samples, understands that some quality metrics may be inherently different from young samples. RNA from aged tissues may show degradation signatures even with optimal handling. Distinguishes age-related biology from technical artifacts through comparison to age-matched controls.

## Limitations

- Cannot definitively distinguish biological from technical effects without controls
- Quality thresholds somewhat arbitrary and context-dependent
- May identify outliers that are biologically interesting rather than technical failures
- Cannot assess quality issues present across all samples uniformly

Requires biological expertise to interpret QC results in experimental context. Statistical outliers may be biologically meaningful rather than technically flawed.

## Remediation Strategies

**For failing samples:**
- Resequence if material available
- Exclude from analysis if unredeemable
- Adjust analysis to account for lower quality
- Document limitations in interpretation

**For batch effects:**
- Apply batch correction methods
- Include batch as covariate in models
- Perform batch-specific analyses
- Consider technical replication

**For systematic issues:**
- Reprocess all samples with improved protocols
- Apply consistent trimming or filtering
- Use alternative alignment strategies
- Consult sequencing facility

---

This command ensures RNA-seq data quality meets standards for reliable biological inference while recognizing aging-specific considerations and providing actionable recommendations.