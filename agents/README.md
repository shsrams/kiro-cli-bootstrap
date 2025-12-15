# Agents Reference

Custom agents for the Kiro CLI bootstrap system. For general agent concepts, see the [official Kiro documentation](https://kiro.dev/docs/cli/custom-agents/).

## Available Agents

| Agent | Purpose | Key Features | When to Use |
|-------|---------|--------------|-------------|
| `sdlc_agent` | Software Development Lifecycle workflows | Curated skills (elaborate-requirements, research, design, write-plan, create-step-guide), auto-lists relevant skills on spawn, file exclusions for clean operations | Requirements analysis, system design, project planning, step-by-step implementation guides |

## Common Configuration Patterns

**Tool Selection**: Agents include specific tools based on their purpose - `sdlc_agent` focuses on development tools (fs_read, fs_write, execute_bash, use_aws) while excluding unnecessary ones for focused workflows.

**Skills Filtering**: Agents can specify curated skill sets using the `--skills` parameter in spawn hooks, showing only relevant skills instead of the entire skills library.

**File Exclusions**: Standard exclusions for `node_modules`, `.git` directories prevent noise during file operations and improve performance.

**Skills Integration**: The `agentSpawn` hook automatically runs `~/.kiro/q-skills list` (with optional filtering) to show available skills, enabling agents to leverage the skills system for enhanced capabilities.

**Custom Prompts**: Each agent includes behavioral instructions that guide how it approaches tasks and interacts with available tools.

## Usage Guide

```bash
# Spawn an agent
kiro-cli --agent sdlc_agent

# List available agents
ls ~/.kiro/agents/

# Switch agents during chat
/agent sdlc_agent
```

## Creating New Agents

Place new agent configuration files (`.json`) in this directory. Follow the existing patterns for tool selection, file exclusions, and prompt design. The configuration will be automatically available after restart.
