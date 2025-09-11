{ config, lib, pkgs, ... }: 

{
  config = {
    nix = {
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
      settings = {
        auto-optimise-store = true;
        allowed-users = [ "@wheel" ];
        trusted-users = [ "@wheel" ];
        experimental-features = lib.mkDefault "nix-command flakes";
      };
    };

    nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
    };

    hardware.enableRedistributableFirmware = true;
  };
}
