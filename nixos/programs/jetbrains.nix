{ config, pkgs, lib,  ... }:

{
  environment.systemPackages = with pkgs; [
    jetbrains.clion
    jetbrains.datagrip
    jetbrains.goland
    jetbrains.pycharm-community
    jetbrains.rider
    jetbrains.webstorm
  ];
}
