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
}
