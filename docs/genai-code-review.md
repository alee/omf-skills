## Calibrating trust in genAI-generated code by language

*Reviewer guidance, not a scorecard. Reflects Claude Sonnet 5 and ChatGPT 5.6 Sol self-reflection as of August 2026. Regenerate periodically, as this will drift as models evolve.*

Like much in life, the risk with genAI code isn't a binary "trust it / don't." Instead consider: what class of mistake does this language's tooling catch before you ever run the code, and what's left over for you to catch?

| Language | Typical failure mode | Watch for | Why |
|---|---|---|---|
| **Python** | Usually runtime-visible, but logic/data errors can be silent | Shape/broadcasting errors, pandas index/axis alignment, mutation/aliasing, `None`/missing data, exception swallowing, library API misuse | Syntax and common idioms are generally strong; review should concentrate on semantics, data assumptions, and library behavior. |
| **R** | Silent or plausible-but-wrong results are relatively common | Vector recycling, `NA` handling, implicit coercion, factor/category behavior, dimensional dropping, base R/tidyverse semantic differences | Permissive vectorized semantics can let malformed analysis run successfully. Validate dimensions, missing-data behavior, and statistical intent. |
| **Julia** | Mixed correctness and performance failures | Type instability, dimensions/broadcasting, mutation conventions, multiple-dispatch edge cases, package-specific APIs | Core language and numerical patterns are generally reliable, but ecosystem-specific idioms and APIs deserve verification against current docs. |
| **Rust** | Many structural/memory errors are compile-time loud; logic errors remain silent | Excessive `clone()`, unnecessary `Arc<Mutex<_>>`, async cancellation/lifetimes, error handling, `unsafe`, crate-version/API mismatch | Ownership and type checking eliminate many C/C++ failure modes before runtime. Successful compilation still does not establish algorithmic correctness. |
| **TypeScript / JavaScript** | TypeScript catches many structural errors, but runtime boundary errors remain silent | `any`, type assertions, unchecked JSON/API inputs, `undefined`/`null`, async behavior, JavaScript coercion, stale framework APIs | TypeScript can provide strong local guarantees while external data and assertions bypass them. Treat runtime validation separately from static typing. |
| **C** | Silent failures can be severe | Buffer bounds, pointer lifetime, allocation ownership, integer overflow, uninitialized memory, undefined behavior | Few language-level safety guarantees prevent invalid programs from compiling. Use warnings, sanitizers, static analysis, and careful boundary review. |
| **C++** | Mixed compile-time failures and subtle runtime/UB failures | Object/reference lifetimes, ownership, iterator invalidation, concurrency, undefined behavior, template complexity, raw-pointer boundaries | Modern RAII and containers reduce risk substantially, but lifetime and UB errors can remain difficult to detect through casual testing. |
| **Fortran** | Numerical/array errors can produce plausible results | Array bounds and shapes, implicit typing in legacy code, precision/kind selection, indexing, column-major assumptions, aliasing, legacy/new-standard mixing | Strong numerical conventions help, but scientific correctness and interactions with legacy Fortran require careful review. Compile with strict warnings and runtime checks during development. |
| **Java** (incl. NetLogo/Repast/MASON-adjacent code) | Mostly compile-time/runtime-visible; concurrency and semantic errors remain silent | Concurrency, resource lifecycle, nullability, generic/type-erasure boundaries, newer language features, framework/API version mismatch | Static typing catches many structural mistakes. Residual risk concentrates in application logic, concurrency, and rapidly evolving APIs. |

**General rule of thumb:** stronger static checking eliminates some classes of
generated mistakes before runtime, reducing review burden for those failure
modes. It does not validate program intent, algorithmic correctness, numerical
assumptions, or domain semantics. In permissive or memory-unsafe languages,
more defects can survive compilation or execution, so tests and domain review
carry more of the burden.

**Four risk categories require different responses:**
- **Language/runtime risk** — memory safety, coercion, array semantics, nullability,
  concurrency, and other hazards determined partly by the language/runtime.
  Counter with compiler checks, sanitizers, static analysis, tests, and targeted review.
- **Knowledge-recency risk** — generated code may use stale package APIs or
  recently changed language features, independent of ecosystem size. Verify
  against current documentation, especially for fast-moving APIs.
- **Ecosystem-coverage risk** — proficiency in a host language does not imply
  equivalent proficiency with a particular framework. Smaller or specialized
  ecosystems may be less represented in training data, increasing the
  likelihood of plausible but nonexistent APIs, outdated idioms, and incorrect
  framework lifecycle assumptions. Review framework-specific code against the
  documentation for the exact version in use. See the framework table below
  for a per-framework breakdown.
- **Domain-semantic risk** — code may compile, run, and produce plausible output
  while implementing the wrong algorithm, model, units, statistical procedure,
  security policy, or scientific assumption. Strong typing does not eliminate
  this; domain tests and expert review are required.

Calibrate the above against what you find yourself steering the models against over time. We believe the categories are durable but the specific risk level per language/model pair will change as foundation models and coding agents improve.

## Framework and ecosystem confidence

Language proficiency does not imply equal proficiency across frameworks built
on that language. Framework risk is generally more sensitive to training-data
coverage, API churn, version differences, and the size of the user community.
"Relative confidence" below is a proxy for training-data and community size,
not a measured accuracy score — treat it the same way as the language table:
a starting prior to check against what your reviewers actually find.

| Framework | Ecosystem | Relative confidence | Review emphasis |
|---|---|---|---|
| **NetLogo** | NetLogo/JVM | High | Model semantics, scheduling, BehaviorSpace, extension APIs |
| **Mesa** | Python | High | Version-specific APIs (2.x vs 3.x breaking changes), schedulers, visualization, model/agent lifecycle |
| **AgentPy** | Python | Moderate | API correctness, experiment infrastructure, version compatibility |
| **Agents.jl** | Julia | Moderate | Current API, scheduler/model conventions, DataFrames integration, performance idioms |
| **MASON** | Java | Moderate | Framework idioms, scheduling, visualization separation, older API conventions |
| **Repast Simphony** | Java | Moderate | Framework configuration, scheduling, visualization/deployment separation, older API conventions |
| **Repast4Py** | Python | Low–Moderate | Smaller community and training-data footprint than Simphony; verify API against current docs rather than fluency, MPI/parallel-execution conventions |

A generated snippet that mixes conventions from two frameworks in the same
ecosystem (e.g. Repast Simphony scheduling patterns applied to a Repast4Py
import) is itself a failure mode worth watching for, distinct from either
framework's individual risk profile.
