return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = function()
			local wk = require("which-key")
			wk.add({
				{ "<leader>f", group = "Fuzzy Finder" },
				{ "<leader>h", group = "Harpoon" },
				{ "<leader>c", group = "Code actions" },
				{ "<leader>t", group = "Trouble" },
			})
		end,
	},
}
