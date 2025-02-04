return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"python",
					"rust",
					"java",
					"javascript",
					"typescript",
					"html",
					"css",
					"terraform",
					"hcl",
					"yaml",
					"toml",
					"json",
          "markdown",
          "go",
          "just"
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
