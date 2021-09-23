# Config file for my zephyrus config.

{ config, pkgs, lib,  ... }:

{
  fileSystems."/mnt/windows" =
    { 
      device = "/dev/disk/by-label/OS";
      fsType = "ntfs";
      options = [ "rw" "uid=1000" ];
    };
}
