{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    # makes dmgs indexed by spotlight
    mac-app-util.url = "github:hraban/mac-app-util";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, mac-app-util, home-manager, ... }:
  let
    username = "huberm";
    hostname = "huberm-mbair";
    useremail = "pfp2024@gmail.com";
    system = "aarch64-darwin";
    modDir = "${self}/modules";
    filesDir = "${self}/files";
    specialArgs =
      inputs
      // {
      inherit username useremail hostname self modDir filesDir;
      };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      inherit system specialArgs;
      modules = [
        ./modules/configuration.nix
        ./modules/apps.nix
        ./modules/system.nix
        mac-app-util.darwinModules.default

        # home manager
        home-manager.darwinModules.home-manager
        {
          users.users.${username}.home = "/Users/${username}";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users.${username}.imports = [
            ./home/${hostname}.nix
            mac-app-util.homeManagerModules.default
          ];
        }
      ];
    };
  };
}
