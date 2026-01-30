{
  description = "My NixOS config with Spicetify, lsfg-vk, and nix-citizen";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";

    # Spicetify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    # Lossless Scaling Frame Generation
    lsfg-vk-flake.url = "github:pabloaul/lsfg-vk-flake/main";
    lsfg-vk-flake.inputs.nixpkgs.follows = "nixpkgs";

    # nix-citizen + optional underlying updates
    nix-citizen.url = "github:LovingMelody/nix-citizen/update";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-citizen.inputs.nix-gaming.follows = "nix-gaming";
  };

  outputs = { self, nixpkgs, home-manager, spicetify-nix, lsfg-vk-flake, nix-citizen, nix-gaming, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    # Override rsi-launcher to use local Lug Wine
    rsiLauncherLug =
      nix-citizen.packages.${system}.rsi-launcher.override (o: {
        wine = pkgs.stdenvNoCC.mkDerivation {
          pname = "lug-wine";
          version = "11.1-1";
          src = ./SC-runners/lug-wine-tkg-git-11.1-1;
          installPhase = ''
            mkdir -p $out
            cp -rv $src/* $out/
          '';
        };
      });
  in
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          spicetify-nix.nixosModules.default
          lsfg-vk-flake.nixosModules.default
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

            services.lsfg-vk.enable = true;

            environment.systemPackages = [
              rsiLauncherLug
            ];
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

              home.username = "dmoz";
              home.homeDirectory = "/home/dmoz";

              home.packages = [
                rsiLauncherLug
              ];
            }
          ];
        };
      };
  };
}
