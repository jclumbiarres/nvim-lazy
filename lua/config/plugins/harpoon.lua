    -- Mostrar menú de Harpoon con <leader>hl
    vim.keymap.set("n", "<leader>hl", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon menú de archivos" })
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})

    -- Guardar archivos en slots 1-4 con <leader>ha, hb, hc, hd
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon add file 1" })
    vim.keymap.set("n", "<leader>hb", function() harpoon:list():add() end, { desc = "Harpoon add file 2" })
    vim.keymap.set("n", "<leader>hc", function() harpoon:list():add() end, { desc = "Harpoon add file 3" })
    vim.keymap.set("n", "<leader>hd", function() harpoon:list():add() end, { desc = "Harpoon add file 4" })

    -- Saltar a archivos 1-4 con <leader>1..4
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon goto 1" })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon goto 2" })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon goto 3" })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon goto 4" })

    -- Menú visual de archivos con Telescope
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end
      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({ results = file_paths }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end
    vim.keymap.set("n", "<leader>hl", function() toggle_telescope(harpoon:list()) end, { desc = "Harpoon menú de archivos (Telescope)" })
  end,
  event = "VeryLazy",
}
