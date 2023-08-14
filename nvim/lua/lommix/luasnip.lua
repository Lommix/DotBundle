local ok, ls = pcall(require, "luasnip")
if not ok then
	return
end

-- any vscode like plugin
require("luasnip.loaders.from_vscode").lazy_load()
if vim.fn.isdirectory("~/.vscode-oss/extensions") then
	local paths = {}
	local readdir = vim.fn.glob("~/.vscode-oss/extensions/*", true, true)
	for _, dir in pairs(readdir) do
		if vim.fn.isdirectory(dir) then
			table.insert(paths, dir)
		end
	end
	require("luasnip.loaders.from_vscode").lazy_load({ paths = paths })
end

-- lua snippets
require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets/" } })

local types = require("luasnip.util.types")

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	-- ext_opts = {
	-- 	[types.choiceNode] = {
	-- 		active = {
	-- 			virt_text = { { "<", "Error" } },
	-- 		},
	-- 	},
	-- },
})

--jump forward
vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

--jump back
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

-- choice
vim.keymap.set({ "i", "s" }, "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice()
	end
end)
