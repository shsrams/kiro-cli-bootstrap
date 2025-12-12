# Kiro CLI Bootstrap Setup

A reusable Kiro CLI configuration with development standards, skills, agents, and prompts.

## Quick Setup

```bash
# Clone/copy this directory to your project
# Run the installer to symlink everything to ~/.kiro/
./install.sh
```

The installer creates symlinks so updates here automatically sync to all projects.

## What's Included

### Core Components
- **MCP Servers** (`mcp.json`) - AWS, search, and web automation tools (disabled by default)
- **Development Standards** (`steering/`) - Code standards, testing approach, debugging practices
- **Skills** (`skills/`) - Reusable implementation guides and processes
- **Agents** (`agents/`) - Specialized agent configurations
- **Prompts** (`prompts/`) - Custom prompts for reusable workflows (use with `@prompt-name`)

### Key Tools
- **q-skills** - Skills management for agents (enables dynamic skill acquisition)
- **Default Agent** - Excludes node_modules, .git, cdk.out from file operations

## Usage Examples

```bash
# Use custom prompts with @ prefix
@commit      # Git commit workflow
@git-release # Git release tagging
@liccheck-py # Python license checking
```

## Development Standards

All code follows TDD approach: **Tests → Models → Services → Endpoints**

Key principles:
- Readability and maintainability first
- No code duplication
- Fix issues immediately when found
- Comprehensive test coverage with real interfaces (no mocked behavior)

## MCP Servers

Available but disabled by default:
- AWS Documentation & CDK guidance
- Bedrock Agent Core
- Web scraping (Playwright)
- Search (Brave)

Enable in `mcp.json` by setting `"disabled": false` for needed servers.

## File Structure

```
├── install.sh              # Setup script
├── mcp.json                # MCP server configurations  
├── q-skills                # Skills management script
├── steering/               # Development standards
├── skills/                 # Implementation guides
├── agents/                 # Agent configurations
└── prompts/                # Workflow templates
```

## Notes

- All directories symlink to `~/.kiro/` for global access
- Changes here automatically apply to all projects
- Skills provide step-by-step implementation guidance
- Agents can run independently with specific tool access
