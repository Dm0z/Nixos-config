{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # System modules
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/time-locale.nix
    ./modules/desktop.nix
    ./modules/audio.nix
    ./modules/users.nix
    ./modules/shell.nix
    ./modules/gaming-media.nix
    ./modules/virtualization.nix
    ./modules/security.nix
    ./modules/packages.nix
    ./modules/fonts.nix
    ./modules/nix-ld.nix
    ./modules/swap.nix
    ./modules/services.nix
  ];

  system.stateVersion = "25.05";

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
}
