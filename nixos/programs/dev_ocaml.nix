{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    emacs
    pkg-config
    xorg.libX11
    ocaml
    ocamlPackages.findlib
    ocamlPackages.graphics
    opam
  ];
}

