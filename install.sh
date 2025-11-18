#!/bin/bash

mkdir -p ~/.kiro/settings

create_symlink() {
    local src="$1"
    local dest="$2"
    local name=$(basename "$dest")
    
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        read -p "$dest exists. Replace with symlink? (y/N): " confirm
        if [[ $confirm =~ ^[Yy]$ ]]; then
            rm -rf "$dest"
            ln -sf "$src" "$dest"
            echo "Created symlink: $dest -> $src"
        else
            echo "Skipped $name"
        fi
    else
        ln -sf "$src" "$dest"
        echo "Created symlink: $dest -> $src"
    fi
}

# Symlink mcp.json to settings
[ -f "mcp.json" ] && create_symlink "$PWD/mcp.json" ~/.kiro/settings/mcp.json

# Symlink directories
[ -d "agents" ] && create_symlink "$PWD/agents" ~/.kiro/agents
[ -d "prompts" ] && create_symlink "$PWD/prompts" ~/.kiro/prompts
[ -d "agent-scripts" ] && create_symlink "$PWD/agent-scripts" ~/.kiro/agent-scripts
[ -d "skills" ] && create_symlink "$PWD/skills" ~/.kiro/skills

# Symlink q-skills script
[ -f "q-skills" ] && create_symlink "$PWD/q-skills" ~/.kiro/q-skills

echo ""
echo "Installation complete!"
echo "All directories symlinked to ~/.kiro/ - new files will be automatically available"
