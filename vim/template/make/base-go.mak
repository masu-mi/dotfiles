NAME := {{_input_:name}}
VERSION := v0.0.1
COMMIT := $(shell git rev-parse HEAD)
DATE := $(shell date "+%Y-%m-%dT%H:%M:%S%z")

SRCS     := $(shell find . -type f -name '*.go')
LDFLAGS  := -ldflags="-s -w -X \"main.version=$(VERSION)\" -X \"main.commit=$(COMMIT)\" -X \"main.date=$(DATE)\" -extldflags -static"
NOVENDOR := $(shell go list ./... | grep -v vendor)

export GO111MODULE=on

.DEFAULT_GOAL := bin/$(NAME)

bin/$(NAME): $(SRCS)
	go build $(LDFLAGS) -o bin/$(NAME)

.PHONY: ci-test
ci-test:
	go test -coverpkg=./... -coverprofile=coverage.txt -v ./...

.PHONY: clean
clean:
	rm -rf bin/*
	rm -rf dist/*
	rm -rf vendor/*

.PHONY: fast
fast:
	go build $(LDFLAGS) -o bin/$(NAME)

.PHONY: cross-build
cross-build:
	for os in darwin linux windows; do \
		for arch in amd64 386; do \
			GOOS=$$os GOARCH=$$arch CGO_ENABLED=0 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o dist/$$os-$$arch/$(NAME); \
		done; \
	done

dist/linux-amd64/$(NAME): cross-build

DOCKER_REPOSITORY := {{_input_:repository}}
ifeq ($(DOCKER_REPOSITORY),)
DOCKER_IMAGE_NAME := {{_input_:image_name}}
else
	DOCKER_IMAGE_NAME := $(DOCKER_REPOSITORY)/{{_input_:image_name}}
endif

DOCKER_IMAGE_TAG  ?= latest
DOCKER_IMAGE      := $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)

.PHONY: docker-build
docker-build: dist/linux-amd64/$(NAME)
ifeq ($(findstring ELF 64-bit LSB,$(shell file dist/linux-amd64/$(NAME) 2> /dev/null)),)
	@echo $(findstring ELF 64-bit LSB,$(shell file dist/linux-amd64/$(NAME) 2> /dev/null))
	@echo "dist/linux-amd64/$(NAME) is not a Linux 64bit binary."
	@exit 1
endif
	docker build -t $(DOCKER_IMAGE) .

.PHONY: install
install:
	go install $(LDFLAGS)

.PHONY: test
test:
	go test -cover -v $(NOVENDOR)
