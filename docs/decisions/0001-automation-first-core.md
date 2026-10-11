# 0001. Pipeline lives in a UI-free `core/`, with three thin entry points

- Status: Accepted
- Date: 2026-10-08

## Context

The tool has to work interactively in Blender, but its real consumers are automation: headless Blender, then a Nodey node and an MCP tool.

## Decision

All the pipeline logic is in `smart_retopo/core/`, one module per step, driven by `core.smart_retopo(objects, RetopoSettings, progress)`. Three thin entry points call it: the operator and panel (`operators.py`, `ui.py`), Python through `bpy.ops.object.smart_retopo`, and the headless `cli.py`. Each returns the same `RetopoResult`.

## Consequences

- New behaviour goes into `core/` and `RetopoSettings`. The entry points only map inputs and outputs.
- Code in `core/` must work headless, with no window. Use `temp_override` and object mode, never UI-only context.
- A new setting needs adding in `RetopoSettings` and in the `props.py` mixin, and in `cli.py` too if it should be a flag.
