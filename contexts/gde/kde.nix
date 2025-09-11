{ pkgs, ... }:

/*
  Configuration gathered from these sources:
  - https://wiki.nixos.org/wiki/KDE
*/

{
  programs = {
    partition-manager.enable = true;
  };

  networking.networkmanager.enable = true;

  security = {
    apparmor.enable = true;
    rtkit.enable = true;
  };

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    desktopManager.plasma6 = {
      enable = true;
      enableQt5Integration = true;
    };

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    xserver = {
      enable = true;
      excludePackages = with pkgs; [
        xterm
      ];
      xkb = {
        variant = "";
        layout = "us";
      };
    };

    xrdp = {
        enable = true;
        defaultWindowManager = "startplasma-x11";
        openFirewall = true;
    };
  };
  /*
  systemd.user.services.add_ssh_keys = {
    script = ''
      ssh-add $HOME/.ssh/id_rsa
    '';
    wantedBy = [ "multi-user.target" ];
  };
  */
}
