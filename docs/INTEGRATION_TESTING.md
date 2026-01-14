# Integration Testing Guide

This document describes validated multi-agent workflows and integration patterns for Bio-ClaudeCode agents.

## Overview

Bio-ClaudeCode agents can be coordinated into complete research pipelines through data bridges and workflow orchestration. This guide documents tested integration patterns and provides examples.

## Validated Integrations

### Data Analyst → Transcriptomics Analyst

**Status:** VALIDATED (2026-01-13)

**Workflow:**
1. Data Analyst performs DESeq2 differential expression analysis
2. Data bridge transforms gene identifiers to standard symbols
3. Transcriptomics Analyst performs pathway enrichment analysis

**Data Bridge:**
- Input: DESeq2 results with gene identifiers
- Transformation: Gene ID mapping to standard symbols
- Output: Pathway enrichment input format

**Results:**
- 86.2% gene mapping coverage achieved
- 11 significantly enriched pathways identified (FDR < 0.05)
- Biological interpretation: Pro-longevity molecular profile

**Code Example:**
```python
# scripts/transform_deseq_to_pathway.py
# Transforms DESeq2 output to pathway enrichment input

import pandas as pd

# Load DESeq2 results
deg_df = pd.read_csv('deseq2_results.csv')

# Load gene mapping
mapping_df = pd.read_csv('gene_mapping.csv')

# Apply transformation
transformed_df = deg_df.merge(
    mapping_df[['gene_id', 'gene_symbol']], 
    left_on='gene_symbol', 
    right_on='gene_id',
    how='inner'
)

# Save transformed data
transformed_df.to_csv('pathway_input.csv', index=False)
```

**Commands:**
```bash
# Test this integration
/integration-test data-analyst transcriptomics-analyst --data test_data/

# Create reusable workflow
/workflow-create rnaseq-to-pathways \
  --agents data-analyst,transcriptomics-analyst \
  --bridge transform_deseq_to_pathway.py

# Run workflow
/workflow-run rnaseq-to-pathways --input deseq2_results.csv
```

## Integration Patterns

### Pattern 1: Sequential Analysis Pipeline

**Description:** Output from Agent A becomes input for Agent B

**Example:** RNA-seq to Pathway Enrichment to Drug Discovery

**Requirements:**
- Compatible data formats
- Data bridge script for transformation
- Validation checkpoints

**Implementation:**
```yaml
# .claude/workflows/sequential-pipeline.yaml
name: sequential-pipeline
agents:
  - name: data-analyst
    output: deg_results.csv
  - name: transcriptomics-analyst
    input: deg_results_transformed.csv
    bridge: transform_deseq_to_pathway.py
    output: enriched_pathways.csv
  - name: drug-discovery-analyst
    input: enriched_pathways.csv
    output: drug_candidates.csv
```

### Pattern 2: Parallel Validation

**Description:** Multiple agents analyze same data independently, results cross-validated

**Example:** Literature review validates genomics findings

**Requirements:**
- Independent data access
- Result comparison logic
- Conflict resolution strategy

### Pattern 3: Iterative Refinement

**Description:** Agent output fed back as input for refinement cycles

**Example:** Drug design iteration with ADMET feedback

**Requirements:**
- Convergence criteria
- Maximum iteration limit
- Quality improvement metrics

## Data Bridge Requirements

### Input Requirements
- Standard file format (CSV, TSV, JSON)
- Required columns documented
- Data type specifications

### Output Requirements
- Compatible with target agent input schema
- Metadata preservation
- Quality metrics included

### Validation Requirements
- Data integrity checks
- Coverage statistics
- Transformation accuracy metrics

## Testing Strategy

### Unit Testing
Test individual data bridges:
```bash
/data-bridge source-agent target-agent --validate-only
```

### Integration Testing
Test complete workflows:
```bash
/integration-test agent1 agent2 --generate-data
```

### Production Testing
Test with real data:
```bash
/workflow-run workflow-name --input real_data.csv --validate
```

## Error Handling

### Common Issues

**Issue 1: Incompatible gene identifiers**
- Symptom: Zero overlap between datasets
- Solution: Implement gene ID mapping bridge
- Example: GENE_XXXX to standard symbols

**Issue 2: Missing required columns**
- Symptom: KeyError in transformation
- Solution: Verify input schema compatibility
- Tool: Use --validate-only flag

**Issue 3: Data type mismatch**
- Symptom: Type conversion errors
- Solution: Explicit type casting in bridge
- Prevention: Schema validation

## Best Practices

### Data Bridge Development
1. Validate input schema before transformation
2. Check mapping coverage (aim for >80%)
3. Preserve metadata and quality metrics
4. Document transformation logic
5. Include validation statistics in output

### Workflow Design
1. Define clear input/output contracts
2. Implement checkpoints between stages
3. Log intermediate results
4. Enable resume from checkpoint
5. Validate biological relevance

### Testing
1. Start with synthetic data
2. Validate with known-good examples
3. Test edge cases
4. Measure performance metrics
5. Document expected results

## Performance Metrics

### Data Bridge Quality
- Mapping coverage: Percentage of successfully mapped entities
- Data integrity: Percentage of preserved information
- Transformation accuracy: Manual validation sample

### Workflow Quality
- Completion rate: Successful runs / total runs
- Result reproducibility: Consistency across runs
- Biological validity: Expert review of findings

## References

Test examples available in:
- `/Testes/teste07/` - Data Analyst to Transcriptomics integration
- `.claude/bridges/` - Reusable data bridge scripts
- `.claude/workflows/` - Workflow definitions

For command reference, see: `CLAUDE.md`
