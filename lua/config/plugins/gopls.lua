-- go.lua - Configuración específica y completa para Go LSP (gopls)
return {
  "neovim/nvim-lspconfig",
  ft = { "go", "gomod", "gowork", "gotmpl" },
  config = function()
    -- Función on_attach específica para Go
    local function go_on_attach(client, bufnr)
      -- Configuración básica de LSP
      local opts = { buffer = bufnr, silent = true }

      -- Keymaps LSP básicos
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

      -- Formatear al guardar
      vim.keymap.set("n", "<leader>lf", function()
        vim.lsp.buf.format({
          async = true,
          filter = function(c)
            return c.name == "gopls"
          end
        })
      end, opts)

      -- Auto-formatear al guardar
      local augroup = vim.api.nvim_create_augroup("GoFormat", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        pattern = "*.go",
        callback = function()
          -- Organizar imports
          local params = vim.lsp.util.make_range_params()
          params.context = { only = { "source.organizeImports" } }
          local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
          for _, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
              if r.edit then
                vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
              else
                vim.lsp.buf.execute_command(r.command)
              end
            end
          end

          -- Formatear
          vim.lsp.buf.format({
            async = false,
            filter = function(c)
              return c.name == "gopls"
            end
          })
        end,
      })

      -- Resaltar símbolo bajo el cursor
      if client.server_capabilities.documentHighlightProvider then
        local group = vim.api.nvim_create_augroup("GoDocumentHighlight", { clear = true })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          group = group,
          buffer = bufnr,
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
          group = group,
          buffer = bufnr,
          callback = vim.lsp.buf.clear_references,
        })
      end
    end

    -- Configuración de capacidades para Go
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- Configuración completa de gopls usando la nueva API
    vim.lsp.config.gopls = {
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_markers = { "go.work", "go.mod", ".git" },
      capabilities = capabilities,
      on_attach = go_on_attach,
      settings = {
        gopls = {
          -- Análisis estático
          analyses = {
            unusedparams = true,
            unreachable = true,
            fillreturns = true,
            nonewvars = true,
            shadow = true,
            unusedwrite = true,
            useany = true,
          },

          -- Experimentos
          experimentalPostfixCompletions = true,

          -- Codelenses
          codelenses = {
            gc_details = false,
            generate = true,
            regenerate_cgo = true,
            run_govulncheck = true,
            test = true,
            tidy = true,
            upgrade_dependency = true,
            vendor = true,
          },

          -- Completado
          completeUnimported = true,
          usePlaceholders = true,
          matcher = "Fuzzy",

          -- Diagnósticos
          diagnosticsDelay = "500ms",
          symbolMatcher = "fuzzy",
          symbolStyle = "Dynamic",

          -- Hints
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },

          -- Herramientas de formateo e imports
          gofumpt = true,
          staticcheck = true,
          vulncheck = "Imports",

          -- Variables de entorno para herramientas
          env = {
            GOFLAGS = "-tags=integration",
          },

          -- Configuración de imports
          ["local"] = "",
          importShortcut = "Both",
          linkTarget = "pkg.go.dev",

          -- Configuración de build
          buildFlags = { "-tags=integration" },

          -- Configuración de directorio de trabajo
          directoryFilters = {
            "-node_modules",
            "-vendor",
            "-.git",
            "-.vscode",
            "-.idea",
            "-.vscode-test",
            "-__debug_bin",
          },

          -- Configuración de plantillas
          templateExtensions = { "tpl", "yaml", "yml" },

          -- Semántica de tokens
          semanticTokens = true,
        },
      },

      -- Inicialización de opciones
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
      },
    }

    -- Habilitar el servidor gopls
    vim.lsp.enable("gopls")

    -- Auto-comandos adicionales para Go
    local augroup = vim.api.nvim_create_augroup("GoLSP", { clear = true })

    -- Configurar el ancho de tab para Go
    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      pattern = "go",
      callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = false
        vim.opt_local.listchars:append("tab:  ")
      end,
    })

    -- Configurar folding para Go
    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      pattern = "go",
      callback = function()
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt_local.foldenable = false
      end,
    })
  end,
}
