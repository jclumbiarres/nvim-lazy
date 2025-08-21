-- ~/.config/nvim/init.lua
-- Configuración principal de Neovim

-- Configuración básica
require('config.options')
require('config.keymaps')

-- Plugin manager (lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Plugins (modularized)
require('config.plugins')
-- lazy will be initialized by the plugin loader modules
