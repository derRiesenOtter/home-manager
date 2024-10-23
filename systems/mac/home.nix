{ config, pkgs, ... }:

{
  home.username = "robin";
  home.homeDirectory = "/Users/robin";

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
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  programs.home-manager.enable = true;
}
