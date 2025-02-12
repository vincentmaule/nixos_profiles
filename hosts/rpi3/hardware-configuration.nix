
{ config, lib, pkgs, ... }: 

{
  config = {

    boot = {
      # kernelPackages = pkgs.linuxPackages_latest;
      initrd = {
        availableKernelModules = [ "usbhid" "usb_storage" ];
      };
      loader = {
        grub.enable = false;
        generic-extlinux-compatible.enable = true;
      };
    };

    i18n.defaultLocale = "en_US.UTF-8";

    hardware.enableRedistributableFirmware = true;
    powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";

    fileSystems = {
      "/" = {
        device = "/dev/disk/by-label/NIXOS_SD";
        fsType = "ext4";
      };
    };

    networking = {
      hostName = "initrpi3";
    };
  };
}