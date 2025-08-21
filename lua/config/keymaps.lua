-- ~/.config/nvim/lua/config/keymaps.lua
-- Configuración de keymaps

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Leader key
-- Guardar archivo con Ctrl+S (modo normal e insert)
keymap("n", "<C-s>", "<cmd>w<CR>", opts)
keymap("i", "<C-s>", "<Esc><cmd>w<CR>", opts)

-- Mejor navegación entre ventanas
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Redimensionar ventanas
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navegar buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)

-- Mover texto seleccionado
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Mover líneas en modo normal
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Mejor indentación en modo visual
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", opts)
-- Telescope mappings: already registered in which-key for descriptions

-- LSP (estos se configurarán en on_attach)
-- Se definen aquí para referencia
-- keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

-- Diagnósticos
keymap("n", "<leader>df", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "<leader>dl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Limpiar resaltado de búsqueda
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Terminal
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", opts)
keymap("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", opts)
keymap("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", opts)

-- Salir de modo terminal
keymap("t", "<esc>", "<C-\\><C-n>", opts)

-- Splits
keymap("n", "<leader>sv", "<cmd>vsplit<cr>", opts)
keymap("n", "<leader>sh", "<cmd>split<cr>", opts)
keymap("n", "<leader>sc", "<cmd>close<cr>", opts)

-- Tabs
keymap("n", "<leader>to", "<cmd>tabnew<CR>", opts)
keymap("n", "<leader>tc", "<cmd>tabclose<CR>", opts)
keymap("n", "<leader>tn", "<cmd>tabn<CR>", opts)
keymap("n", "<leader>tp", "<cmd>tabp<CR>", opts)

-- Formatear código
keymap("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, opts)

-- Salir de Neovim
keymap("n", "<leader>q", "<cmd>q<cr>", opts)
keymap("n", "<leader>Q", "<cmd>qa!<cr>", opts)
