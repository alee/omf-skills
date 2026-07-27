---
name: fair
description: |
  Use this skill when you need research software engineering support for
  computational models or other research software: reproducibility,
  provenance, FAIR metadata, dependency and environment management,
  packaging, portability, citation, release readiness, archival guidance,
  and repository organization.

  Triggers: "prepare for publication", "make my code citable",
  "create FAIR metadata", "package my repository", "prepare a release",
  "archive my software", "write codemeta", "generate CITATION.cff",
  "make this reproducible".

  Expected output: codemeta.json as canonical metadata, CITATION.cff derived
  from codemeta.json, release-readiness guidance, packaging and environment
  notes, provenance guidance, archival guidance, and a concise checklist for
  reuse and maintenance.
license: MIT
compatibility: Works with any research software or computational modeling project
metadata:
  domain: computational-modeling
  maturity: beta
  audience: modelers, researchers who code, research software engineers
  category: publication
---

# FAIR Research Software Readiness Skill

This skill applies FAIR principles, FAIR4RS recommendations, and modern
research software engineering best practices to improve reproducibility,
portability, provenance, software quality, and long-term reuse.

OMFA owns scientific knowledge and methodological reasoning.
FAIR owns research software engineering, reproducibility, provenance,
portability, release readiness, and archival guidance.
Document consumes artifacts from both.

## What This Skill Owns

Use this skill for:

- reproducibility and provenance capture
- dependency and environment management
- packaging and portability
- software citation and metadata
- release preparation and archival readiness
- repository organization and maintainability
- software sustainability and long-term reuse

Do not use this skill for:

- scientific reasoning, conceptual modeling, or methodological choices; use `omfa`
- narrative model documentation; use `document`
- methodological peer-review assessment; use `peer-review`
- HPC job design or performance tuning; use `hpc`
- distributed execution workflow design; use `ospool`

## Inputs

This skill works best with:

- repository URL or local repository path
- software title, version, and license
- primary language and packaging format
- dependency list, runtime, and environment details
- authors, ORCIDs, affiliations, and contributor roles
- release target, archive target, or citation target
- data and model dependencies with identifiers when available
- known provenance sources, build steps, and execution assumptions

If OMFA has already classified the model or provided methodological context,
reuse that information instead of re-deriving it.

## Workflow

### 1. Determine the software task

Classify the request as one or more of:

- planning a release or archival package
- refreshing metadata or citation files
- improving reproducibility or provenance
- organizing the repository for reuse
- checking packaging, portability, or environment capture

If the request is really about scientific reasoning, model structure, or
method choice, route to `omfa` instead.

### 2. Inventory the implemented software facts

Extract only what is observed from the repository or supplied materials:

- package name, repository, version, and license
- source layout and entry points
- build, test, and release commands
- dependencies, container/runtime assumptions, and external services
- metadata already present in `codemeta.json`, `CITATION.cff`, README, or release notes
- provenance signals such as generated files, data sources, and workflow traces

Separate observed facts from inferred assumptions. Mark missing information as
`Unknown` rather than guessing.

### 3. Choose the canonical metadata path

Use `codemeta.json` as the canonical machine-readable software metadata source.
Derive `CITATION.cff` from it and keep names, version, license, authorship, and
repository identifiers synchronized.

When metadata fields conflict, prefer `codemeta.json` and call out the mismatch.

### 4. Draft the release-readiness package

Produce the minimum set of artifacts needed for reuse and archival:

- codemeta.json
- CITATION.cff
- dependency and environment notes
- packaging and installation guidance
- reproducibility and provenance notes
- release checklist and archival guidance
- optional Software Management Plan guidance when a project needs living process documentation

Shape the emphasis to the software type:

- exploratory analysis: prioritize reproducibility and environment capture
- reusable research software: prioritize packaging, documentation, and API stability
- long-lived infrastructure: prioritize robustness, governance, and maintenance

### 5. Make portability and preservation explicit

Document:

- how the software is installed
- which dependencies are pinned or versioned
- what is required for a clean rerun
- how release artifacts are archived
- how DOI, repository, and version references relate to one another
- any limits on portability, external services, or platform support

### 6. Check coherence before finalizing

Verify that:

- names, versions, and licenses match across outputs
- author order and credit are consistent
- release artifacts link back to the repository and version tag
- dependencies and environments are stated clearly enough to reproduce the release
- provenance is preserved for generated or derived artifacts
- unknowns are explicit and not silently filled in

### 7. Route adjacent work

- If the user needs model narrative or ODD/ODD+2 prose, use `document`
- If the user needs scientific framing, assumptions, or uncertainty reasoning, use `omfa`
- If the user needs review-readiness assessment, use `peer-review`
- If the user needs compute-scale execution, use `hpc` or `ospool`

## When to Load References

Load additional material only when needed:

- `references/README.md` for the reference map and file roles
- `references/FAIR-RSE-CROSSWALK.md` when aligning metadata, citation, packaging, and release sections
- `references/FAIR-RELEASE-REFRESH-POLICY.md` when checking refresh cadence and maintenance expectations
- `assets/SMP-TEMPLATE.md` when drafting or refreshing a living Software Management Plan

## Practical Outputs

Depending on the task, return one or more of the following:

- a metadata draft centered on `codemeta.json`
- a derived `CITATION.cff`
- a release-readiness checklist
- a packaging or portability note
- a provenance summary
- an archival or deposit recommendation
- an SMP outline or update plan

## Gotchas

- treating FAIR as only metadata rather than release readiness and reuse
- mixing scientific reasoning into software engineering guidance
- letting `CITATION.cff` drift away from `codemeta.json`
- omitting dependency pins, environment details, or external service assumptions
- describing intended behavior instead of the implemented packaging or release path
- leaving provenance implicit for generated files, data products, or release artifacts
