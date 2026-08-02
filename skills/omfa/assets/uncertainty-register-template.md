# Uncertainty Register (Guidance Template)

This register is a **living artifact**. Create it early and revise it whenever assumptions, calibration, model structure, scenarios, input data, or supporting evidence change. It is a structured record of uncertainties that could materially affect model interpretation, evaluation, or decision support.

Entries should reference supporting analyses (e.g., sensitivity analysis, calibration notes, scenario design documents) rather than duplicating them. For detailed uncertainty characterization or decision making under deep uncertainty, see `references/guidance/uncertainty.md` and `references/guidance/deep-uncertainty.md`.

---

## 1. Parameter Uncertainty

**Goal:** Distinguish between "we don't know the value" (epistemic) and "the value varies naturally" (aleatory).

**Questions to Consider:**
1. Identify parameters, stochastic inputs, or rule parameters whose uncertainty could materially influence model behavior or interpretation.
2. Document the evidence supporting the parameter value (e.g., empirical measurement, literature, expert judgment, placeholder assumption) and explain any remaining uncertainty.
3. Describe how errors in this parameter could affect model conclusions, citing supporting sensitivity analyses where available.
4. Note whether the uncertainty is reducible with more evidence or irreducible variability.

**Example:**
- **Parameter:** `infection_rate_beta`
- **Value:** 0.25 (Source: Smith et al. 2023)
- **Confidence:** Medium.
- **Note:** Based on a different climate zone; may require local calibration. High sensitivity: small changes significantly shift the epidemic peak.

---

## 2. Structural Uncertainty

**Goal:** Justify the "map" you chose to represent the "territory."

**Questions to Consider:**
1. List the primary mechanisms and relationships implemented.
2. Identify the **"road not taken"**: what alternative structures or mechanisms were considered and rejected?
3. Explain the trade-off: why is the current structure fit-for-purpose despite the omission?
4. Note any omitted mechanism whose absence could invalidate conclusions under specific conditions.

**Example:**
- **Mechanism:** Linear decay of agent energy.
- **Alternative:** Sigmoidal decay.
- **Justification:** Linear decay is computationally efficient and sufficient for the current time-scale; sigmoidal behavior only emerges at extremes not relevant to this research question.

---

## 3. Scenario Uncertainty

**Goal:** Prevent "over-precision" in forecasting by documenting the fragility of future assumptions.

**Questions to Consider:**
1. Define the baseline scenario and its key assumptions.
2. Identify **external developments, scenario assumptions, or plausible changes** that would invalidate the baseline. Do not rely on "black swan" framing; focus on assumptions that are empirically or logically contestable.
3. Map these developments to specific model inputs, parameters, or mechanisms.
4. Note whether the scenario uncertainty can be characterized probabilistically or should be treated as deep uncertainty (see `references/guidance/deep-uncertainty.md`).

**Example:**
- **Driver:** Sudden regulatory change in carbon pricing.
- **Impact:** Would shift the `economic_incentive` parameter from 0.1 to 0.8, potentially flipping the model's predicted equilibrium.

---

## 4. Data Limitations

**Goal:** Make explicit how input and observational data constrain or weaken model claims.

**Questions to Consider:**
1. What datasets, measurements, or observations feed the model?
2. What are their spatial, temporal, or population coverage limits?
3. What preprocessing, imputation, harmonization, or quality-control choices were made?
4. How might measurement error, missingness, sampling bias, or representativeness gaps affect results?
5. Document the **consequence of being wrong**: if a key data assumption fails, which conclusions become unreliable?
6. Distinguish between uncertainty arising from the data and uncertainty introduced during preprocessing or transformation.

**Example:**
- **Dataset:** Regional census counts used to initialize agent populations.
- **Limitation:** Five years old; does not capture recent displacement.
- **Consequence:** If the actual population distribution has shifted, spatial clustering and contact patterns may be misrepresented.

---

## 5. Calibration Ambiguity & Equifinality

**Goal:** Admit when different parameter combinations produce indistinguishable results.

**Questions to Consider:**
1. Check whether multiple parameter sets produce similar acceptable outputs (equifinality).
2. If yes, document why the chosen set is the most scientifically plausible.
3. Identify calibration targets or metrics that were unable to discriminate among alternatives.
4. Note what additional evidence would reduce this ambiguity.

**Example:**
- **Observation:** Both high `migration_rate` + low `birth_rate` AND low `migration_rate` + high `birth_rate` produce the same population curve.
- **Resolution:** Chose the former based on census data showing high regional mobility.

---

## 6. Interpretation Guidance (Key Caveats)

**Goal:** Translate the uncertainties above into clear, actionable limits on how results should be interpreted.

**Questions to Consider:**
1. Given the uncertainties documented above, what is the **one thing** a reader or user must be cautious about when interpreting the results?
2. Under what conditions are the results most reliable? When should they not be used?
3. Which uncertainties are most consequential for the specific claims being made?
4. Where should readers look for supporting analyses (sensitivity analysis, calibration notes, scenario exploration) instead of finding those details duplicated here?
5. Which conclusions remain robust despite these uncertainties?

**Example:**
"The model is highly sensitive to `initial_seed_density`. Results should be interpreted as 'possible trajectories' rather than 'predicted outcomes' unless the seed density is empirically verified."

---

**References:**
- `references/guidance/uncertainty.md`
- `references/guidance/deep-uncertainty.md`
