IMAGE ?= kaigara/postfix
TAG   ?= $(shell git describe --tags --abbrev=0 2>/dev/null || echo "dev")

.PHONY: build

build:
	@echo "Building $(IMAGE):$(TAG)"
	@docker build -t "$(IMAGE):$(TAG)" .
