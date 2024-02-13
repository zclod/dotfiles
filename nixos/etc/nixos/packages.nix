{pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        neovim
        fd
        delta
        sad
        fzf

        git
        mc
        stow

        unzip
        firefox
        rclone

        nodejs
        yarn

        keepassxc

	nixos-generators

    ];
}
