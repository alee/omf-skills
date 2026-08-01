---
name: omfb
description: |
  Guide implementation of computational models as research software while preserving
  traceability to the conceptual model. Helps translate scientific models into
  maintainable implementations, identify implementation risks, and delegate
  platform-specific practices to specialized guidance.

  Expected output: implementation guidance, implementation review, implementation
  planning, and routing to platform-specific implementation guidance.
license: MIT
compatibility: Works with agent-based, system dynamics, statistical, simulation,
  optimization, and hybrid computational models.
metadata:
  domain: computational-modeling
  maturity: alpha
  audience: model developers
  category: implementation
---

# Model Implementation Guidance

## When to Use This Skill

Use this skill to:

- plan the implementation of a conceptual model into research software.
- review implementation decisions to ensure they preserve scientific intent.
- organize model architecture for maintainability and traceability.
- identify implementation risks or prepare a model for coding agents.

Do **not** use this skill when: performing conceptual modeling, uncertainty analysis, evaluation methodology, or seeking language-specific coding advice.

## OMFA Handoff Contract

OMFB consumes the reviewable scientific artifacts produced by OMFA. These artifacts are the authoritative implementation specification. These artifacts are the authoritative description of scientific intent and SHOULD be treated as the implementation specification. Implementation artifacts supplement, but never supersede, these scientific artifacts.

## Required Inputs

OMFB uses reviewable artifacts as the authoritative implementation specification.

Before substantial implementation begins, the following artifacts MUST exist unless the work is explicitly exploratory or the omission is justified.

| Artifact | Status | Purpose |
|----------|--------|---------|
| `artifacts/conceptual-model.md` | REQUIRED | Authoritative conceptual specification. |
| `artifacts/assumptions.md` | REQUIRED | Scientific assumptions that implementation must preserve. |
| `artifacts/implementation/plan.md` | OPTIONAL | Existing implementation planning, if resuming work. |

### Conditional Inputs

Load these artifacts only when they materially affect implementation decisions.

| Artifact | When Required |
|----------|---------------|
| `artifacts/research-questions.md` | When implementation choices affect the questions the model is intended to answer. |
| `artifacts/problem-statement.md` | When project scope or intended use influences implementation priorities. |
| `artifacts/uncertainty-register.md` | When stochasticity, calibration, numerical methods, or experimental design influence implementation. |
| `artifacts/analysis-plan.md` | When implementation must support planned experiments, outputs, or evaluation. |
| `artifacts/stakeholder-register.md` | When implementation decisions have governance, transparency, privacy, or participation implications. |

## Guidance Library

Load only the implementation guidance required.

| Context | Guidance |
|----------|----------|
| General implementation planning | `implementation-planning.md` |
| Architecture and modularization | `architecture.md` |
| Verification planning           | `verification.md` |
| Stochastic simulation           | `stochastic.md` |
| Performance optimization        | `performance.md` |
| Parallel execution              | `parallel.md` |
| Language and framework idioms   | platform guidance |

## Deliverables

OMFB creates or maintains:

| Artifact | Purpose |
|----------|---------|
| `artifacts/implementation/plan.md` | Implementation plan |
| `artifacts/implementation/architecture.md` | Implementation architecture |
| `artifacts/implementation/module-mapping.md` | Mapping from conceptual model to implementation |
| `artifacts/implementation/parameter-schema.md` | Externalized parameters and configuration |
| `artifacts/implementation/verification-plan.md` | Implementation verification plan |

## Implementation Contract

OMFB MUST:

- preserve traceability between conceptual models and implementation;
- preserve separation between scientific logic and implementation infrastructure;
- document consequential implementation decisions and implementation-introduced assumptions;
- produce reviewable implementation artifacts;
- delegate language- and platform-specific guidance when appropriate;
- return implementation findings that require revision of upstream conceptual artifacts.

OMFB MUST NOT:

- silently modify the conceptual model;
- reinterpret scientific assumptions for implementation convenience;
- introduce implementation-driven behavior without documenting and justifying it.

If implementation constraints require changes to scientific assumptions or conceptual structure, pause planning and recommend revising affected upstream artifact(s).
