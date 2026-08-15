# Parallel Execution Guidance

Use this reference when implementation may use parallelism, job arrays, parameter sweeps, or distributed execution.

## Decision Framework

1. **Identify parallelizable work.** Is the parallelism across independent runs (embarrassingly parallel), across agents (shared memory), or across model partitions (distributed)?
2. **Choose the simplest correct pattern.** Prefer independent runs with no communication when possible. Avoid shared mutable state.
3. **Preserve reproducibility.** Parallel execution can change result ordering, RNG streams, and numerical reductions. Document how nondeterminism is controlled.

## Common Patterns

| Pattern | When to Use | Caution |
| ------- | ----------- | ------- |
| Parameter sweep | Many independent configurations | Ensure seeds differ or are deliberately shared |
| Ensemble runs | Statistical sampling across replicates | Aggregate outputs, not individual trajectories |
| Agent parallelism | Large agent populations | Race conditions can alter dynamics |
| Domain decomposition | Spatial or network models | Boundary-condition errors at partitions |

## Implementation Rules

- Separate the parallelization harness from the scientific model.
- Make the model code runnable serially for debugging and verification.
- Collect provenance for each run (seed, parameters, environment).
- Route platform-specific submission to the `hpc` or `ospool` skills; OMFB owns the model's parallel structure, not the cluster batch script.

## Testing

- Verify correctness on a single process first.
- Compare parallel output against serial output for identical seeds and parameters.
