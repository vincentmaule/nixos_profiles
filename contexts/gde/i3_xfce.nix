{ config,  pkgs, callPackage, ... }: 

/*
  Configuration gathered from these sources:
  - https://wiki.nixos.org/wiki/Xfce#Using_as_a_desktop_manager_and_not_a_window_manager
*/

{
  fonts.packages = with pkgs; [
    hermit
    source-code-pro
    terminus_font
  ];
  services = {
    displayManager = {
      defaultSession = "xfce+i3";
    };
    xserver = {
      enable = true;
      autorun = false;
      xkb = {
        variant = "";
        layout = "us";
      };
      displayManager.lightdm.enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu #application launcher most people use
          #i3status # gives you the default i3 status bar
          #i3lock #default i3 screen locker
          #i3blocks #if you are planning on using i3blocks over i3status
        ];
      };
    };
  };
  programs.dconf.enable = true;
}
