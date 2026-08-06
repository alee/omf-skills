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

## Detailed omfa prompt

```markdown
/omfa (create, synchronize, audit) this project's reviewable modeling artifacts.

Treat the project's narrative documentation, existing artifacts, source code, review comments, and user instructions as the available evidence.

Determine the appropriate operating mode:

- **Bootstrap**: initialize the artifact set for a new project.
- **Update** (default): synchronize existing artifacts with available evidence.
- **Audit**: assess artifacts without modifying them.

When an expected artifact is missing:

- generate it if sufficient evidence exists;
- otherwise create a scaffold that clearly distinguishes available evidence, missing evidence, unresolved questions, and assumptions requiring user confirmation;
- never invent scientific commitments.

Store all artifacts under `artifacts/` using the canonical filenames defined by OMFA. Do not invent alternative filenames or repository structures.

When updating artifacts:

- preserve traceability between evidence, assumptions, decisions, implementation, evaluation, and conclusions;
- update only artifacts affected by new evidence;
- identify downstream artifacts that should be reviewed because they may now be stale;
- never silently reconcile conflicting evidence.

Report:

1. current lifecycle stage;
2. loaded guidance modules;
3. artifacts created, updated, reviewed, or flagged;
4. unresolved deficiencies and missing evidence;
5. recommended next actions and any additional OMFA guidance that should be loaded.

Be explicit about uncertainty, distinguish evidence from inference, preserve project terminology where possible, and prefer the simplest defensible interpretation supported by the available evidence.
```

## example omfb prompt

```text
/omfb (develop, review, update) the implementation plan. Preserve traceability between OMFA scientific artifacts, implementation artifacts, source code, and verification activities. Prefer small, reviewable implementation increments over monolithic code generation. If OMFA artifacts do not exist, stop and request that the user run `/omfa` first to generate them.

* **Plan**: create the initial implementation artifacts from OMFA artifacts before coding.
* **Update**: synchronize implementation artifacts as scientific artifacts, code, or constraints evolve.
* **Audit**: assess whether implementation and code remain faithful to the scientific artifacts without modifying code unless explicitly requested.
```

After the plan has been created, run `/omfb create a (NetLogo, Python, Julia) implementation in src/(netlogo|python|julia)`.

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
