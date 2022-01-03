{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    libreoffice
    teams
    slack
  ];
}
