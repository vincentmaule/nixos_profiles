{ config, ... }:

{
  
  imports = [
  ];
  
  config = {

  boot = {    
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      systemd-boot = {
        enable = true;
      };
    };
  };

  nixpkgs.hostPlatform = "x86_64-linux";  
  };
}
