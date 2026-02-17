let
  pkgs = import <nixpkgs> {};
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    pkg-config
    gtk3
    gtk4
    glib
    cairo
    gdk-pixbuf
    librsvg
    webkitgtk_4_1
    webkitgtk_6_0
    cargo
    cargo-tauri
    rustc
    rustfmt
    openssl
  ];
}

/* rust shell that works pretty well */
