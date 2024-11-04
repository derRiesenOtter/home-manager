{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.ripgrep
    pkgs.eza
    pkgs.lazygit
    pkgs.texliveFull
    pkgs.tree
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

    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        l = "eza -lah";
        gg = "lazygit";
      };
    };

    tmux = {
      enable = true;
      sensibleOnTop = false;
      extraConfig = builtins.readFile ./dotfiles/tmux.conf;
      plugins = with pkgs; [
        tmuxPlugins.vim-tmux-navigator
        {
          plugin = tmuxPlugins.tokyo-night-tmux;
          extraConfig = ''
            set -g @tokyo-night-tmux_window_id_style none
            set -g @tokyo-night-tmux_pane_id_style hsquare
            set -g @tokyo-night-tmux_zoom_id_style dsquare
            set -g @tokyo-night-tmux_show_datetime 0
            set -g @tokyo-night-tmux_show_git 0
          '';
        }
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = ''
            set -g @resurrect-strategy-nvim 'session'
            set -g @resurrect-capture-pane-contents 'on'
          '';
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '5'
          '';
        }
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
