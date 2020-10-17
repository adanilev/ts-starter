# these should change
IMAGE_NAME		:= ts-starter
LABEL_PREFIX	:= com.adanilev.ts-starter

# these should stay the same
IMAGE_TAG					?= local
IMAGE_NAME_TAGGED := $(IMAGE_NAME):$(IMAGE_TAG)
CREATED						:= $(shell date --rfc-3339=seconds)
AUTHORS						:= $(shell node -e 'console.log(require("./package.json").author)')
SOURCE_URL				:= $(shell node -e 'console.log(require("./package.json").repository)')
VERSION						:= $(shell node -e 'console.log(require("./package.json").version)')
REVISION					:= $(shell git rev-parse HEAD)
LICENSES					:= $(shell node -e 'console.log(require("./package.json").license)')

.PHONY: build
build: ## Build an image tagged with "local". Set IMAGE_TAG environment variable when releasing
	DOCKER_BUILDKIT=1 docker build \
		--label "$(LABEL_PREFIX).image.created=$(CREATED)" \
		--label "$(LABEL_PREFIX).image.authors=$(AUTHORS)" \
		--label "$(LABEL_PREFIX).image.source=$(SOURCE_URL)" \
		--label "$(LABEL_PREFIX).image.version=$(VERSION)" \
		--label "$(LABEL_PREFIX).image.revision=$(REVISION)" \
		--label "$(LABEL_PREFIX).image.licenses=$(LICENSES)" \
		--tag $(IMAGE_NAME_TAGGED) \
		--target final \
		.

.PHONY: lint
lint: ## Lint
	DOCKER_BUILDKIT=1 docker build \
		--tag $(IMAGE_NAME):lint \
		--target lint \
		.
	docker image rm $(IMAGE_NAME):lint

.PHONY: unit-test
unit-test: ## Run unit-tests
	DOCKER_BUILDKIT=1 docker build \
		--progress plain \
		--tag $(IMAGE_NAME):unit-test \
		--target unit-test \
		.
	docker image rm $(IMAGE_NAME):unit-test

.PHONY: integration-test
integration-test: ## Run integration tests
	DOCKER_BUILDKIT=1 docker build \
		--progress plain \
		--tag $(IMAGE_NAME):integration-test \
		--target integration-test \
		.
	docker image rm $(IMAGE_NAME):integration-test

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'