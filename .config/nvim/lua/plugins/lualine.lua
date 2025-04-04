return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local lualine = require("lualine")
      lualine.setup({
        options = { theme = "material" },
      })
    end,
  },
}
