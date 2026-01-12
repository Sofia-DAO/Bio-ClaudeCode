# Annotate Variants

Comprehensive functional annotation of genetic variants for aging GWAS, whole-genome sequencing, and longevity genetics studies.

## Agent Used

This command leverages the **Genomics Analyst** agent for variant annotation.

## Description

Performs detailed functional annotation of genetic variants from GWAS, whole-exome, or whole-genome sequencing. Predicts variant consequences on genes and proteins, assesses deleteriousness, identifies regulatory impacts, integrates population genetics data, and prioritizes variants for functional validation. Essential for interpreting genetic associations with aging phenotypes and longevity.

## Usage

```
/annotate-variants
```

After invoking the command, provide:
- Variant list (VCF format or coordinates)
- Reference genome version
- Annotation preferences (consequences, scores, populations)
- Phenotype context (aging, longevity, disease)

## Inputs

**Required:**
- Variant coordinates: Chromosome, position, ref, alt
- Reference genome: hg19, hg38, etc.

**Optional:**
- Genotype information: For population genetics
- Phenotype associations: GWAS p-values
- Gene lists: For focused annotation
- Regulatory data: Cell type-specific annotations

## Process

The command performs:

1. **Consequence prediction**: Impact on genes and transcripts
2. **Deleteriousness scoring**: Multiple prediction algorithms
3. **Population genetics**: Allele frequencies and selection
4. **Regulatory annotation**: Transcription factor and enhancer impacts
5. **Disease associations**: Links to aging-related phenotypes
6. **Conservation assessment**: Evolutionary constraint
7. **Functional prioritization**: Ranks variants by impact
8. **Literature integration**: Known variant-phenotype links

## Outputs

**Variant consequences:**
- Coding effects (missense, nonsense, splice)
- Transcript impacts
- Protein changes
- Gene annotations
- Regulatory region overlaps

**Deleteriousness predictions:**
- CADD scores
- PolyPhen-2 predictions
- SIFT scores
- MPC (missense badness)
- REVEL ensemble scores

**Population genetics:**
- Allele frequencies (gnomAD, 1000G)
- Population differentiation
- Selection signatures
- Haplotype context
- Linkage disequilibrium

**Regulatory impacts:**
- Transcription factor binding changes
- Enhancer disruption
- Promoter variants
- Splicing effects
- Chromatin accessibility changes

**Phenotype associations:**
- ClinVar classifications
- GWAS catalog hits
- UK Biobank associations
- Aging phenotype links
- Disease associations

**Prioritization:**
- Combined scores
- Functional rankings
- Likely pathogenic variants
- Follow-up candidates

## Interpretation Guidelines

The command provides:
- Functional impact of each variant
- Deleteriousness predictions
- Population context and rarity
- Regulatory and phenotypic effects

For aging research specifically:
- Longevity-associated variant effects
- Age-related disease risk variants
- Pathway disruption by variants
- Druggable targets from genetics

## Example Use Cases

**GWAS follow-up:**
Annotate genome-wide significant SNPs to identify causal variants and affected genes.

**Longevity genetics:**
Characterize variants enriched in centenarians determining mechanisms of exceptional longevity.

**Rare variant analysis:**
Prioritize rare coding variants from WES affecting aging pathways.

**Functional fine-mapping:**
Distinguish causal from linked variants in associated loci.

## Integration with Other Commands

Results complement:
- `/analyze-gwas` provides variants to annotate
- `/pathway-enrichment` interprets affected pathways
- `/build-grn` shows regulatory variant impacts
- `/predict-protein-structure` models missense effects

## Best Practices

**Annotation completeness:**
- Use multiple annotation sources
- Include regulatory predictions
- Assess population frequencies
- Check for known phenotypes

**Deleteriousness interpretation:**
- Use ensemble predictions
- Consider multiple scores
- Validate critical predictions
- Account for annotation bias

**Prioritization strategies:**
- Combine multiple evidence types
- Weight by prior biological knowledge
- Consider druggability
- Validate top candidates experimentally

**Population context:**
- Check allele frequencies carefully
- Consider population specificity
- Assess recent selection
- Evaluate MAF thresholds

## Technical Notes

Integrates multiple annotation tools including VEP, ANNOVAR, or SnpEff. Queries gnomAD, ClinVar, GWAS Catalog, and other resources. Applies conservation scores from phyloP, phastCons. Uses regulatory annotations from ENCODE and Roadmap Epigenomics.

For aging genetics, recognizes that longevity variants may have small effects, be enriched in specific populations, or show age-by-genotype interactions requiring careful interpretation.

## Variant Consequences

**Coding variants:**
- Synonymous: No amino acid change
- Missense: Amino acid substitution
- Nonsense: Premature stop codon
- Frameshift: Insertion/deletion altering reading frame
- In-frame indel: Insertion/deletion maintaining frame

**Splicing:**
- Splice donor/acceptor: Affects intron removal
- Splice region: Near splice sites, may affect splicing
- Deep intronic: Rarely affects splicing

**Regulatory:**
- 5' UTR: Affects translation
- 3' UTR: Affects stability, miRNA binding
- Promoter: Affects transcription initiation
- Enhancer: Affects tissue-specific expression
- TFBS: Alters transcription factor binding

## Deleteriousness Scores

**CADD:**
Combined annotation-dependent depletion. Integrates multiple features. Scores >20 likely deleterious.

**PolyPhen-2:**
Predicts missense impact using structure and conservation. Scores variants as benign, possibly damaging, probably damaging.

**SIFT:**
Sorts intolerant from tolerant substitutions based on conservation. Scores <0.05 predicted deleterious.

**REVEL:**
Ensemble method combining multiple scores. Effective for prioritizing rare variants.

## Population Genetics

**Allele frequency:**
Rare variants (MAF<1%) more likely to be deleterious. Very rare may be private or sequencing errors.

**Population differentiation:**
Variants with large frequency differences between populations may be under selection.

**Constraint metrics:**
pLI (probability of loss-of-function intolerance), LOEUF (loss-of-function observed/expected upper fraction) indicate gene constraint.

**Selection signatures:**
Long haplotypes, derived allele frequencies suggest recent positive selection.

## Regulatory Prediction

**Transcription factor binding:**
Variants in motifs may disrupt TF binding. Use position weight matrices and ChIP-seq.

**Enhancer variants:**
Overlapping H3K27ac peaks, accessible chromatin, or eQTLs suggest regulatory impact.

**Splicing prediction:**
MaxEntScan, SpliceAI predict splice-altering variants including deep intronic.

**Expression quantitative trait loci (eQTLs):**
Variants associated with gene expression changes. Mechanistic links to phenotypes.

## Aging-Specific Annotation

**Longevity genes:**
Variants in FOXO3, APOE, KLOTHO, IGF1R and other established longevity genes.

**Aging pathways:**
Nutrient sensing, DNA damage response, proteostasis, mitochondrial function pathway members.

**Cellular senescence:**
Genes regulating senescence entry, SASP, or senolytic targets.

**Age-related diseases:**
Alzheimer's, cardiovascular disease, cancer susceptibility genes.

## Prioritization Strategies

**Functional evidence:**
Coding changes, splice variants, validated regulatory effects score higher.

**Deleteriousness:**
Multiple prediction tools agreeing on pathogenicity.

**Rarity:**
Rare variants in constrained genes likely to be impactful.

**Phenotype relevance:**
Known associations with aging or related phenotypes.

**Druggability:**
Variants in genes amenable to therapeutic modulation prioritized for translation.

## Limitations

- Predictions imperfect, experimental validation required
- Regulatory annotations incomplete and cell type-specific
- Population frequency data biased toward European ancestry
- Rare variants difficult to interpret without functional data
- Complex variants (structural, copy number) not well annotated

Integration of experimental functional data improves annotation accuracy.

## Advanced Features

**Structural variant annotation:**
Larger deletions, duplications, inversions affecting genes or regulatory elements.

**Non-coding RNA variants:**
Impacts on lncRNA, miRNA affecting gene regulation.

**3D genome context:**
Variants in TAD boundaries or loop anchors affecting long-range regulation.

**Cell type-specific:**
Tissue-relevant regulatory annotations from epigenomic data.

**Pharmacogenomics:**
Drug response variants relevant for precision medicine in aging.

## Variant Interpretation Framework

**Pathogenic evidence:**
- Null variants in constrained genes
- Missense with high deleteriousness scores
- Known disease-causing variants
- Strong functional evidence

**Benign evidence:**
- High population frequency
- Low deleteriousness scores
- Synonymous in non-conserved regions
- No known phenotype associations

**Uncertain significance:**
Insufficient evidence for classification. Most variants fall here requiring more data.

---

This command enables comprehensive variant annotation revealing functional impacts and facilitating interpretation of genetic associations with aging and longevity phenotypes.