-- ~/.config/nvim/lua/config/options.lua
-- Configuración de opciones básicas de Neovim

local opt = vim.opt

-- General
opt.fileencoding = "utf-8"
opt.backup = false
opt.swapfile = false
opt.autoread = true
opt.hidden = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- Preferir xclip si está disponible para copy/paste en X11/Wayland
local function has_cmd(cmd)
  return vim.fn.executable(cmd) == 1
end

if has_cmd("xclip") then
  vim.g.clipboard = {
    name = "xclip",
    copy = {
      ["+"] = "xclip -selection clipboard -in",
      ["*"] = "xclip -selection primary -in",
    },
    paste = {
      ["+"] = "xclip -selection clipboard -out",
      ["*"] = "xclip -selection primary -out",
    },
    cache_enabled = 0,
  }
  -- ensure unnamedplus uses system clipboard
  opt.clipboard = "unnamedplus"
end

-- Interface
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.termguicolors = true
opt.showmode = false
opt.cmdheight = 1
opt.laststatus = 3
opt.pumheight = 10

-- Indentación
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true

-- Búsqueda
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Tiempo de espera
opt.updatetime = 300
opt.timeout = true
opt.timeoutlen = 500

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- Completado
opt.completeopt = { "menuone", "noselect" }

-- Whitespace characters
opt.list = true
-- opt.listchars = {
--   tab = "→ ",
--   eol = "↲",
--   nbsp = "␣",
--   trail = "•",
--   extends = "⟩",
--   precedes = "⟨",
-- }

-- Desactivar providers innecesarios
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Variables globales
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- clipboard ya se establece con opt.clipboard arriba ("unnamedplus")
