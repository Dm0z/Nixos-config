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

  programs.localsend.enable = true;
  programs.firefox.enable = true;

  hardware.logitech.wireless.enable = true;

  services.lsfg-vk = {
    enable = true;
    ui.enable = true;
  };


  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];


  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.opengl.enable = true;

  services.deluge.enable = true;

  services.deluge.web.enable = true;

  services.flatpak.enable = true;
}
