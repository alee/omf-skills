#!/usr/bin/env python3

import json
import sys
from pathlib import Path

import jsonschema

SCHEMA_PATH = Path("evals/schema/schema.json")


def load_schema():
    return json.loads(SCHEMA_PATH.read_text())


def validate_file(path, schema):
    try:
        data = json.loads(path.read_text())
    except json.JSONDecodeError as e:
        print(f"❌ {path} invalid JSON")
        print(f"   → {e.msg} (line {e.lineno}, column {e.colno})")
        return False

    try:
        jsonschema.validate(instance=data, schema=schema)
        print(f"✅ {path} valid")
    except jsonschema.ValidationError as e:
        print(f"❌ {path} invalid")
        print(f"   → {e.message}")
        return False

    return True


def main():
    schema = load_schema()
    has_errors = False

    # validate all evals.json in skills/
    for path in Path("skills").rglob("evals.json"):
        if not validate_file(path, schema):
            has_errors = True

    # validate cross-skill evals
    for path in Path("evals").glob("*.json"):
        if not validate_file(path, schema):
            has_errors = True

    if has_errors:
        sys.exit(1)


if __name__ == "__main__":
    main()
