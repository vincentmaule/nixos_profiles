# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, outputs, lib, config, pkgs, nixpkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./network.nix
  ];
  
  

  config = {
    system.stateVersion = "24.05";
    
    nix = {
      registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
      nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
    };

    nixpkgs = {
      config = {
        allowUnfree = true;
      };
    };

    time = {
        timeZone = "America/Detroit";
      };
    
    services = {
        tailscale = {
          useRoutingFeatures = "both";
      };
    };
    
  };
}