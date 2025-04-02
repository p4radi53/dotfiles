return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		local sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.terraform_fmt,
			null_ls.builtins.diagnostics.terraform_validate,
      null_ls.builtins.formatting.gofmt,
		}

		null_ls.setup({
			sources = sources,
		})
	end,
}
