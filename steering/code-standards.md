# Code Standards

## Writing Code

- Develop in the following order: Tests > Models > Services > Endpoints
- Accord highest priority to readability and maintainability
- Avoid duplicating code
- Ask before adding any backward compatibility
- Do not rewrite or remove anything without explicit approval
- Fix things immediately when you find them

## Naming Conventions

- Name to tell what code does, not how it's implemented nor its history
- Do not use temporal/historical context (e.g. 'NewAPI', 'ImprovedHandler', 'EnhancedService' etc.)
- Do not use implementation details in names (e.g. 'MCPWrapper', 'JSONParser' etc.)

## Code Comments

- Always add comments around any piece of code you write
- Focus on telling what it is, than how it evolved
- Do not touch comments unless you can prove it is false - they are important documentation
- Remove old comments when refactoring
