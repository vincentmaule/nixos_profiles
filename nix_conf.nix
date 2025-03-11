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
        lib.mkDefault experimental-features = "nix-command flakes";
      };
    };

    nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
    };
  };
}
