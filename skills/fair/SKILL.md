---
name: fair
description: |
  Support FAIR stewardship of digital research objects, including research
  software, datasets, computational models, and workflows. Use for FAIR
  metadata, provenance, persistent identifiers, citation, repository
  organization, dependency and environment management, packaging,
  portability, archival preparation, preservation, and management planning.

  Triggers include making research objects FAIR, reproducible, citable,
  reusable, publication- or archive-ready; creating FAIR metadata (e.g.
  codemeta.json, CITATION.cff, RO-Crate); packaging or archiving
  a repository, dataset, or model; and developing FAIR, data, or software
  management plans.

  Expected output: a FAIR Management Plan as the canonical stewardship
  document, with appropriate metadata, provenance, packaging, and archival
  artifacts, plus a DMP or SMP when required.
license: MIT
compatibility: Works with any project managing research software, datasets, computational models, or workflows
metadata:
  domain: fair-research-objects
  maturity: beta
  audience: modelers, researchers who code, research software engineers, data stewards
  category: publication
---

# FAIR Research Objects Skill

This skill applies the FAIR principles across research software, computational models, datasets, workflows, metadata, and other digital research objects to improve discoverability, accessibility, interoperability, reproducibility, provenance, preservation, and long-term reuse.

The FAIR Management Plan is the project's canonical, primary stewardship document. It is not a funder deliverable itself — it is the source of truth that funder-facing documents are disseminated from. When a funder requires a Data Management Plan (DMP) or Software Management Plan (SMP), generate that document as a derived extract, populated from `assets/DMP-TEMPLATE.md` using the relevant sections of the FAIR Management Plan. The DMP is a dissemination artifact, not an independent source of stewardship decisions — if a DMP requirement surfaces new information (e.g. a funder-mandated retention period), record it back in the FAIR Management Plan first, then re-derive the DMP.

## Responsibility

This skill is responsible for lifecycle stewardship of digital research objects — findability, accessibility, interoperability, and reusability across whatever mix of software, data, models, and workflows a project has. It is deliberately one of four orthogonal responsibilities: `omfa` is responsible for scientific reasoning, this skill is responsible for stewardship, `document` is responsible for narrative communication, and `peer-review` is responsible for human assessment. Keep that boundary intact when extending any of the four.

Data or authority governance questions about populations whose data or knowledge a model draws on, including collective benefit, authority to control, accountability for use, or affected-population consent and legitimacy, are modeling ethics concerns. Route those to `omfa`'s `references/guidance/ethics.md`; do not treat them as resolved by FAIR packaging, metadata, or archival stewardship alone.

Use this skill for:

- stewardship of research software
- FAIR metadata
- persistent identifiers
- provenance capture
- reproducibility
- repository organization
- dependency and environment management
- data packaging
- model packaging
- workflow capture
- archival preparation
- citation
- preservation
- release and publication readiness where applicable

Do not use this skill for:

- scientific reasoning, conceptual modeling, or methodological choices; use `omfa`
- narrative model documentation; use `document`
- methodological peer-review assessment; use `peer-review`
- HPC job design or performance tuning; use `hpc`
- distributed execution workflow design; use `ospool`

## Inputs

This skill works best with:

- an existing FAIR Management Plan, when this is an update rather than a first draft
- datasets and repositories
- computational models
- workflow descriptions
- notebooks
- simulation outputs
- metadata records
- persistent identifiers (DOIs, ORCID, ROR)
- repository URL or local repository path
- software title, version, and license
- primary language and packaging format
- dependency list, runtime, and environment details
- authors, ORCIDs, affiliations, and contributor roles
- release target, archive target, or citation target
- data and model dependencies with identifiers when available
- known provenance sources, build steps, and execution assumptions

If OMFA has already classified the model or provided methodological context in `artifacts/`, reuse that information instead of re-deriving it.

## Workflow

**Classify the stewardship task.** Classify the request as one or more of:

- planning a release, archival package, or other stewardship milestone
- refreshing metadata or citation files
- improving reproducibility or provenance
- organizing the repository for reuse
- checking packaging, portability, or environment capture
- disseminating a DMP or SMP from the FAIR Management Plan

If the request is really about scientific reasoning, model structure, or method choice, route to `omfa` instead.

**Inventory available FAIR research assets.** Inventory:

- software
- models
- datasets
- workflows
- documentation
- metadata
- provenance
- identifiers
- licenses

Separate observed facts from inferred assumptions. Mark missing information as `Unknown` rather than guessing. Write this inventory directly into the Research Object Inventory table in `fair-management-plan.md`, the table is the persisted form of this step, not a duplicate of it.

The Research Object Inventory is the canonical inventory of all managed research objects in the project. Every other FAIR artifact (`fair-assessment.md`, `provenance-manifest.json`, `license-inventory.md`, and any metadata records) should reference inventory entries by name or identifier rather than re-listing or re-describing them. If an artifact needs to say something about a research object that isn't in the inventory, add it to the inventory first.

Every managed research object MUST appear exactly once in the Research Object Inventory. Other FAIR artifacts reference inventory entries rather than redefining them. The Research Object Inventory contains research objects being stewarded, not the supporting FAIR artifacts used to describe or assess them.

**Choose the canonical metadata representation.** Choose canonical metadata appropriate for each artifact:

- Software: codemeta.json
- Citation: CITATION.cff
- Datasets: DataCite metadata
- Models: OMF metadata / model card
- Workflows: RO-Crate, WorkflowHub metadata, CWL metadata
- Repositories: README, LICENSE

Prefer community-adopted metadata standards whenever they exist. Only introduce project-specific metadata when existing standards are insufficient, and document the gap it fills and the standard it extends.

When metadata overlap across representations, identify the canonical metadata record for each artifact type and synchronize derived metadata from it. Call out inconsistencies and request human review. Do not maintain two independently edited metadata records describing the same research object.

**Produce FAIR stewardship artifacts.** Produce the minimum set of FAIR stewardship artifacts appropriate for the research objects present, whether or not the project has a release event.

- Software: codemeta.json, CITATION.cff, and optional Software Management Plan guidance when a project needs living process documentation
- Datasets: DataCite metadata, README
- Models: model card, OMF metadata, and a pointer to ODD/TRACE documentation where available
- Workflows: RO-Crate

Shape the recommendations to the primary research objects and intended reuse:

- Exploratory research: prioritize reproducibility and environment capture
- Reusable software or datasets: prioritize packaging, documentation, and API/format stability
- Computational models: prioritize parameterization, calibration/validation data, and provenance of derived results, alongside model card and OMF metadata
- Reference workflows: prioritize portability and machine-readable execution steps
- Long-lived infrastructure: prioritize robustness, governance, and maintenance

**Make portability and preservation explicit.** Document:

- installation
- execution
- workflows
- data dependencies
- model dependencies
- provenance, expressed using a documented provenance model where practical (e.g. W3C PROV-O, the RO-Crate provenance profile, or another domain-standard scheme) rather than free text
- identifiers
- archival locations
- preservation strategy
- interoperability limitations

**Check coherence before finalizing.** Verify that:

- names, versions, and licenses match across outputs
- author order and credit are consistent, and match the Roles and Responsibilities section of the FAIR Management Plan
- published or archived artifacts link back to the repository and version tag
- dependencies and environments are stated clearly enough for others to reproduce the work
- provenance is preserved for generated or derived artifacts
- unknowns are explicit and not silently filled in
- every research object has persistent identifiers where appropriate
- metadata are internally consistent
- provenance links all derived artifacts
- licenses are explicitly declared, use SPDX where possible, potential compatibility concerns are flagged, unresolved licensing questions are documented
- citation metadata are complete
- software, data, and models reference one another
- repositories expose machine-readable metadata
- any DMP or SMP in circulation still matches the FAIR Management Plan it was derived from

**Route adjacent work.**

- Scientific reasoning, conceptual modeling, or methodological decisions → `omfa`
- Narrative documentation, methods sections, OMF, or ODD documentation → `document`
- Publication-quality assessment or compliance review → `peer-review`
- Performance optimization or parallel execution → `hpc`

## When to Load References

Load the reference map first, then pull specific sources as needed:

- `references/README.md` for the reference map and file roles

Core FAIR literature (via the reference map):

- FAIR Principles: Wilkinson et al. (2016)
- FAIR Research Software: Barker et al. (2022), Chue Hong et al. (2022)
- Research Software Engineering: Wilson et al. (2014), Lemmen et al. (2024), Jiménez et al. (2017)
- Data stewardship: DataCite, RO-Crate
- Computational models: OMF, ODD, TRACE

Load additional material only when needed:

- `references/FAIR-RSE-CROSSWALK.md` when aligning FAIR4RS metadata, citation, packaging, and release sections
- `references/FAIR-RELEASE-REFRESH-POLICY.md` when checking refresh cadence and maintenance expectations
- `assets/FAIR-MP-TEMPLATE.md` when drafting or refreshing the living FAIR Management Plan
- `assets/DMP-TEMPLATE.md` when disseminating a funder-facing DMP from the FAIR Management Plan
- `assets/SMP-TEMPLATE.md` when disseminating a funder-facing SMP from the FAIR Management Plan

## Practical Outputs

All FAIR stewardship review artifacts generated by this skill MUST be stored under artifacts/fair/. Research-object metadata and other files that conventionally live with the research object SHOULD remain in their appropriate project location and be referenced from the FAIR Management Plan.

The FAIR Management Plan is the project's living stewardship document and MUST be maintained at `artifacts/fair/fair-management-plan.md`. Update it whenever research objects, metadata, repositories, identifiers, preservation strategies, or stewardship responsibilities change.

A DMP or SMP, when required by a funder, is a secondary dissemination artifact derived from the FAIR Management Plan, never drafted independently. Store it separately and note the exact FAIR-MP version and date it was derived from, so drift is detectable.

Depending on the task, generate or update one or more of the following under `artifacts/fair/`:

- `fair-management-plan.md`: **REQUIRED**
- FAIR metadata records appropriate to the research objects (e.g. `codemeta.json`, `CITATION.cff`, DataCite metadata, RO-Crate metadata)
- `fair-assessment-report.md`: generate for project-level FAIR assessments or stewardship reviews; not required for narrow metadata, citation, or packaging tasks. Assess FAIR status per research object, not per project; a single project routinely has FAIR software alongside non-FAIR datasets and draft workflows, and each needs its own status. Reflect the current status of each object in a status column on the Research Object Inventory table, and use this file for the backing detail (what's missing, what's planned) behind each status. Update both together.
- `provenance-manifest.json`
- `license-inventory.md`
- `stewardship-checklist.md` — a general readiness checklist for whatever milestone applies (release, archival deposit, or ongoing curation); rename to `release-checklist.md` only for projects where a software release is specifically the milestone in question
- `dmp.md` or `smp.md` — only when a funder requires it, derived from `assets/DMP-TEMPLATE.md`

## Citation

### Research Object Citation
- Cite each research object (e.g., software, data, models, workflows, publications) as a distinct scholarly output.
- List only contributors to the cited object as its authors/creators.
- Cite related research objects separately.
- Explicitly describe relationships (e.g., "implements", "derived from", "extends", "replicates", "uses", or "documents").
- Include an appropriate persistent identifier (DOI, SWHID, trusted repository identifier), version, title, publisher/repository, and license where applicable.
- Document provenance, including transformations, assumptions, and modifications.
- Prefer community citation metadata standards (e.g., CITATION.cff, CodeMeta, DataCite).
- Follow the applicable FORCE11 citation principles.

### Software Citation
- List only software contributors as software authors; direct metadata should be specific to the software itself.
- Use `references` for prior work that the research object implements, derives from, extends, or depends on. Use `preferred-citation` only to redirect citation to an equivalent scholarly description of the same research object (for example, a software paper or data descriptor authored by the creators of that object).
- Include version, repository, and commit hash, release, or SWHID.
- Cite publications describing implemented methods, algorithms or models separately.
- Explicitly state the relationship (e.g., "independent implementation of", "replication of", or "based on").
- Include version, persistent identifier (DOI preferred), repository URL, and commit hash where applicable.
- Follow the FORCE11 Software Citation Principles.

### Data Citation
- List only data contributors as dataset creators.
- Include dataset version or snapshot and repository.
- Cite publications describing or analyzing the dataset separately.
- Record processing and derivation history.

### Model Citation

- If citing a computational model specification, credit the model authors.
- If citing an implementation, credit the software authors separately.
- State whether the implementation reproduces, extends, or deviates from the original model.

## Gotchas

- treating FAIR as only metadata instead of stewardship, interoperability, preservation, and reuse
- mixing scientific reasoning into software engineering guidance
- letting `CITATION.cff` drift away from `codemeta.json`
- omitting dependency pins, environment details, or external service assumptions
- describing intended behavior instead of the implemented packaging or dissemination path
- leaving provenance implicit for generated files, data products, or archived artifacts
- drafting a DMP or SMP directly instead of deriving it from the FAIR Management Plan, letting the two diverge
