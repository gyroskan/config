{ config, pkgs, lib, ... }:

{

  services.xserver = 
  {
    desktopManager = 
    {
      xterm.enable = false;
    };
    displayManager = 
    {
      defaultSession = "none+i3";
    };

    windowManager.i3 = 
    {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
      ];
    };
  };
}
