vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>", { desc = "[c] Exit insert mode with jk" })
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "[c] Clear search highlights" })
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "[c] Increment number" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "[c] Decrement number" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "[c] Navigate to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "[c] Navigate to the window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "[c] Navigate to the window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "[c] Navigate to the right window" })
vim.keymap.set("n", "<C-q>", "<C-w>w", { desc = "[c] Navigate to the next window" })

vim.keymap.set({ "n", "x" }, "<leader>p", function()
	require("telescope").extensions.yank_history.yank_history({})
end, { desc = "[c] Open Yank History" })
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", { desc = "[c] Yanky Paste After" })
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", { desc = "[c] Yanky Paste Before" })
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", { desc = "[c] Navigate to the left window" })
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", { desc = "[c] Navigate to the left window" })
vim.keymap.set(
	{ "n", "x" },
	"<c-p>",
	"<Plug>(YankyPreviousEntry)",
	{ desc = "[c] Select previous entry through yank history" }
)
vim.keymap.set({ "n", "x" }, "<c-n>", "<Plug>(YankyNextEntry)", { desc = "[c] Select next entry through yank history" })
vim.keymap.set(
	{ "n", "x" },
	"]p",
	"<Plug>(YankyPutIndentAfterLinewise)",
	{ desc = "[c] Put indented after cursor (linewise)" }
)
vim.keymap.set(
	{ "n", "x" },
	"[p",
	"<Plug>(YankyPutIndentBeforeLinewise)",
	{ desc = "[c] Put indented before cursor (linewise)" }
)
vim.keymap.set(
	{ "n", "x" },
	"]P",
	"<Plug>(YankyPutIndentAfterLinewise)",
	{ desc = "[c] Put indented after cursor (linewise)" }
)
vim.keymap.set(
	{ "n", "x" },
	"[P",
	"<Plug>(YankyPutIndentBeforeLinewise)",
	{ desc = "[c] Put indented before cursor (linewise)" }
)
vim.keymap.set({ "n", "x" }, ">p", "<Plug>(YankyPutIndentAfterShiftRight)", { desc = "[c] Put and indent right" })
vim.keymap.set({ "n", "x" }, "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", { desc = "[c] Put and indent left" })
vim.keymap.set(
	{ "n", "x" },
	">P",
	"<Plug>(YankyPutIndentBeforeShiftRight)",
	{ desc = "[c] Put before and indent right" }
)
vim.keymap.set({ "n", "x" }, "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", { desc = "[c] Put before and indent left" })
vim.keymap.set({ "n", "x" }, "=p", "<Plug>(YankyPutAfterFilter)", { desc = "[c] Put after applying a filter" })
vim.keymap.set({ "n", "x" }, "=P", "<Plug>(YankyPutBeforeFilter)", { desc = "[c] Put before applying a filter" })
vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "[c] LazyGit" })
vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "[c] Nvim Tree toggle" })

vim.keymap.set("n", "s", require("substitute").operator, { noremap = true })
vim.keymap.set("n", "ss", require("substitute").line, { noremap = true })
vim.keymap.set("n", "S", require("substitute").eol, { noremap = true })
vim.keymap.set("x", "s", require("substitute").visual, { noremap = true })

vim.keymap.set("n", "<leader>fd", ":TodoTelescope<CR>", { desc = "Telescope TODO" })

local harpoon_mark = require("harpoon.mark")
vim.keymap.set("n", "<leader>fa", harpoon_mark.add_file, { desc = "Add file to Harpoon" })

local harpoon_ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>f1", function()
	harpoon_ui.nav_file(1)
end, { desc = "[c] Navigate to Harpoon file 1" })
vim.keymap.set("n", "<leader>f2", function()
	harpoon_ui.nav_file(2)
end, { desc = "[c] Navigate to Harpoon file 2" })
vim.keymap.set("n", "<leader>f3", function()
	harpoon_ui.nav_file(3)
end, { desc = "[c] Navigate to Harpoon file 3" })
vim.keymap.set("n", "<leader>f4", function()
	harpoon_ui.nav_file(4)
end, { desc = "[c] Navigate to Harpoon file 4" })
vim.keymap.set("n", "<leader>f5", function()
	harpoon_ui.nav_file(5)
end, { desc = "[c] Navigate to Harpoon file 5" })
vim.keymap.set("n", "<leader>f6", function()
	harpoon_ui.nav_file(6)
end, { desc = "[c] Navigate to Harpoon file 6" })

vim.keymap.set("n", "<leader>fl", harpoon_ui.toggle_quick_menu, { desc = "[c] Toggle Harpoon Menu" })
vim.keymap.set("n", "<leader>fn", harpoon_ui.nav_next, { desc = "[c] Navigate to next Harpoon mark" })
vim.keymap.set("n", "<leader>fp", harpoon_ui.nav_prev, { desc = "[c] Navigate to previous Harpoon mark" })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[c] Telescope find files" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[c] Telescope find recent files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[c] Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[c] Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[c] Telescope help tags" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[c] Telescope keymaps" })
vim.keymap.set("n", "<leader>fc", builtin.current_buffer_fuzzy_find, { desc = "[c] Telescope current" })
vim.keymap.set("n", "<leader>ft", builtin.current_buffer_tags, { desc = "[c] Telescope tags" })
