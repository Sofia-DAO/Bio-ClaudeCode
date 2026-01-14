# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## Project Overview

Node.js CLI tool for managing Claude Code components (agents, commands, MCPs, hooks, settings) with a static website for browsing and installing components. The project includes Vercel API endpoints for download tracking and Discord integration.

## Essential Commands

```bash
# Development
npm install                    # Install dependencies
npm test                       # Run tests
npm version patch|minor|major  # Bump version
npm publish                    # Publish to npm

# Component catalog
python scripts/generate_components_json.py  # Update docs/components.json

# API testing
cd api && npm test             # Test API endpoints before deploy
vercel --prod                  # Deploy to production
```

## Security Guidelines

### ⛔ CRITICAL: NEVER Hardcode Secrets

**NEVER write API keys, tokens, or passwords in code.**

```javascript
// ❌ WRONG
const API_KEY = "AIzaSy...";

// ✅ CORRECT
const API_KEY = process.env.GOOGLE_API_KEY;
```

**When creating scripts with API keys:**
1. Use `process.env` (Node.js) or `os.environ.get()` (Python)
2. Load from `.env` file using `dotenv`
3. Add variable to `.env.example` with placeholder
4. Verify `.env` is in `.gitignore`

**If you accidentally commit a secret:**
1. Revoke the key IMMEDIATELY
2. Generate new key
3. Update `.env`
4. Old key is compromised forever (git history)

## Component System

### Component Types

**Agents** (600+) - AI specialists for development tasks
**Commands** (200+) - Custom slash commands for workflows
**MCPs** (55+) - External service integrations
**Settings** (60+) - Claude Code configuration files
**Hooks** (39+) - Automation triggers
**Templates** (14+) - Complete project configurations

### Installation Patterns

```bash
# Single component
npx claude-code-templates@latest --agent frontend-developer
npx claude-code-templates@latest --command setup-testing
npx claude-code-templates@latest --hook automation/simple-notifications

# Batch installation
npx claude-code-templates@latest --agent security-auditor --command security-audit --setting read-only-mode

# Interactive mode
npx claude-code-templates@latest
```

### Component Development

#### Adding New Components

1. Create component file in `cli-tool/components/{type}/{category}/{name}.md`
2. Use descriptive hyphenated names
3. Include clear descriptions and usage examples
4. Run `python scripts/generate_components_json.py` to update catalog
5. Test installation: `npx claude-code-templates@latest --{type} {name}`

#### Statuslines with Python Scripts

Statuslines can reference Python scripts that are auto-downloaded to `.claude/scripts/`:

```javascript
// In src/index.js:installIndividualSetting()
if (settingName.includes('statusline/')) {
  const pythonFileName = settingName.split('/')[1] + '.py';
  const pythonUrl = githubUrl.replace('.json', '.py');
  additionalFiles['.claude/scripts/' + pythonFileName] = {
    content: pythonContent,
    executable: true
  };
}
```

### Publishing Workflow

```bash
# 1. Update component catalog
python scripts/generate_components_json.py

# 2. Run tests
npm test

# 3. Bump version
npm version patch  # 1.20.2 -> 1.20.3

# 4. Publish
npm publish

# 5. Deploy website
vercel --prod
```

## API Architecture

### Critical Endpoints

The `/api` directory contains Vercel Serverless Functions:

**`/api/track-download-supabase`** (CRITICAL)
- Tracks component downloads for analytics
- Used by CLI on every installation
- Database: Supabase (component_downloads table)

**`/api/discord/interactions`**
- Discord bot slash commands
- Features: /search, /info, /install, /popular

**`/api/claude-code-check`**
- Monitors Claude Code releases
- Vercel Cron: every 4 hours
- Database: Neon (claude_code_versions table)

### Deployment Workflow

**ALWAYS test before deploying:**

```bash
# 1. Run API tests
cd api
npm test

# 2. If tests pass, deploy
cd ..
vercel --prod

# 3. Monitor logs
vercel logs aitmpl.com --follow
```

### Environment Variables (Vercel)

```bash
# Supabase
SUPABASE_URL=https://xxx.supabase.co
SUPABASE_SERVICE_ROLE_KEY=xxx

# Neon Database
NEON_DATABASE_URL=postgresql://user:pass@host/db?sslmode=require

# Discord
DISCORD_APP_ID=xxx
DISCORD_BOT_TOKEN=xxx
DISCORD_PUBLIC_KEY=xxx
DISCORD_WEBHOOK_URL_CHANGELOG=https://discord.com/api/webhooks/xxx
```

### Emergency Rollback

```bash
vercel ls                              # List deployments
vercel promote <previous-deployment>   # Rollback
```

## Website Architecture (docs/)

Static website at https://aitmpl.com for browsing components.

### Key Files

- `docs/components.json` - Component catalog (generated, ~2MB)
- `docs/index.html` - Main component browser
- `docs/blog/` - Blog articles
- `docs/js/` - Vanilla JavaScript (data-loader, search, cart)

### Data Flow

1. `scripts/generate_components_json.py` scans `cli-tool/components/`
2. Generates `docs/components.json` with embedded content
3. Website loads JSON and renders component cards
4. Download tracking via `/api/track-download-supabase`

### Blog Article Creation

Use the CLI skill to create blog articles:

```bash
/create-blog-article @cli-tool/components/{type}/{category}/{name}.json
```

This automatically:
1. Generates AI cover image
2. Creates HTML with SEO optimization
3. Updates `docs/blog/blog-articles.json`

## Code Standards

### Path Handling
- Use relative paths: `.claude/scripts/`, `.claude/hooks/`
- Never hardcode absolute paths or home directories
- Use `path.join()` for cross-platform compatibility

### Naming Conventions
- Files: `kebab-case.js`, `PascalCase.js` (for classes)
- Functions/Variables: `camelCase`
- Constants: `UPPER_SNAKE_CASE`
- Components: `hyphenated-names`

### Error Handling
- Use try/catch for async operations
- Provide helpful error messages
- Log errors with context
- Implement fallback mechanisms

## Testing

```bash
npm test                 # Run all tests
npm run test:watch      # Watch mode
npm run test:coverage   # Coverage report
cd api && npm test      # Test API endpoints
```

Aim for 70%+ test coverage. Test critical paths and error handling.

## Common Issues

**API endpoint returns 404 after deploy**
- Serverless functions must be in `/api/` directory
- Use format: `/api/function-name.js` or `/api/folder/index.js`

**Download tracking not working**
- Check Vercel logs: `vercel logs aitmpl.com --follow`
- Verify environment variables in Vercel dashboard
- Test endpoint manually with curl

**Components not updating on website**
- Run `python scripts/generate_components_json.py`
- Clear browser cache
- Check `docs/components.json` file size

## Important Notes

- **Component catalog**: Always regenerate after adding/modifying components
- **API tests**: Required before production deploy (breaks download tracking)
- **Secrets**: Never commit API keys (use environment variables)
- **Paths**: Use relative paths for all project files
- **Backwards compatibility**: Don't break existing component installations

---

## Integration Commands (Fase B - Added 2026-01-13)

Bio-ClaudeCode now includes 5 specialized commands for multi-agent workflow orchestration and integration testing:

### Workflow Management
1. **`/workflow-create <name>`** - Define reusable multi-agent workflows
   - Specify agent sequence, data bridges, validation checkpoints
   - Save as YAML for repeated execution
   - Enable production-ready pipeline automation

2. **`/workflow-run <name> [options]`** - Execute saved workflows
   - Automatic data bridging between agents
   - Real-time progress tracking
   - Checkpoint validation and error handling
   - Resume failed workflows from any stage

3. **`/workflow-list [--filter <agent>]`** - List available workflows
   - View all saved workflow definitions
   - Filter by agent, show execution history
   - Validate workflow status

### Integration Testing
4. **`/integration-test <agent1> <agent2> [options]`** - Test agent integration
   - Validate data format compatibility
   - Test data bridge transformations
   - Generate integration reports
   - Save successful bridge configurations

5. **`/data-bridge <source> <target> --transform <spec>`** - Manual data bridging
   - Create custom data transformations
   - Format conversion, column mapping, filtering
   - Build reusable bridge library
   - Validate transformations before execution

### Use Cases
- **Fase B Testing**: Validate multi-agent coordination
- **Production Pipelines**: Deploy end-to-end research workflows
- **Data Integration**: Bridge between different analysis stages
- **Quality Assurance**: Test agent compatibility before deployment

Total Commands: **37** (19 analysis + 4 QC + 4 visualization + 8 workflows + 2 general)

---

## Integration Testing (Added 2026-01-13)

Bio-ClaudeCode agents can be coordinated into complete research pipelines through data bridges and workflow orchestration.

### Integration Commands

Five specialized commands enable multi-agent workflow testing:

1. **`/workflow-create <name>`** - Define reusable multi-agent workflows
2. **`/workflow-run <name> [options]`** - Execute saved workflows  
3. **`/workflow-list [--filter <agent>]`** - List available workflows
4. **`/integration-test <agent1> <agent2>`** - Test agent pair integration
5. **`/data-bridge <source> <target>`** - Manual data transformation

### Validated Integrations

**Data Analyst → Transcriptomics Analyst** (Validated 2026-01-13)
- Workflow: DESeq2 differential expression to pathway enrichment
- Data bridge: Gene ID mapping to standard symbols
- Results: 86.2% coverage, 11 significant pathways identified
- Status: Production ready

### Quick Start

Test an integration:
```bash
/integration-test data-analyst transcriptomics-analyst --data test_data/
```

Create a workflow:
```bash
/workflow-create rnaseq-pipeline \
  --agents data-analyst,transcriptomics-analyst \
  --bridge transform_deseq_to_pathway.py
```

Run workflow:
```bash
/workflow-run rnaseq-pipeline --input deseq2_results.csv
```

### Documentation

- **Integration Guide:** `docs/INTEGRATION_TESTING.md`
- **Example Bridges:** `examples/data-bridges/`
- **Test Cases:** `/Testes/teste07/` (external to repository)

### Data Bridge Example

See `examples/data-bridges/deseq2_to_pathway.py` for complete implementation of DESeq2 to pathway enrichment transformation.

Key features:
- Input validation
- Gene ID mapping
- Coverage statistics
- Quality metrics

### Integration Patterns

**Pattern 1: Sequential Pipeline**
- Agent A output becomes Agent B input
- Example: RNA-seq to Pathway to Drug Discovery

**Pattern 2: Parallel Validation**  
- Multiple agents analyze same data independently
- Example: Literature validates Genomics findings

**Pattern 3: Iterative Refinement**
- Agent output fed back for refinement cycles
- Example: Drug design with ADMET feedback

### Testing Strategy

1. Unit test data bridges with `--validate-only`
2. Integration test with synthetic data using `--generate-data`
3. Production test with real data

### Performance Metrics

- **Mapping coverage:** Percentage of successfully mapped entities
- **Data integrity:** Percentage of preserved information  
- **Workflow completion:** Successful runs / total runs
- **Biological validity:** Expert review of findings

