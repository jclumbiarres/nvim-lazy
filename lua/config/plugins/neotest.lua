return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-jest",
  },
  config = function()
    local neotest = require("neotest")
    neotest.setup({
      adapters = {
        require("neotest-go")({
          experimental = { test_table = true },
        }),
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
      },
    })
    -- Keymaps (español-friendly)
    vim.keymap.set("n", "<leader>tt", function() neotest.run.run() end, { desc = "Test: Ejecutar test actual" })
    vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Test: Archivo actual" })
    vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "Test: Toggle resumen" })
    vim.keymap.set("n", "<leader>to", neotest.output.open, { desc = "Test: Ver salida" })
  end,
}
