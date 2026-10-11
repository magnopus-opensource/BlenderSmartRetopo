# 0004. Private repo; distribute through GitHub Releases

- Status: Accepted
- Date: 2026-10-09

## Context

Blender can install updates from a remote extension repository (an `index.json`, e.g. on GitHub Pages). But Blender can't sign in, so the repository has to be public. Magnopus wants the code private for now. The org is on GitHub Enterprise Cloud.

## Decision

Keep `magnopus/BlenderSmartRetopo` private. Releases are the distribution channel: org members download the zip, and automation fetches it by tag with a read-only token. The Pages update channel, a beta channel and an extensions.blender.org listing are future work (NODEY-1814).

## Consequences

- There are no in-Blender update notifications. Artists install from disk and can watch the repo for releases.
- Enterprise Cloud makes rulesets and artifact attestations available on the private repo.
- If the repo goes public, revisit this record and the "Future work" section of the release proposal.
