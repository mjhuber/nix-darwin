.PHONY: deploy install-homebrew install-nix update
deploy:
	darwin-rebuild switch --flake .

install-homebrew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

install-nix:
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
		sh -s -- install

update:
	nix flake update

