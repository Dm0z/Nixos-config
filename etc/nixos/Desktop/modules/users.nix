{ config, pkgs, ... }:

{
  users.mutableUsers = true;

  users.users.dmoz = {
    isNormalUser = true;
    description = "David M";
    extraGroups = [
      "wheel"
      "networkmanager"
      "wireshark"
      "libvirtd"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      kdePackages.kate
      tor-browser
    ];
  };
}
