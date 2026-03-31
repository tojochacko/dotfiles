# Global Claude Code Guide

## Communication
- Be concise. Lead with action/answer, skip preamble.
- No emojis unless asked.
- Reference code as `file:line`.
- Skip restating the user's request.
- Use parallel tool calls where possible.

## Research Before Responding
- Always verify file names, commands, and config by reading the codebase before referencing them.
- Never invent paths, commands, or configuration. When uncertain, use Glob/Grep/Read to confirm.

## Code Changes
- Minimal changes — only what's asked.
- Prefer editing existing files over creating new ones.
- No extra comments, docstrings, error handling, or abstractions unless needed.
- No backwards-compat shims for removed code.

## Code Philosophy
- **KISS**: Choose straightforward solutions over complex ones.
- **YAGNI**: Implement features only when needed, not speculatively.
- **Single Responsibility**: One clear purpose per function, class, and module.
- **Fail Fast**: Validate early, raise exceptions immediately.
- **Dependency Inversion**: Depend on abstractions, not implementations.

## Code Structure
- Files: max 500 lines. Functions: max 50 lines. Classes: max 100 lines.
- Line length: max 100 characters.
- Organize code into modules grouped by feature or responsibility.
- Always use type hints.

## Tooling
- Lint/format: `ruff check` and `ruff format`
- Tests: `pytest`
- Validation: Pydantic v2
- Package management: `uv` (never edit `pyproject.toml` dependencies directly — use `uv add`)
- Documentation lookup: use context7 (`mcp__context7__resolve-library-id` + `mcp__context7__query-docs`) before falling back to web search

## Testing
- Aim for 80%+ coverage on core logic.
- Mock all external services (APIs, databases) in tests — no live calls in CI.
- Use `conftest.py` for shared fixtures.
- Verify all tests pass before committing. Report the test count and pass/fail status.
- When tests fail, fix the root cause — don't just adjust test expectations unless the test was genuinely wrong.

## Security
- Never commit secrets — use environment variables.
- Validate all user input at system boundaries with Pydantic.
- Use parameterized queries for database operations.

## Git
- Never commit unless explicitly asked.
- Never force-push or run destructive git commands without confirmation.
- Commit message format: `<type>(<scope>): <subject>` (feat, fix, docs, style, refactor, test, chore)
- Never include "Claude Code" or "written by Claude" in commit messages.

## Session End
- After every session, write or update `PRIMER.md` in the project root with:
  1. What was done this session
  2. Current state of the project
  3. Recommended next steps

## Feature Planning
- For complex features, use implementation phases.
- Check the `docs/` folder for existing architecture and design decisions before planning.
- Save feature plans as `{feature-name}.md` in a `features/` or `docs/` directory.

## Context Window Hygiene
- Use the Agent tool for any task that produces large output or requires broad exploration: running tests, searching unfamiliar codebases, multi-file research.
- Never run test suites or open-ended searches directly in the main conversation — delegate to a subagent to keep the context clean.

## Docker
- All code runs inside Docker containers. Do NOT use git worktrees.
- File edits must account for volume mounts — if files aren't bind-mounted, changes won't appear in the container.
- Before suggesting Docker-related fixes, check docker-compose.yml for actual volume mounts and service configuration.
- Never hallucinate docker-compose filenames; read the actual files first.
- Prefer `docker compose exec <service>` over `docker compose run --rm` when the stack is already running — reuses the existing container, avoids startup overhead and OOM-killed container accumulation.
- Only fall back to `docker compose run --rm` if the service is not running.

## Reading Large Files
When reading large files , run `wc -l` first to check the line count. If the file is over 2000 lines, use the `offset` and `limit` parameters on the Read tool to read in chunks rather than attempting to read the entire file at once.

## Debugging Approach
- When fixing bugs, prefer the simplest solution first. Do not cycle through multiple complex approaches.
- If a fix doesn't work on the first attempt, stop and re-analyze the root cause before trying another fix.
- Never go back and forth between approaches (e.g., toggling between OAuth client types). If unsure, ask the user.

## Change Scope
- When asked to remove a feature, remove it completely. Don't try to fix or replace it unless asked.
- Prefer minimal, targeted changes. Avoid excessive refactoring beyond what was requested.
- If the user suggests a simpler approach, adopt it immediately rather than defending the complex one.
