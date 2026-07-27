# FAIR + SMP Companion References

This directory contains companion references for generating release-readiness outputs with explicit Software Management Plan (SMP) support.

## Files

- `../assets/codemeta.json`:
  Starter CodeMeta JSON-LD artifact. Treat this as the canonical machine-readable software metadata source and keep citation outputs synchronized from it.

- `FAIR-RELEASE-REFRESH-POLICY.md`:
  Defines a practical refresh cadence and review checklist to keep FAIR release guidance aligned with evolving research software engineering practice and EVERSE RSQKit recommendations.

- `FAIR-RSE-CROSSWALK.md`:
  Maps FAIR and research software engineering release-readiness deliverables to SMP lifecycle sections so teams can produce coherent, non-duplicative plans.

## Why this exists

External guidance changes over time. These reference documents provide local, versioned guidance for contributors while preserving a clear process for periodic updates against authoritative sources.

## Maintenance expectation

Treat these references as a living resource:

- review after major EVERSE RSQKit updates
- review after major changes to packaging, citation, archival, or provenance practice
- record changes in pull requests with date and rationale
