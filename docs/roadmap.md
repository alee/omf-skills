# Skills Roadmap

This roadmap outlines the planned evolution of the Open Modeling Foundation (OMF) Skills repository.

OMF Skills augment AI coding agents with community-developed computational modeling methodology, research software practices, and scientific workflows. The repository is organized as a modular ecosystem in which lifecycle coordination, methodological guidance, specialist execution, and research software infrastructure remain separate but composable. This separation keeps scientific reasoning explicit, reviewable, and reusable across modeling projects.

This roadmap is intentionally lightweight and will evolve through community feedback, real-world use, and advances in foundation models.

## Current Capabilities

The current alpha release provides foundational support for computational modeling across much of the research lifecycle.

## Lifecycle Coordination

**OMFA** (Good Modeling Practice) is the primary entry point into the repository. It coordinates the computational modeling lifecycle by identifying the current modeling stage, loading the appropriate methodological guidance, producing reviewable intermediate artifacts, and routing work to specialist skills when appropriate.

## Methodological Guidance

**OMFB** (Model Implementation Guidance) translates reviewable conceptual models into maintainable research software architectures while preserving scientific intent and traceability.

Future methodological guidance will expand to additional domains such as experimentation, calibration, visualization, and documentation methodology.

## Specialist Skills

Current specialist skills support:

- narrative model documentation
- FAIR research software and publication assets
- peer-review readiness
- HPC and distributed computing workflows

Together these skills support computational modeling from conceptualization through implementation, documentation, publication, review, and computational execution.

## Repository Architecture

OMF Skills are organized into complementary architectural layers.

```text
OMFA (Lifecycle Coordination)
              ↓
Methodological Guidance
              ↓
Specialist Execution Skills
              ↓
Research Software & Infrastructure
```

Each layer has a distinct responsibility.

| Layer                                  | Responsibility                                                                                                                  |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **Lifecycle coordination**             | Determine the current modeling stage, coordinate methodological reasoning, and route work to the appropriate specialist skills. |
| **Methodological guidance**            | Encode community-developed modeling methodology and consequential scientific reasoning independent of implementation.           |
| **Specialist execution skills**        | Perform analyses, generate artifacts, and execute workflows using the applicable methodological guidance.                       |
| **Research software & infrastructure** | Support implementation, publication, reproducibility, and computational execution.                                              |

Future development should reinforce this architecture by favoring routing over duplication, modular guidance over monolithic skills, and explicit reviewable artifacts over implicit conversational state.

## Terminology

Throughout this repository:

- **Methodology** refers to the scientific reasoning, analytical choices, and community knowledge used to develop and evaluate computational models.
- **Guidance** refers to the structured instructions that encode that methodology for AI agents.
- **Practices** refers to established community conventions, standards, and research software workflows that support transparent and reproducible computational modeling.

## Near-Term Priorities

The next phase focuses on expanding methodological coverage while strengthening specialist execution skills.

## Guidance Library

Planned guidance includes:

- experimentation and experimental design
- calibration
- visualization and communication
- documentation methodology
- collaboration with AI coding agents

Future guidance will continue to emphasize consequential analytical choices, reviewable intermediate artifacts, and transparent scientific reasoning.

## Execution Skills

Planned execution skills include support for:

- statistical analysis
- sensitivity analysis
- calibration workflows
- verification and testing
- reproducibility automation
- visualization

These skills will consume the methodological guidance produced by OMFA and OMFB rather than duplicating it.

## Domain Extensions

Future domain-specific skills may include support for:

- NetLogo
- GAMA
- Python (Mesa, AgentPy)
- Julia (Agents.jl)
- system dynamics
- Bayesian workflows
- domain-specific modeling methodologies

Domain skills should extend existing methodological guidance rather than introducing independent modeling workflows.

## Community Priorities

We particularly welcome contributions involving:

- methodological guidance
- reproducibility and FAIR research software
- statistical and uncertainty workflows
- modeling platform integrations
- evaluation cases
- example projects
- documentation improvements
- real-world case studies

See [CONTRIBUTING.md](../CONTRIBUTING.md) for contribution guidelines.

## Roadmap Philosophy

As foundation models improve, OMF Skills should become smaller rather than larger.

The long-term goal is to preserve only the frontier methodological knowledge, scientific standards, research software practices, and workflows that foundation models do not consistently apply on their own.

Every new skill should improve composability, transparency, and reviewability while minimizing context cost.
