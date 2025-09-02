{
    services.samba = {
        enable = true;
        openFirewall = true;
        settings = {
            global = {
                "workgroup" = "WORKGROUP";
                "server string" = "smbnix";
                "netbios name" = "smbnix";
                "security" = "user";
                #"use sendfile" = "yes";
                #"max protocol" = "smb2";
                # note: localhost is the ipv6 localhost ::1
                "hosts allow" = "192.168.1. 127.0.0.1 localhost";
                "hosts deny" = "0.0.0.0/0";
                "guest account" = "nobody";
                "map to guest" = "bad user";
            };
            # "public" = {
            "private" = {
                "path" = "/home/cla/Downloads/torrents";
                "browseable" = "yes";
                "read only" = "yes";
                # "guest ok" = "yes";
                "guest ok" = "no";
                "create mask" = "0644";
                "directory mask" = "0755";
                "force user" = "cla";
                #"force group" = "groupname";
            };
            "media" = {
                "path" = "/home/cla/media";
                "browseable" = "yes";
                "read only" = "yes";
                # "guest ok" = "yes";
                "guest ok" = "no";
                "create mask" = "0644";
                "directory mask" = "0755";
                "force user" = "cla";
                #"force group" = "groupname";
            };
            # "private" = {
            #   "path" = "/mnt/Shares/Private";
            #   "browseable" = "yes";
            #   "read only" = "no";
            #   "guest ok" = "no";
            #   "create mask" = "0644";
            #   "directory mask" = "0755";
            #   "force user" = "username";
            #   "force group" = "groupname";
            # };
        };
    };

    services.samba-wsdd = {
        enable = true;
        openFirewall = true;
    };

    networking.firewall.enable = true;
    networking.firewall.allowPing = true;
}
