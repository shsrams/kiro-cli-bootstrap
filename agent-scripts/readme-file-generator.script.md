# README File Generator

## Overview

This script generates comprehensive README files for code repositories by analyzing the codebase structure, dependencies, and documentation. It creates professional, well-structured README files that include project description, installation instructions, usage examples, API documentation, and contribution guidelines.

## Parameters

- **repo_path** (required): The path to the repository. 
- **project_name** (optional): Override the project name. If not provided, infers from directory name or project configuration files.

## Steps
NOTE: 
### 1. Check Existing README

Check if a README file already exists and ask for user confirmation.

**Constraints:**
- You MUST check if the output file already exists
- You MUST ask for user confirmation before overwriting existing files
- You MUST display a preview of what will be overwritten
- You MUST allow the user to cancel the operation

### 2. Analyze Repository Structure

Examine the repository to understand its structure and technology stack.

**Constraints:**
- You MUST identify the primary programming language and framework
- You MUST detect package managers (npm, pip, maven, gradle, cargo, etc.)
- You MUST identify configuration files and their purposes

### 2. Extract Project Information

Gather essential project details from various sources.

**Constraints:**
- When working with acronyms that need to be expanded into their full form, you MUST search for them on https://w.amazon.com/ for accuracy
- You MUST extract project name, version, and description from project configuration files (package.json, pom.xml, pyproject.toml, etc.). Scan for existing documentation files in https://w.amazon.com/
- You MUST identify dependencies and their purposes
- You MUST detect build scripts and commands
- You MUST identify entry points and main files

### 3. Generate Project Description

Create a compelling project description and overview.

**Constraints:**
- You MUST write a clear, concise project description
- You MUST identify key features and capabilities
- You MUST explain the project's purpose and use cases
- You MUST include technology stack information

### 4. Create Installation Instructions

Generate step-by-step installation and setup instructions.

**Constraints:**
- You MUST include prerequisites and system requirements
- You MUST provide installation commands for the detected package manager
- You MUST include environment setup instructions if applicable
- You MUST add configuration steps if required

### 5. Generate Usage Examples

Create practical usage examples and code snippets.

**Constraints:**
- You MUST provide basic usage examples
- You MUST include code snippets with proper syntax highlighting
- You MUST show common use cases and scenarios
- You MUST include command-line usage if applicable

### 6. Document API and Features

Generate API documentation and feature descriptions.

**Constraints:**
- You MUST document important functions, classes, and modules
- You MUST include parameter descriptions and return values
- You MUST provide examples for each major feature
- You MUST organize documentation logically

### 7. Generate Final README

Compile all sections into a comprehensive README file.

**Constraints:**
- You MUST use proper markdown formatting
- You MUST include a table of contents for long READMEs
- You MUST ensure consistent formatting and style
- You MUST validate all links and references

### 8. Ask for Confirmation

Ask the user if they want to add anything

**Constraints:**
- You MUST inform the user that the README file has been created and provide its path
- You MUST ask the user to if they want to make any changes, since in the next step you'll be raising the CR. User can make changes via the Agent prompts or using the text editor

### 9. Create Code Review

Create a code review with the README changes.

**Constraints:**
- You MUST commit the README file changes to git
- You MUST create a code review with a descriptive title
- You MUST include a summary of what was generated/updated
- You MUST provide the CR URL to the user

## Example Output Structure

```markdown
# Project Name

Brief project description explaining what it does and why it's useful.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [API Documentation](#api-documentation)
- [Development](#development)

## Installation

### Prerequisites

- Node.js 16+ or Python 3.8+
- Package manager (npm, pip, etc.)

### Install

```bash
npm install project-name
# or
pip install project-name
# or
mvn install
```

## Usage

Basic usage example:

```javascript
const project = require('project-name');
project.doSomething();
```

```python
import project_name
project_name.do_something()
```

## API Documentation

### Class: MainClass

#### Methods

- `method1(param)` - Description of method
- `method2(options)` - Description of method

## Development

### Setup

```bash
git clone repo-url
cd project-name
npm install  # or pip install -e . or mvn install
```

### Testing

```bash
npm test  # or pytest or mvn test
```

### Building

```bash
npm run build  # or python setup.py build or mvn compile
```
```

