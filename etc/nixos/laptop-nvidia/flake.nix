{
  description = "My NixOS config with Spicetify";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";

    # Spicetify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = { self, nixpkgs, home-manager, spicetify-nix, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          spicetify-nix.nixosModules.default
          {
            programs.spicetify = let
              spicePkgs = spicetify-nix.legacyPackages.${system};
            in {
              enable = true;
              theme = spicePkgs.themes.ziro;
              colorScheme = "gray-dark";
              enabledExtensions = with spicePkgs.extensions; [
                adblock
                hidePodcasts
                shuffle
              ];
            };
          }
        ];
      };
    };

    homeConfigurations = {
      dmoz = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        extraSpecialArgs = { inherit self nixpkgs; };
        modules = [
          {
            home.stateVersion = "23.05";
            home.username = "dmozlp";
            home.homeDirectory = "/home/dmozlp";
            home.packages = [ ];
          }
        ];
      };
    };
  };
}
