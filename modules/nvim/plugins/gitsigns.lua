require("gitsigns").setup({
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		map("n", "<leader>hj", function()
			if vim.wo.diff then
				vim.cmd.normal({ "<leader>hj", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end, { desc = "[c] Next Git hunk" })

		map("n", "<leader>hk", function()
			if vim.wo.diff then
				vim.cmd.normal({ "<leader>hk", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end, { desc = "[c] Previous Git hunk" })

		map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "[c] Stage Hunk" })
		map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "[c] Reset Hunk" })
		map("v", "<leader>hs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "[c] Stage Hunk" })
		map("v", "<leader>hr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "[c] Reset Hunk" })
		map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "[c] Stage Buffer" })
		map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "[c] Undo Stage Buffer" })
		map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "[c] Reset Buffer" })
		map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "[c] Preview Hunk" })
		map("n", "<leader>hb", function()
			gitsigns.blame_line({ full = true })
		end, { desc = "[c] Blame Line" })
		map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[c] Toggle Line Blame" })
		map("n", "<leader>hd", gitsigns.diffthis, { desc = "[c] Diff Hunk" })
		map("n", "<leader>hD", function()
			gitsigns.diffthis("~")
		end, { desc = "[c] Diff Hunk" })
		map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "[c] Toggle Deleted" })

		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "[c] Select Hunk" })
	end,
})
