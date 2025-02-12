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
        experimental-features = "nix-command flakes";
      };
    };
    environment = {
      systemPackages = with pkgs; [
        home-manager
        deploy-rs
      ];
    };
  };
}
