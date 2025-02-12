{ config, lib, pkgs, ... }: 

{

  imports = [
  ];

  
    config.users.users = {
        rose = {
          extraGroups = [
            "disk"
            "audio"
            "tty"
            "video"
            "users"
          ];
          home = "/home/rose";
          isNormalUser = true;
          packages = with pkgs; [ 
            blueman
            chromium
            deja-dup
            drawing
            elementary-xfce-icon-theme
            evince
            firefox
            foliate
            font-manager
            gimp-with-plugins
            gnome.file-roller
            gnome.gnome-disk-utility
            inkscape-with-extensions
            libqalculate
            libreoffice
            orca
            pavucontrol
            qalculate-gtk
            thunderbird
            wmctrl
            xclip
            xcolor
            xcolor
            xdo
            xdotool
            xfce.catfish
            xfce.gigolo
            xfce.orage
            xfce.xfburn
            xfce.xfce4-appfinder
            xfce.xfce4-clipman-plugin
            xfce.xfce4-cpugraph-plugin
            xfce.xfce4-dict
            xfce.xfce4-fsguard-plugin
            xfce.xfce4-genmon-plugin
            xfce.xfce4-netload-plugin
            xfce.xfce4-panel
            xfce.xfce4-pulseaudio-plugin
            xfce.xfce4-systemload-plugin
            xfce.xfce4-weather-plugin
            xfce.xfce4-whiskermenu-plugin
            xfce.xfce4-xkb-plugin
            xfce.xfdashboard
            xorg.xev
            xsel
            xtitle
            xwinmosaic
            zuki-themes
          ];
        };
    };
}