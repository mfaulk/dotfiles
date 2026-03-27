# AGENTS.md

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
- Never mention "Codex" or "AI" in commit messages

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
Prefer sparse, high-signal documentation comments in source files. Do not add or preserve file-level doc comments by default; include them only when they communicate non-obvious information that helps a maintainer understand the file's purpose, key constraints, important invariants, security or protocol requirements, or notable design rationale. Keep any file-level doc comment brief and technically specific, and avoid inventory-style summaries of functions, types, or responsibilities that are already clear from the code. When editing existing comments, treat them as candidates for deletion or aggressive shortening if they mostly restate names, signatures, types, or obvious behavior.

Exception for tests: include a single concise sentence comment for each unit test stating exactly what behavior or assertion the test covers.

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

## Playwright-Friendly HTML and UI Contract

When creating or editing frontend code, produce markup that is easy to test with Playwright.

### Default rules
- Prefer semantic HTML over generic `div`/`span` containers.
- Use the correct native element for the job:
  - `button` for actions
  - `a` for navigation
  - `input`, `select`, `textarea` for form entry
  - `form`, `label`, `fieldset`, `legend`, `table`, `dialog`, `nav`, `main`, `header`, `footer` where appropriate
- Ensure every interactive element has a stable accessible name from visible text, `label`, `aria-label`, or `aria-labelledby`.
- Associate every form control with a real label.
- Expose important UI state through standard HTML/ARIA semantics where appropriate, such as:
  - disabled/enabled
  - checked/unchecked
  - selected
  - expanded/collapsed
  - dialogs
  - status/error/success messages
- Avoid requiring tests to rely on CSS classes, DOM depth, fragile text structure, or autogenerated IDs.

### Test hook policy
- Prefer Playwright-friendly locators based on role, label, and visible name.
- Add `data-testid` only when role/name-based selection would be ambiguous, unstable, or impractical.
- Good candidates for `data-testid` include:
  - toast containers
  - loading regions
  - skeleton states
  - empty states
  - error banners
  - dynamic list rows
  - drag handles
  - chart wrappers
  - virtualized list containers
- Do not add unnecessary `data-testid` attributes to every element.

### Repeated and dynamic content
- For repeated items, provide a stable way to identify each item.
- Prefer a combination of:
  - a stable visible label, and/or
  - a stable machine-readable attribute such as `data-item-id`
- When useful, add a row/container test id such as `data-testid="user-row"`.

### Async and stateful UI
- Make loading, success, empty, and error states explicit in the DOM.
- Use clear status regions where appropriate, such as `role="status"` or `aria-live`.
- Ensure dialogs, popovers, menus, and tabs use correct semantics so Playwright can target them reliably.

### Output expectations
When generating HTML/JSX:
- produce accessible, semantic markup first
- preserve stable user-facing names for important controls
- include targeted `data-testid` hooks only where they materially improve e2e reliability
- do not use brittle markup patterns that force tests to depend on implementation details

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
