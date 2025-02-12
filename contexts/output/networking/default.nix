{ config, pkgs, ... }:

{
  config = {
    services = {
      tailscale = {
        enable = true;
        useRoutingFeatures = "both";
      };
      openssh = {
        enable = true;
        settings.PermitRootLogin = "no";
      };
    };

    networking = {
      firewall = {
        enable = true;
        checkReversePath = "loose";
        logRefusedPackets = true;
        logRefusedConnections = true;
      };
    };
  };
}
