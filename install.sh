#!/bin/bash

mkdir -p ~/.aws/amazonq

# Copy mcp.json if it exists
if [ -f "mcp.json" ]; then
    cp mcp.json ~/.aws/amazonq/
    echo "Copied mcp.json to ~/.aws/amazonq/"
fi

# Create symlink for q-skills script
if [ -f "q-skills" ]; then
    ln -sf "$PWD/q-skills" ~/.aws/amazonq/q-skills
    echo "Created symlink: ~/.aws/amazonq/q-skills -> $PWD/q-skills"
fi

for dir in */; do
    if [ -d "$dir" ]; then
        dirname=$(basename "$dir")
        target="$HOME/.aws/amazonq/$dirname"
        
        if [ -e "$target" ]; then
            echo "Target $target already exists."
            read -p "Do you want to remove it and create a symlink? (y/N): " confirm
            if [[ $confirm =~ ^[Yy]$ ]]; then
                rm -rf "$target"
                ln -sf "$PWD/$dirname" "$target"
                echo "Created symlink: $target -> $PWD/$dirname"
            else
                echo "Skipped $dirname"
            fi
        else
            ln -sf "$PWD/$dirname" "$target"
            echo "Created symlink: $target -> $PWD/$dirname"
        fi
    fi
done
