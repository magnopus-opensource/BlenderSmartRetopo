# 0005. release-please, draft-then-publish, attested releases

- Status: Accepted
- Date: 2026-10-09

## Context

Releases should come from a reviewed decision (one merge), be reproducible from a tag, and be impossible to change after publishing. Immutable releases lock assets as soon as a release is published.

## Decision

- **release-please v5** (`release-please-config.json`, `simple` type) keeps a Release PR with the version bump and `CHANGELOG.md`.
- Merging that PR creates the tag and a **draft** release (`draft` plus `force-tag-creation`, so the tag exists straight away).
- `release.yml` builds and tests on Blender 5.2, writes `SHA256SUMS`, creates a build-provenance attestation, uploads the assets, and only then un-drafts the release.
- No long-lived secrets: only `GITHUB_TOKEN`, scoped per job.

## Consequences

- Never edit the version or `CHANGELOG.md` by hand.
- Release PRs created with `GITHUB_TOKEN` don't trigger CI. A maintainer re-runs the checks, until a GitHub App token is set up (NODEY-1810).
- A bad release can't be replaced. Mark it as a pre-release, warn in its notes, and ship a patch.
- Proposal with the full reasoning: https://claude.ai/code/artifact/d773fa7c-706a-4063-87a4-aa040dd76cdd
