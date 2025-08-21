return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      shade_terminals = true,
      direction = "float",
      float_opts = {
        border = "curved",
      },
    })
    -- Keymaps para terminal flotante, horizontal y vertical
    vim.keymap.set("n", "<leader>tf", function()
      require("toggleterm.terminal").Terminal:new({ direction = "float" }):toggle()
    end, { desc = "Terminal flotante" })
    vim.keymap.set("n", "<leader>th", function()
      require("toggleterm.terminal").Terminal:new({ direction = "horizontal", size = 10 }):toggle()
    end, { desc = "Terminal horizontal" })
    vim.keymap.set("n", "<leader>tv", function()
      require("toggleterm.terminal").Terminal:new({ direction = "vertical", size = 80 }):toggle()
    end, { desc = "Terminal vertical" })
  end,
  event = "VeryLazy",
}
