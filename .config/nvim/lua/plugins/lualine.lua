return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      require("lualine").setup({
        opts = { theme = "material" },
      })
    end,
  },
}
