# FAIR and RSE to SMP Crosswalk

This crosswalk helps teams avoid duplicate effort when producing release-readiness outputs and a Software Management Plan (SMP).

## How to use this crosswalk

1. Draft canonical software metadata and citation artifacts first (`codemeta.json`, `CITATION.cff`).
2. Draft release and preservation notes for packaging, environment capture, provenance, and archival.
3. Draft SMP sections using `assets/SMP-TEMPLATE.md`.
4. Use this mapping to ensure consistency across all artifacts.
5. Resolve any conflicts in one place and propagate updates.

## Crosswalk Table

| FAIR / Release Deliverable                                             | SMP Section(s)                                                         | Consistency Checks                                                                                                  |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| codemeta.json (canonical machine-readable source)                      | Project Overview; Collaboration and Licensing; Versioning and Releases | codemeta.json is the authoritative source for software metadata; other metadata artifacts are synchronized from it. |
| Repository metadata (title, version, license, URL, keywords)           | Project Overview; Collaboration and Licensing; Versioning and Releases | Title/version/license are identical in metadata, CITATION.cff, README, and release notes.                           |
| CITATION.cff + ORCID attribution                                       | Collaboration, Governance, and Licensing                               | Contributor roles and credit policy in SMP match citation authorship and attribution rules.                         |
| Dependency and environment documentation                                | Analysis, Design, and Implementation; Testing and Quality Assurance; Deployment, Distribution, and Delivery | Dependency strategy and compatibility policies are consistent across docs and release artifacts.                    |
| Packaging and installation notes                                        | Analysis, Design, and Implementation; Deployment, Distribution, and Delivery | Packaging format, install path, and supported environments are explicit and reproducible.                           |
| Reproducibility and provenance notes                                    | Testing and Quality Assurance; Deployment, Distribution, and Delivery   | Provenance capture, seed policy, and rerun instructions are documented and actionable.                               |
| Archival target (Zenodo, institutional repository, Software Heritage)  | Versioning, Releases, and Archival; Sustainability and Maintenance      | DOI and archival strategy in SMP align with the publication and preservation workflow.                               |
| Repository organization and governance statements                       | Stakeholders, Roles, and Responsibilities; Collaboration, Governance, and Licensing | Maintainer responsibilities, ownership, and contribution expectations are explicit.                                  |
| Release checklist                                                       | Testing and Quality Assurance; Versioning, Releases, and Archival       | Checklist pass criteria map to explicit SMP quality gates and release steps.                                        |

## Minimal Coherence Checklist

Before finalizing outputs, verify:

- names, versions, and license identifiers are identical across all outputs
- codemeta.json is treated as the canonical metadata source and CITATION.cff remains synchronized with it
- author and contributor lists are consistent between CITATION.cff and SMP governance sections
- archival route and preservation commitments are not contradictory
- release cadence and quality gates are documented both in checklist and SMP
- maintenance responsibilities and contingency plan are explicitly assigned

## Typical Workflow Order

1. Generate codemeta.json as canonical software metadata.
2. Generate or update CITATION.cff from codemeta.json.
3. Draft release-readiness notes for packaging, provenance, and archival.
4. Draft SMP from template.
5. Run crosswalk checks and reconcile discrepancies.
6. Finalize release checklist and submission package.

## Refresh Note

Revalidate this crosswalk during scheduled refreshes defined in `FAIR-RELEASE-REFRESH-POLICY.md`.
