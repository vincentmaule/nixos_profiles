{ config, pkgs, lib, ... }:

{
  config = {
    services = {
      pipewire = {
        enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
        pulse.enable = true;
        audio.enable = true;
        jack.enable = true;
      };
      pulseaudio.enable = false;
    };
  };
}

  