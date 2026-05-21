# ---- config ----
PYTHON ?= python3
SCRIPTS := scripts
EVALS := evals

CROSS_EVAL := $(EVALS)/cross-skills.json

# ---- default ----
.PHONY: all
all: validate-evals cross validate-skills

# ---- individual skills validation ----
.PHONY: validate-skills
validate-skills:
	$(PYTHON) $(SCRIPTS)/validate_individual_skills.py

# ---- schema validation ----
.PHONY: validate-evals
validate-evals:
	$(PYTHON) $(SCRIPTS)/validate_evals_schema.py

# ---- cross-skill evals ----
.PHONY: cross
cross:
	$(PYTHON) $(SCRIPTS)/validate_cross_skills.py $(CROSS_EVAL)

# ---- per-skill evals (placeholder) ----
# assumes future runner like: run_skill_evals.py <skill>
SKILLS := document fair4rs hpc ospool peer-review

.PHONY: skills
skills: $(SKILLS)

.PHONY: $(SKILLS)
$(SKILLS):
	@echo "Running evals for $@"
	$(PYTHON) $(SCRIPTS)/run_skill_evals.py $@

# ---- aggregate report ----
.PHONY: report
report:
	$(PYTHON) $(SCRIPTS)/aggregate_failures.py

# ---- full pipeline ----
.PHONY: full
full: validate-evals cross report

# ---- CI Pipeline ----
.PHONY: ci
ci:
	@echo "=== Running CI pipeline ==="
	$(MAKE) validate-evals
	$(MAKE) cross
	$(MAKE) report
	@echo "=== CI completed ==="

# ---- format JSON files ----
format-json:
	@find . -type f -name "*.json" \
		-not -path "./node_modules/*" \
		-not -path "./.git/*" | while read -r file; do \
			tmp="$$(mktemp)"; \
			if jq . "$$file" > "$$tmp"; then \
				mv "$$tmp" "$$file"; \
				echo "formatted $$file"; \
			else \
				echo "invalid json: $$file"; \
				rm -f "$$tmp"; \
				exit 1; \
			fi; \
		done

# ---- format Markdown files ----
.PHONY: format-md
format-md:
	find . -type f -name "*.md" -exec prettier --write {} \; -exec echo "Formatted {}" \;

# ---- format all ----
.PHONY: format
format: format-json format-md

# ---- run formatter in container ----
.PHONY: dc-format
dc-format:
	docker compose run --rm formatter
