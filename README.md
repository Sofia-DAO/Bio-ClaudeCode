# Bio-ClaudeCode

Specialized Claude Code agents for bioinformatics and aging research workflows.

Forked from [claude-code-templates](https://github.com/davila7/claude-code-templates) by davila7.

## Overview

Bio-ClaudeCode transforms general-purpose AI agents into domain experts specialized in longevity research and bioinformatics. The project focuses on creating intelligent workflow orchestrators that understand the nuances of aging biology, genomics, proteomics, and drug discovery.

**Key Innovation:** Agents are not passive knowledge assistants but active workflow orchestrators capable of generating executable code, making autonomous decisions through decision trees, and coordinating with other agents to execute complete research pipelines.

This repository is not primarily about Model Context Protocol (MCP) integrations. While MCPs serve as valuable tools for connecting to scientific databases, the core mission is agent specialization for production-ready research workflows.

## Current Status

**Version:** 2.0 (Released January 2026)

**Agents:** 6 specialized workflow orchestrators
**Commands:** 37 total (19 analysis + 4 QC + 4 visualization + 8 workflows + 2 general)
**Integration Testing:** Data Analyst to Transcriptomics validated (86.2% coverage)
**Status:** Production-ready for aging and longevity research

## Agent Capabilities (Version 2.0)

All agents have been upgraded from knowledge assistants to workflow orchestrators with:

- **Executable Code Generation:** Produces complete R, Python, and bash scripts
- **Decision Trees:** Automatic method selection based on data characteristics
- **End-to-End Pipelines:** From raw data to biological insights
- **Inter-Agent Coordination:** Seamless data bridges between workflows
- **Automated Quality Control:** Built-in validation and error checking
- **Troubleshooting Guides:** Expert debugging assistance

### Available Agents

**Data Analyst**
- DESeq2 differential expression analysis
- Statistical testing and multiple testing correction
- Data normalization and batch effect removal
- Quality control pipelines
- Meta-analysis workflows

**Literature Analyst**
- PRISMA-compliant systematic reviews
- PubMed search and paper retrieval
- Evidence synthesis and GRADE assessment
- Citation management
- Meta-analysis of published effect sizes

**Genomics Analyst**
- GATK variant calling pipelines
- WGS/WES analysis from FASTQ to VCF
- GWAS association testing
- Variant annotation and filtering
- eQTL analysis

**Proteomics Analyst**
- Mass spectrometry data analysis
- AlphaFold structure prediction
- Molecular docking workflows
- Protein-protein interaction networks
- SASP biomarker identification

**Transcriptomics Analyst**
- Bulk RNA-seq analysis (DESeq2, edgeR)
- Single-cell RNA-seq workflows
- Pathway enrichment analysis
- Gene set enrichment analysis (GSEA)
- Alternative splicing analysis

**Drug Discovery Analyst**
- Virtual screening campaigns
- Molecular docking (AutoDock Vina, Smina)
- ADMET prediction
- Senolytic compound identification
- Lead optimization workflows

## Repository Structure
```
Bio-ClaudeCode/
├── .claude/
│   ├── agents/                    # 6 specialized agents (Version 2.0)
│   │   ├── data-analysis/
│   │   ├── literature/
│   │   ├── genomics/
│   │   ├── proteomics/
│   │   ├── transcriptomics/
│   │   └── drug-discovery/
│   └── commands/                  # 37 research commands
│       ├── analysis/              # 19 analysis commands
│       ├── quality-control/       # 4 QC commands
│       ├── visualization/         # 4 visualization commands
│       └── workflows/             # 8 workflow commands
├── docs/
│   ├── INTEGRATION_TESTING.md    # Multi-agent workflow guide
│   └── CONTRIBUTING.md
├── examples/
│   └── data-bridges/             # Example integration scripts
├── CLAUDE.md                     # Complete command reference
└── README.md
```

## Installation

Clone the repository and install dependencies:
```bash
git clone https://github.com/Sofia-DAO/Bio-ClaudeCode.git
cd Bio-ClaudeCode
npm install
```

## Quick Start

### Single Agent Usage

Invoke agents directly through Claude Code interface:
```
"Use Data Analyst to perform DESeq2 analysis on my RNA-seq counts.
Input: counts.csv (10 samples: 5 young, 5 old)
Generate complete R pipeline with quality control."
```

The agent will:
1. Analyze data characteristics
2. Choose appropriate normalization method
3. Generate executable DESeq2 script
4. Include quality control checks
5. Produce publication-ready visualizations

### Multi-Agent Workflows

Coordinate multiple agents for complex pipelines:
```bash
# Test integration between agents
/integration-test data-analyst transcriptomics-analyst

# Create reusable workflow
/workflow-create rnaseq-to-pathways \
  --agents data-analyst,transcriptomics-analyst \
  --bridge transform_deseq_to_pathway.py

# Execute workflow
/workflow-run rnaseq-to-pathways --input deseq2_results.csv
```

See `docs/INTEGRATION_TESTING.md` for complete workflow documentation.

## Validated Workflows

### Data Analyst → Transcriptomics (Tested 2026-01-13)

**Pipeline:** DESeq2 differential expression to pathway enrichment

**Results:**
- 86.2% gene mapping coverage
- 11 significantly enriched pathways identified
- Biological profile: Pro-longevity molecular signature
- Status: Production-ready

**Key Features:**
- Automatic gene ID transformation
- Hypergeometric enrichment testing
- FDR multiple testing correction
- Separate UP/DOWN pathway analysis

Example output:
- Top pathway: Autophagy (FDR: 1.34e-04, 14/14 genes)
- Senescence downregulated (FDR: 4.80e-04, 8/8 genes)
- Profile consistent with geroprotective interventions

## Command Reference

### Analysis Commands (19)

RNA-seq analysis, variant calling, structure prediction, docking, literature search, and more.

### Quality Control (4)

Data validation, outlier detection, batch effect assessment, reproducibility checks.

### Visualization (4)

Volcano plots, heatmaps, pathway diagrams, network visualizations.

### Workflow Commands (8)

Multi-agent coordination, data bridges, integration testing, pipeline execution.

See `CLAUDE.md` for complete command documentation.

## Integration Testing

Bio-ClaudeCode includes comprehensive integration testing framework:

**Commands:**
- `/integration-test` - Test agent pair compatibility
- `/workflow-create` - Define multi-agent workflows
- `/workflow-run` - Execute saved workflows
- `/workflow-list` - View available workflows
- `/data-bridge` - Manual data transformation

**Patterns:**
- Sequential pipelines (A → B → C)
- Parallel validation (independent analysis + cross-validation)
- Iterative refinement (feedback loops)

See `docs/INTEGRATION_TESTING.md` for details.

## Scientific Domains

### Genomics
DNA sequencing analysis, variant identification, GWAS, eQTL analysis, genetic association studies.

### Proteomics
Structure prediction (AlphaFold/ESMFold), molecular docking, PPI networks, post-translational modifications.

### Transcriptomics
Bulk RNA-seq, single-cell RNA-seq, differential expression, pathway analysis, alternative splicing.

### Drug Discovery
Virtual screening, ADMET prediction, senolytic identification, lead optimization, structure-based design.

### Literature Analysis
PubMed searches, systematic reviews, meta-analysis, evidence synthesis, citation management.

## Development Roadmap

**Phase 1: Foundation (Complete)**
- Repository structure established
- 6 agents Version 2.0 deployed
- 37 commands implemented
- Integration testing framework validated

**Phase 2: Expansion (In Progress)**
- Additional workflow validations
- Extended data bridge library
- Performance optimization
- Advanced coordination patterns

**Phase 3: MCP Integration (Planned)**
- PubMed MCP server
- UniProt MCP server
- KEGG pathway MCP server
- ChEMBL drug database MCP server

**Phase 4: Community (Planned)**
- Research lab partnerships
- Publication of validated workflows
- Community contribution guidelines
- Training materials and tutorials

## Performance Metrics

### Agent Quality
- Code generation accuracy: Production-ready
- Decision tree effectiveness: Autonomous method selection
- Biological validity: Expert-reviewed outputs

### Integration Quality
- Data bridge coverage: 86.2% (Data Analyst → Transcriptomics)
- Workflow completion: 100% success rate (tested workflows)
- Result reproducibility: Consistent across runs

## Contributing

Contributions welcome from bioinformatics and aging research communities.

**Priority Areas:**
- New specialized agents
- Workflow validations
- Data bridge implementations
- Scientific database integrations
- Best practices documentation

**Standards:**
- All code in English (zero exceptions)
- No emojis in code or documentation
- Follow scientific computing best practices
- Include comprehensive testing
- Provide clear documentation

See `CONTRIBUTING.md` for guidelines.

## Scientific Standards

All agents and workflows adhere to computational biology standards:

- **Code Quality:** PEP 8 (Python), tidyverse style (R), standard bash conventions
- **Statistics:** Appropriate methods, effect sizes, confidence intervals, multiple testing correction
- **Reproducibility:** Version control, seed setting, environment documentation
- **Visualization:** Publication-ready figures following scientific standards
- **Documentation:** Method citations, parameter justification, validation metrics

## Testing

External test suite available in `/Testes/` directory (outside repository):

- Individual agent tests (teste01-teste06)
- Integration tests (teste07+)
- Validation reports
- Example datasets

Test coverage:
- Data Analyst: Validated
- Literature Analyst: Validated
- Genomics Analyst: Validated
- Proteomics Analyst: Validated
- Transcriptomics Analyst: Validated
- Drug Discovery Analyst: Validated

## Documentation

- **CLAUDE.md** - Complete command reference
- **INTEGRATION_TESTING.md** - Multi-agent workflow guide
- **examples/data-bridges/** - Integration examples
- **Test reports** - External validation results

## Acknowledgments

Built on claude-code-templates by davila7. Thanks to the Anthropic community for AI agent development tools and the aging research community for domain expertise.

## License

MIT License - see LICENSE file for details.

Maintains compatibility with upstream claude-code-templates license.

## Links

**Repository:** https://github.com/Sofia-DAO/Bio-ClaudeCode

**Upstream:** https://github.com/davila7/claude-code-templates

**Documentation:** See docs/ directory

**Issues:** GitHub Issues for bug reports and feature requests

**Discussions:** GitHub Discussions for community questions

---

Built with focus on scientific rigor, reproducibility, and practical utility for aging and longevity research.

Version 2.0 - January 2026
