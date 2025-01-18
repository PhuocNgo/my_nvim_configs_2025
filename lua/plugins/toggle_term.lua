return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "float", -- Hiển thị terminal dạng cửa sổ nổi (có thể là "horizontal", "vertical" hoặc "float")
			float_opts = {
				border = "curved", -- Kiểu đường viền (curved, double, single, etc.)
			},
			shade_terminals = false, -- Làm mờ các cửa sổ khác khi terminal mở
			start_in_insert = true, -- Bắt đầu ở chế độ Insert khi mở terminal
		})
	end,
}
