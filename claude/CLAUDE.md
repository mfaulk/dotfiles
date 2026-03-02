# CLAUDE.md

## Working Style
- Be precise, concrete, and implementation-focused.
- Prefer complete, runnable changes over high-level advice.
- Use exact file paths, commands, and config keys.
- If something is uncertain, inspect files and verify before claiming.

## Development Workflow Policy (Default)

### Red-Green TDD for Core Requirements
Use Red-Green-Refactor test-driven development by default for core requirements and bug fixes.

For core behavior changes:
1. **Red**: Add or update a test that fails and captures the requirement or bug.
2. **Green**: Implement the smallest code change needed to make the test pass.
3. **Refactor**: Clean up code while keeping tests green.

Guidelines:
- Prefer small, incremental changes.
- Keep tests focused on observable behavior.
- If a change is difficult to test directly, explain the test strategy and add the closest practical automated test.

### CI Early Policy
Create a GitHub Actions CI workflow as soon as it is practical (typically once the project has meaningful build/test/lint steps).

- Add workflows under `.github/workflows/`
- Start with a minimal CI pipeline that runs the most important checks for the stack
- Expand CI coverage over time, but do not defer initial CI setup unnecessarily

Typical early CI checks (as applicable):
- build / typecheck
- tests
- lint
- formatting checks

### Conventional Commits (Required)
Follow the [Conventional Commits v1.0.0](https://www.conventionalcommits.org/en/v1.0.0/) standard for all commit messages.

Format:
```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

Types:
- `feat`: New feature (correlates with MINOR in semver)
- `fix`: Bug fix (correlates with PATCH in semver)
- `refactor`: Code restructuring without behavior change
- `perf`: Performance improvement
- `docs`: Documentation only
- `test`: Test additions or corrections
- `build`: Build system or dependency changes
- `ci`: CI/CD configuration changes
- `chore`: Maintenance tasks
- `style`: Code formatting (whitespace, semicolons, etc.)

Breaking changes:
- Append `!` after type/scope: `feat(api)!: remove deprecated endpoints`
- Or add a `BREAKING CHANGE:` footer

Rules:
- One logical change per commit
- Run tests before committing
- Write the subject in imperative mood ("add", "fix", "remove" — not "added", "fixes", "removed")
- Keep the subject line under 72 characters
- Use the body to explain *why*, not *what* (the diff shows *what*)
- Reference issue numbers when applicable (e.g., `Fixes: #123`)
- Never mention "Claude" or "AI" in commit messages

## README Policy (Default)
README.md files are required and must stay current.

For any change to code, behavior, APIs, CLI commands, config, setup steps, or workflows:
- update the relevant README.md files before finishing

This includes, when applicable:
- root `README.md`
- package/module README.md files
- setup and usage examples
- commands and scripts
- config/env var documentation
- CI workflow usage or badges (if introduced/changed)

## Source File Documentation Policy (Default)
Each source code file should have a file-level doc comment/header comment.

For every new or modified source file:
- add or maintain a file-level doc comment that explains:
  - the file’s purpose
  - the main responsibilities in the file
  - important entry points/types/functions (as applicable)
  - notable assumptions or constraints (if any)

Keep file-level doc comments concise but informative, and ensure they match the current code.

## Documentation Correctness Pass (Required)
Before marking a task complete:
1. Review impacted README files
2. Verify commands, file paths, names, examples, and workflow references match the current code
3. Remove stale or misleading content
4. Add missing usage notes for new features/scripts/config/CI
5. Review new/changed source files for file-level doc comments
6. Confirm tests were added/updated first for core requirements (or explain why not)
7. Confirm CI workflow was added/updated when appropriate (or explain why not yet)
8. Explicitly note anything uncertain

If no README, source-file documentation, test, or CI changes are needed, explicitly say why.

## Repo-wide Documentation Review Behavior
If asked to review READMEs or documentation:
- audit README files for correctness and completeness
- audit source files for file-level doc comments
- compare docs to current code/config/workflows
- update stale setup, examples, commands, paths, CI docs, and file headers
- summarize what changed and any areas needing human review

## Done Checklist
Before finishing:
- [ ] Code changes complete
- [ ] Core requirements/bug fixes followed Red-Green TDD (or explicit reason given)
- [ ] Tests added/updated and run (or explicit reason given)
- [ ] GitHub CI workflow added/updated when appropriate (or explicit reason given)
- [ ] README updates made (or explicit reason given)
- [ ] File-level doc comments added/updated for changed source files (or explicit reason given)
- [ ] Commands/examples/workflows verified
- [ ] Commit messages follow Conventional Commits format
- [ ] Assumptions noted