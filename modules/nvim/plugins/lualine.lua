local colors = {
	black = "#161616",
	turquoise = "#08BDBA",
	purple = "#BD95FE",
	white = "#F2F4F8",
	red = "#ED5296",
	green = "#25BE6A",
	blue = "#78A9FF",
	grey = "#353535",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.blue, bg = colors.grey },
		b = { fg = colors.turquoise, bg = colors.grey },
		c = { fg = colors.turquoise },
	},

	insert = { a = { fg = colors.green, bg = colors.grey } },
	visual = { a = { fg = colors.red, bg = colors.grey } },
	replace = { a = { fg = colors.purple, bg = colors.grey } },
	command = { a = { fg = colors.turquoise, bg = colors.grey } },

	inactive = {
		a = { fg = colors.white, bg = colors.grey },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white },
	},
}

require("lualine").setup({

	options = {
		theme = bubbles_theme,
		component_separators = "",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
		lualine_b = { "filename", "branch" },
		lualine_c = {
			"%=", --[[ add your center compoentnts here in place of this comment ]]
		},
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})
