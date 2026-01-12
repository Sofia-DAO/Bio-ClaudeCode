# Check Proteomics Quality

Comprehensive quality control assessment for mass spectrometry proteomics data ensuring reliable downstream analysis.

## Agent Used

This command leverages the **Proteomics Analyst** agent for proteomics quality assessment.

## Description

Performs systematic quality control evaluation of mass spectrometry proteomics data from raw spectra through protein quantification. Identifies technical issues, assesses biological quality, detects outlier samples, and provides recommendations for filtering or reprocessing. Ensures data meets quality standards before differential abundance or other downstream analyses.

## Usage

```
/check-proteomics-quality
```

After invoking the command, provide:
- Raw mass spectrometry files
- Peptide identification results
- Protein quantification data
- Sample metadata for context

## Inputs

**Required (one or more):**
- Raw MS files: Spectral data
- Search results: Peptide-spectrum matches
- Protein groups: Quantified proteins
- Intensity matrix: Protein abundances across samples

**Optional:**
- Sample metadata: Experimental groups, batches
- Fractionation information: If pre-fractionation used
- Labeling strategy: TMT, iTRAQ, SILAC details
- Expected proteome characteristics

## Quality Metrics Assessed

### Identification Quality

**Search statistics:**
- Peptide identification rates
- Protein identification numbers
- False discovery rate estimates
- Peptide length distributions

**Sequence coverage:**
- Proteins identified with single peptides
- Average sequence coverage
- Distribution across protein abundance ranges

**Modification analysis:**
- Post-translational modification identification
- Oxidation and other artifact rates
- Modification site localization confidence

### Quantification Quality

**Missing values:**
- Proportion of missing values per sample
- Missing value patterns (random versus systematic)
- Proteins identified inconsistently across samples

**Measurement reproducibility:**
- Coefficient of variation in technical replicates
- Biological replicate correlation
- Retention time stability

**Dynamic range:**
- Abundance distribution across detected proteins
- Coverage of low versus high abundance proteins
- Signal-to-noise characteristics

### Sample Quality

**Injection quality:**
- Total ion current profiles
- Peptide identifications per sample
- Mass accuracy drift
- Retention time stability

**Contamination assessment:**
- Keratin contamination levels
- Non-specific binding indicators
- Carry-over between samples

**Batch effects:**
- Systematic differences between batches
- Temporal drift across runs
- Sample clustering patterns

## Process

The command performs:

1. **Raw data assessment**: Evaluates spectra quality
2. **Identification evaluation**: Checks search results
3. **Quantification analysis**: Assesses abundance measurements
4. **Between-sample comparison**: Identifies outliers
5. **Failure mode detection**: Recognizes specific issues
6. **Recommendation generation**: Suggests corrections
7. **Report creation**: Compiles comprehensive QC report

## Outputs

**Quality report:**
- Pass/fail assessment per metric
- Sample-level quality scores
- Outlier sample identification
- Recommended actions

**Diagnostic plots:**
- Total ion chromatograms
- Mass accuracy distributions
- Missing value heatmaps
- Sample correlation matrices
- PCA plots showing sample relationships
- Coefficient of variation distributions

**Summary statistics:**
- Proteins identified per sample
- Missing value proportions
- Median CVs in replicates
- Batch effect assessments

**Action recommendations:**
- Samples requiring exclusion
- Normalization approaches needed
- Batch correction necessity
- Reprocessing suggestions

## Interpretation Guidelines

The command evaluates:
- Whether data quality supports reliable differential abundance testing
- Which samples may be technical outliers
- Whether batch effects require correction
- If additional MS runs are warranted

For aging studies specifically:
- Distinguishes protein degradation in aged samples from technical issues
- Recognizes age-related proteome complexity changes
- Identifies when age effects confound with technical factors
- Assesses if sample handling affected aged tissues differentially

## Example Use Cases

**Pre-analysis QC:**
Assess data quality before differential abundance analysis to identify problematic samples.

**Method optimization:**
Evaluate new sample preparation or MS acquisition protocols.

**Troubleshooting:**
Diagnose why expected protein changes not detected in analysis.

**Batch integration:**
Determine if samples from different MS runs can be combined after correction.

## Integration with Other Commands

Results inform:
- Sample inclusion for differential abundance analysis
- Batch correction requirements
- Covariate inclusion in statistical models
- Need for additional MS runs

## Quality Standards

**Minimum acceptable:**
- At least 1000 proteins quantified per sample
- Missing values below 30% overall
- Technical replicate CVs below 20%
- Biological replicates cluster together

**High quality:**
- Over 3000 proteins quantified
- Missing values below 15%
- Technical replicate CVs below 10%
- Clear separation of biological groups

## Common Failure Modes

**Technical failures:**
- Low peptide identification from poor LC performance
- High missing values from inconsistent detection
- Contamination from sample preparation issues
- Carryover from inadequate column washing

**Biological concerns:**
- Protein degradation from sample handling
- Variable protein extraction across samples
- Differential post-translational modifications
- Sample identity mix-ups

**Experimental design issues:**
- Confounding of biological and technical factors
- Inadequate biological replication
- Batch effects overwhelming biological signal
- Inappropriate controls

## Best Practices

**Proactive QC:**
- Assess quality before deep analysis
- Identify systematic issues early
- Catch problems affecting multiple samples
- Document quality metrics for publication

**Statistical considerations:**
- Don't remove outliers solely on statistics
- Investigate biological reasons for outliers
- Balance sample size versus quality
- Document all QC decisions

**Biological validation:**
- Confirm unexpected patterns with Western blots
- Consider biological explanations before assuming failure
- Validate key findings in QC-passing samples

## Technical Notes

Implements standard proteomics QC metrics from community best practices. Recognizes platform-specific characteristics including Orbitrap, Q-TOF, and triple quadrupole instruments. Understands labeling-specific considerations for TMT, iTRAQ, SILAC experiments.

For aging tissue samples, understands that proteome complexity and post-translational modification rates may differ from young samples. Distinguishes age-related biology from technical artifacts through comparison to age-matched controls.

## Normalization Strategies

**Total intensity normalization:**
Assumes similar total protein amounts across samples. May fail if major abundance shifts occur.

**Median normalization:**
More robust to outlier proteins. Assumes symmetric changes around median.

**Quantile normalization:**
Forces identical distributions. Strong assumption but effective for removing systematic bias.

**Reference protein normalization:**
Uses housekeeping proteins. Requires careful selection of stable proteins.

## Batch Effect Correction

**ComBat:**
Parametric adjustment for known batch effects. Requires batch assignments and adequate sample sizes per batch.

**Surrogate variable analysis:**
Identifies unknown sources of variation. Useful when batch structure unclear.

**Ratio methods:**
Uses within-batch ratios to remove batch effects. Requires common reference samples.

## Limitations

- Cannot definitively distinguish biological from technical effects without controls
- Quality thresholds context-dependent
- May identify outliers that are biologically interesting
- Cannot assess issues uniform across all samples

Requires biological expertise to interpret QC results in experimental context.

## Remediation Strategies

**For failing samples:**
- Reprocess if material available
- Exclude if unredeemable
- Adjust analysis to account for lower quality
- Document limitations

**For batch effects:**
- Apply batch correction methods
- Include batch as covariate
- Perform batch-specific analyses
- Consider reprocessing with balanced design

**For systematic issues:**
- Reprocess all samples with improved protocol
- Apply consistent normalization
- Use alternative quantification strategies
- Consult proteomics core facility

## Aging-Specific Considerations

**Sample handling:**
Aged tissues may require optimized extraction protocols to handle increased protein crosslinking or aggregation.

**Post-translational modifications:**
Increased oxidation, glycation, and other modifications in aged samples may affect identification and quantification.

**Proteome composition:**
Age-related changes in cellular composition may cause apparent abundance changes in normalization.

**Quality interpretation:**
Lower identification rates in aged samples may reflect biological reality rather than technical failure.

---

This command ensures proteomics data quality meets standards for reliable biological inference while recognizing aging-specific considerations and providing actionable recommendations.