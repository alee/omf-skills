# ---- config ----
PYTHON ?= python3
SCRIPTS := scripts
EVALS := evals

CROSS_EVAL := $(EVALS)/cross-skills.json
TOOLS_RUN := docker compose run --rm --entrypoint python3 tools
TOOLS_EXEC := docker compose run --rm tools

# ---- default ----
.PHONY: all
all: help

# ---- help ----
.PHONY: help
help:
	@echo "OMF Skills repository — supported make targets"
	@echo ""
	@echo "  make help              Show this help message"
	@echo "  make validate          Run the canonical repository validation suite (CI-equivalent)"
	@echo "  make container-validate  Run the full validation suite inside the supported container"
	@echo "  make test              Run repository tests / evals only (no lint or format)"
	@echo "  make lint              Run static analysis (markdown lint)"
	@echo "  make format            Apply repository formatting (prettier on md/json)"
	@echo "  make clean             Remove generated artifacts"
	@echo "  make report            Aggregate failure report from evals"
	@echo ""
	@echo "Prefer these targets over invoking docker, python, pytest, npm, etc. directly."

# ---- canonical validation ----
# make validate is the single obvious entry point. It runs the same checks as CI.
.PHONY: validate
validate: container-validate

# ---- containerized validation ----
# Authoritative, CI-equivalent validation runs inside the supported container.
.PHONY: container-validate
container-validate:
	@echo "=== Running containerized validation ==="
	@$(MAKE) lint
	@$(MAKE) test
	@echo "=== Container validation completed ==="

# ---- tests (no lint, no format) ----
.PHONY: test
test: validate-evals cross validate-skills

# ---- individual validation targets ----
.PHONY: validate-skills
validate-skills:
	@$(TOOLS_RUN) $(SCRIPTS)/validate_individual_skills.py

.PHONY: validate-evals
validate-evals:
	@$(TOOLS_RUN) $(SCRIPTS)/validate_evals_schema.py

.PHONY: cross
cross:
	@$(TOOLS_RUN) $(SCRIPTS)/validate_cross_skills.py $(CROSS_EVAL)

# ---- per-skill evals (placeholder) ----
SKILLS := document fair hpc omfa ospool peer-review

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

# ---- full pipeline (legacy alias, same as validate) ----
.PHONY: full
full: validate

# ---- CI Pipeline (legacy alias, same as validate) ----
.PHONY: ci
ci: validate

# ---- formatting ----
.PHONY: format
format:
	$(TOOLS_EXEC) 'prettier --write *.md **/*.{md,json}'

# ---- linting ----
LINT_GLOBS := docs/agent-skills-creation-reference.md docs/SKILL-TEMPLATE.md docs/SKILLS-ASSESSMENT.md docs/VALIDATION.md docs/data-analysis-skills.md docs/roadmap.md

.PHONY: lint
lint:
	$(TOOLS_EXEC) 'markdownlint-cli2 $(LINT_GLOBS)'

.PHONY: lint-all
lint-all:
	$(TOOLS_EXEC) 'markdownlint-cli2 **/*.md'

# ---- clean ----
.PHONY: clean
clean:
	@rm -f results_cross.json
	@find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	@find . -type f -name '*.pyc' -delete 2>/dev/null || true
	@echo "Cleaned generated artifacts"
