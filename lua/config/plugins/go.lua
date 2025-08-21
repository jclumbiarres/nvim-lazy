return {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("go").setup({
            -- Disable gopls since we configure it separately
            disable_defaults = false,
            go = "go",                -- go command, can be go[default] or go1.18beta1
            goimport = "gopls",       -- goimport command, can be gopls[default] or goimport or goimports
            fillstruct = "gopls",     -- can be nil (use fillstruct, slower) and gopls
            gofmt = "gofumpt",        -- gofmt cmd. Usa 'golines' para que max_line_len tenga efecto
            -- max_line_len = 120, -- Solo efectivo si gofmt = 'golines'. Target maximum line length for golines
            tag_transform = false,    -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
            tag_options = "json=omitempty", -- sets options sent to gomodifytags, i.e., json=omitempty
            gotests = {               -- gotests
                template = "",        -- sets gotests -template parameter (check gotests for details)
                template_dir = "",    -- sets gotests -template_dir parameter (check gotests for details)
            },
            schema = {
                source = "pkg.go.dev", -- "pkg.go.dev", "gopls"
            },
            comment_placeholder = "   ",
            icons = { breakpoint = "🧘", currentpos = "🏃" }, -- setup to `false` to disable icons setup
            verbose = false, -- output loginf in messages
            lsp_cfg = false, -- false: use your own lspconfig setup, true: use go.nvim default setup
            lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
            lsp_on_attach = nil, -- use on_attach from go.nvim
            dap_debug = true,
            dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
            dap_debug_gui = {}, -- bool|table put your dap-ui setup here set to false to disable
            dap_debug_vt = { enabled_commands = true, all_frames = true }, -- bool|table put your dap-virtual-text setup here set to false to disable

            gopls = {
                -- we will set this to false since we handle gopls configuration separately
                disable = true,
            },

            luasnip = true, -- enable included luasnip snippets. B
        })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
