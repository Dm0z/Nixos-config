{ config, pkgs, ... }:

{
  programs.steam.enable = true;
  programs.steam.remotePlay.openFirewall = true;
  programs.steam.dedicatedServer.openFirewall = true;

  programs.gamemode.enable = true;

  programs.obs-studio.enable = true;
  programs.obs-studio.plugins = with pkgs.obs-studio-plugins; [
    wlrobs
    obs-backgroundremoval
    obs-pipewire-audio-capture
    obs-vaapi
    obs-gstreamer
    obs-vkcapture
  ];


  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  boot.blacklistedKernelModules = [ "nouveau" ];

  hardware.nvidia = {
    modesetting.enable = true;

    open = false;

    powerManagement.enable = false;
    powerManagement.finegrained = false;

    nvidiaSettings = true;


    package = config.boot.kernelPackages.nvidiaPackages.legacy_470;

    prime = {
      sync.enable = true;
      intelBusId  = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  programs.localsend.enable = true;
  programs.firefox.enable = true;
}
