return {
	"oxfist/night-owl.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("night-owl").setup({
			bold = true,
			italics = true,
			underline = true,
			undercurl = true,
			transparent_background = false,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		})
		vim.cmd.colorscheme("night-owl")
	end,
}
