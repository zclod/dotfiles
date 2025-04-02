{lib, ...}:{
    # services.minidlna.enable = true;
    # services.minidlna.openFirewall = true;
    # services.minidlna.settings.media_dir = [
    #     "V,/home/cla/media/videos"
    # ];

    # services.mediatomb.enable = true;
    # services.mediatomb.openFirewall = true;
    # users.users.mediatomb.extraGroups = ["users"];
    # services.mediatomb.mediaDirectories = [
    #     {
    #     hidden-files = false;
    #     path = "/home/cla/media/videos";
    #     recursive = true;
    #     }
    # ];

    #DLNA
    services.minidlna.enable = true;
    services.minidlna.settings.inotify = "yes";
    services.minidlna.openFirewall = true;
    services.minidlna.settings = {
      friendly_name = "DLNA MEDIA";
      media_dir = [
         "V,/home/cla/media/videos" #Videos files are located here
         "P,/home/cla/media/videos" #Pictures files are located here
         # "A,/mnt/media/Songs/" #Audio files are here
     ];
      log_level = "error";
    };
    
    systemd.services.minidlna.wantedBy = lib.mkForce [];

    users.users.minidlna = {
      extraGroups = [ "users" ]; # so minidlna can access the files.
    };

    systemd.services.minidlna.serviceConfig = {
      ProtectHome = lib.mkForce "tmpfs";
      BindReadOnlyPaths = "/home/cla/media/videos/";
    };
}
