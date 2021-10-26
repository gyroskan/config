# Config file for desktop computer.

{ config, pkgs, lib, ... }:

{
  fileSystems = 
  {
    "/mnt/windows/ssd" = 
    {
      device = "/dev/disk/by-uuid/42145AD1145AC815";
      fsType = "ntfs";
      options = [ "rw" "uid=1000"];
    };

    "/mnt/windows/hdd" = 
    {
      device = "/dev/disk/by-uuid/8A2813A828139275";
      fsType = "ntfs";
      options = [ "rw" "uid=1000" ];
    };
  };
}
