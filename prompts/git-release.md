Tag the current version as {0} and create a git archive named {1}-{0}.zip. Then show me the commands to push changes and tags to remote.

Steps:
1. Create git tag: `git tag {0}`
2. Create archive: `git archive --format=zip --output={1}-{0}.zip {0}`
3. Show push commands for both commits and tags

Usage: @git-release version project-name
Example: @git-release v1.0.0 my-project
