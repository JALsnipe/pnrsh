GOOS            := $(shell go env GOOS)
PKG             := pnrsh
DEST            ?= .
DEV_TARGETS     := pnrsh

default: all

all: $(DEV_TARGETS)

.PHONY: build
build: pnrsh

.PHONY: pnrsh
pnrsh: clean
	GOOS=$(GOOS) go build -v -o $(DEST)/$(PKG) ./cmd

.PHONY: clean
clean: ## Cleans go and generated files
	go clean
	@rm -rf $(DEV_TARGETS)
