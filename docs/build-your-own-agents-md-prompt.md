# AGENTS.md Generation Prompt

Review this repository and create or replace its root `AGENTS.md` with concise instructions for coding agents.

Derive instructions from repository evidence, including developer documentation, package/build configuration, CI workflows, tests, contribution guidance, and existing tooling.

Consult current authoritative `AGENTS.md` guidance where available, but let repository evidence determine the content.

## Selection principle

Include a fact only when knowing it in advance materially reduces the risk of an incorrect change or avoids significant unnecessary discovery work.

Prioritize:

- canonical setup and validation commands;
- non-obvious invariants enforced by tests, CI, configuration, or documented policy;
- compatibility, versioning, and release constraints;
- repository-specific validation required before submitting changes;
- cross-cutting changes that require coordinated edits in multiple places;
- pointers to authoritative files for deeper guidance.

Prefer executable evidence such as tests, CI, and configuration when determining current commands and constraints. Report meaningful conflicts with descriptive documentation rather than silently resolving them.

## Keep it durable

Prefer pointers to authoritative files over summaries of implementation details.

Do not:

- document architecture that agents can readily discover from source inspection;
- enumerate files, directories, dependencies, or CI workflows merely to describe what exists;
- duplicate README, contribution, or configuration documentation;
- include generic language, framework, Git, testing, style, or coding advice;
- turn implementation patterns into repository policy unless supported by documentation, configuration, tests, or CI;
- invent commands, conventions, requirements, or architectural intent.

Distinguish repository requirements from observations. If evidence is ambiguous or conflicting, flag it rather than resolving it by assumption.

## Output

Organize `AGENTS.md` around only the operational concerns justified by the repository. Do not follow a fixed section template.

Aim for fewer than 100 lines. Shorter is better when fewer instructions are needed.

The result should function as a compact operational index for coding agents, not as repository documentation or an architecture guide.
