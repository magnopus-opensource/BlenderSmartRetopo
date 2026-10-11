# Decision records

Short records of decisions that shape this repo, so later changes start from the reasons rather than rediscovering them. One file per decision, numbered, never renumbered. To change a decision, add a new record that supersedes the old one and mark the old one `Superseded by NNNN`.

| # | Decision | Status |
|---|---|---|
| [0001](0001-automation-first-core.md) | Pipeline lives in a UI-free `core/`, with three thin entry points | Accepted |
| [0002](0002-blender-5-only.md) | Blender 5.0+ only; the manifest is the only metadata source | Accepted |
| [0003](0003-emission-swap-baking.md) | Bake Principled inputs through a temporary emission swap | Accepted |
| [0004](0004-private-repo-releases.md) | Private repo; distribute through GitHub Releases | Accepted |
| [0005](0005-release-please-draft-publish.md) | release-please, draft-then-publish, attested releases | Accepted |
| [0006](0006-versioning-and-interface.md) | SemVer from 0.1.0; the public interface is operator, CLI and result JSON | Accepted |
| [0007](0007-gpl-reuse.md) | GPL-3.0-or-later, Magnopus LLC, REUSE with two-line headers | Accepted |
| [0008](0008-tooling.md) | One Makefile for checks; actions pinned to commit SHAs | Accepted |

Template:

```markdown
# NNNN. Title

- Status: Proposed | Accepted | Superseded by NNNN
- Date: YYYY-MM-DD

## Context
## Decision
## Consequences
```
