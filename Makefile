.PHONY: help test build checklint lint

help:
	@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


test: ## Run unit tests
	@swift test

build: ## Build the library
	@swift build

buildswiftexample: ## Builds the examples
	@echo "Building Examples/swiftui-toot"
	@xcodebuild build -project Examples/swiftui-toot/SwiftUI-Toot.xcodeproj -scheme SwiftUI-Toot

checklint: ## Checks the project for linting errors, used by the CI
	@swift-format lint -s --configuration ./.swift-format --recursive ./Sources
	@swift-format lint -s --configuration ./.swift-format --recursive ./Tests
	@swift-format lint -s --configuration ./.swift-format --recursive ./Examples/swiftui-toot/TootSDK-Demo
	@swift-format lint -s --configuration ./.swift-format --recursive ./Examples/swiftyadmin/Sources

lint: ## Applies all auto-correctable lint issues and reformats all source files
	@swift-format format -i --configuration ./.swift-format --recursive ./Sources
	@swift-format format -i --configuration ./.swift-format --recursive ./Tests
	@swift-format format -i --configuration ./.swift-format --recursive ./Examples/swiftui-toot/TootSDK-Demo
	@swift-format format -i --configuration ./.swift-format --recursive ./Examples/swiftyadmin/Sources
	@swift-format format -i --configuration ./.swift-format --recursive ./Examples/tootsdk-release/Sources
	@swift-format format -i --configuration ./.swift-format --recursive ./Examples/vaportoot/Sources
	@swift-format lint -p --configuration ./.swift-format --recursive ./Sources
	@swift-format lint -p --configuration ./.swift-format --recursive ./Tests
	@swift-format lint -p --configuration ./.swift-format --recursive ./Examples/swiftui-toot/TootSDK-Demo
	@swift-format lint -p --configuration ./.swift-format --recursive ./Examples/swiftyadmin/Sources
	@swift-format lint -p --configuration ./.swift-format --recursive ./Examples/tootsdk-release/Sources
	@swift-format lint -p --configuration ./.swift-format --recursive ./Examples/vaportoot/Sources
