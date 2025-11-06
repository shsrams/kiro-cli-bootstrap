# How to Create Implementation Guides: Step-by-Step Process

## Overview

This document explains the systematic process used to create a Step Implementation Guide. Follow this process to create comprehensive, developer-ready implementation guides for any step in an implementation plan.

## The 8-Step Process

### Step 1: Gather All Context Information

**What to Collect:**
- [ ] Original requirements documents
- [ ] Design documents and architecture diagrams
- [ ] Research findings and technology decisions
- [ ] Previous implementation steps and dependencies
- [ ] Business context and user stories

**Information Sources Used:**
- `data/*.csv` - Primary data source
- `planning/design/detailed-design.md` - System architecture
- `planning/idea-honing.md` - Requirements clarification
- `planning/research/` - Technology research

**Key Questions to Answer:**
- What is the business purpose of this component?
- What are the technical dependencies?
- What data structures are involved?
- What are the integration points with other components?

### Step 2: Define Clear Objectives and Scope

**Create a Focused Objective Statement:**
- One sentence describing what will be built
- Clear success criteria
- Estimated duration
- Prerequisites needed

**Example from Step 1:**
```
Objective: Create a working intervention data loader that can parse interventions.md 
and return structured data for all 36 techniques with their effectiveness ratings 
across 10 personality dimensions.

Duration: 1-2 days
Prerequisites: Python 3.9+, basic understanding of data structures and file parsing
```

**Scope Boundaries:**
- What IS included in this step
- What is NOT included (deferred to later steps)
- Dependencies from previous steps
- What this enables for future steps

### Step 3: Provide Essential Context for Developers

**Business Context Section:**
- [ ] What problem does this solve?
- [ ] Who are the end users?
- [ ] How does this fit in the larger system?
- [ ] Key business constraints or requirements

**Technical Context Section:**
- [ ] Architecture overview
- [ ] Data flow and structures
- [ ] Integration points
- [ ] Performance requirements

**Required Reading Section:**
- [ ] List all documents a developer must read
- [ ] Explain what to focus on in each document
- [ ] Provide direct file paths or links
- [ ] Prioritize by importance

### Step 4: Break Down Into Granular Tasks

**Task Structure Template:**
```markdown
### Task X: [Clear Action-Oriented Title]
**Objective**: [One sentence describing the goal]

**What to Implement:**
- [ ] Specific deliverable 1
- [ ] Specific deliverable 2
- [ ] Specific deliverable 3

**Key Requirements:**
- Technical constraint 1
- Technical constraint 2
- Integration requirement

**Acceptance Criteria:**
- [ ] Testable criterion 1
- [ ] Testable criterion 2
- [ ] Testable criterion 3
```

**Task Breakdown Strategy:**
1. **Start with data structures** - What models/schemas are needed?
2. **Core functionality** - What are the main operations?
3. **Configuration** - How is the system configured?
4. **Testing** - How do we validate it works?
5. **Documentation** - How do others use it?
6. **Quality assurance** - Code standards, performance, security

**Task Sizing Guidelines:**
- Each task should take 2-4 hours maximum
- Tasks should have clear, testable outcomes
- Dependencies between tasks should be explicit
- Each task should build toward the overall objective

### Step 5: Include Standards and Best Practices

**Code Quality Standards:**
- [ ] Coding style requirements (formatting, linting)
- [ ] Documentation standards (docstrings, comments)
- [ ] Type safety requirements
- [ ] Error handling patterns
- [ ] Logging and observability requirements

**Development Process Standards:**
- [ ] Test-driven development requirements
- [ ] Tests segregated into /unit and /integration directories
- [ ] Code review criteria
- [ ] Version control practices
- [ ] Dependency management approach
- [ ] Use latest code constructs from libraries (e.g. Use Pydantic V2 classes and functions - ConfigDict, field_validator, model_dump_json instead of older ones such as 'validator') 

**Architecture Standards:**
- [ ] Design patterns to follow
- [ ] Performance requirements
- [ ] Security considerations
- [ ] Scalability considerations

**External Standards Integration:**
Research and include relevant industry standards:
- Constitution/coding standards from your organization
- Industry best practices (like GitHub Spec-Kit Constitution)
- Framework-specific guidelines
- Security and compliance requirements

### Step 6: Define Comprehensive Acceptance Criteria

**Acceptance Criteria Categories:**

1. **Functional Requirements**
   - [ ] Core functionality works as specified
   - [ ] All data processing requirements met
   - [ ] Integration points function correctly

2. **Technical Requirements**
   - [ ] Performance benchmarks met
   - [ ] Code quality standards passed
   - [ ] Security requirements addressed

3. **Documentation Requirements**
   - [ ] All documentation complete
   - [ ] Examples work as written
   - [ ] Operational procedures validated

4. **Quality Requirements**
   - [ ] Test coverage meets standards
   - [ ] Error handling comprehensive
   - [ ] Ready for next development phase

**Acceptance Criteria Best Practices:**
- Make criteria binary (pass/fail, not subjective)
- Include specific numbers where possible
- Reference external standards
- Cover both positive and negative cases
- Include performance and security criteria

### Step 7: Create Handoff and Continuity Plan

**Handoff Checklist:**
- [ ] All deliverables completed
- [ ] Documentation reviewed and approved
- [ ] Integration points validated
- [ ] Ready for next development phase

**Next Steps Preview:**
- What comes after this implementation
- How this work integrates with future phases
- What dependencies this creates for other developers
- What new capabilities this enables

**Knowledge Transfer:**
- Key decisions made during implementation
- Lessons learned and gotchas
- Performance characteristics discovered
- Recommendations for future development

## Quality Checklist for Implementation Guides

### Content Completeness
- [ ] All context information included
- [ ] Clear objectives and scope defined
- [ ] Tasks broken down to 2-4 hour chunks
- [ ] Acceptance criteria are testable
- [ ] Best practices and standards included
- [ ] Handoff plan complete

### Developer Experience
- [ ] Can be followed by someone with no project knowledge
- [ ] All required information is self-contained
- [ ] Examples are concrete and executable
- [ ] Troubleshooting guidance included
- [ ] Clear success criteria defined

### Technical Quality
- [ ] Architecture decisions explained
- [ ] Integration points clearly defined
- [ ] Performance requirements specified
- [ ] Security considerations addressed
- [ ] Error handling requirements clear

### Process Integration
- [ ] Fits with overall development methodology
- [ ] Supports continuous integration/deployment
- [ ] Enables effective code review
- [ ] Facilitates knowledge transfer
- [ ] Supports project tracking and reporting

## Common Pitfalls to Avoid

### Scope Creep
- **Problem**: Tasks become too large or complex
- **Solution**: Keep tasks focused on single objectives
- **Check**: Each task should take 2-4 hours maximum

### Missing Context
- **Problem**: Developers can't understand the bigger picture
- **Solution**: Always include business context and architecture overview
- **Check**: Someone new to the project can follow the guide

### Vague Acceptance Criteria
- **Problem**: Unclear when work is "done"
- **Solution**: Make criteria binary and testable
- **Check**: Each criterion can be verified objectively

### Missing Integration Points
- **Problem**: Work doesn't connect properly with other components
- **Solution**: Explicitly define all dependencies and interfaces
- **Check**: Integration requirements are testable

## Template for Future Implementation Guides

```markdown
# [Step X] Implementation Guide: [Component Name]

## Overview
[Objective, duration, prerequisites]

## Project Context
[Business context, technical context, required reading]

## Data Structure Understanding
[Key data formats, relationships, constraints]

## Implementation Tasks
### Task 1: [Title]
[Objective, requirements, acceptance criteria]

### Task 2: [Title]
[Objective, requirements, acceptance criteria]

[Continue for all tasks...]

## Best Practices to Follow
[Code quality, development process, architecture standards]

## Acceptance Criteria Summary
[Functional, technical, documentation, quality requirements]

## Handoff Checklist
[Final validation steps and next steps preview]
```

## Measuring Success

A good implementation guide should result in:
- **Consistent Output**: Different developers produce similar quality results
- **Reduced Questions**: Minimal clarification needed during implementation
- **Faster Onboarding**: New developers can contribute quickly
- **Quality Deliverables**: Code meets standards without extensive rework
- **Smooth Handoffs**: Work integrates cleanly with other components

Use these metrics to continuously improve your implementation guide process.
