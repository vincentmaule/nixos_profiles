{ config, lib, pkgs, ... }:

{
  config = {
    services.avahi = {
      enable = lib.mkForce false;
      nssmdns4 = true;
    };
    services.printing = {
      enable = true;
    };
    programs.system-config-printer.enable = true;
  };
}