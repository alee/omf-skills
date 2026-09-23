# Installing OMF Skills

OMF skills are files loaded by a coding agent. They do not install themselves.
Use a coding agent that supports Agent Skills, or use the [Skills CLI](https://www.skills.sh/docs/cli). The repository's published skills live under `skills/`.

## Install through a coding agent

Ask your agent to install the skills from `https://github.com/openmodelingfoundation/skills` for your project or user account, following that agent's skill installation instructions. Ask it to list the installed skills afterward. Installation paths and reload behavior depend on the agent.

## Install with Skills CLI

With a supported coding agent and Node.js available, run from your project directory:

```bash
npx skills add openmodelingfoundation/skills
```

The [upstream CLI reference](https://www.skills.sh/docs/cli) documents the `npx skills add owner/repo` form. Follow its prompts to select the skills and target agent. For user-wide installation, the [upstream CLI help](https://github.com/vercel-labs/skills/blob/main/src/cli.ts) documents `-g`:

```bash
npx skills add openmodelingfoundation/skills -g
```

Check the selected target and listed skills before relying on them. The CLI command above does not pin `v2026.09`; the source revision selected depends on CLI behavior. The `v2026.09` tag becomes available only after publication. If an exact release is required, use the Git method below and record the resolved commit in your project provenance. CLI behavior and agent install locations may vary by CLI version.

## Manual Git installation

Use this method when a fixed Git release is needed or Node.js is unavailable. The example uses `~/.agents/skills`, a common shared location; check your agent's documented discovery path first. Review existing links before replacing them.

```bash
git clone https://github.com/openmodelingfoundation/skills.git ~/.cache/omf-skills
# After v2026.09 is published:
git -C ~/.cache/omf-skills fetch --tags
git -C ~/.cache/omf-skills checkout --detach v2026.09
mkdir -p ~/.agents/skills
for d in ~/.cache/omf-skills/skills/*/; do
  [ -f "$d/SKILL.md" ] && ln -s "${d%/}" "$HOME/.agents/skills/$(basename "$d")"
done
```

The loop links only published skill directories. It does not replace existing paths; resolve any `ln` conflict deliberately. Restart or reload the agent if it does not discover new skills automatically.

A tag checkout is detached. To move to a later tag, fetch tags and check out that tag explicitly; `git pull` is for an attached branch, not a detached tag. For a branch checkout, use `git -C ~/.cache/omf-skills switch main` and `git -C ~/.cache/omf-skills pull --ff-only` to follow the branch. Remove only links you created before removing the clone.

## Research use

Cite the specific released version and record the exact repository revision used. `CITATION.cff` contains the Zenodo concept DOI, which resolves across releases; use a release-specific DOI when one is published. For material project changes under `omf-artifacts/`, record the producing skill revision, inputs, decisions, review status, and observable agent or model version in `omf-artifacts/fair/provenance-manifest.json`.
