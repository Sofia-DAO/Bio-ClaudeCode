#!/bin/bash
# Bio-ClaudeCode Structure Setup Script
# Reorganizes repository for bioinformatics and aging research

set -e

echo "Setting up Bio-ClaudeCode directory structure..."

# Create agent directories by scientific domain
echo "Creating agent directories..."
mkdir -p .claude/agents/genomics
mkdir -p .claude/agents/proteomics
mkdir -p .claude/agents/transcriptomics
mkdir -p .claude/agents/drug-discovery
mkdir -p .claude/agents/literature
mkdir -p .claude/agents/data-analysis
mkdir -p .claude/agents/core

# Create command directories by analysis type
echo "Creating command directories..."
mkdir -p .claude/commands/analysis
mkdir -p .claude/commands/visualization
mkdir -p .claude/commands/workflows
mkdir -p .claude/commands/quality-control

# Create MCP directory structure (for future integrations)
echo "Creating MCP directories..."
mkdir -p .claude/mcps/databases

# Create examples directory
echo "Creating examples directory..."
mkdir -p examples/genomics
mkdir -p examples/proteomics
mkdir -p examples/drug-discovery
mkdir -p examples/workflows

# Create tests directory
echo "Creating tests directory..."
mkdir -p tests/agents
mkdir -p tests/commands
mkdir -p tests/integration

# Create documentation structure
echo "Creating documentation structure..."
mkdir -p docs/agents
mkdir -p docs/workflows
mkdir -p docs/contributing

# Move existing agents to core (preserve originals)
echo "Moving existing agents to core directory..."
if [ -f .claude/agents/agent-expert.md ]; then
    mv .claude/agents/*.md .claude/agents/core/ 2>/dev/null || true
fi

# Move existing commands to appropriate directories
echo "Organizing existing commands..."
if [ -f .claude/commands/test.md ]; then
    mv .claude/commands/test.md .claude/commands/quality-control/ 2>/dev/null || true
fi
if [ -f .claude/commands/lint.md ]; then
    mv .claude/commands/lint.md .claude/commands/quality-control/ 2>/dev/null || true
fi

# Create initial documentation files
echo "Creating initial documentation..."

cat > docs/README.md << 'DOCEOF'
# Bio-ClaudeCode Documentation

This directory contains comprehensive documentation for Bio-ClaudeCode agents, commands, and workflows.

## Contents

- agents/ - Agent-specific documentation
- workflows/ - Complete research workflow guides
- contributing/ - Contribution guidelines and standards

## Getting Started

See the main README.md in the repository root for installation and quick start instructions.
DOCEOF

cat > docs/agents/README.md << 'AGENTDOC'
# Agent Documentation

Documentation for all specialized bioinformatics agents in Bio-ClaudeCode.

## Agent Categories

### Genomics Agents
Specialized in DNA sequencing analysis, variant calling, GWAS, and genetic association studies.

### Proteomics Agents
Focused on protein structure prediction, docking, and interaction network analysis.

### Transcriptomics Agents
Handle RNA-seq analysis, differential expression, and pathway enrichment.

### Drug Discovery Agents
Support virtual screening, ADMET prediction, and senolytic compound identification.

### Literature Agents
Assist with PubMed searches, paper analysis, and citation management.

### Data Analysis Agents
Provide statistical analysis, visualization, and quality control capabilities.
AGENTDOC

cat > docs/workflows/README.md << 'WORKFLOWDOC'
# Research Workflows

Complete end-to-end workflows for common bioinformatics and aging research tasks.

## Available Workflows

Workflows will be documented here as they are developed, including:

- GWAS analysis pipeline
- Protein structure prediction and docking
- RNA-seq differential expression
- Virtual drug screening
- Literature review automation

Each workflow includes step-by-step instructions, example data, and expected outputs.
WORKFLOWDOC

cat > docs/contributing/README.md << 'CONTRIBDOC'
# Contributing to Bio-ClaudeCode

We welcome contributions that enhance agent capabilities and add new research workflows.

## Contribution Guidelines

### Adding New Agents

Agents should focus on domain expertise rather than simple API wrappers. Include comprehensive documentation of capabilities, example workflows, and scientific context.

### Code Standards

- Python code follows PEP 8
- All code includes type hints
- Statistical analyses report effect sizes with confidence intervals
- Visualizations follow scientific figure best practices
- All methods cite relevant papers

### Testing Requirements

- Unit tests for all functions
- Integration tests for complete workflows
- Example data included for validation
- Performance benchmarks where appropriate

### Documentation

- Clear usage examples
- Scientific background and context
- Citations for methods and algorithms
- Known limitations and edge cases
CONTRIBDOC

# Create .gitkeep files in empty directories
echo "Creating .gitkeep files..."
find .claude -type d -empty -exec touch {}/.gitkeep \;
find examples -type d -empty -exec touch {}/.gitkeep \;
find tests -type d -empty -exec touch {}/.gitkeep \;

echo "Directory structure setup complete!"
echo ""
echo "Structure created:"
echo "  .claude/agents/      - Organized by scientific domain"
echo "  .claude/commands/    - Organized by analysis type"
echo "  .claude/mcps/        - Database integrations"
echo "  examples/            - Research workflow examples"
echo "  tests/               - Quality assurance"
echo "  docs/                - Comprehensive documentation"
echo ""
echo "Original agents moved to: .claude/agents/core/"
