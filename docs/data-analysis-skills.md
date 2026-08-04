# Design Notes: Reusable Architectural Ideas for Analysis Skills

This document captures architectural ideas preserved from an earlier analysis skills proposal. The original design predates the current OMF architecture and should not be interpreted as an implementation plan.

The ideas below remain relevant because they reinforce the repository's guiding principles of methodological transparency, modularity, reproducibility, and reviewability.

---

# Guiding Principles

Future analysis skills should preserve the following characteristics.

## Reproducibility by default

Analytical workflows should preserve sufficient information for independent reproduction.

This includes:

* software versions
* execution parameters
* input provenance
* generated outputs
* important defaults

Analysis results should remain understandable without depending on conversational history.

---

## Explicit methodological choices

Analysis skills should surface consequential analytical choices rather than silently selecting defaults.

Examples include:

* statistical methods
* uncertainty methods
* calibration approaches
* parameter selection
* preprocessing decisions
* visualization choices

Whenever possible, record both the selected method and the rationale.

---

## Reviewable intermediate artifacts

Long analytical workflows should externalize important intermediate reasoning.

Examples include:

* assumptions
* analysis plans
* experiment definitions
* diagnostic summaries
* validation results

Intermediate artifacts should remain reusable by downstream skills.

---

## Structured diagnostics

Analysis skills should distinguish:

* informational observations
* cautions
* methodological limitations
* execution failures

Diagnostics should remain machine-readable whenever practical to support downstream review and automation.

---

## Modular execution

Analysis skills should remain independently usable.

They should:

* perform one analytical responsibility
* consume reviewable artifacts produced upstream
* produce artifacts useful to downstream skills
* avoid duplicating methodological guidance

Workflow coordination belongs to lifecycle coordination rather than individual analysis skills.

---

## Open ecosystem

Prefer:

* open data formats
* open statistical libraries
* open provenance standards
* open reproducibility tooling

Avoid unnecessary dependence on proprietary ecosystems.

---

# Relationship to OMF Architecture

These principles should be implemented within the existing OMF architecture rather than through a separate orchestration system.

Specifically:

* OMFA remains responsible for lifecycle coordination and routing.
* Methodological guidance determines how analyses should be conducted.
* Specialist execution skills implement analyses using the applicable guidance.
* FAIR and research software skills remain responsible for publication, provenance, and long-term stewardship.

Analysis skills should consume methodological guidance rather than embedding it.

---

# Future Work

Potential specialist analysis skills include:

* statistical analysis
* sensitivity analysis
* calibration
* visualization
* geospatial analysis
* network analysis
* text analysis

These represent implementation opportunities rather than architectural commitments. Their eventual design should follow the repository's composable skill architecture and evolve through community feedback rather than a predetermined orchestration framework.

## Specialist threshold

A new analysis skill should exist only when the task requires substantially more than lifecycle guidance.

If a request can be satisfied through concise methodological guidance from OMFA, it should not become a separate skill.

Specialist skills are justified when they encapsulate substantial analytical methodology, deterministic execution, domain-specific expertise, or reusable workflows that would otherwise overwhelm lifecycle guidance.