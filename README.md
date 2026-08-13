# OMF Skills Repository

Computational modeling requires scientific and methodological judgment that extends beyond software engineering, but general-purpose AI coding agents do not consistently apply established modeling practices. OMF Skills encode community-developed modeling methodology, research software practices, and scientific workflows, helping computational modelers at any career stage build models that are transparent, reviewable, reproducible, and FAIR-aligned.

**Status**: `Alpha` — We are actively seeking community feedback to refine these workflows.

## Who this is for

This repository is designed for researchers, research software engineers, students, and practitioners at any career stage developing computational models.

## Repository Philosophy

Agent Skills capture specialized methodological knowledge that foundation models do not consistently possess. This repository follows a "shrink-to-fit" philosophy: as foundation models improve, skills are simplified or removed, preserving only frontier community knowledge, standards, workflows, and practices beyond models' reliable capabilities.

The ultimate goal of these Agent Skills is to provide community-informed guidance that sharpens expertise, automates rote and boilerplate work, and fosters critical thinking and deeper engagement with the modeling process through structured workflows that encode best practices.

## Quick Start

### Prerequisites

- A [coding-capable AI agent](https://agentskills.io/clients) (e.g., Cursor, Claude Code, Warp, OpenCode, Cursor, etc.)
- Node.js LTS (see [docs/install.md](docs/install.md))

### Install

#### Via Skills CLI (Recommended)

```bash
npx skills add openmodelingfoundation/skills
# or spell out the entire github repo
npx skills add https://github.com/openmodelingfoundation/skills
```

#### Via Coding Agent

Ask your agent: _"Install all skills from https://github.com/openmodelingfoundation/skills"_

### Verify Installation

Confirm your agent has loaded the skills:

```text
List all installed skills and summarize when each should be used.
```

## Example Workflow

> An animated walkthrough will be added here in a future release.

**Example:** `/omfa help me build a spatially explicit ABM of wildfire evacuation`

The `/omfa` skill guides you through a structured modeling lifecycle and produces:

1. **Conceptual model**: entities, processes, and system boundaries.
2. **Assumptions list**: explicit, reviewable modeling choices.
3. **Implementation plan**: modular structure with validation activities.
4. **Recommendations**: when to use specialist skills for documentation, FAIR metadata, HPC orchestration, or peer-review readiness.

## Example omfa prompt

````markdown
```text
/omfa Review this project and create or update its modeling artifacts.

Evidence: documentation, existing artifacts, source code, review comments.

Determine the project's lifecycle state and apply relevant OMFA
guidance. Create or update only the artifacts the evidence justifies. Where
evidence is missing, conflicting, or uncertain, say so explicitly rather than
inventing scientific commitments.

Store artifacts under `artifacts/` using OMFA canonical filenames.

Report: what was created, updated, reviewed, or flagged; unresolved
deficiencies; recommended next steps.
```
````

## example omfb prompt

```text
/omfb Review this project and create or update its implementation artifacts.

Evidence: OMFA artifacts, existing implementation artifacts, source code,
tests, review comments.

Develop the implementation plan from the scientific artifacts and apply the
relevant OMFB guidance. Create or update only the artifacts the evidence
justifies. Where evidence is missing, conflicting, or uncertain, say so
explicitly rather than inventing implementation or scientific commitments.

Preserve traceability from scientific artifacts through implementation
decisions, source code, and verification.

Report: what was created, updated, reviewed, or flagged; unresolved
deficiencies; recommended next steps.
```

Once an implementation plan has been created and reviewed carefully by you, try running

`/omfb implement the reviewed implementation plan using the latest stable version of Python Mesa in src/python/`

or

`/omfb implement the reviewed implementation plan using NetLogo 7.0.4 in src/netlogo/`

## Repository Structure

```text
.
├── skills/            # Published agent skills (e.g., omfa, omfb, document, fair)
├── docs/              # Contributor documentation
├── evals/             # Evaluation framework
├── scripts/           # Repository tooling
└── AGENTS.md          # Repository operating contract
```

## Contributing

We welcome new skills, improvements to existing workflows, and evaluation cases.

- **Contribution Workflow**: [CONTRIBUTING.md](CONTRIBUTING.md)
- **Authoring Reference**: [docs/agent-skills-creation-reference.md](docs/agent-skills-creation-reference.md)
- **New Skill Template**: [docs/SKILL-TEMPLATE.md](docs/SKILL-TEMPLATE.md)

## Roadmap

| Available                                      | Planned                             |
| :--------------------------------------------- | :---------------------------------- |
| OMF Assistant (Modeling Methodology) (`/omfa`) | Statistical Analysis                |
| OMF Builder (Model Implementation) (`/omfb`)   | Calibration and Validation          |
| Narrative Documentation (`/document`)          | Reproducibility Automation          |
| FAIR Metadata (`/fair`)                        | Domain-specific Modeling Templates  |
| HPC/HTC Orchestration (`/hpc`, `/ospool`)      | Visualization Standards             |
| Peer Review Readiness (`/peer-review`)         | Workflow Automation and Integration |

## Links & References

- **Open Modeling Foundation**: [openmodelingfoundation.org](https://www.openmodelingfoundation.org)
- **Agent Skills Specification**: [agentskills.io](https://agentskills.io)
- **Skills CLI**: [github.com/vercel-labs/skills](https://github.com/vercel-labs/skills)

## License

All skills in this repository are licensed under the [MIT License](LICENSE).
