# ---- config ----
PYTHON ?= python3
SCRIPTS := scripts
EVALS := evals

CROSS_EVAL := $(EVALS)/cross-skills.json
TOOLS_RUN := docker compose run --rm --entrypoint python3 tools

# ---- default ----
.PHONY: all
all: validate-evals cross validate-skills

# ---- combined validation ----
.PHONY: validate
validate: validate-skills validate-evals cross

# ---- individual skills validation ----
.PHONY: validate-skills
validate-skills:
	@$(TOOLS_RUN) $(SCRIPTS)/validate_individual_skills.py

# ---- schema validation ----
.PHONY: validate-evals
validate-evals:
	@$(TOOLS_RUN) $(SCRIPTS)/validate_evals_schema.py

# ---- cross-skill evals ----
.PHONY: cross
cross:
	@$(TOOLS_RUN) $(SCRIPTS)/validate_cross_skills.py $(CROSS_EVAL)

# ---- per-skill evals (placeholder) ----
# assumes future runner like: run_skill_evals.py <skill>
SKILLS := document fair hpc ospool peer-review

.PHONY: skills
skills: $(SKILLS)

.PHONY: $(SKILLS)
$(SKILLS):
	@echo "Running evals for $@"
	$(PYTHON) $(SCRIPTS)/run_skill_evals.py $@

# ---- aggregate report ----
.PHONY: report
report:
	@$(TOOLS_RUN) $(SCRIPTS)/aggregate_failures.py

# ---- full pipeline ----
.PHONY: full
full: validate-evals cross report

# ---- CI Pipeline ----
.PHONY: ci
ci:
	@echo "=== Running CI pipeline ==="
	$(MAKE) lint
	$(MAKE) validate-evals
	$(MAKE) cross
	$(MAKE) report
	@echo "=== CI completed ==="

# ---- markdown lint globs ----
LINT_GLOBS := docs/agent-skills-creation-reference.md docs/SKILL-TEMPLATE.md docs/SKILLS-ASSESSMENT.md docs/VALIDATION.md docs/data-analysis-skills.md docs/roadmap.md

format:
	docker compose run --rm tools \
		'prettier --write **/*.{md,json}'

lint:
	docker compose run --rm tools \
		'markdownlint-cli2 $(LINT_GLOBS)'

.PHONY: lint-all
lint-all:
	docker compose run --rm tools \
		'markdownlint-cli2 **/*.md'
