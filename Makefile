# Get the hostname, but allow overriding it.
HOSTNAME ?= $(shell hostname)
# Construct the flake URI for the current host.
FLAKE_URI ?= .#$(HOSTNAME)

# Set the default goal to 'help'
.DEFAULT_GOAL := help

# Phony targets don't represent files.
.PHONY: help clean deploy install-homebrew install-nix update

# Target to display help.
help:
	@echo "Makefile for managing Nix Darwin configuration"
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  help             Show this help message."
	@echo "  deploy           Apply the Nix Darwin configuration for the current host."
	@echo "  update           Update the flake's inputs."
	@echo "  clean            Run Nix garbage collection."
	@echo "  install-nix      Install Nix using the Determinate Systems installer."
	@echo "  install-homebrew Install Homebrew."
	@echo ""
	@echo "Variables:"
	@echo "  HOSTNAME         The hostname to build for (default: $$(hostname))."
	@echo "  FLAKE_URI        The flake URI to build (default: .#$$(HOSTNAME))."


# Apply the configuration for the current host.
deploy:
	@echo "Switching to flake configuration: $(FLAKE_URI)"
	@sudo -H darwin-rebuild switch --flake $(FLAKE_URI)
	@echo "Deployment complete."

# Update flake inputs.
update:
	@echo "Updating flake inputs..."
	@nix flake update
	@echo "Flake update complete."

# Collect Nix garbage.
clean:
	@echo "Collecting Nix garbage..."
	@nix-collect-garbage -d
	@echo "Garbage collection complete."

# Install Nix if it's not already installed.
install-nix:
	@if ! command -v nix &> /dev/null; then \
		echo "Nix not found. Installing Nix..."; \
		curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install; \
	else \
		echo "Nix is already installed."; \
	fi

# Install Homebrew if it's not already installed.
install-homebrew:
	@if ! command -v brew &> /dev/null; then \
		echo "Homebrew not found. Installing Homebrew..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "Homebrew is already installed."; \
	fi
