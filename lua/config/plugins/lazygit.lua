return {
  "kdheepak/lazygit.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
   cmd = { "LazyGit", "LazyGitConfig" },
   keys = {
     { "<leader>gg", function()
         vim.cmd("LazyGit")
       end, desc = "Abrir LazyGit (flotante)" },
   },
   config = function()
     vim.g.lazygit_floating_window_winblend = 10 -- transparencia
     vim.g.lazygit_floating_window_scaling_factor = 1.0
     vim.g.lazygit_floating_window_border_chars = {"╭","─","╮","│","╯","─","╰","│"}
     vim.g.lazygit_use_neovim_remote = 1
   end,
   event = "VeryLazy",
}
