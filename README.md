# Bio-ClaudeCode

Specialized Claude Code agents for bioinformatics and aging research workflows.

Forked from [claude-code-templates](https://github.com/davila7/claude-code-templates) by davila7.

## Overview

Bio-ClaudeCode transforms general-purpose AI agents into domain experts specialized in longevity research and bioinformatics. The project focuses on creating intelligent agents that understand the nuances of aging biology, genomics, proteomics, and drug discovery workflows.

This repository is not primarily about Model Context Protocol (MCP) integrations. While MCPs serve as valuable tools for connecting to scientific databases, the core mission is agent specialization. We adapt existing agents from the upstream claude-code-templates repository and create new agents specifically designed for research workflows in aging and bioinformatics.

## Project Architecture

The repository maintains compatibility with the claude-code-templates ecosystem while extending it for scientific computing. Agents are organized by research domain rather than technical function. Each agent understands the scientific context of its domain, including standard protocols, common pitfalls, and best practices in that field.

Genomics agents handle tasks like variant calling, GWAS analysis, and sequence annotation. Proteomics agents work with structure prediction, molecular docking, and protein-protein interaction networks. Literature agents assist with PubMed searches, paper analysis, and citation management. Drug discovery agents support virtual screening, ADMET prediction, and senolytic identification.

## Repository Structure

The .claude directory contains agents organized by scientific domain. Commands provide quick access to common research tasks. MCP integrations connect to external databases when workflows require them. The examples directory demonstrates complete research pipelines. Documentation covers both usage and contribution guidelines.

## Installation

Clone the repository and install dependencies:

\`\`\`bash
git clone https://github.com/Sofia-DAO/Bio-ClaudeCode.git
cd Bio-ClaudeCode
npm install
\`\`\`

## Usage

Agents can be invoked directly through the Claude Code interface. Each agent includes comprehensive documentation of its capabilities and example workflows. Commands provide shortcuts for frequently used operations.

For genomics workflows, agents assist with quality control, variant annotation, and pathway enrichment. Proteomics agents help with structure prediction using AlphaFold or ESMFold, followed by docking studies and interaction analysis. Literature agents streamline the process of finding relevant papers, extracting key findings, and managing citations.

## Scientific Domains

The project currently covers five major research areas. Genomics focuses on DNA sequencing analysis, variant identification, and genetic association studies. Proteomics addresses protein structure prediction, function annotation, and interaction networks. Transcriptomics handles RNA-seq analysis, differential expression, and pathway analysis. Drug discovery encompasses virtual screening, pharmacokinetic prediction, and lead optimization. Literature analysis provides automated paper retrieval, summary generation, and citation tracking.

## Development Roadmap

Phase 1 establishes the foundation by forking the repository, customizing the structure, and adapting initial agents. Phase 2 expands agent capabilities across all scientific domains and adds comprehensive testing. Phase 3 introduces MCP integrations for major bioinformatics databases. Phase 4 focuses on community engagement, documentation, and real-world validation with research labs.

## Contributing

Contributions are welcome from the bioinformatics and aging research communities. We particularly value contributions that add new specialized agents, improve existing workflows, or integrate additional scientific databases. All contributions should maintain the focus on agent intelligence and domain expertise rather than simple API wrappers.

Please read our contributing guidelines before submitting pull requests. We follow scientific computing best practices including comprehensive testing, clear documentation, and reproducible workflows.

## Scientific Standards

All agents and workflows adhere to established standards in computational biology. Code follows PEP 8 for Python and standard conventions for other languages. Statistical analyses use appropriate methods and report effect sizes with confidence intervals. Visualizations follow best practices for scientific figures. Documentation includes citations for methods and algorithms.

## Acknowledgments

This project builds on claude-code-templates created by davila7. We thank the broader Anthropic community for tools and frameworks that enable sophisticated AI agent development. Special thanks to the aging research and bioinformatics communities for domain expertise and workflow requirements.

## License

MIT License - see LICENSE file for details.

This project maintains compatibility with the upstream claude-code-templates license while adding specialized content for scientific research.

## Links

Repository: https://github.com/Sofia-DAO/Bio-ClaudeCode

Upstream project: https://github.com/davila7/claude-code-templates

Documentation: Coming soon

Community discussions: GitHub Issues and Discussions

---

Built with focus on scientific rigor, reproducibility, and practical utility for aging and longevity research.
