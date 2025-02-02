return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("tokyonight").setup({
			transparent = true,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = { bold = true },
				variables = {},
				sidebars = "transparent",
				floats = "transparent",
			},
		})
		vim.cmd([[colorscheme tokyonight-night]])
	end,
}
