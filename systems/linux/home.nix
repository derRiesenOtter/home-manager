{ config, pkgs, ... }:

{
  home.username = "robin";
  home.homeDirectory = "/home/robin";

  home.stateVersion = "24.05";

  imports = [
    ../../modules/apps.nix
    ../../modules/nvim/nvim.nix
  ];

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  home.file = {
    ".config/nvim/snippets/tex.snippets".source = ../../modules/nvim/snippets/tex.snippets;
    ".config/wezterm/wezterm.lua".source = ../../modules/dotfiles/wezterm.lua;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "${pkgs.bash}/bin/bash";
  };

  programs.home-manager.enable = true;
}
