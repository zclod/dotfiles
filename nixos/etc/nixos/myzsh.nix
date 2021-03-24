{pkgs, ...}:
{

    environment.systemPackages = with pkgs; [fzf-zsh];

    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;
    programs.zsh.autosuggestions.enable = true;
    programs.zsh.enableCompletion = true;
    programs.zsh.syntaxHighlighting.enable = true;
    programs.zsh.ohMyZsh.enable = true;
    programs.zsh.ohMyZsh.plugins = [ "git" "colored-man-pages" "command-not-found" "extract" ];
    programs.zsh.ohMyZsh.theme = "avit";


    programs.zsh.shellAliases = {
        e = "nvim";
        se = "sudoedit";
    };

    environment.variables = {
        EDITOR = "nvim";
        SUDO_EDITOR = "nvim";
        VISUAL = "nvim";
    };
}
