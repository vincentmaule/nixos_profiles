 { config, lib, pkgs, ... }: 

{

  imports = [
  ];

  config = {
    users.users = {
      vince = {
        description = "Vincent Maule";
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
        home = "/home/vince";
        isNormalUser = true;
      };
    };

    services.tailscale.permitCertUid = "vincentmaule.github";
  };
}
