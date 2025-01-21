return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = function()
			require("catppuccin").setup({
        transparent_background=true
      }) 
		end,
	},
}
