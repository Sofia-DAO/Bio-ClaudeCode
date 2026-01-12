# Pathway Enrichment

Comprehensive pathway and gene set enrichment analysis to identify biological processes affected in aging research experiments.

## Agents Used

This command leverages the **Transcriptomics Analyst** and **Literature Analyst** agents for pathway analysis and biological interpretation.

## Description

Performs pathway and gene ontology enrichment analysis on gene lists from differential expression, GWAS, or other omics analyses. Identifies overrepresented biological processes, molecular functions, and cellular components. Provides statistical testing, multiple testing correction, and biological interpretation in the context of aging research.

## Usage

```
/pathway-enrichment
```

After invoking the command, provide:
- Gene list (differentially expressed genes, GWAS hits, etc.)
- Background gene set (all genes tested in the study)
- Pathway databases to query
- Significance thresholds

## Inputs

**Required:**
- Gene list: Genes of interest from analysis
- Gene identifiers: Ensembl, Entrez, or gene symbols

**Optional:**
- Background gene set: Universe of genes tested
- Pathway databases: Specific databases to query
- Significance threshold: P-value or FDR cutoff
- Effect direction: Separate analysis for up/down regulated genes

## Process

The command performs:

1. **Gene ID mapping**: Converts identifiers to standard formats
2. **Background definition**: Establishes appropriate gene universe
3. **Overrepresentation analysis**: Tests for enriched pathways
4. **Multiple testing correction**: Applies FDR or Bonferroni correction
5. **Effect size calculation**: Computes enrichment fold changes
6. **Pathway hierarchy**: Organizes results by biological themes
7. **Literature integration**: Provides context for aging relevance

## Outputs

**Enrichment results:**
- Table of significantly enriched pathways
- P-values and adjusted p-values
- Enrichment ratios and fold changes
- Genes contributing to each pathway
- Pathway hierarchies and relationships

**Visualizations:**
- Bar plots of top enriched pathways
- Dot plots showing significance and enrichment
- Network diagrams of pathway relationships
- Gene-pathway heatmaps

**Biological interpretation:**
- Aging-relevant pathway highlights
- Connections to known longevity mechanisms
- Comparison to previous aging studies
- Therapeutic target suggestions

## Interpretation Guidelines

The command provides:
- Statistical evidence for pathway enrichment
- Biological context for enriched processes
- Gene-level contributions to pathways
- Relationships between enriched pathways

For aging research specifically:
- Highlights pathways central to aging hallmarks
- Identifies intervention mechanisms of action
- Connects findings to longevity pathways
- Suggests follow-up experiments

## Example Use Cases

**Differential expression follow-up:**
Identify biological processes affected by aging or longevity interventions from transcriptomics data.

**GWAS interpretation:**
Map genetic associations to biological pathways to understand mechanism.

**Multi-omics integration:**
Find pathways affected across transcriptomics, proteomics, and metabolomics.

**Cross-species comparison:**
Identify conserved aging pathways across different model organisms.

## Integration with Other Commands

Results complement:
- `/analyze-differential-expression` provides input gene lists
- `/analyze-gwas` identifies genetic pathways
- Network analysis visualizes pathway interactions
- Drug discovery targets pathway members therapeutically

## Best Practices

**Statistical rigor:**
- Define appropriate background gene set
- Apply multiple testing correction
- Report effect sizes alongside p-values
- Consider pathway size in interpretation

**Biological interpretation:**
- Focus on coherent biological themes
- Consider pathway crosstalk
- Integrate with literature knowledge
- Validate key pathways experimentally

**Aging-specific considerations:**
- Prioritize known longevity pathways
- Consider tissue-specific pathway roles
- Examine age-by-pathway interactions
- Compare to aging pathway databases

## Technical Notes

Implements hypergeometric tests for overrepresentation. Applies gene set enrichment analysis for ranked gene lists. Uses pathway topology where available. Accounts for pathway size, gene overlap, and hierarchical relationships.

For aging studies, recognizes canonical pathways including nutrient sensing, mitochondrial function, autophagy, inflammation, DNA damage response, and proteostasis. Interprets findings in context of aging hallmarks and longevity mechanisms.

## Pathway Databases

The command queries multiple pathway resources:

**Biological processes:**
- Gene Ontology biological processes
- Cellular components
- Molecular functions

**Metabolic pathways:**
- Core metabolic pathways
- Signaling cascades
- Biosynthetic pathways

**Disease pathways:**
- Age-related disease processes
- Pharmacological pathways
- Toxicity pathways

**Aging-specific:**
- Longevity pathway annotations
- Senescence-associated processes
- Geroprotector mechanisms

## Enrichment Methods

**Overrepresentation Analysis:**
Tests whether pathway genes are overrepresented in gene list versus background. Appropriate for discrete gene sets from thresholded analyses.

**Gene Set Enrichment Analysis:**
Tests whether pathway genes cluster toward top or bottom of ranked gene list. Appropriate for ranked lists avoiding arbitrary thresholds.

**Network-based Enrichment:**
Considers pathway topology and gene interactions. Identifies pathway regions most affected rather than treating all genes equally.

## Limitations

- Pathway annotations incomplete and biased toward well-studied genes
- Overlapping pathways can produce redundant enrichments
- Pathway boundaries somewhat arbitrary
- Enrichment does not prove functional importance

Integration with experimental validation and mechanistic studies essential for establishing biological significance.

## Advanced Features

**Directional enrichment:**
Separate analysis for upregulated versus downregulated genes to identify opposing pathway effects.

**Leading edge analysis:**
Identifies core genes driving pathway enrichment for focused follow-up.

**Pathway crosstalk:**
Maps interactions between enriched pathways to understand coordinated regulation.

**Temporal analysis:**
Tracks pathway enrichment changes across time series or aging progression.

---

This command enables biological interpretation of gene lists while maintaining statistical rigor and providing aging-specific context for findings.