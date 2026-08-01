---
name: update-skill
description: "Repository-local maintainer workflow for refreshing skill assets and references when upstream standards, rubrics, or guidance change. Use when updating compressed artifacts, checklists, and linked policy text across this repository in a consistent PR."
user-invocable: false
---

# Update Skill (Repository-Local)

Use this skill for maintainer updates in this repository only.

## When to Use

- Upstream standards or rubrics changed and local compressed artifacts may be stale
- A skill reference/checklist/template needs synchronized updates
- You need a repeatable refresh process across SKILL.md, references, assets, and evals

## Scope

This skill is local to this repository workspace (`.github/skills/update-skill`) and is not part of the published skill catalog under `skills/`.

## Workflow

1. Identify affected source(s) and fetch current upstream content.
2. Diff upstream changes against local compressed/reference artifacts.
3. Update only changed concepts; keep summaries compressed and decision-oriented.
4. Update "Last reviewed" dates for refreshed artifacts.
5. Propagate semantic changes in the same PR to all impacted files:
   - skill orchestration (`skills/*/SKILL.md`)
   - normative references/checklists (`skills/*/references/*`)
   - templates/assets (`skills/*/assets/*`)
   - eval expectations (`skills/*/evals.json`) when behavior changes
6. Add a concise PR note using `assets/REFRESH-PR-NOTE-TEMPLATE.md`.

## Architectural Invariant

Changes to an authoritative artifact or interface contract SHOULD propagate to
all dependent skills, guidance, templates, examples, evaluations, and
documentation in the same change whenever practical.

Flag dependencies rather than allowing repository drift.

## Synchronize Repository State

Treat repository documentation, skills, guidance, templates, examples, and
evaluations as executable project state.

When a change is made, identify every repository component that depends on the
changed concept and keep those components synchronized.

Verify that:

- skill contracts match current behavior;
- routing and activation logic remain consistent;
- artifact names, locations, and schemas remain synchronized;
- guidance references remain valid;
- examples reflect the current architecture;
- downstream consumers remain compatible with upstream artifact contracts.

Treat every shared concept as having a single authoritative definition.

Prefer updating dependent references over duplicating or redefining concepts.

Do not silently reconcile architectural inconsistencies.

Instead:

- identify the authoritative source;
- identify conflicting documents;
- explain the inconsistency;
- identify downstream components requiring review.

Preserve repository terminology, ownership boundaries, interface contracts, and
artifact dependencies.

Avoid stylistic rewrites unless they improve consistency.

Report:

1. architectural inconsistencies;
2. stale or inconsistent repository state;
3. broken contracts between repository components;
4. downstream components requiring synchronized review.

## Guardrails

- Do not copy upstream pages verbatim.
- Preserve repository-specific policy decisions unless explicitly changed.
- Prefer smallest coherent change set that keeps references, templates, and evals aligned.

## References

- Process details: `references/REFRESH-WORKFLOW.md`
- PR note template: `assets/REFRESH-PR-NOTE-TEMPLATE.md`
