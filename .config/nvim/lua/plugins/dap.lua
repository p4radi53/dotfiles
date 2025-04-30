return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", ":DapToggleBreakpoint<CR>", desc = "Toggle breakpoint" },
      { "<leader>dc", ":DapContinue<CR>",         desc = "Continue" },
    },
    dependencies = {
      {
        "igorlfs/nvim-dap-view",
        opts = {
          windows = {
            terminal = {
              hide = { "go" },
            },
          },
        },
      },
    },
    config = function()
      local dap = require("dap")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("dap-go").setup()
    end,
  },
}
