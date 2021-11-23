{ config, pkgs, lib,  ... }:

{
  environment.systemPackages = with pkgs; [
    dotnetCorePackages.sdk_5_0
    jetbrains.clion
    jetbrains.datagrip
    jetbrains.goland
    jetbrains.pycharm-community
    jetbrains.rider
    jetbrains.webstorm
  ];
}
