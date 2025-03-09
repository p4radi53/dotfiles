return {
	"linux-cultist/venv-selector.nvim",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Venv Selection" },
	},
}
