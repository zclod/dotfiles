{pkgs, ...}:
{

    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;
    programs.zsh.autosuggestions.enable = true;
    programs.zsh.enableCompletion = true;
    programs.zsh.syntaxHighlighting.enable = true;
    programs.zsh.ohMyZsh.enable = true;
    programs.zsh.ohMyZsh.plugins = [ "git" "colored-man-pages" "command-not-found" "extract" "fzf" "direnv" ];
    programs.zsh.ohMyZsh.theme = "avit";

    programs.zoxide.enable = true;
    programs.zoxide.enableZshIntegration = true;

    programs.zsh.shellAliases = {
        e = "nvim";
        se = "sudoedit";
        lg = "lazygit";
        f = ''z "$(xplr --print-pwd-as-result)"'';
    };

    environment.variables = {
        EDITOR = "nvim";
        SUDO_EDITOR = "nvim";
        VISUAL = "nvim";
        XPLR_BOOKMARK_FILE = "$HOME/.xplrbookmarks";

        #for java applications
        _JAVA_AWT_WM_NONREPARENTING="1";
    };
}
