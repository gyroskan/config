{ config, pkgs, lib,  ... }:

{
  environment.systemPackages = with pkgs; [
    jetbrains.idea-ultimate
    maven
    jdk
  ];
}
