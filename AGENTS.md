# AGENTS.md — OMF Skills Repository

Agent instructions for working in this repository. Every AI agent should read this file before creating, editing, or reviewing skills.

---

## Purpose

A collection of [Agent Skills](https://agentskills.io) that augment AI coding agents and assistants with community-developed computational modeling methodology, research software practices, and scientific workflows.

Published skills live in `skills/`. A local, maintainer-only skill for updating / refreshing skill content and references lives in `.github/skills/update-skill/` and is **not** part of the published catalog.

---

## Repository design principles

The repository prioritizes methodological correctness, transparency, reviewability, and maintainability. It exists to encode community methodological knowledge that foundation models do not consistently possess, not generic software engineering or modeling advice.

As foundation models improve, this repository should become smaller, preserving only frontier community knowledge, standards, workflows, and practices that models do not consistently execute.

---

## Required authoring reference (load when editing skills)

When creating, modifying, or reviewing a skill, you **must read**:

```
docs/agent-skills-creation-reference.md
```

Use it as the canonical guide for `SKILL.md` structure, frontmatter, description optimization, scoping, progressive disclosure, and evaluation.

---

## Editing heuristics

* Preserve routing boundaries.
* Remove redundancy aggressively.
* Prefer composition over duplication.
* Keep guidance proportional to its value.
* Justify consequential methodological recommendations.
* Add references only when they materially support new guidance.
* Preserve traceable intermediate artifacts.
* Every instruction competes for context. If an agent would consistently succeed without it, remove it.

---

## Scope discipline

Each skill should own a single methodological responsibility. Avoid duplicated guidance; overlapping functionality should route to the specialist skill instead of being copied. Many small composable skills are preferred over fewer comprehensive ones.

---

## Skill loading model (critical)

Agents load skills in stages:
1. Discovery → name + description
2. Activation → full `SKILL.md`
3. On-demand → `references/` and `scripts/`

Implications:
- Weak descriptions prevent activation.
- `SKILL.md` must work without references unless explicitly invoked.
- References must include clear load conditions.

---

## Skill anatomy

```
skills/<kebab-case-name>/
├── SKILL.md          ← required: YAML frontmatter + agent instructions
├── assets/           ← output templates and starter files
├── references/       ← normative checklists, standards, compressed artifacts
└── scripts/          ← deterministic automation helpers
```

Rules:
- Folder name **must** match the `name:` frontmatter field exactly.
- Keep `SKILL.md` as small as practical; move detail to `references/` when it improves readability or reuse.
- All paths must be relative.
- No secrets, absolute paths, or personal configuration.

---

## Repository conventions

* **Naming**: `kebab-case` by default
* **Artifacts**: `kebab-case.md` 
* **Scripts**: `snake_case.py`, `kebab.sh`
* **References**: `UPPERCASE-TOPIC.md`
* **Config/Templates**: YAML or JSON only
* **Maturity**: `alpha`, `beta`, `stable`
* **Evals**: ≥3 trigger + ≥3 non-trigger cases
* **License**: MIT default

---

## Evaluation strategy

Each skill must include an evaluation JSON defining trigger and non-trigger cases.

**Required behavior**: Test with and without the skill using realistic prompts and artifacts. Compare correctness, efficiency, and failure modes.

---

## Key documentation

* `docs/agent-skills-creation-reference.md`: Canonical skill design + specification guide.
* `CONTRIBUTING.md`: Contribution workflow.
* `docs/SKILL-TEMPLATE.md`: New skill template.
* `docs/VALIDATION.md`: Validation rules.
* `docs/roadmap.md`: Planned skills.

---

## Review checklist

* Does this duplicate another skill?
* Does this belong in another skill?
* Should this live in `references/` instead?
* Is routing still unambiguous?
* Can wording be shorter?
* Does the change justify its context cost?
* Does it improve reviewability?

---

## Common mistakes

* No `template/` directory exists. Copy an existing skill.
* `name:` does not match folder name.
* Weak descriptions prevent triggering.
* Publishing `.github/skills/update-skill/`.
* Duplicating large guidance into `SKILL.md` instead of using references.
* Extending a skill when routing to a specialist skill is more appropriate.
