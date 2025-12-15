# Kiro CLI Bootstrap Setup

A reusable Kiro CLI configuration with development standards, skills, agents, and prompts.

## Why Bootstrap Kiro CLI?

Kiro CLI's strength lies in its lightweight, "no batteries included" approach - unlike heavy IDE-based Agentic development tools, it stays fast and focused. Power users appreciate this flexibility and want to customize it for their specific workflows. This bootstrap system provides ready-made configurations that get you productive immediately while maintaining Kiro's simplicity and speed. You can also use this system to create your own components specific to your standards and workflows and make it a more bespoke setup.

## What's Included

### Core Components
- **MCP Servers** (`mcp.json`) - Includes configurations for commonly used MCP servers like AWS documentation, web scraping, and search tools. All servers are disabled by default - enable them in `mcp.json` by setting `"disabled": false` for the servers you need.

- **Development Standards** (`steering/`) - [Steering files in Kiro](https://kiro.dev/docs/cli/steering/) define behavioral guidelines and development principles that influence how Kiro approaches tasks. These files establish coding standards, testing methodologies, and debugging practices to ensure consistent, high-quality output across all interactions.

- **Skills** (`skills/`) - Skills are reusable knowledge modules that provide step-by-step implementation guidance for specific tasks or technologies. They help Kiro deliver consistent, expert-level assistance by codifying best practices and proven approaches into structured, actionable processes. The system loads only skill summaries initially, then progressively loads detailed content as needed, saving tokens and reducing hallucinations by providing focused, relevant information. For example, when researching a technical topic, Kiro knows it can access instructions from `research/SKILL.md` but only loads the detailed steps when actually performing the research.

- **Agents** (`agents/`) - [Agents in Kiro](https://kiro.dev/docs/cli/custom-agents/) are specialized configurations that can operate independently with specific tool access and behavioral parameters. They contain pre-defined configurations tailored for specific use cases, allowing for focused, domain-specific assistance while maintaining isolation from other tasks and contexts. For example, the `sdlc_agent` is configured with access to the Kiro CLI skills system and automatically lists available skills when spawned, enabling enhanced SDLC capabilities like code review, testing strategies, and deployment workflows. See [agents/README.md](agents/README.md) for detailed documentation.

- **Prompts** (`prompts/`) - Reusable workflow templates that can be invoked with `@prompt-name` syntax. These provide standardized approaches for common development tasks like `@commit` for git commit workflows, `@git-release` for release tagging, and `@liccheck-py` for Python license validation. Prompts encapsulate oft-repeated sets of instructions in the name of a command, saving time on repetitive tasks. See [prompts/README.md](prompts/README.md) for detailed documentation.

## Getting Started

### 1. Install the Bootstrap

```bash
# Clone/copy this directory to your project
# Run the installer to symlink everything to ~/.kiro/
./install.sh
```

The installer creates symlinks so updates here automatically sync to all projects.

### 2. Try Your First Prompt

Start Kiro CLI and use a workflow template:

```bash
kiro-cli chat
> @commit
```

This will help you create a conventional commit with proper prefixes (feat:, fix:, docs:, etc.).

### 3. Enable an MCP Server (Optional)

Edit `mcp.json` and set `"disabled": false` for a server you want to use:

```json
"fetch": {
  "command": "uvx",
  "args": ["mcp-server-fetch"],
  "disabled": false  // Changed from true
}
```

Restart Kiro CLI to load the server.

### 4. Try a Specialized Agent

Launch the SDLC agent for development workflows:
```bash
kiro-cli --agent sdlc_agent
```

The agent automatically shows available skills and provides focused development assistance with access to specialized knowledge modules.

### Next Steps

- **Customize steering files** in `steering/` to match your coding standards
- **Create custom prompts** by adding `.md` files to `prompts/`
- **Configure agents** for your specific workflows in `agents/`
- **Enable MCP servers** you need for enhanced capabilities

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
