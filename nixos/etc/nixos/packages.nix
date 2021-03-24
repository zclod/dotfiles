{pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        neovim
        git
        mc
        stow
        fzf

        unzip
        firefox

        jre
        qemu
        virt-manager

    ];
}
