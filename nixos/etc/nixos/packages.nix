{pkgs, ...}:

let 
    unstable = import <unstable> {};

in

{
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

        keepassxc

        firefox
        thunderbird

        onedrive
        onedrivegui

        qbittorrent
        soulseekqt

        ffmpeg
        mpv
        qimgv


        unstable.aider-chat
    ];
}
