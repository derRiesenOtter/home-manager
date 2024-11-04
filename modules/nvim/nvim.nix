{ config, pkgs, ... }:

{
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
        ${builtins.readFile ./options.lua}
        ${builtins.readFile ./keymaps.lua}
      '';
      plugins = with pkgs.vimPlugins; [
        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./plugins/lsp.lua;
        }
        {
          plugin = markdown-nvim;
          config = toLua "require('markdown').setup()";
        }
        {
          plugin = tokyonight-nvim;
          config = "colorscheme tokyonight-night";
        }
        {
          plugin = comment-nvim;
          config = toLua "require('Comment').setup()";
        }
        {
          plugin = telescope-nvim;
          config = toLuaFile ./plugins/telescope.lua;
        }
        telescope-fzf-native-nvim
        which-key-nvim
        {
          plugin = neogit;
          config = toLua "require('neogit').setup()";
        }
        {
          plugin = nvim-autopairs;
          config = toLua "require('nvim-autopairs').setup()";
        }
        {
          plugin = lualine-nvim;
          config = toLua "require('lualine').setup()";
        }
        nvim-web-devicons
        {
          plugin = todo-comments-nvim;
          config = toLua "require('todo-comments').setup()";
        }
        {
          plugin = luasnip;
          config = toLuaFile ./plugins/luasnip.lua;
        }
        luasnip
        friendly-snippets
        {
          plugin = yanky-nvim;
          config = toLuaFile ./plugins/yanky.lua;
        }
        render-markdown-nvim
        cmp_luasnip
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp_yanky
        cmp-nvim-lsp-signature-help
        lspkind-nvim
        dressing-nvim
        lazygit-nvim
        vim-tmux-navigator
        {
          plugin = vim-slime;
          config = toLuaFile ./plugins/slime.lua;
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
          config = toLuaFile ./plugins/lint.lua;
        }
        {
          plugin = indent-blankline-nvim;
          config = toLua "require('ibl').setup()";
        }
        {
          plugin = conform-nvim;
          config = toLuaFile ./plugins/conform.lua;
        }
        {
          plugin = nvim-cmp;
          config = toLuaFile ./plugins/cmp.lua;
        }
        {
          plugin = gitsigns-nvim;
          config = toLuaFile ./plugins/gitsigns.lua;
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
          config = toLuaFile ./plugins/treesitter.lua;
        }
      ];
    };

}
