# Release Assessment

Assess the OMF Skills repository for release readiness.

This prompt evaluates the repository against the release criteria defined in `docs/release-readiness.md`. Treat repository documentation as the normative specification. Base findings on repository evidence and distinguish confirmed deficiencies from recommendations.

## Assessment Workflow

Conduct the assessment in two phases.

### Phase 1

Read and interpret the repository's governing documentation. Resolve the documentation hierarchy and record any inconsistencies rather than resolving them.

### Phase 2

Evaluate the repository against `docs/release-readiness.md`. Support every finding with repository evidence. Expand beyond representative sampling only when evidence suggests a repository-wide issue.

## Repository Survey

Review the following before beginning the assessment.

Always review completely:

- `AGENTS.md`
- `README.md`
- `CONTRIBUTING.md`
- `Makefile`
- GitHub Actions workflows
- `docs/release-readiness.md`

Review representative examples from:

- `docs/` for core contributor and validation documentation
- `skills/` for at least one skill from each major category or architectural layer
- `evals/` for representative evaluation suites
- `scripts/` for representative repository tooling

Expand beyond representative sampling only when inconsistencies or systemic issues are discovered.

## Documentation precedence

When repository documents disagree, resolve them in this order:

1. `AGENTS.md` (repository operating contract)
2. Specialized documentation under `docs/`
3. `CONTRIBUTING.md`
4. `README.md`
5. Comments, examples, and incidental references elsewhere

Always report inconsistencies rather than silently choosing one interpretation.

## Assessment Principles

- Evaluate the repository as a published project, not as an individual pull request.
- Ground every finding in repository evidence.
- Do not assume missing functionality.
- Distinguish confirmed findings, inferred risks, and improvement opportunities.
- Prefer documented repository workflows over ad hoc commands.
- If a criterion cannot be evaluated from repository evidence, state that explicitly.

## Release Criteria Reference

Use `docs/release-readiness.md` as the source of release criteria and severity logic.

Map findings to the repository's criteria as follows:

- unmet MUST criteria are release blockers
- unmet SHOULD criteria are major or minor findings depending on impact
- informational gaps are observations

If a finding does not map cleanly to the release criteria, note that and explain why.

## Evidence Expectations

For each finding, include:

- the relevant repository evidence
- the release criterion or criteria implicated
- why the evidence supports the finding
- the recommended resolution, if any

When the evidence is incomplete, say so.

## Deliverables

Produce a report containing:

# Executive Summary

Overall assessment.

Release recommendation.

Confidence level.

# Evidence Reviewed

List documentation, workflows, and representative skills examined.

# Release Blockers

For each blocker:

- description
- supporting evidence
- recommended resolution

# Major Issues

List significant issues that should be addressed.

# Minor Issues

List quality improvements.

# Consistency Findings

Summarize repository-wide inconsistencies.

# Positive Findings

Highlight repository strengths.

# Recommended Next Actions

Prioritize work before release.

Identify the smallest set of changes needed to achieve release readiness.

## Optional Continuity Artifact

If the assessment identifies substantial follow-up work, create `docs/handoffs/release-assessment-status.md` containing:

- assessment date
- repository revision
- assessment outcome
- completed review areas
- remaining blockers
- deferred issues
- recommended next assessment steps

Keep this document concise. It is a handoff artifact for subsequent reviewers, not a duplicate of the assessment report.

## Success Criteria

A successful assessment:

- evaluates the repository against its own documented standards
- produces evidence rather than opinions
- distinguishes blockers from improvements
- identifies the smallest remaining work before release
- leaves a clear state for the next reviewer if additional work is required
