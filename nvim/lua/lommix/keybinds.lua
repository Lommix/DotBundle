local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- split movement : linux
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")

-- split movement : mac
map("n", "ª", "<C-w>h")
map("n", "º", "<C-w>j")
map("n", "∆", "<C-w>k")
map("n", "@", "<C-w>l")

-- split
map("n", "<leader>sh", "<C-w>s")
map("n", "<leader>sv", "<C-w>v")
map("n", "<leader>se", "<C-w>=")
map("n", "<leader>q", ":close<CR>")

-- tabs
map("n", "<leader>to", ":tabnew<CR>")
map("n", "<leader>tx", ":tabclose<CR>")
map("n", "<leader>tn", ":tabn<CR>")
map("n", "<leader>tp", ":tabp<CR>")

-- util
map("n", "<leader>+", "<C-a>")
map("n", "<leader>-", "<C-x>")
map("n", "x", '"_x')
-- map("n", "<leader>e", ":NvimTreeFindFileToggle<CR>:NvimTreeFocus<CR>")
map("n", "<leader>e", ":Oil --float<CR>")

-- resize
map("n", "<C-Right>", "<C-w><")
map("n", "<C-Left>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- git
map("n", "<leader>lg", ":lua _LAZYGIT_TOGGLE()<CR>")
map("n", "<leader>ld", ":lua _LAZYDOCKER_TOGGLE()<CR>")
map("n", "<leader>go", ":lua _GOQUICKRUN_TOGGLE()<CR>")

-- telescope
map("n", "<leader>ff", ":Telescope find_files find_command=rg,--ignore,--files prompt_prefix=🔍<CR>")
map("n", "<leader>fg", ":Telescope live_grep find_command=rg,--ignore,--files prompt_prefix=🔍<CR>")
map("n", "<leader>fs", ":Telescope grep_string find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>")
map("n", "<leader>fb", "<CMD>Telescope buffers<CR>")
map("n", "<leader>fh", "<CMD>Telescope help_tags<CR>")

map("n", "<leader>fF", function()
	require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
end)

map("n", "<leader>fG", function()
	require("telescope.builtin").live_grep({
		additional_args = function(args)
			return vim.list_extend(args, { "--hidden", "--no-ignore" })
		end,
	})
end)
--harpoon

-- lspsaga
map("n", "<leader>i", ":LspInfo<CR>")
map("n", "<leader>fa", ":lua vim.lsp.buf.format()<CR>")
map("n", "<C-k>", "<Cmd>Lspsaga show_line_diagnostics <CR>")
map("n", "K", "<Cmd>Lspsaga hover_doc <CR>")
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
map("n", "gD", "<cmd>Lspsaga lsp_finder<CR>")
map("n", "gp", "<Cmd>Lspsaga peek_definition<CR>")
map("n", "gr", "<Cmd>Lspsaga rename ++project<CR>")
map("n", "gt", "<Cmd>Lspsaga code_action<CR>")
map("n", "gn", "<cmd>Telescope diagnostics<CR>")
map("n", "gi", "<cmd>Lspsaga goto_type_definition<CR>")

-- clear highlight search
map("n", "<CR>", "<CR> :noh<CR><CR>")
map("n", "<leader>r", ":lua require('nvim-reload').Reload()<CR>:syntax on<CR>")

-- flowers
map("n", "<leader><leader>1", ":colorscheme catppuccin_mocha<CR>")
map("n", "<leader><leader>2", ":colorscheme tokyonight-moon<CR>")
map("n", "<leader><leader>3", ":colorscheme gruvbox<CR>")
map("n", "<leader><leader>5", ":colorscheme nightfly<CR>")
map("n", "<leader><leader>6", ":colorscheme kanagawa<CR>")
map("n", "<leader><leader>b", ":hi normal ctermbg=none guibg=none<CR>")

-- rust
map("n", "<leader>ta", ":!cargo test -- --nocapture<CR>")
