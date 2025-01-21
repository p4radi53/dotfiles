return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
            },
          },
        },
      })
      telescope.load_extension("fzf")
      local keymap = vim.keymap

      keymap.set(
        "n",
        "<leader>ff",
        "<cmd>Telescope find_files<CR>",
        { desc = "Fuzzy find files in current directory" }
      )
      keymap.set(
        "n",
        "<leader>fs",
        "<cmd>Telescope live_grep<CR>",
        { desc = "Fuzzy find string in current directory" }
      )
      keymap.set(
        "n",
        "<leader>fg",
        "<cmd>Telescope git_files<CR>",
        { desc = "Fuzzy find string in current directory" }
      )
      keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Fuzzy find buffers" })
    end,
  },
}
