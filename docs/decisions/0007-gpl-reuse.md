# 0007. GPL-3.0-or-later, Magnopus LLC, REUSE with two-line headers

- Status: Accepted
- Date: 2026-10-09

## Context

Blender add-ons that use `bpy` are generally treated as derivative works of Blender (GPL). The 0.1.0 zip declared GPL in its manifest but shipped no license text.

## Decision

- License: **GPL-3.0-or-later**. Copyright holder: **Magnopus LLC**.
- Follow the REUSE 3.3 spec:
  - Every source file starts with exactly these two lines, with no blank `#` line between them:
    ```
    # SPDX-FileCopyrightText: 2026 Magnopus LLC
    # SPDX-License-Identifier: GPL-3.0-or-later
    ```
  - `REUSE.toml` covers files that can't hold comments (Markdown, JSON).
- The license text is in `LICENSE` (for GitHub), `LICENSES/GPL-3.0-or-later.txt` (for REUSE) and `smart_retopo/LICENSE` (shipped in the zip).
- `make check` and CI run `reuse lint` and check that the three copies are identical.

## Consequences

- Add the header to every new source file. `reuse annotate` inserts a blank `#` line by default, so copy the header by hand or remove that line afterwards.
- Anyone the extension is shared with outside Magnopus gets GPL rights. The zip contains the full source, which covers the source-code requirement.
