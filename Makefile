# vim: set ft=make ts=8 noet
# Variables
# UNAME		:= $(shell uname -s)
.EXPORT_ALL_VARIABLES:

.PHONY: help
help:
ifeq ($(UNAME), Linux)
	@grep -P '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
else
	@awk -F ':.*###' '$$0 ~ FS {printf "%15s%s\n", $$1 ":", $$2}' \
		$(MAKEFILE_LIST) | grep -v '@awk' | sort
endif

# Targets
.PHONY: debug
debug:	### Debug Makefile itself
	@echo $(UNAME)

.PHONY: build
build: ### Build go project into a binnary file
	go build -v -a -o ./src/target/bin/hello ./src

.PHONY: run
run:	### Run the go application
	@go run ./src

.PHONY: test
test:	### Run all tests
	go test ./src/pkg/... -v -race -count=1

.PHONY: lint
lint:	### Run go linter
	golangci-lint run ./src/...

.PHONY: install
install:	### Install dependencies
	go mod download
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

# Flatpak commands
.PHONY: flatpak.build
flatpak.build:	### Build
	flatpak-builder --force-clean --user --repo=repo builddir org.senonide.gonome.yml

.PHONY: flatpak.install
flatpak.install:	### Build
	flatpak-builder --force-clean --user --repo=repo --install builddir org.senonide.gonome.yml

.PHONY: flatpak.bundle
flatpak.bundle:	### Build flatpak bundle
	flatpak-builder --force-clean --user --repo=repo builddir org.senonide.gonome.yml
	flatpak build-bundle repo gonome.flatpak org.senonide.gonome --runtime-repo=https://flathub.org/repo/flathub.flatpakrepo

.PHONY: flatpak.remove
flatpak.remove:	### Remove flatpak installation
	flatpak remove org.senonide.gonome -y

.PHONY: flatpak
flatpak:	### Build flatpak bundle and install it
	flatpak-builder --force-clean --user --repo=repo builddir org.senonide.gonome.yml
	flatpak build-bundle repo gonome.flatpak org.senonide.gonome --runtime-repo=https://flathub.org/repo/flathub.flatpakrepo
	flatpak install --user gonome.flatpak -y

.PHONY: flatpak.run
flatpak.run:	### Run the flatpak installed app
	flatpak run org.senonide.gonome
