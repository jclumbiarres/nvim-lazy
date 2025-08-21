return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "truncate" },
        file_ignore_patterns = { "%.git/", "node_modules/", "%.o", "%.a", "%.out", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip" },
        mappings = { i = { ["<C-u>"] = false, ["<C-d>"] = false } },
      },
      pickers = {
        find_files = { theme = "dropdown", previewer = false },
        buffers = { theme = "dropdown", previewer = false, initial_mode = "normal" },
      },
      extensions = { fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case" } },
    })
    pcall(require("telescope").load_extension, "fzf")
    -- Atajo para abrir el buscador de keymaps nativo
    vim.keymap.set("n", "<leader>km", require('telescope.builtin').keymaps, { desc = "Buscar keymaps (Telescope)" })
  end,
}
