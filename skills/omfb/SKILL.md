---
name: omfb
description: |
  Use this skill when a modeling project needs executable model realization, implementation architecture, code structure, or configuration changes for an existing conceptual model.

  Triggers: "implement the model", "write the code", "realize the conceptual model", "build the simulation", "create the software architecture", "modify model implementation".

  Expected output: implementation plan, code structure guidance, configuration changes, and a clear handoff back to omfa or the relevant specialist when the request is scientific rather than implementation-focused.
license: MIT
compatibility: Works with Python, R, NetLogo, Julia, and mixed-language simulation projects
metadata:
  domain: computational-modeling
  maturity: alpha
  audience: modelers, researchers, research software engineers
  category: implementation
---

# OMFB Implementation Skill

This skill is responsible for executable model realization. It turns an approved conceptual model into implementation architecture, source code structure, configuration, and run-capable software.

## Routing Contract

Every request MUST resolve to exactly one outcome:

```yaml
outcome: continue | route | block
target: omfa | omfb | document | fair | peer-review | hpc | ospool | model-extractor
from:
  - omfa
missing_artifacts: []
reason: <short explanation>
```

Use this contract before acting:

- `continue` when the request is implementation-focused and the current skill is responsible for the artifact boundary.
- `route` when the request is scientific, documentation, review, or execution-environment focused and belongs to another skill.
- `block` when required prerequisites are missing, such as a conceptual model or approved implementation scope.

If the request already contains `omfb` in the routed-from trail, emit `block` with a responsibility-ambiguity note instead of routing again.

## Primary Responsibilities

Use this skill for:

- implementation architecture and code structure
- model realization and software construction
- configuration, parameter handling, and execution wiring
- translating a conceptual model into runnable code
- implementation-focused refactoring and debugging

Do not use this skill for:

- scientific questions or methodological redesign; route to `omfa`
- narrative documentation; route to `document`
- release, metadata, or archival stewardship; route to `fair`
- peer review assessment; route to `peer-review`
- HPC or OSPool job scripting; route to `hpc` or `ospool`

## Activation Rules

1. If the request is about scientific purpose, validation strategy, or conceptual redesign, `route` to `omfa`.
2. If the request is about narrative documentation, `route` to `document`.
3. If the request is about release, metadata, packaging, or provenance, `route` to `fair`.
4. If the request is about review readiness or rubric-based assessment, `route` to `peer-review`.
5. If the request is about execution environment, Slurm, or HTCondor, `route` to `hpc` or `ospool`.
6. If the request is implementation-focused and the necessary conceptual artifact exists, `continue`.
7. If the conceptual model, implementation scope, or artifact boundary is missing, `block` and request the missing artifact.

## Required Inputs

Before implementing, confirm the request includes or can reference:

- a conceptual model or implementation scope
- the target language/runtime
- any required inputs, outputs, and constraints
- the intended execution environment

## Outputs

Produce implementation-oriented artifacts such as:

- an implementation plan
- a code structure overview
- configuration and parameter guidance
- runnable code or refactoring steps

## Gotchas

- Treat code completion as implementation evidence only; it does not replace scientific review.
- Do not silently redesign the scientific model while implementing; route such requests to `omfa`.
- If the implementation request is ambiguous and the necessary artifact boundary is not clear, `block` rather than guessing.
