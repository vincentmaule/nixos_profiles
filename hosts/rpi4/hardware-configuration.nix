
{ config, lib, pkgs, ... }: 

{
  config = {

    boot = {
      kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
      initrd = {
        availableKernelModules = [ "ahci" "xhci_pci" "usbhid" "usb_storage" ];
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
        options = [ "noatime" ];
      };
    };

    networking = {
      hostName = "initrpi4";
    };
  };
}