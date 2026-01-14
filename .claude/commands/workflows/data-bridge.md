# Data Bridge
Manually create or apply data transformation bridges between Bio-ClaudeCode agents.

## Description
Creates explicit data transformation specifications to bridge outputs from one agent to inputs of another. Enables custom transformations when automatic bridging is insufficient or when specific data manipulation is required.

## Usage
```
/data-bridge <source-agent> <target-agent> --transform <spec>
```

### Arguments
- `<source-agent>`: Agent producing output data
- `<target-agent>`: Agent consuming transformed data
- `--transform <spec>`: Transformation specification

### Options
- `--input <file>`: Input file to transform
- `--output <file>`: Output file location
- `--save <name>`: Save bridge configuration for reuse
- `--validate`: Validate transformation without execution
- `--show-schema`: Display source and target schemas

## Transformation Specifications

### Format Conversion
```yaml
transform:
  type: format_conversion
  source_format: vcf
  target_format: gene_list
  options:
    extract_field: gene_symbol
    include_annotations: true
```

### Column Mapping
```yaml
transform:
  type: column_mapping
  mappings:
    log2FoldChange: log2fc
    padj: p_adjusted
    gene_symbol: gene_name
  keep_unmapped: false
```

### Filtering
```yaml
transform:
  type: filter
  conditions:
    - field: padj
      operator: "<"
      value: 0.05
    - field: log2fc
      operator: "abs >"
      value: 1.0
```

### Value Transformation
```yaml
transform:
  type: value_transform
  operations:
    - field: expression_level
      operation: log2
    - field: p_value
      operation: -log10
    - field: binding_affinity
      operation: abs
```

### Complex Pipeline
```yaml
transform:
  type: pipeline
  steps:
    - filter:
        field: padj
        operator: "<"
        value: 0.05
    - column_mapping:
        log2FoldChange: log2fc
        gene_symbol: gene
    - value_transform:
        field: log2fc
        operation: round
        decimals: 2
    - sort:
        field: padj
        order: ascending
```

## Built-in Bridges

### RNA-seq to Pathway Analysis
```yaml
# data-analyst -> transcriptomics-analyst
transform:
  type: pipeline
  steps:
    - filter: {field: padj, operator: "<", value: 0.05}
    - extract_columns: [gene_symbol, log2fc, p_adjusted]
    - rename: {log2FoldChange: log2fc, padj: p_adjusted}
```

### Variants to Protein Targets
```yaml
# genomics-analyst -> proteomics-analyst
transform:
  type: pipeline
  steps:
    - vcf_to_genes: {annotation: ensembl}
    - map_to_proteins: {database: uniprot}
    - filter_protein_coding: true
```

### Pathways to Drug Targets
```yaml
# transcriptomics-analyst -> drug-discovery-analyst
transform:
  type: pipeline
  steps:
    - extract_pathway_genes: {top_pathways: 5}
    - annotate_druggability: {database: drugbank}
    - filter_druggable: true
    - export_targets: {format: sdf}
```

## Usage Examples

### Apply Saved Bridge
```
User: /data-bridge data-analyst transcriptomics-analyst \
      --input results/deseq2_results.csv \
      --output pathway_input/deg_genes.csv \
      --transform saved/rnaseq_to_pathway.yaml

Claude: Applying data bridge: data-analyst -> transcriptomics-analyst
        
        [LOADING] Bridge configuration from saved/rnaseq_to_pathway.yaml
        [OK] Transform spec validated
        
        [READING] Input: results/deseq2_results.csv (200 genes)
        [FILTER] padj < 0.05 (58 genes retained)
        [MAP] Column mappings applied
        [TRANSFORM] Value transformations applied
        [WRITING] Output: pathway_input/deg_genes.csv (58 genes)
        
        Bridge applied successfully.
        58 genes ready for pathway analysis.
```

### Create New Bridge
```
User: /data-bridge proteomics transcriptomics \
      --transform "filter: {field: is_sasp, value: true} | extract: [protein_name, fold_change]"

Claude: Creating data bridge: proteomics -> transcriptomics
        
        Transform specification:
        1. Filter: is_sasp == true
        2. Extract columns: protein_name, fold_change
        
        [OK] Transform validated
        Save this bridge? (y/n)

User: y

Claude: Bridge saved to: .claude/bridges/proteomics_to_transcriptomics.yaml
        Use with: /data-bridge proteomics transcriptomics --transform saved/...
```

### Validate Bridge
```
User: /data-bridge genomics drug-discovery --validate --show-schema

Claude: Validating bridge: genomics -> drug-discovery
        
        SOURCE SCHEMA (genomics-analyst output):
        - chr: string
        - pos: integer
        - gene: string
        - variant_type: string
        - binding_affinity: float
        
        TARGET SCHEMA (drug-discovery-analyst input):
        - protein_id: string
        - structure_file: path
        - binding_site: string
        
        [WARNING] Schema mismatch detected:
        - Missing: protein_id (required)
        - Missing: structure_file (required)
        - Unused: chr, pos, variant_type
        
        Recommended transformations:
        1. Map gene -> protein_id (via UniProt)
        2. Generate structure_file (via AlphaFold)
        3. Predict binding_site (via algorithm)
        
        Manual bridge configuration required.
```

## Bridge Library
Maintains reusable bridges:
```
.claude/bridges/
├── rnaseq_to_pathway.yaml
├── variants_to_proteins.yaml
├── pathways_to_drugs.yaml
├── proteomics_to_transcriptomics.yaml
└── literature_to_genomics.yaml
```

## Related Commands
- `/integration-test` - Test agent integration
- `/workflow-create` - Create multi-agent workflow
- `/workflow-run` - Execute workflow
