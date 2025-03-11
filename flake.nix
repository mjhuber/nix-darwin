{
  description = "Multi-machine nix-darwin system flake";

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
    # Common variables
    modDir = "${self}/modules";
    filesDir = "${self}/files";
    
    # Define all hosts with their configurations
    hosts = {
      "huberm-mbpro" = {
        username = "huberm";
        useremail = "pfp2024@gmail.com";
        system = "aarch64-darwin";
      };
      "MicahHuber-DTP6M3YJQ3" = {
        username = "huberm";
        useremail = "pfp2024@gmail.com";
        system = "aarch64-darwin";
      };
      # Add more hosts here as needed
    };
    
    # Function to create Darwin configurations
    mkDarwinConfig = hostname: { username, useremail, system, ... }: 
      nix-darwin.lib.darwinSystem {
        inherit system;
        
        # Create specialized args for this specific host
        specialArgs = inputs // {
          inherit username useremail hostname self modDir filesDir;
        };
        
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
            home-manager.extraSpecialArgs = inputs // {
              inherit username useremail hostname self modDir filesDir;
            };
            home-manager.users.${username}.imports = [
              ./home/${hostname}.nix
              mac-app-util.homeManagerModules.default
            ];
          }
        ];
      };
  in
  {
    # Map over all hosts to create configurations
    darwinConfigurations = nixpkgs.lib.mapAttrs mkDarwinConfig hosts;
  };
}
