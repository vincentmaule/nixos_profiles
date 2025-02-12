{ config, lib, pkgs, ... }: 

{
  config = {
    services = {
      clamav = {
        daemon = {
          enable = true;
        };
      };
      pcscd = {
        enable = true;
      };
    };

    security = {
      sudo = {
        enable = true;
        extraRules = [
          {
            commands = [
              {
                command = "ALL";
                options = [ "NOPASSWD" ];
              }
            ];
            users = [ "vince" ];
          }
        ];
      };
      polkit.enable = true;
      pam = {
        sshAgentAuth.enable = true;
        services.sudo.sshAgentAuth = true;
      };
    };

    users.mutableUsers = false;

    environment.systemPackages = [
      pkgs.yubikey-manager
      pkgs.yubikey-agent
      pkgs.age-plugin-yubikey
      pkgs.yubico-pam
    ];
  };
}
