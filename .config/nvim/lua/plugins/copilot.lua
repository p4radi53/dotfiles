return {
	{
		"github/copilot.vim",
		event = "VeryLazy",
		config = function()
			vim.g.copilot_no_tab_map = true
		end,
		keys = {
			{
				"<C-a>",
				'copilot#Accept("<CR>")',
				expr = true,
				silent = true,
				replace_keycodes = false,
				mode = "i",
				desc = "Accept Copilot sugggestion",
			},
		},
	},
}
