# Config file for gyroskan user.

{ pkgs, ... }:
  {
    users.users.gyroskan = {
      isNormalUser = true;
      createHome = true;
      shell = pkgs.zsh;
      extraGroups = [ "wheel" "docker" "networkmanager" "dialout" ];
  };
}
