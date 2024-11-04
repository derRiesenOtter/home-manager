require("lspconfig").lua_ls.setup({})
require("lspconfig").nixd.setup({})
require("lspconfig").r_language_server.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").texlab.setup({})
require("lspconfig").marksman.setup({})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		opts.desc = "[c] Show LSP references"
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

		opts.desc = "[c] Go to declaration"
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		opts.desc = "[c] Show LSP definitions"
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

		opts.desc = "[c] Show LSP implementations"
		vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

		opts.desc = "[c] Show LSP type definitions"
		vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

		opts.desc = "[c] See available code actions"
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

		opts.desc = "[c] Smart rename"
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		opts.desc = "[c] Show buffer diagnostics"
		vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

		opts.desc = "[c] Show line diagnostics"
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

		opts.desc = "[c] Go to previous diagnostic"
		vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts)

		opts.desc = "[c] Go to next diagnostic"
		vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)

		opts.desc = "[c] Show documentation for what is under cursor"
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

		opts.desc = "[c] Restart LSP"
		vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
	end,
})
