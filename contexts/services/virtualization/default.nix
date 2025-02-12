{ config, lib, pkgs, ... }: 

{

    config = {
      boot = {
        binfmt = {
          emulatedSystems = [
            "x86_64-windows"
            "aarch64-linux"
          ];
        };
      };

      environment = {
        systemPackages = [
          pkgs.spice-gtk
          pkgs.qemu
          pkgs.docker
          pkgs.distrobox
          pkgs.boxbuddy
        ];
      };
      
      virtualisation = {
        docker.enable = true;
        libvirtd = {
          enable = true;
          onShutdown = "suspend";
        };
      };

      programs.dconf.enable = true;
    };
  }
