# 0008. One Makefile for checks; actions pinned to commit SHAs

- Status: Accepted
- Date: 2026-10-11

## Context

People, agents and CI should run the same checks, with the same tool versions. Third-party actions referenced by tag can be moved by their owners.

## Decision

- The `Makefile` is the single entry point: `make check` (no Blender needed), `make test` (Blender or the `bpy` wheel) and `make build`. CI calls `make check` and `make test` rather than repeating the commands.
- Ruff and reuse are pinned in the `Makefile` and run through `pipx`.
- Every GitHub Action is pinned to a full commit SHA with a version comment. Dependabot updates those pins weekly.
- `.github/actions/setup-blender` downloads official Blender builds and checks them against blender.org's SHA-256 file.

## Consequences

- Dependabot doesn't update the ruff and reuse pins in the `Makefile`. Bump them by hand.
- A new check goes into the `Makefile` first, then CI picks it up automatically.
