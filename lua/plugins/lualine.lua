return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		lualine.setup({
			options = {
				theme = "tokyonight",
				disabled_filetypes = { "NvimTree" },
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_x = {
					{ "filetype" },
				},
				lualine_a = {
					{
						"mode",
						color = { gui = "bold" },
					},
				},
			},
		})
	end,
}
