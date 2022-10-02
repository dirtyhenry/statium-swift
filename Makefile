prefix ?= /usr/local
bindir = $(prefix)/bin

packageName = Statium

help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

open: ## Open the project in Xcode
	open Package.swift

build: ## Build the project in debug confiration
	swift build

buildr: ## Build the project in release configuration
	swift build -c release

test: ## Run tests
	swift test

format: ## Format the code with swiftformat and swiftlint (read-write)
	swiftformat --verbose .
	swiftlint lint --autocorrect .
	
lint: ## Lint the code with swiftformat and swiftlint (read-only)
	swiftformat --lint .
	swiftlint lint .

clean: ## Remove files that can be regenerated
	rm -rf .build/
	rm -rf .swiftpm/
