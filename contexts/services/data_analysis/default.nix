{ config, lib, pkgs, ... }: 

{
  config = {
    environment = {
      systemPackages = [
        pkgs.ntfs3g
        pkgs.toybox
        pkgs.jmtpfs
        # pkgs.ventoy-full
        /*
        Known issues:
        - Ventoy uses binary blobs which can't be trusted to be free of malware or compliant to their licenses.
          https://github.com/NixOS/nixpkgs/issues/404663
          See the following Issues for context:
          https://github.com/ventoy/Ventoy/issues/2795
          https://github.com/ventoy/Ventoy/issues/3224
        */
        pkgs.testdisk
        pkgs.cdrtools
        pkgs.clinfo
      ];
    };
  };
}
