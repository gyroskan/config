{ config, lib, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./vscode-server.nix
    ./git.nix
  ];

  # programs.home-manager.enable = true;

  home = {
    username = "gyroskan";
    homeDirectory = "/home/gyroskan";
    packages = with pkgs; [
      nodejs-18_x
      mariadb
    ];
  };

  home.stateVersion = "22.05";
}
