# Prompts Reference

Reusable workflow templates for the Kiro CLI bootstrap system. Prompts can be invoked using `@prompt-name` syntax to execute standardized development workflows.

## Available Prompts

| Prompt | Purpose | Usage | When to Use |
|--------|---------|-------|-------------|
| `@commit` | Git commit with conventional commit standards | `@commit` | Committing changes with proper conventional commit prefixes (feat, fix, docs, etc.) |
| `@git-release` | Create tagged releases and archives | `@git-release v1.0.0 project-name` | Creating versioned releases with git tags and zip archives |
| `@liccheck-py` | Python license compliance verification | `@liccheck-py` | Checking Python dependencies against approved license lists using liccheck |
| `@liccheck-node` | Node.js license compliance verification | `@liccheck-node` | Checking Node.js dependencies against approved/prohibited license lists |
| `@semgrep` | Static analysis security scanning | `@semgrep` | Running Semgrep security analysis on Python projects |

## Prompt Categories

**Git Workflows**: `@commit`, `@git-release` - Standardized git operations following best practices

**License Compliance**: `@liccheck-py`, `@liccheck-node` - Automated license verification for different package managers

**Security Analysis**: `@semgrep` - Static code analysis and security scanning

## Usage Guide

```bash
# Use a prompt in chat
@commit

# Use parameterized prompts
@git-release v2.1.0 my-project

# Prompts work in any Kiro CLI session
kiro-cli chat
> @liccheck-py
```

## Creating New Prompts

1. Create a new `.md` file in this directory
2. Write the prompt instructions as markdown content
3. Use `{0}`, `{1}`, etc. for parameters in parameterized prompts
4. The filename (without `.md`) becomes the prompt name

## Prompt Design Patterns

**Parameterization**: Use numbered placeholders `{0}`, `{1}` for dynamic values

**Step-by-Step Instructions**: Break complex workflows into numbered steps

**Command Examples**: Include concrete command examples with expected outputs

**Context Awareness**: Prompts should work from any project directory when possible

**Tool Integration**: Leverage specific tools (uv, npm, git) appropriate for the workflow
