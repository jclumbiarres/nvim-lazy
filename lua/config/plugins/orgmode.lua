return {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    config = function()
        require("orgmode").setup({
            org_agenda_files = { '~/org/*' },
            org_default_notes_file = '~/org/refile.org',
            org_babel = {
                load_languages = {
                    python = true,
                    shell = true,
                    lua = true,
                    go = true,
                },
            },
        })
        -- Keymaps básicos para orgmode (español-friendly)
        vim.keymap.set("n", "<leader>oa", "<cmd>OrgAgenda<CR>", { desc = "Org Agenda" })
        vim.keymap.set("n", "<leader>oc", "<cmd>OrgCapture<CR>", { desc = "Org Capture" })
        vim.keymap.set("n", "<leader>ot", ":OrgTodo<Space>", { desc = "Org TODO" })
        vim.keymap.set("n", "<leader>on", "<cmd>e ~/org/notes.org<CR>", { desc = "Abrir notas org" })
        -- Tangle: exportar bloques de código a archivo
        vim.keymap.set("n", "<leader>ox", function()
            vim.cmd('OrgTangle')
        end, { desc = "Org Tangle: exportar bloques a archivo" })
        -- Ejecutar el archivo tanglado (último exportado)
        vim.keymap.set("n", "<leader>oe", function()
            -- Busca el primer archivo #+PROPERTY: header-args :tangle <file> en el buffer actual
            local file = nil
            for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
                local match = line:match("tangle%s+([%w%._/-]+)")
                if match then
                    file = match
                    break
                end
            end
            if file then
                vim.cmd('!chmod +x ' .. file .. ' && ' .. file)
            else
                vim.notify('No se encontró archivo tanglado en el buffer', vim.log.levels.WARN)
            end
        end, { desc = "Ejecutar archivo tanglado" })
    end,
}
