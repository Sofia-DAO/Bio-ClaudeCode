# Integration Test
Test integration between two or more Bio-ClaudeCode agents to validate data flow and coordination.

## Agents Used
Tests any combination of:
- **Data Analyst**
- **Literature Analyst**
- **Genomics Analyst**
- **Proteomics Analyst**
- **Transcriptomics Analyst**
- **Drug Discovery Analyst**

## Description
Validates that outputs from one agent can be successfully consumed as inputs by another agent. Tests data format compatibility, transformation accuracy, and end-to-end workflow execution without full pipeline overhead.

## Usage
```
/integration-test <agent1> <agent2> [--data <path>]
```

### Arguments
- `<agent1>`: Source agent (produces output)
- `<agent2>`: Target agent (consumes input)
- `--data <path>`: Test data directory (optional, uses synthetic data if not provided)

### Options
- `--generate-data`: Create synthetic test data automatically
- `--validate-only`: Check compatibility without execution
- `--save-bridge`: Save successful data bridge configuration

## Test Phases

### Phase 1: Compatibility Check
1. Verify both agents are available
2. Check output schema of agent1
3. Check input requirements of agent2
4. Identify potential incompatibilities
5. Report compatibility status

### Phase 2: Data Bridge Creation
1. Analyze output format from agent1
2. Determine required transformations
3. Create data bridge specification
4. Validate bridge logic

### Phase 3: Execution Test
1. Run agent1 with test data
2. Capture and validate outputs
3. Apply data bridge transformation
4. Run agent2 with transformed data
5. Validate agent2 outputs

### Phase 4: Validation Report
1. Compare expected vs actual outputs
2. Measure accuracy and completeness
3. Identify any data loss or corruption
4. Generate integration report

## Data Bridge Validation
Tests these transformation types:
- **Format conversion**: CSV to JSON, VCF to gene list, etc.
- **Column mapping**: Rename columns, reorder fields
- **Data filtering**: Extract relevant subset
- **Value transformation**: Unit conversion, normalization
- **Schema validation**: Ensure required fields present

## Test Data Generation
If `--generate-data` specified, creates:
```
test_data/
├── agent1_input/
│   └── [synthetic data matching agent1 requirements]
├── agent1_output/
│   └── [expected output from agent1]
├── agent2_input/
│   └── [transformed data for agent2]
└── agent2_output/
    └── [expected output from agent2]
```

## Output Report
```
[INTEGRATION TEST REPORT]
Test: data-analyst -> transcriptomics-analyst
Date: 2026-01-13 18:45:00
Status: PASSED

PHASE 1: COMPATIBILITY CHECK
[OK] Both agents available
[OK] Output schema validated
[OK] Input requirements met
Compatibility: 100%

PHASE 2: DATA BRIDGE
Bridge type: CSV to CSV (column mapping + filtering)
Transformations:
  - Rename: 'log2FoldChange' -> 'log2fc'
  - Rename: 'padj' -> 'p_adjusted'
  - Filter: padj < 0.05
  - Extract: gene_symbol, log2fc, p_adjusted
Status: [OK] Bridge created

PHASE 3: EXECUTION TEST
[RUNNING] Data Analyst (DESeq2)...
[DONE] 58 significant genes identified
[OK] Output validation passed

[RUNNING] Data bridge transformation...
[DONE] 58 genes transformed
[OK] Bridge validation passed

[RUNNING] Transcriptomics Analyst (pathway enrichment)...
[DONE] 11 pathways enriched
[OK] Output validation passed

PHASE 4: VALIDATION
Data integrity: 100% (no data loss)
Accuracy: 100% (all expected outputs present)
Performance: 2m 34s total execution time

RESULT: INTEGRATION PASSED
Agents can be successfully integrated.
Bridge saved to: .claude/bridges/data-analyst_to_transcriptomics.yaml
```

## Example Sessions

### Test Agent Pair
```
User: /integration-test data-analyst transcriptomics-analyst

Claude: Testing integration: data-analyst -> transcriptomics-analyst
        
        [PHASE 1] Checking compatibility...
        [OK] Both agents available
        [OK] Output/input schemas compatible
        
        [PHASE 2] Creating data bridge...
        [OK] Bridge specification created
        
        [PHASE 3] Running integration test...
        [OK] Data Analyst completed (58 genes)
        [OK] Bridge transformation (58 genes)
        [OK] Transcriptomics completed (11 pathways)
        
        [PHASE 4] Validation...
        [OK] 100% data integrity
        
        RESULT: INTEGRATION PASSED
        Bridge saved for future use.
```

### Validate Only
```
User: /integration-test genomics-analyst proteomics-analyst --validate-only

Claude: Validation mode: genomics-analyst -> proteomics-analyst
        
        [OK] Both agents available
        [WARNING] Schema mismatch detected:
            - genomics outputs: VCF format
            - proteomics expects: protein IDs
            - Required bridge: VCF -> gene symbols -> protein IDs
        
        Compatibility: 70%
        Manual bridge configuration recommended.
```

### Generate Test Data
```
User: /integration-test data-analyst drug-discovery --generate-data

Claude: Generating synthetic test data...
        [OK] Created test_data/data-analyst_input/
        [OK] Created test_data/drug-discovery_input/
        
        Running integration test...
        [Test proceeds with generated data]
```

## Integration Patterns

### Validated Integrations
After Fase B testing, maintains list of validated patterns:
```
.claude/integrations/
├── validated_pairs.yaml
├── data-analyst_to_transcriptomics.yaml
├── transcriptomics_to_drug-discovery.yaml
├── literature_to_genomics.yaml
└── proteomics_to_transcriptomics.yaml
```

## Related Commands
- `/workflow-create` - Create multi-agent workflow
- `/workflow-run` - Execute workflow
- `/data-bridge` - Manual data bridging
- `/workflow-list` - View available workflows
