# flake.nix
{
  description = "Minimal Standalone Home Manager Flake";

  inputs = {
    # Change "nixos-unstable" to a specific release version if needed (e.g., "nixos-24.11")
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux"; # Change to "aarch64-linux", "x86_64-darwin", etc., if needed
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."tomer20116262" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here
        modules = [
          ./home.nix
        ];
      };
    };
}
