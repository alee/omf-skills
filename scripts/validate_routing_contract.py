#!/usr/bin/env python3
import json
import sys
from pathlib import Path

try:
    import jsonschema
    from jsonschema import validate, ValidationError

    HAS_JSONSCHEMA = True
except ImportError:
    HAS_JSONSCHEMA = False

ROOT = Path("skills")
SCHEMA_PATH = Path("schemas/routing-schema.json")


def validate_routing_records(root: Path):
    errors = []
    checked = 0

    schema_data = None
    if HAS_JSONSCHEMA and SCHEMA_PATH.exists():
        schema_data = json.loads(SCHEMA_PATH.read_text())

    for skill_dir in sorted(root.iterdir()):
        if not skill_dir.is_dir():
            continue
        evals_path = skill_dir / "evals.json"
        if not evals_path.exists():
            continue

        try:
            data = json.loads(evals_path.read_text())
        except json.JSONDecodeError:
            continue

        for eval_case in data.get("evals", []):
            routing = eval_case.get("routing")
            if not routing:
                continue

            checked += 1
            if HAS_JSONSCHEMA and schema_data:
                try:
                    validate(instance=routing, schema=schema_data)
                except ValidationError as e:
                    errors.append(
                        f"{skill_dir.name}: eval {eval_case.get('id')} - {e.message}"
                    )
            else:
                # Fallback basic validation
                if routing.get("outcome") not in {"continue", "route", "block"}:
                    errors.append(
                        f"{skill_dir.name}: eval {eval_case.get('id')} has invalid outcome"
                    )
                if not isinstance(routing.get("from", []), list):
                    errors.append(
                        f"{skill_dir.name}: eval {eval_case.get('id')} has non-list from"
                    )
                if not isinstance(routing.get("reason"), str):
                    errors.append(
                        f"{skill_dir.name}: eval {eval_case.get('id')} has missing reason"
                    )

    if checked == 0:
        print("No routing records found to validate")
        return 0

    if errors:
        for err in errors:
            print(f"❌ {err}")
        return 1

    print(
        f"Validated {checked} routing records"
        + (" (using jsonschema)" if HAS_JSONSCHEMA else " (basic fallback)")
    )
    return 0


if __name__ == "__main__":
    root = Path(sys.argv[1]) if len(sys.argv) > 1 else ROOT
    if not root.exists():
        print("skills directory missing")
        sys.exit(1)
    sys.exit(validate_routing_records(root))
