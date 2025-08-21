return {
  "rcarriga/nvim-notify",
  config = function()
    vim.notify = require("notify")
    require("notify").setup({
      stages = "fade_in_slide_out",
      timeout = 3000,
      background_colour = "#1e222a",
      render = "default",
    })
    -- Keymap para mostrar historial de notificaciones
    vim.keymap.set("n", "<leader>un", require("notify").dismiss, { desc = "Cerrar notificaciones" })
  end,
}
