{ config, pkgs, callPackage, ... }: 

/*
  Configuration gathered from these sources:
  - https://wiki.nixos.org/wiki/I3
*/

{
  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 

  services = {
    displayManager = {
      defaultSession = "none+i3";
    };

    xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
      };

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu #application launcher most people use
          i3status # gives you the default i3 status bar
          i3lock #default i3 screen locker
          i3blocks #if you are planning on using i3blocks over i3status
        ];
      };
    };
  };
}
