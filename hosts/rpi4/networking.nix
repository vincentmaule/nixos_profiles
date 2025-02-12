{ config, ... }:

{
  services.openssh = {
    enable = true;
    settings.X11Forwarding = true;
  };
  
  networking = {
      firewall = {
        enable = true;
      };
  };
}