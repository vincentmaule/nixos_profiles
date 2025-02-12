{ config, lib, pkgs, ... }: 

{

  imports = [
  ];

  config = {
    security = {
      sudo = {
        enable = true;
        extraRules = [
          {
            users = [ "fishy" ];
            commands = [
              {
                command = "ALL";
                options = [ "NOPASSWD" ];
              }
            ];
          }
        ];
      };
    };
    users.users = {
        fishy = {
          extraGroups = [
            "wheel"
            "networkmanager"
            "libvirtd"
            "disk"
            "audio"
            "floppy"
            "cdrom"
            "tty"
            "plugdev"
            "video"
            "users"
            "keys"
            "docker"
          ];
          home = "/home/fishy";
          isNormalUser = true;
        };
    };
  };
}