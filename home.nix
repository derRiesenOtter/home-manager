{ inputs, lib, config, pkgs, ... }:

{ 
  home.username = "robin";
  home.homeDirectory = "/Users/robin";
  
  home.stateVersion = "24.05"; 

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  home.packages = [
    pkgs.ripgrep
    pkgs.eza
    pkgs.fzf
    pkgs.zoxide
    pkgs.zellij
    pkgs.lazygit
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
    "--cmd cd"
    ];
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      l = "eza -lah";
      vi = "nvim";
      vim = "nvim";
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.git = {
    enable = true;
    userName = "derRiesenOtter";
    userEmail = "104461717+derRiesenOtter@users.noreply.github.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.oh-my-posh = {
    enable = true;
    useTheme = "gruvbox";
  };

  programs.nixvim = {

    enable = true;
    globals.mapleader = " ";
    clipboard.register = "unnamedplus";

    keymaps = [
      {
        mode = "n";
        key = "<leader>nh";
        action = "<cmd>nohl<CR>";
      }
      {
        mode = "i";
        key = "jk";
        action = "<ESC>";
      }
      {
        mode = "n";
        key = "<leader>+";
        action = "<C-a>";
      } 
      {
        mode = "n";
        key = "<leader>-";
        action = "<C-x>";
      }
      {
        mode = "n";
        key = "<leader>fl";
        action = "<cmd>Telescope live_grep<CR>";
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = "<cmd>Telescope oldfiles<CR>";
      }
      {
        mode = "n";
        key = "<leader>ee";
        action = "<cmd>NvimTreeToggle<CR>";
      }
      {
        mode = "x";
        key = "<leader>p";
        action = ''"_dp'';
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>d";
        action = ''"_d'';
      }
    ];

    opts = {
      relativenumber = true;
      number = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      wrap = false;
      ignorecase = true;
      smartcase = true;
      cursorline = true;
      termguicolors = true;
      signcolumn = "yes";
      swapfile = false;
      spelllang = "en,de";
      spell =true; 
    };

    colorschemes.gruvbox.enable = true; 
    plugins = {
      lualine.enable = true;
      web-devicons.enable = true;
      nvim-tree.enable = true;
      which-key.enable = true;
      comment.enable = true;
      vim-slime = {
        enable = true;
        settings = {
          target = "zellij";
          default_config = 
                {
                  session_id = "current";
                  relative_pane = "down";
                }
          ;
        };
      };
      nvim-autopairs.enable = true;
      telescope = {
        enable = true;
        settings = {
          defaults.mappings.i = {
            "<C-k>" = "move_selection_previous";
            "<C-j>" = "move_selection_next";
          };
        };
      };
      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "luasnip";}
          ];
          mapping = {
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<C-e>" = "cmp.mapping.abort()";
          };
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-rg.enable = true;
      cmp-buffer.enable = true;
      cmp_luasnip.enable = true;
      cmp-cmdline.enable = true;
      lsp-format.enable = true;
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          r-language-server.enable = true;
          # pyright.enable = true;
        };
        keymaps = {
          silent = true;
          lspBuf = {
            gd.action = "definition";
            gr.action = "references";
            gD.action = "declaration";
            gI.action = "implementation";
            gT.action = "type_definition";
            "<leader>cr".action = "rename";
          };
        };
      };
      treesitter = {
        enable = true;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          markdown
          nix
          r
        ];
      };
    };

  };
  
  home.file = {
    ".wezterm.lua".source = ./dotfiles/wezterm.lua;
    ".config/zellij/config.kdl".source = ./dotfiles/zellij.kdl;
    ".config/zellij/layouts/default.kdl".source = ./dotfiles/zellij_layouts.kdl;
  };

  home.sessionVariables = {
    EDITOR = "nixvim";
  };

  programs.home-manager.enable = true;
}
