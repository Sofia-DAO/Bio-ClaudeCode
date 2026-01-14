# Workflow List
List and inspect available multi-agent workflows in Bio-ClaudeCode.

## Description
Displays all saved workflow definitions with metadata, agents involved, and execution history. Enables workflow discovery and selection for Fase B integration testing.

## Usage
```
/workflow-list [--filter <agent>] [--verbose]
```

### Options
- `--filter <agent>`: Show only workflows using specific agent
- `--verbose`: Show detailed workflow specifications
- `--history`: Include execution history
- `--status`: Show workflow validation status

## Output Format

### Standard View
```
[AVAILABLE WORKFLOWS]

1. rnaseq-to-drugs
   Description: RNA-seq analysis to senolytic discovery
   Agents: data-analyst -> transcriptomics -> drug-discovery
   Status: Validated
   Runs: 3 (last: 2026-01-13)

2. biomarker-validation
   Description: Literature to genomics validation
   Agents: literature-analyst -> genomics-analyst
   Status: Validated
   Runs: 1 (last: 2026-01-12)

3. proteomics-pathway-enrichment
   Description: SASP to pathway analysis
   Agents: proteomics -> transcriptomics
   Status: Not tested
   Runs: 0

Total workflows: 3
Use /workflow-run <name> to execute
```

### Verbose View
```
[WORKFLOW: rnaseq-to-drugs]

Description: End-to-end pipeline from RNA-seq to drug candidates
Version: 1.0.0
Created: 2026-01-13
Author: Antonio Franco

AGENTS:
  [1] Data Analyst
      Input: counts_matrix.csv, metadata.csv
      Output: deseq2_results.csv

  [2] Transcriptomics Analyst
      Input: deg_genes.csv, pathway_db.txt
      Output: enriched_pathways.csv

  [3] Drug Discovery Analyst
      Input: target_proteins.csv, compound_lib.sdf
      Output: top_candidates.csv

DATA BRIDGES: 2
CHECKPOINTS: 3
SUCCESS CRITERIA: 4

EXECUTION HISTORY:
  2026-01-13 14:30 - Success (95.8% accuracy)
  2026-01-12 16:45 - Success (92.3% accuracy)
  2026-01-11 09:15 - Failed (checkpoint 2)
```

## Filter Examples
```
# Show workflows using transcriptomics
/workflow-list --filter transcriptomics

# Show detailed info with history
/workflow-list --verbose --history

# Check workflow validation status
/workflow-list --status
```

## Workflow Files
Lists workflows from:
```
.claude/workflows/*.yaml
```

## Example Session
```
User: /workflow-list

Claude: [Displays standard workflow list]
        
        Available workflows: 3
        - rnaseq-to-drugs (3 runs, last success)
        - biomarker-validation (1 run)
        - proteomics-pathway-enrichment (not tested)

User: /workflow-list --verbose rnaseq-to-drugs

Claude: [Shows detailed workflow specification]
```

## Related Commands
- `/workflow-create` - Create new workflow
- `/workflow-run` - Execute workflow
- `/integration-test` - Test agent pairs
