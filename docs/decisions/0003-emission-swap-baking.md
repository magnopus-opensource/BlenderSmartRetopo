# 0003. Bake Principled inputs through a temporary emission swap

- Status: Accepted
- Date: 2026-10-08

## Context

Cycles has no direct bake for base colour, roughness or metallic as stored values. Its `DIFFUSE` colour pass is scaled by `(1 - metallic)`, so metals bake black, and lit passes depend on the scene lighting.

## Decision

For BASE_COLOR, ROUGHNESS and METALLIC, every source material's Principled input (linked or constant) is temporarily routed through an Emission shader into the material output, and an `EMIT` bake runs. The materials are restored in a `finally`. NORMAL, AO and EMISSION use the native bake types.

## Consequences

- The maps hold exact material values, not lighting.
- Only Principled BSDF inputs are read. Other shaders fall back to defaults (0.8 grey, roughness 0.5, metallic 0). Tracked in NODEY-1813.
- Source objects must be hidden during the bake, because they coincide with `_high` and occlude AO. `pipeline.py` does this.
