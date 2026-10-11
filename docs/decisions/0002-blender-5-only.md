# 0002. Blender 5.0+ only; the manifest is the only metadata source

- Status: Accepted
- Date: 2026-10-09

## Context

Blender 4.2 introduced extensions with `blender_manifest.toml`. Supporting older versions as well means keeping a legacy `bl_info` dict, plus test matrices and API workarounds for each version.

## Decision

Support Blender **5.0 and later** (`blender_version_min = "5.0.0"`). Remove `bl_info`, so `blender_manifest.toml` is the only source of the version and metadata. CI tests the newest 5.0.x (the minimum) and 5.2.x (the current LTS).

## Consequences

- Blender 5.x APIs can be used without fallbacks. Some older fallbacks remain, e.g. `_shade_smooth`, and can be removed.
- Raising the minimum version is a breaking change for consumers (see 0006).
- When a new LTS ships, add it to the CI matrix in `.github/workflows/ci.yml`.
