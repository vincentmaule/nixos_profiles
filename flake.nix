{
  description = "Vincent Maule's Opinionated Guide to the Core NixOS Configuration for all systems.";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ...}@inputs: let
    inherit (self) outputs;
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
  in
  rec {
    nixosModules = {

      system-baseline = {inputs, config, pkgs, ... }: {
        imports = [
          ./nix_conf.nix
          ./locale.nix
          ./contexts/output/networking/default.nix
          ./contexts/output/security/default.nix
        ];
        environment.systemPackages = [
          pkgs.nixos-generators
        ];
      };

      i3 = {inputs, config, ... }: {
        imports = [
          ./contexts/gde/i3.nix
        ];
      };

      i3-xfce = {inputs, config, ... }: {
        imports = [
          ./contexts/gde/i3_xfce.nix
        ];
      };

      kde = {inputs, config, ... }: {
        imports = [
          ./contexts/gde/kde.nix
        ];
      };

      wlan = {inputs, config, ... }: {
        imports = [
          ./contexts/output/wireless/wlan/default.nix
          ./contexts/output/wireless/wlan/hidden_wifi_net.nix
        ];
      };

      bluetooth = {inputs, config, ... }: {
        imports = [
          ./contexts/output/wireless/bluetooth.nix
        ];
      };

      sound = {inputs, config, ... }: {
        imports = [
          ./contexts/output/sound/default.nix
        ];
      };

      printing = {inputs, config, ... }: {
        imports = [
          ./contexts/output/printing/default.nix
        ];
      };

      virtualization = {inputs, config, ... }: {
        imports = [
          ./contexts/services/virtualization/default.nix
        ];
      };

      data_analysis = {inputs, config, ... }: {
        imports = [
          ./contexts/services/data_analysis/default.nix
        ];
      };

      security = {inputs, config, ...}: {
        imports = [
          ./contexts/services/security/default.nix
        ];
      };
    };
  };
}
