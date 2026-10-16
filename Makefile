# SPDX-FileCopyrightText: 2026 Magnopus LLC
# SPDX-License-Identifier: GPL-3.0-or-later

# One entry point for checks, shared by people, agents and CI.
#   make check   fast, no Blender needed: lint, licensing, version, result schema
#   make test    end-to-end pipeline test + result-schema validation (needs Blender or the bpy wheel)
#   make build   installable zip in dist/
#
# Tool versions are pinned to match CI. Override to use local installs:
#   make check RUFF=ruff REUSE=reuse

RUFF    ?= pipx run ruff==0.16.8
REUSE   ?= pipx run reuse==6.2.0
PYTHON  ?= python3
BLENDER ?= blender

.PHONY: help check lint reuse version schema test build clean

help:
	@sed -n 's/^#   //p' $(MAKEFILE_LIST)

check: lint reuse version schema

lint:
	$(RUFF) check $(RUFF_FLAGS) .

reuse:
	$(REUSE) lint
	cmp LICENSES/GPL-3.0-or-later.txt LICENSE
	cmp LICENSES/GPL-3.0-or-later.txt smart_retopo/LICENSE

version:
	$(PYTHON) tests/ci/check_version.py $(TAG)

schema:
	$(PYTHON) tests/ci/check_result_schema.py

# Uses Blender if it is on PATH (or BLENDER is set), else the bpy wheel (pip install bpy).
test:
	@if command -v $(BLENDER) >/dev/null 2>&1; then \
	  $(BLENDER) -b --factory-startup --python-exit-code 1 -P tests/test_pipeline.py; \
	else \
	  $(PYTHON) tests/test_pipeline.py; \
	fi
	$(PYTHON) tests/ci/check_result_schema.py tests/_output/result.json tests/_output/result_low_poly.json

build:
	./scripts/build.sh

clean:
	rm -rf dist tests/_output
