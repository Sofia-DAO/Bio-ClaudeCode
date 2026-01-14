# Workflow Run
Execute a saved multi-agent workflow from Bio-ClaudeCode workflow definitions.

## Agents Used
Dynamically loads agents specified in the workflow YAML:
- **Data Analyst**
- **Literature Analyst**
- **Genomics Analyst**
- **Proteomics Analyst**
- **Transcriptomics Analyst**
- **Drug Discovery Analyst**

## Description
Executes complete multi-agent workflows with automatic data bridging, validation checkpoints, error handling, and progress tracking. Implements the coordination logic defined in workflow YAML files.

## Usage
```
/workflow-run <workflow-name> [--input <path>] [--validate-only]
```

### Options
- `--input <path>`: Override default input directory
- `--validate-only`: Dry-run to validate workflow without execution
- `--resume-from <stage>`: Resume failed workflow from specific stage
- `--debug`: Enable verbose logging

## Execution Flow

### Phase 1: Workflow Loading
1. Load workflow YAML from `.claude/workflows/<name>.yaml`
2. Validate workflow structure and agent availability
3. Check input requirements
4. Initialize execution context

### Phase 2: Agent Coordination
For each agent in sequence:
1. **Prepare Input**
   - Load required input files
   - Apply data bridges from previous stages
   - Validate input completeness

2. **Execute Agent**
   - Invoke agent with prepared input
   - Monitor execution progress
   - Capture all outputs

3. **Validate Output**
   - Run validation checkpoint
   - Verify success criteria
   - Log validation results

4. **Data Bridge**
   - Transform outputs for next agent
   - Save intermediate results
   - Update execution state

### Phase 3: Completion
1. Collect all agent outputs
2. Validate final success criteria
3. Generate execution report
4. Archive workflow artifacts

## Validation Checkpoints
At each stage:
```yaml
checkpoint:
  stage: "after_<agent>"
  validations:
    - check: "output_exists"
      files: ["results.csv", "report.txt"]
    - check: "metrics_met"
      criteria: {accuracy: ">= 0.90"}
    - check: "no_errors"
      max_warnings: 5
```

## Error Handling
- **Validation Failure**: Retry with adjusted parameters or abort
- **Agent Error**: Log error, save state, enable resume
- **Data Bridge Failure**: Halt and report incompatible data formats
- **Checkpoint Failure**: Follow workflow `on_fail` directive

## Output Structure
```
.claude/workflow_runs/<workflow-name>_<timestamp>/
├── execution_log.txt
├── agent_outputs/
│   ├── data-analyst/
│   ├── transcriptomics/
│   └── drug-discovery/
├── data_bridges/
│   ├── bridge_1_data_to_transcriptomics.csv
│   └── bridge_2_transcriptomics_to_drugs.csv
├── validation_reports/
│   ├── checkpoint_1.txt
│   └── checkpoint_2.txt
└── workflow_report.md
```

## Progress Tracking
Real-time progress display:
```
[WORKFLOW EXECUTION]
Workflow: rnaseq-to-drugs
Status: Running

[COMPLETE] [1/3] Data Analyst      (100%)
[RUNNING]  [2/3] Transcriptomics   ( 60%)
[PENDING]  [3/3] Drug Discovery    (  0%)

Elapsed: 15m 23s
```

## Example Session
```
User: /workflow-run rnaseq-to-drugs --input ./experiment_data/

Claude: Loading workflow 'rnaseq-to-drugs'...
        [OK] Workflow validated
        [OK] All 3 agents available
        [OK] Input requirements met
        
        Starting execution...
        
        [1/3] Data Analyst
        [RUNNING] DESeq2 analysis...
        [DONE] 58 significant genes identified
        [OK] Checkpoint passed
        
        [2/3] Transcriptomics Analyst  
        [RUNNING] Pathway enrichment analysis...
        [DONE] 11 pathways enriched
        [OK] Checkpoint passed
        
        [3/3] Drug Discovery Analyst
        [RUNNING] Screening compounds...
        [DONE] 8 top candidates identified
        [OK] Final validation passed
        
        Workflow completed successfully!
        Report: .claude/workflow_runs/rnaseq-to-drugs_20260113/workflow_report.md
```

## Resume Failed Workflows
```
/workflow-run rnaseq-to-drugs --resume-from transcriptomics
```

## Related Commands
- `/workflow-create` - Define new workflows
- `/workflow-list` - View available workflows
- `/integration-test` - Test specific integrations
- `/data-bridge` - Manual data bridging
