# Smart Local Changes Review

Please review my local changes with intelligent context awareness.

**Review Scope**: $ARGUMENTS (default: all local changes)

## Automated Analysis Steps

1. **Change Detection**: Determine what type of changes we're reviewing:
   - If no arguments: review all uncommitted changes
   - If "staged": review only staged changes (`git diff --cached`)
   - If "commit:<hash>": review specific commit
   - If file path: review specific file changes
   - If "last": review last commit (`git show HEAD`)

2. **Context Gathering**: 
   - Show git status
   - Display relevant diffs
   - Identify file types and technologies involved

3. **Intelligent Review**: Based on file types and changes:
   - **Frontend files**: Focus on UI/UX, accessibility, performance
   - **Backend files**: Focus on logic, security, data handling
   - **Database files**: Focus on migrations, indexes, data integrity  
   - **Config files**: Focus on security, environment consistency
   - **Tests**: Focus on coverage, test quality, edge cases
   - **Documentation**: Focus on accuracy, completeness, clarity

4. **Contextual Recommendations**:
   - Suggest related files that might need updates
   - Identify potential breaking changes
   - Recommend additional testing scenarios
   - Flag integration points that need attention

## Review Output Structure
- **Executive Summary**: High-level overview
- **Change Analysis**: Detailed file-by-file review
- **Risk Assessment**: Potential issues and their severity
- **Action Items**: Specific tasks before committing/merging
- **Quality Score**: Overall assessment (1-10 scale)

Start by analyzing what changes exist and then provide your comprehensive review.

