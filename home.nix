{ pkgs, ... }:

{
  home.username = "robin";
  home.homeDirectory = "/Users/robin";

  home.stateVersion = "24.05";

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  home.packages = [
    pkgs.ripgrep
    pkgs.eza
    pkgs.fzf
    pkgs.zoxide
    pkgs.lazygit
    pkgs.texliveFull
    pkgs.zellij
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
      gg = "lazygit";
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

  programs.starship = {
    enable = true;
  };

  programs.neovim =
    let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraPackages = with pkgs; [
        lua-language-server
        nixd
        pyright
        texlab
        stylua
        nixfmt-rfc-style
        vale
        marksman
      ];
      extraLuaConfig = ''
        ${builtins.readFile ./nvim/options.lua}
        ${builtins.readFile ./nvim/keymaps.lua}
      '';
      plugins = with pkgs.vimPlugins; [
        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./nvim/plugins/lsp.lua;
        }
        {
          plugin = gruvbox-nvim;
          config = "colorscheme gruvbox";
        }
        {
          plugin = comment-nvim;
          config = toLua "require('Comment').setup()";
        }
        {
          plugin = telescope-nvim;
          config = toLuaFile ./nvim/plugins/telescope.lua;
        }
        telescope-fzf-native-nvim
        which-key-nvim
        auto-pairs
        {
          plugin = lualine-nvim;
          config = toLua "require('lualine').setup()";
        }
        nvim-web-devicons
        # TODO friendly-snippets does not work yet
        luasnip
        friendly-snippets
        {
          plugin = yanky-nvim;
          config = toLuaFile ./nvim/plugins/yanky.lua;
        }
        cmp_luasnip
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp_yanky
        lspkind-nvim
        dressing-nvim
        lazygit-nvim
        # TODO be able to navigate nvim panes (maybe tmux is required)
        {
          plugin = vim-slime;
          config = toLuaFile ./nvim/plugins/slime.lua;
        }
        {
          plugin = harpoon;
          config = toLua "require('harpoon').setup()";
        }
        {
          plugin = nvim-surround;
          config = toLua "require('nvim-surround').setup()";
        }
        {
          plugin = substitute-nvim;
          config = toLua "require('substitute').setup()";
        }
        {
          plugin = nvim-tree-lua;
          config = toLua "require('nvim-tree').setup()";
        }
        {
          plugin = nvim-lint;
          config = toLuaFile ./nvim/plugins/lint.lua;
        }
        {
          plugin = indent-blankline-nvim;
          config = toLua "require('ibl').setup()";
        }
        {
          plugin = conform-nvim;
          config = toLuaFile ./nvim/plugins/conform.lua;
        }
        {
          plugin = nvim-cmp;
          config = toLuaFile ./nvim/plugins/cmp.lua;
        }
        {
          plugin = gitsigns-nvim;
          config = toLuaFile ./nvim/plugins/gitsigns.lua;
        }
        {
          plugin = (
            nvim-treesitter.withPlugins (p: [
              p.tree-sitter-nix
              p.tree-sitter-vim
              p.tree-sitter-bash
              p.tree-sitter-lua
              p.tree-sitter-python
              p.tree-sitter-json
              p.tree-sitter-r
              p.tree-sitter-latex
              p.markdown_inline
              p.gitignore
            ])
          );
          config = toLuaFile ./nvim/plugins/treesitter.lua;
        }
      ];
    };

  home.file = {
    ".wezterm.lua".source = ./dotfiles/wezterm.lua;
    ".config/zellij/config.kdl".source = ./dotfiles/zellij.kdl;
    ".config/zellij/layouts/default.kdl".source = ./dotfiles/zellij_layouts.kdl;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
