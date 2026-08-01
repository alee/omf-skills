# OMF Skills Repository

Computational modeling requires scientific and methodological judgment that extends beyond software engineering, but general-purpose AI coding agents do not consistently apply established modeling practices. OMF Skills encode community-developed modeling methodology, research software practices, and scientific workflows, helping computational modelers at any career stage build models that are transparent, reviewable, reproducible, and FAIR-aligned.

**Status**: `Alpha` — We are actively seeking community feedback to refine these workflows.

## Who this is for

This repository is designed for researchers, research software engineers, students, and practitioners at any career stage developing computational models.

## Repository Philosophy

Agent Skills capture specialized methodological knowledge that foundation models do not consistently possess. This repository follows a "shrink-to-fit" philosophy: as foundation models improve, skills are simplified or removed, preserving only frontier community knowledge, standards, workflows, and practices that models do not consistently possess or reliably execute.

## Quick Start

### Prerequisites

- A [coding-capable AI agent](https://agentskills.io/clients) (e.g., Cursor, Claude Code, Windsurf, etc.)
- Node.js LTS (see [docs/install.md](docs/install.md))

### Install

#### Via Skills CLI (Recommended)

```bash
npx skills add omf/skills
```

#### Via Coding Agent

Ask your agent: *"Install all skills from https://github.com/openmodelingfoundation/skills"*

### Verify Installation

Confirm your agent has loaded the skills:

```text
List all installed skills and summarize when each should be used.
```

### Repository Workflow

Use documented `make` targets for all repository operations:

```bash
make help       # list supported commands
make validate   # run the canonical validation suite (CI-equivalent)
```

`make validate` is the single entry point for validation. It runs the same checks as CI inside the supported container. Do not invoke `docker`, `python`, `pytest`, `npm`, or similar tools directly when an equivalent `make` target exists.

## Example Workflow

> An animated walkthrough will be added here in a future release.

**Example:** `/omfa help me build a spatially explicit ABM of wildfire evacuation`

The `/omfa` skill guides you through a structured modeling lifecycle and produces:

1. **Conceptual model**: entities, processes, and system boundaries.
2. **Assumptions list**: explicit, reviewable modeling choices.
3. **Implementation plan**: modular structure with validation activities.
4. **Recommendations**: when to use specialist skills for documentation, FAIR metadata, HPC orchestration, or peer-review readiness.

## Repository Structure

```text
.
├── skills/            # Published agent skills (e.g., omfa, document, fair)
├── docs/              # Contributor documentation
├── evals/             # Evaluation framework
├── scripts/           # Repository tooling
└── AGENTS.md          # Repository operating contract
```

## Contributing

We welcome new skills, improvements to existing workflows, and evaluation cases.

* **Contribution Workflow**: [CONTRIBUTING.md](CONTRIBUTING.md)
* **Authoring Reference**: [docs/agent-skills-creation-reference.md](docs/agent-skills-creation-reference.md)
* **New Skill Template**: [docs/SKILL-TEMPLATE.md](docs/SKILL-TEMPLATE.md)

## Roadmap

| Available | Planned |
| :--- | :--- |
| Modeling Methodology (`/omfa`) | Statistical Analysis |
| Narrative Documentation (`/document`) | Calibration & Validation |
| FAIR Metadata (`/fair`) | Reproducibility Automation |
| HPC/HTC Orchestration (`/hpc`, `/ospool`) | Domain-specific Modeling Templates |
| Peer Review Readiness (`/peer-review`) | Visualization Standards |

## Links & References

- **Open Modeling Foundation**: [openmodelingfoundation.org](https://www.openmodelingfoundation.org)
- **Agent Skills Specification**: [agentskills.io](https://agentskills.io)
- **Skills CLI**: [github.com/vercel-labs/skills](https://github.com/vercel-labs/skills)

## License

All skills in this repository are licensed under the [MIT License](LICENSE).
