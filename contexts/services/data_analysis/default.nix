{ config, lib, pkgs, ... }: 

{
  config = {
    environment = {
      systemPackages = [
        pkgs.ntfs3g
        pkgs.toybox
        pkgs.git
        pkgs.jmtpfs
        pkgs.ventoy-full
        pkgs.testdisk
        pkgs.cdrtools
        pkgs.nixos-generators
        pkgs.clinfo
      ];
    };
  };
}
