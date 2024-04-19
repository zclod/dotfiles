{pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        neovim
	fd
        delta
        fzf
        pipe-rename
        sd
        pistol

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
    ];
}
