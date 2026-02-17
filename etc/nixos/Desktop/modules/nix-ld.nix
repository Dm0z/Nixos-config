{ config, pkgs, ... }:

{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libGL
    libX11
    libXi
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxrender
    libxrandr
    libsm
    libice
    alsa-lib
    pulseaudio
    glib
    gtk3
    cairo
    pango
    gdk-pixbuf
    webkitgtk_4_1
    mono6
    libgdiplus
    zlib
    libffi
    libpng
    freetype
    fontconfig
    libsoup_3
  ];
}
