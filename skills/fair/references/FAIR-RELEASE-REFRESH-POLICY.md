# FAIR Release Refresh Policy

This policy defines how to keep FAIR, citation, packaging, and archival guidance aligned with current research software engineering practice.

## Refresh Triggers

- major release of this repository or a downstream software project
- changes to packaging, installation, or environment management practice
- changes to citation metadata conventions or archival targets
- major updates to EVERSE RSQKit or related guidance
- discovery of a repeated release failure mode during validation

## Review Cadence

- review before each major release
- review after any change to repository layout, dependency strategy, or archival workflow
- review at least annually for long-lived projects

## Update Checklist

- confirm `codemeta.json` remains the canonical metadata source
- confirm `CITATION.cff` still matches repository identity and version
- confirm packaging and environment notes still reflect the shipped release
- confirm provenance and archival instructions still match the actual workflow
- record any new assumptions, caveats, or external dependencies

## Documentation Rule

If a release introduces a new source of unreproducibility, portability risk, or provenance ambiguity, document it in the crosswalk and SMP update before the release is tagged.
