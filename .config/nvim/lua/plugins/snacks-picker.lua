return {
  "folke/snacks.nvim",
  opts = {
    picker = {},
    explorer = {},
  },
  keys = {
    -- Top Pickers & Explorer
    {
      "<leader>ff",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fs",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
  },
}
