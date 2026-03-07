{ config, pkgs, ... }:

{
  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    libGL
    xorg.libX11
    xorg.libXi
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXrender
    xorg.libXrandr
    xorg.libSM
    xorg.libICE
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
