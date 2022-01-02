{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    emacs
    # uncomment if not in the including config
    # pkg-config
    xorg.libX11
    ocaml
    ocamlPackages.findlib
    ocamlPackages.graphics
    opam
  ];
}

