# Workflow Create
Create a reusable multi-agent workflow definition for Bio-ClaudeCode integration testing and production pipelines.

## Agents Used
This command helps define workflows that can integrate any combination of:
- **Data Analyst**: RNA-seq, differential expression
- **Literature Analyst**: Systematic reviews, PRISMA
- **Genomics Analyst**: Variant calling, annotation
- **Proteomics Analyst**: Mass spec, SASP detection
- **Transcriptomics Analyst**: Pathway enrichment
- **Drug Discovery Analyst**: Docking, ADMET screening

## Description
Creates structured workflow definitions that specify agent coordination, data flow, validation criteria, and success metrics. Workflows are saved as YAML configurations and can be executed with `/workflow-run`.

## Usage
```
/workflow-create <workflow-name>
```

After invoking, provide:
- Workflow name and description
- Agents involved (in execution order)
- Input requirements for each agent
- Output specifications and data bridges
- Validation checkpoints
- Success criteria

## Workflow Structure

### 1. Metadata Definition
```yaml
workflow:
  name: "aging-biomarker-discovery"
  description: "End-to-end biomarker identification pipeline"
  version: "1.0.0"
  author: "Antonio Franco"
  created: "2026-01-13"
```

### 2. Agent Sequence
Define agents in execution order with inputs/outputs:
```yaml
agents:
  - name: "literature-analyst"
    input: "research_question.txt"
    output: "candidate_biomarkers.csv"
    validation: "min_candidates >= 10"
    
  - name: "genomics-analyst"  
    input: "candidate_biomarkers.csv, vcf_data/"
    output: "validated_variants.csv"
    validation: "longevity_genes > 0"
```

### 3. Data Bridges
Specify how data flows between agents:
```yaml
data_bridges:
  - source: "literature-analyst.candidate_biomarkers.csv"
    target: "genomics-analyst.input/gene_list.txt"
    transform: "extract_gene_symbols"
    
  - source: "genomics-analyst.validated_variants.csv"
    target: "transcriptomics-analyst.input/gene_variants.csv"
    transform: "vcf_to_gene_list"
```

### 4. Validation Checkpoints
Define validation between stages:
```yaml
checkpoints:
  - stage: "after_literature"
    conditions:
      - "candidate_biomarkers exists"
      - "num_candidates >= 10"
      - "references_cited > 0"
    on_fail: "abort"
    
  - stage: "after_genomics"
    conditions:
      - "variants_annotated == true"
      - "longevity_genes > 0"
    on_fail: "retry_with_lower_threshold"
```

### 5. Success Metrics
```yaml
success_criteria:
  - metric: "biomarkers_identified"
    threshold: ">= 5"
    required: true
    
  - metric: "validation_accuracy"
    threshold: ">= 0.80"
    required: true
```

## Output
Saves workflow to:
```
.claude/workflows/<workflow-name>.yaml
```

## Integration with Testing
Created workflows can be:
- Executed with `/workflow-run`
- Tested with `/integration-test`
- Listed with `/workflow-list`
- Used in Fase B validation

## Example Session
```
User: /workflow-create rnaseq-to-drugs
Claude: Creating new workflow. Please provide:
        1. Description
        2. Agents to include
        3. Data flow specification

User: Pipeline from RNA-seq to senolytic candidates.
      Agents: data-analyst, transcriptomics, drug-discovery

Claude: [Creates workflow with proper data bridges and validation]
        Workflow saved to .claude/workflows/rnaseq-to-drugs.yaml
```

## Related Commands
- `/workflow-run` - Execute saved workflow
- `/workflow-list` - View available workflows  
- `/integration-test` - Test agent integration
- `/data-bridge` - Manual data bridging
