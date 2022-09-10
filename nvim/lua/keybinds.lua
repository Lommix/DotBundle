local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- split movement : linux
map('n','<A-h>','<C-w>h')
map('n','<A-j>','<C-w>j')
map('n','<A-k>','<C-w>k')
map('n','<A-l>','<C-w>l')

-- split movement : mac
map('n','ª','<C-w>h')
map('n','º','<C-w>j')
map('n','∆','<C-w>k')
map('n','@','<C-w>l')

-- split
map('n','<leader>s','<CMD>split<CR>')
map('n','<leader>v','<CMD>vsplit<CR>')
map('n','<leader>q','<CMD>close<CR>')
map('n','<leader>e','<CMD>vsplit<BAR>:Ex<CR>')

map('n','<leader>j',':resize -2<CR>')
map('n','<leader>k',':resize +2<CR>')
map('n','<leader>l',':vertical resize -2<CR>')
map('n','<leader>h',':vertical resize +2<CR>')

-- telescope
map('n','<leader>ff','<CMD>Telescope find_files<CR>')
map('n','<leader>fb','<CMD>Telescope buffers<CR>')
map('n','<leader>fh','<CMD>Telescope help_tags<CR>')
map('n','<leader>fg','<CMD>Telescope live_grep<CR>')
map('n','<leader>b','<CMD>Ex<CR>')

-- lsp
--map('n','<leader>f','<CMD>Autoformat<CR>')
map('n','<leader>f', vim.lsp.buf.formatting)
map('n','K', vim.lsp.buf.hover)
map('n','gd', vim.lsp.buf.definition)
map('n','gD', vim.lsp.buf.declaration)
map('n','gr', vim.lsp.buf.references)
map('n','gi', vim.lsp.buf.implementation)

--debug
local godot = require('plugins.godot')
map('n','<leader>b',godot.debug)
map('n','<leader>d',godot.debug_at_cursor)
