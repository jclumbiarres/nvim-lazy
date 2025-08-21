return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    require("nvim-dap-virtual-text").setup()
    dapui.setup()

    -- Delve config for Go
    dap.adapters.go = function(callback, _)
      local handle
      local pid_or_err
      local port = 38697
      handle, pid_or_err = vim.loop.spawn("dlv", {
        args = {"dap", "--listen=127.0.0.1:" .. port, "--log"},
        detached = true
      }, function(code)
        handle:close()
        print("Delve exited with exit code: " .. code)
      end)
      -- Wait 100ms for delve to start
      vim.defer_fn(function()
        callback({
          type = "server",
          host = "127.0.0.1",
          port = port
        })
      end, 100)
    end
    dap.configurations.go = {
      {
        type = "go",
        name = "Debug",
        request = "launch",
        program = "${file}"
      },
      {
        type = "go",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
      }
    }

    -- Keymaps
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
    vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
    vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step Out" })
    vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
    vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run Last" })
    vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
  end
}
