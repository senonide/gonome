{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    cairo
    glib
    gobject-introspection
    graphene
    pkg-config
    libadwaita
  ];
  buildInputs = with pkgs; [
    gnumake
  ];
}
