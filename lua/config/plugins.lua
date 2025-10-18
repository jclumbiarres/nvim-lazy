-- /home/devie/.config/nvim/lua/config/plugins.lua
-- Central plugin loader para lazy.nvim: importa módulos por plugin
local specs = {
    require("config.plugins.lsp"),
    require("config.plugins.cmp"),
    require("config.plugins.colorscheme"),
    require("config.plugins.treesitter"),
    require("config.plugins.telescope"),
    require("config.plugins.lualine"),
    require("config.plugins.lazygit"),
    require("config.plugins.gitsigns"),
    require("config.plugins.go"),
    require("config.plugins.harpoon"),
    require("config.plugins.toggleterm"),
    require("config.plugins.dap"),
    require("config.plugins.nio"),
    require("config.plugins.null-ls"),
    require("config.plugins.neotest"),
    require("config.plugins.noice"),
    require("config.plugins.notify"),
    require("config.plugins.orgmode"),
    require("config.plugins.tmux"),
}

require("lazy").setup(specs, {
    ui = {
        border = "rounded",
        icons = {
            cmd = " ",
            config = "",
            event = "",
            ft = " ",
            init = " ",
            import = " ",
            keys = " ",
            lazy = "鈴 ",
            loaded = "●",
            not_loaded = "○",
            plugin = " ",
            runtime = " ",
            source = " ",
            start = "",
            task = "✔ ",
            list = { "●", "➜", "★", "‒" },
        },
    },
})
