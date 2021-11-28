# Config file for my zephyrus config.

{ config, pkgs, lib,  ... }:

{
  networking.interfaces.wlp2s0.useDHCP = true;

  fileSystems."/mnt/windows" =
    { 
      device = "/dev/disk/by-label/OS";
      fsType = "ntfs";
      options = [ "rw" "uid=1000" ];
    };
}
