{ config, lib, pkgs, ... }: 

{
  config = {
    environment = {
      systemPackages = [
        pkgs.ntfs3g
        pkgs.toybox
        pkgs.jmtpfs
        pkgs.ventoy-full
        pkgs.testdisk
        pkgs.cdrtools
        pkgs.clinfo
      ];
    };
  };
}
