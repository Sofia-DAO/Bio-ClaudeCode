# Analyze GWAS

Genome-wide association study analysis identifying genetic variants associated with aging-related phenotypes.

## Agent Used

This command leverages the **Genomics Analyst** agent for genetic association analysis.

## Description

Performs comprehensive genome-wide association analysis to identify genetic variants influencing longevity, healthspan, or age-related disease risk. Implements appropriate statistical tests, corrects for population structure, applies genome-wide significance thresholds, and annotates findings with functional information.

## Usage

```
/analyze-gwas
```

After invoking the command, provide:
- Genotype data (variants x individuals)
- Phenotype data (trait values or case-control status)
- Covariate information (age, sex, principal components)
- Optional: Kinship matrix for related individuals

## Inputs

**Required:**
- Genotype file: Genetic variants for all study participants
- Phenotype file: Trait measurements or disease status
- Covariate file: Adjustment variables including ancestry

**Optional:**
- Relatedness matrix: For family-based or structured populations
- Gene annotation: For functional interpretation
- LD reference: For clumping independent signals

## Process

The command performs:

1. **Quality control**: Filters variants and samples by quality metrics
2. **Population stratification**: Corrects for ancestry differences
3. **Association testing**: Tests each variant for phenotype association
4. **Multiple testing correction**: Applies genome-wide significance threshold
5. **Independent signal identification**: Clumps correlated variants
6. **Functional annotation**: Maps variants to genes and regulatory elements
7. **Pathway analysis**: Identifies enriched biological processes

## Outputs

**Primary results:**
- Manhattan plot showing genome-wide association signals
- QQ plot assessing test statistic calibration
- Table of genome-wide significant variants
- Regional association plots for top signals

**Functional annotation:**
- Gene assignments for associated variants
- Predicted functional consequences
- Regulatory element overlaps
- Conservation scores

**Biological interpretation:**
- Pathway enrichment results
- Gene set analysis
- Integration with expression data

## Interpretation Guidelines

The command provides:
- Genome-wide significant associations (p < 5e-8)
- Effect sizes (odds ratios, beta coefficients)
- Allele frequencies and directions of effect
- Functional predictions for causal mechanisms

For longevity research specifically:
- Identifies variants associated with lifespan or healthspan
- Maps associations to known longevity pathways
- Compares findings to prior aging genetics studies
- Evaluates replication of known longevity variants

## Example Use Cases

**Longevity GWAS:**
Identify genetic variants associated with exceptional longevity by comparing centenarians to younger controls.

**Healthspan GWAS:**
Map variants influencing functional decline, frailty scores, or composite healthspan measures.

**Age-related disease:**
Identify genetic risk factors for Alzheimer's, cardiovascular disease, or other aging-associated conditions.

**Intervention response:**
Test whether genetic variants predict response to longevity interventions like dietary restriction.

## Integration with Other Commands

Results can feed into:
- Polygenic score construction
- Expression QTL analysis with RNA-seq data
- Protein QTL analysis with proteomics data
- Drug target prioritization

## Best Practices

**Study design:**
- Ensure adequate sample size for expected effect sizes
- Include diverse ancestries with appropriate analysis
- Replicate findings in independent cohorts
- Validate top hits with functional studies

**Statistical rigor:**
- Apply strict quality control filters
- Correct for population structure thoroughly
- Use appropriate genome-wide significance threshold
- Report effect sizes with confidence intervals

**Biological interpretation:**
- Consider LD structure when mapping variants to genes
- Integrate functional genomics data
- Examine consistency with known biology
- Prioritize variants for functional validation

## Technical Notes

Implements linear or logistic regression for quantitative or binary traits. Includes principal components to correct for population structure. Applies genomic control if test statistics show inflation. Uses LD clumping to identify independent signals.

For aging phenotypes, recognizes survivor bias where individuals dying young are excluded from elderly cohorts. Accounts for age as covariate when appropriate. Considers sex-stratified analysis given sex differences in aging.

## Limitations

- Requires large sample sizes for adequate power
- Identifies associations, not causal variants
- Common variant focus misses rare variant contributions
- Population-specific findings may not generalize across ancestries

Functional validation required to establish causal variants and mechanisms. Integration with multi-omics data strengthens biological interpretation.

---

This command enables discovery of genetic influences on aging while maintaining statistical rigor and providing biological context for findings.