.PHONY: chart  tag is_dirty
SHELL := /bin/bash -o pipefail
VERSION = $(shell git describe --tags --abbrev=0)
NEXT_VERSION = $(shell scripts/semver bump ${step} ${VERSION})

all:
	@echo "Please read this file !"

is_dirty:
	@git diff --cached --quiet --exit-code || (echo "Master in dirty state !!" && exit 1)

tag: is_dirty
	@echo "Current version: ${VERSION}"
	@echo "Next version: ${NEXT_VERSION}"
	git tag -a ${NEXT_VERSION} -m '${step} bump to v${NEXT_VERSION}'
