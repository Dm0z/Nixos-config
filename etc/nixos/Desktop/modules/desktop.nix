{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.lxqt.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  security.polkit.enable = true;

  services.printing.enable = true;
}
