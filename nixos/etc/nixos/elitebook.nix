{config, pkgs, lib, ...}:

let
    pcie-powersave = pkgs.writeShellApplication {
        name = "pcie-powersave";

        text = ''
            echo powersupersave > /sys/module/pcie_aspm/parameters/policy
        '';

    };

    enable-aspm = pkgs.writeTextFile {
        name = "enable-aspm";
        # runtimeInputs = with pkgs; [pciutils bc];
        executable = true;
        destination = "/bin/enable-aspm";

        text = builtins.readFile ./enable-aspmargs;

    };
in
{
    boot.kernelParams = [
        "pcie_aspm=force"
    ];

    environment.systemPackages = with pkgs; [
        pciutils
        bc
        pcie-powersave
        enable-aspm
    ];

    systemd.services.aspm = {
        wantedBy = [];
        enable = true;
        serviceConfig = {
            User = "root";
            Group = "root";
        };

        script = ''
            #!/usr/bin/env bash 

            ROOT_COMPLEX="00:02.2"
            ENDPOINT="01:00.0"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            
            ROOT_COMPLEX="00:02.4"
            ENDPOINT="02:00.0"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            
            
            ROOT_COMPLEX="00:08.1"
            ENDPOINT="c3:00.0"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            ROOT_COMPLEX="00:08.1"
            ENDPOINT="c3:00.1"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            ROOT_COMPLEX="00:08.1"
            ENDPOINT="c3:00.2"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            ROOT_COMPLEX="00:08.1"
            ENDPOINT="c3:00.3"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            ROOT_COMPLEX="00:08.1"
            ENDPOINT="c3:00.4"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            ROOT_COMPLEX="00:08.1"
            ENDPOINT="c3:00.5"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            ROOT_COMPLEX="00:08.1"
            ENDPOINT="c3:00.6"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            
            
            ROOT_COMPLEX="00:08.2"
            ENDPOINT="c4:00.0"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            ROOT_COMPLEX="00:08.2"
            ENDPOINT="c4:00.1"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            
            
            ROOT_COMPLEX="00:08.3"
            ENDPOINT="c5:00.0"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            ROOT_COMPLEX="00:08.3"
            ENDPOINT="c5:00.3"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            ROOT_COMPLEX="00:08.3"
            ENDPOINT="c5:00.4"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            ROOT_COMPLEX="00:08.3"
            ENDPOINT="c5:00.5"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            ROOT_COMPLEX="00:08.3"
            ENDPOINT="c5:00.6"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            
            
            ROOT_COMPLEX="00:03.1"
            ENDPOINT="03"
            ${enable-aspm} $ROOT_COMPLEX $ENDPOINT
            
            ROOT_COMPLEX="00:04.1"
            ENDPOINT="63"
            enable-aspm $ROOT_COMPLEX $ENDPOINT





            pcie-powersave
        '';

    };

}
