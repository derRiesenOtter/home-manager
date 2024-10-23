{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.ripgrep
    pkgs.eza
    pkgs.lazygit
    pkgs.texliveFull
  ];

  programs = {

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      initExtra = builtins.readFile ./dotfiles/zshrc;
      shellAliases = {
        l = "eza -lah";
        gg = "lazygit";
      };
    };

    tmux = {
      enable = true;
      extraConfig = builtins.readFile ./dotfiles/tmux.conf;
      plugins = with pkgs; [
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = "set -g @resurrect-strategy-nvim 'session'";
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '5' # minutes
          '';
        }
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.gruvbox
      ];
    };

    git = {
      enable = true;
      userName = "derRiesenOtter";
      userEmail = "104461717+derRiesenOtter@users.noreply.github.com";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
      ignores = [
        ".DS_Store"
        ".direnv"
        ".envrc"
      ];
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    wezterm = {
      enable = true;
      extraConfig = builtins.readFile ./dotfiles/wezterm.lua;
    };

    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [
        "--cmd cd"
      ];
    };

    starship = {
      enable = true;
    };

  };
}
