{ config, pkgs, ... }:

{
  services.lsfg-vk.enable = true;

  services.deluge.enable = true;
  services.deluge.web.enable = true;
}
