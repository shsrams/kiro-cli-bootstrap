Tag the current version as {0} and create a git archive named {1}-{0}.tar.gz. Then show me the commands to push changes and tags to remote.

Steps:
1. Create git tag: `git tag {0}`
2. Create archive: `git archive --format=tar.gz --output={1}-{0}.tar.gz {0}`
3. Show push commands for both commits and tags

Usage: @git-tag-and-archive version project-name
Example: @git-tag-and-archive v1.0.0 my-project
