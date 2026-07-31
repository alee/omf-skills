# OMF Skills Repository

Computational modeling involves hundreds of methodological decisions, but most AI coding agents only know general software engineering. OMF Skills augment coding agents with community-developed modeling guidance, research software practices, and scientific workflows so they can help produce transparent, reviewable computational models.

These skills are open source, structured guidance designed to evolve alongside both the research community and foundation models. As foundation models improve, the skills should shrink, capturing only the frontier community knowledge, standards, and practices that models do not natively possess or consistently apply.

**NOTE**: These skills are still under active development so behavior and guidance may change rapidly. Please check for updates periodically via `npx skills update` or `git pull` if you manually cloned them to your `.agents/skills/` directory (either in your home directory or in a specific project).

## Quick Start

### Prerequisites

- A [coding-capable AI agent](https://agentskills.io/clients) (Cursor, Claude Code, ChatGPT Codex, VS Code, Warp, etc.)
- Node.js LTS (see [docs/install.md](docs/install.md))

### Install

OMF Skills require a coding-capable AI agent and Node.js LTS. See [docs/install.md](docs/install.md) for more detailed Node.js or manual git clone setup instructions.

#### Install with the Skills CLI (recommended)

```bash
npx skills add omf/skills
# or
npx skills add https://github.com/omf/skills
```

This installs the skills into your agent's managed skills directory and makes future updates easy via `npx skills update`.

#### Install directly from your coding agent

Some coding agents are capable of installing skills through their chat interface. Ask them if they can install skills directly which would let you enter `install all skills from https://github.com/openmodelingfoundation/skills` into the chat interface to install all skills.

## Example Workflow

User: `/omfa help me build a conceptual model of ...`

or

User: `/omfa build a spatially explicit ABM of wildfire evacuation`

User request
     │
     ▼
   /omfa
     │
     ├── develop conceptual model
     ├── create implementation plan
     ├── /document produce narrative documentation
     ├── /fair prepare research objects for publication
     └── /peer-review evaluate review readiness

#### Verify the agent can discover installed skills

Try:

```text
List all installed skills and summarize when each should be used.
```

#### Complex tasks

Develop a conceptual model:
```text
/omfa Help me develop a conceptual model for how agricultural land use affects watershed nutrient loading in the Loire River Basin. Identify the major entities, processes, assumptions, and system boundaries before discussing implementation.
```

Project planning:
```text
/omfa Create a modular project plan for implementing this conceptual model, including milestones, risks, validation activities, and documentation artifacts.
```

Other examples:

- _"Set up an OSPool batch scaffolder for my sensitivity analysis"_
- _"Generate a FAIR publication checklist for this model"_
- _"Generate a FAIR publication checklist for my model's output data"_

## Repository Structure

```text
.
├── skills/            # published agent skills
│   ├── omfa/
│   ├── document/
│   ├── fair/
│   └── ...
├── docs/              # contributor documentation
├── evals/             # evaluation framework
├── scripts/           # repository tooling
├── README.md
├── CONTRIBUTING.md
└── AGENTS.md
```

## Contributing

We welcome new skills, improvements to existing skills, documentation updates, and evaluation cases.

See:

- CONTRIBUTING.md for contribution workflow and repository conventions
- docs/agent-skills-creation-reference.md for detailed skill authoring guidance
- docs/SKILL-TEMPLATE.md to scaffold a new skill

## Roadmap

| Current              | Planned                  |
| -------------------- | ------------------------ |
| Modeling methodology | Statistical analysis     |
| Documentation        | Calibration              |
| FAIR                 | Reproducibility          |
| HPC / HTC            | Visualization            |
|                      | Domain-specific modeling |

## Links & References

- **Agent Skills specification**: [agentskills.io](https://agentskills.io)
- **Skills.sh leaderboard**: [skills.sh](https://skills.sh)
- **Agent Skills documentation**: [agentskills.io](https://agentskills.io)
- **Agent Skills CLI**: [github.com/vercel-labs/skills](https://github.com/vercel-labs/skills)
- **Example skills repository**: [github.com/anthropics/skills](https://github.com/anthropics/skills)

## License

All skills in this repository are licensed under the [MIT License](LICENSE) unless otherwise noted in individual `SKILL.md` files.