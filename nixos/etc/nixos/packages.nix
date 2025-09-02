{pkgs, ...}:

let 
    unstable = import <unstable> {};

in

{

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        neovim
	fd
        delta
        fzf
        pipe-rename
        sd
        pistol
        ripdrag

        htop
        git
        stow

        unzip
        rclone
        rar

        keepassxc

        firefox
        thunderbird

        onedrive
        onedrivegui

        qbittorrent
        soulseekqt

        losslesscut-bin
        ffmpeg
        mpv
        qimgv


        unstable.aider-chat
        unstable.aichat
        poppler-utils

        unstable.jujutsu
        unstable.jjui
    ];

    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
    users.groups.libvirtd.members = ["cla"];

    programs.direnv.enable = true;

}
