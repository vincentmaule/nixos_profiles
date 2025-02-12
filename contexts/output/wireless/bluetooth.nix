{ config, pkgs, ... }: 

{
    config = {
        hardware.bluetooth.enable = true;
        services = {
            blueman.enable = true;
        };
        environment.systemPackages = [pkgs.bluez];
        systemd.services.btattach = {
            before = [ "bluetooth.service" ];
            after = [ "dev-ttyAMA0.device" ];
            wantedBy = [ "multi-user.target" ];
            serviceConfig = {
            ExecStart = "${pkgs.bluez}/bin/btattach -B /dev/ttyAMA0 -P bcm -S 3000000";
            };
        };
    };
}
