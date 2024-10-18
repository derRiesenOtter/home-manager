require("yanky").setup({
	{
		ring = {
			history_length = 100,
			storage = "shada",
			storage_path = vim.fn.stdpath("data") .. "/databases/yanky.db", -- Only for sqlite storage
			sync_with_numbered_registers = true,
			cancel_event = "update",
			ignore_registers = { "_" },
			update_register_on_cycle = false,
		},
		picker = {
			select = {
				action = nil,
			},
			telescope = {
				use_default_mappings = true,
				mappings = nil,
			},
		},
		system_clipboard = {
			sync_with_ring = true,
			clipboard_register = nil,
		},
		highlight = {
			on_put = true,
			on_yank = true,
			timer = 100,
		},
		preserve_cursor_position = {
			enabled = true,
		},
		textobj = {
			enabled = true,
		},
	},
})