# 0006. SemVer from 0.1.0; the public interface is operator, CLI and result JSON

- Status: Accepted
- Date: 2026-10-09

## Context

Nodey and MCP will call Smart Retopo programmatically, so "breaking change" needs a precise meaning. The interface is also still settling.

## Decision

Semantic versioning, starting at **0.1.0** (`initial-version`). While on 0.x, `bump-minor-pre-major` makes a breaking change bump the minor version. The **public interface** is:

1. Operator `object.smart_retopo`: its property names, types and defaults, and `window_manager["smart_retopo_last_result"]`.
2. `cli.py`: flags, the `SMART_RETOPO_RESULT:` stdout line, `--report`, and the exit code (1 on failure).
3. The result JSON, defined by `docs/result.schema.json` and enforced against `RetopoResult` by `tests/ci/check_result_schema.py`.
4. The minimum Blender version.

## Consequences

- Removing or renaming anything above means a `feat!:` or `fix!:` PR title, or a `BREAKING CHANGE:` footer.
- Adding an optional property, flag or result key is a `feat:`.
- Move to 1.0.0 once Nodey depends on the interface and we commit to keeping it stable.
