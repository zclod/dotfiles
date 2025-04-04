{pkgs, ...}:

let 
   unstable = import <unstable> {};

in

{
    hardware.bluetooth.enable = true;
    hardware.bluetooth.settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
    services.blueman.enable = true; 

    services.upower.enable = true;
    services.gvfs.enable = true;
    services.udisks2.enable = true;

    programs.evolution.enable = true;
    programs.evolution.plugins = [ pkgs.evolution-ews ];
    services.gnome.evolution-data-server.enable = true;

    programs.ssh.startAgent = true;

    programs.gnupg.agent.enable = true;

    # for wpgtk
    programs.dconf.enable = true;

    fonts.packages = with pkgs; [
       inconsolata-nerdfont 
       liberation_ttf
    ];

    environment.systemPackages = with pkgs; [
        foot
        dbus   # make dbus-update-activation-environment available in the path
        wayland
        xdg-utils # for opening default programs when clicking links
        glib # gsettings
        swaylock-effects
        swayidle
        grim # screenshot functionality
        slurp # screenshot functionality
        wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
        rofi-wayland
        # mako # notification system developed by swaywm maintainer
        wdisplays # tool to configure displays
        wlogout
        unstable.waybar
        gnome-calendar

        # perform wpg-install.sh -g and -i to install gtk themes
        wpgtk
        # set the wpgtk theme through nwg-look
        nwg-look
        nwg-panel
        # nwg-shell-config
        # nwg-displays # tool to configure displays
        swaynotificationcenter

        shikane

        xplr
        xfce.thunar
        xfce.thunar-volman
        xfce.thunar-archive-plugin

        pavucontrol
        qpwgraph
        jamesdsp
        easyeffects
    ];

    xdg.mime.defaultApplications = {
        "application/pdf" = "firefox.desktop";
    };

# non piu necessario da doc nixos??????
#    services.dbus.enable = true;
#    xdg.portal = {
#        enable = true;
#        wlr.enable = true;
#        # gtk portal needed to make gtk apps happy
#        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
#    };

#    systemd.services.kanshi = {
#      description = "kanshi daemon";
#      enable = true;
#      environment = {
#        HOME="/home/cla/";
#        XDG_RUNTIME_DIR="/home/cla/.config/kanshi";
#      };
#      serviceConfig = {
#        Type = "simple";
#        ExecStart = ''${pkgs.kanshi}/bin/kanshi -c /home/cla/.config/kanshi/config'';
#        Restart= "always";
#      };
#      wantedBy = ["sway-session.target"];
#      #wantedBy = ["multi-user.target"];
#    };

    services.pipewire = {
        enable = true;
        alsa.enable = true;
        pulse.enable = true;
        wireplumber.enable = true;
    };

    programs.light.enable = true;

    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                # command = "${pkgs.greetd.greetd}/bin/agreety --cmd sway";
                command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
            };
        };
    };
    # programs.regreet.enable = true;

    security.pam.services.swaylock = {}; 

    programs.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
    };
}
