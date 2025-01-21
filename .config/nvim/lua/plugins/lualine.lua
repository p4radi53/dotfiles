return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			require("lualine").setup({
				options = { theme = "material" },
			})
		end,
	},
}
