{ config, pkgs, ...}:

{
  networking.networkmanager = {
    wifi.scanRandMacAddress = false;
  };
}
