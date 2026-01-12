# Analyze Metabolomics

Comprehensive metabolomics analysis for metabolite profiling, pathway mapping, and metabolic aging signatures.

## Agent Used

This command leverages the **Data Analyst** agent for metabolomics statistical analysis.

## Description

Performs end-to-end metabolomics analysis from processed peak data through biological interpretation. Implements metabolite identification, normalization, statistical testing, pathway enrichment, and integration with other omics data. Identifies age-related metabolic changes, intervention effects on metabolism, and metabolic biomarkers of aging or healthspan.

## Usage

```
/analyze-metabolomics
```

After invoking the command, provide:
- Metabolite abundance data (metabolites x samples)
- Sample metadata (age, treatment, tissue)
- Platform information (LC-MS, GC-MS, NMR)
- Analysis goals (differential abundance, pathways, biomarkers)

## Inputs

**Required:**
- Abundance matrix: Metabolite intensities per sample
- Metabolite identifiers: Names, formulas, or database IDs
- Sample information: Experimental groups and covariates

**Optional:**
- Metabolite annotations: Chemical classes, pathways
- Quality control data: Internal standards, blanks
- Multi-omics data: For integration analysis
- Reference ranges: For biomarker interpretation

## Process

The command performs:

1. **Data quality assessment**: Evaluates measurement quality
2. **Normalization**: Corrects for technical variation
3. **Missing value handling**: Imputation or filtering strategies
4. **Differential abundance**: Statistical testing between groups
5. **Pathway analysis**: Metabolic pathway enrichment
6. **Network analysis**: Metabolite correlation and connectivity
7. **Biological interpretation**: Relates findings to aging

## Outputs

**Differential metabolites:**
- Significantly changed metabolites
- Fold changes and p-values
- Volcano plots
- Heatmaps of top metabolites

**Pathway enrichment:**
- Enriched metabolic pathways
- Pathway impact scores
- Metabolite-pathway networks
- Flux predictions where possible

**Correlation networks:**
- Metabolite-metabolite correlations
- Network modules
- Hub metabolites
- Pathway connectivity

**Biomarker analysis:**
- Metabolites distinguishing groups
- ROC curves and performance metrics
- Metabolite panels for classification
- Validation statistics

**Quality metrics:**
- CV distributions in QC samples
- Missing value patterns
- Batch effect assessments
- Normalization effectiveness

## Interpretation Guidelines

The command provides:
- Metabolic changes between conditions
- Affected metabolic pathways
- Metabolite-metabolite relationships
- Potential metabolic biomarkers

For aging research specifically:
- Age-related metabolic decline
- Intervention effects on metabolism
- Metabolic clock signatures
- Metabolites predicting healthspan

## Example Use Cases

**Metabolic aging:**
Profile metabolite changes across lifespan identifying age-associated metabolic dysregulation.

**Intervention metabolomics:**
Characterize metabolic effects of dietary restriction, rapamycin, or other longevity interventions.

**Metabolic biomarkers:**
Discover metabolite panels predicting biological age or healthspan outcomes.

**Disease metabolism:**
Map metabolic changes in age-related diseases like Alzheimer's or cardiovascular disease.

## Integration with Other Commands

Results complement:
- `/pathway-enrichment` for integrated pathway analysis
- `/integrate-multiomics` for multi-omics relationships
- `/train-classifier` for metabolomic biomarker models
- `/plot-heatmap` and `/plot-pca` for visualization

## Best Practices

**Quality control:**
- Use pooled QC samples throughout run
- Monitor internal standard performance
- Assess blank contamination
- Remove metabolites with poor detection

**Normalization:**
- Correct for sample dilution differences
- Account for batch effects
- Validate normalization with QC samples
- Consider platform-specific approaches

**Statistical analysis:**
- Use appropriate tests for data distribution
- Correct for multiple testing
- Report effect sizes with significance
- Account for covariates appropriately

**Biological interpretation:**
- Consider metabolite chemical relationships
- Integrate with pathway knowledge
- Validate key findings with standards
- Relate to other omics layers

## Technical Notes

Implements appropriate normalization for untargeted metabolomics including total intensity, median, quantile, or probabilistic quotient normalization. Handles missing values through detection limit imputation or minimum value replacement. Applies appropriate statistical tests accounting for data distribution.

For aging metabolomics, recognizes common patterns including declining NAD+, altered amino acid metabolism, lipid profile changes, and accumulation of damage-associated metabolites.

## Metabolomics Platforms

**LC-MS (Liquid Chromatography-Mass Spectrometry):**
Broad metabolite coverage, good sensitivity. Platform-specific normalization. Annotation challenges for unknowns.

**GC-MS (Gas Chromatography-Mass Spectrometry):**
Primary metabolites, reliable identification. Requires derivatization. Complementary to LC-MS.

**NMR (Nuclear Magnetic Resonance):**
Quantitative, reproducible, minimal sample prep. Lower sensitivity than MS. Excellent for targeted metabolites.

**Targeted assays:**
Specific metabolites with standards. High accuracy and reproducibility. Limited coverage but quantitative.

## Normalization Strategies

**Sample normalization:**
- Total intensity: Assumes similar total metabolite content
- Median: Robust to outlier metabolites
- Probabilistic quotient: Accounts for dilution
- Internal standards: Uses spiked compounds

**Batch correction:**
- QC-based correction using quality control samples
- ComBat adaptation for metabolomics
- Ratio methods using stable metabolites

## Metabolite Identification

**Level 1: Confirmed**
Matched to authentic standards with retention time and MS/MS confirmation.

**Level 2: Probable**
MS/MS matches spectral libraries without standards.

**Level 3: Tentative**
MS1 accurate mass matches only.

**Level 4: Unknown**
Detected features without identification.

## Pathway Analysis Approaches

**Enrichment analysis:**
Tests for overrepresentation of pathway metabolites in significant results. Standard approach but pathway incomplete coverage.

**Topology-aware:**
Considers metabolite positions in pathways. Distinguishes central versus peripheral metabolites.

**Network-based:**
Builds metabolite networks, identifies affected subnetworks. Captures metabolite relationships beyond predefined pathways.

**Flux analysis:**
Estimates metabolic flux changes where feasible. Requires isotope tracing data or kinetic modeling.

## Aging Metabolic Signatures

**NAD+ decline:**
Central metabolite decreasing with age affecting sirtuins and energy metabolism.

**Amino acid dysregulation:**
Branched-chain amino acid accumulation, tryptophan metabolism alterations.

**Lipid changes:**
Ceramide accumulation, cardiolipin remodeling, altered fatty acid composition.

**Oxidative stress:**
Increased oxidized metabolites, altered glutathione ratio, lipid peroxidation products.

**Glycolytic shift:**
Altered glucose metabolism, lactate changes, pentose phosphate pathway flux.

## Limitations

- Annotation challenges for unknown metabolites
- Dynamic range challenges detecting low-abundance metabolites
- Platform-specific biases in coverage
- Labile metabolites may degrade during processing
- Cannot distinguish isomers without additional separation

Complementing with targeted assays for key metabolites improves quantitative accuracy.

## Advanced Features

**Isotope tracing:**
When stable isotope tracers used, tracks metabolic flux through pathways.

**Ion mobility:**
Additional separation dimension improves isomer resolution and confidence.

**MS/MS networking:**
Connects structurally related metabolites even without identification.

**Multi-platform integration:**
Combines LC-MS, GC-MS, and NMR for comprehensive metabolome coverage.

**Lipidomics:**
Specialized workflows for complex lipids including structural assignment and quantification.

---

This command enables comprehensive metabolic profiling revealing systemic metabolic aging changes and intervention effects essential for understanding metabolic contributions to longevity.