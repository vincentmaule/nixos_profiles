{ config, pkgs, ... }:

{
  config = {
    environment = {
      systemPackages = [
        pkgs.ntfs3g
        pkgs.git
        pkgs.jmtpfs
        ];
    };

    users.users.root = {
      isNormalUser = false;
      initialPassword = "beginpass123";
      extraGroups = [ "wheel" ];
    };
  };
}