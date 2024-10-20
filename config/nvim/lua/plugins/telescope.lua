return {
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"plenary",
		},
		config = function()
			require("telescope").setup({
				fzf = {
					fuzzy = false, -- false will only do exact matching
					override_generic_sorter = false, -- override the generic sorter
					override_file_sorter = false, -- override the file sorter
					case_mode = "ignore_case", -- or "ignore_case" or "respect_case"
				},
				defaults = {
					path_display = function(opts, path)
						local parts = {}
						for part in string.gmatch(path, "[^/]+") do
							table.insert(parts, part)
						end

						local new_path = {}
						for i, part in ipairs(parts) do
							if i ~= #parts then
								table.insert(new_path, string.sub(part, 1, 3))
							else
								table.insert(new_path, part)
							end
						end
						return table.concat(new_path, "/")
					end,
					file_ignore_patterns = { ".png", ".jpg", ".svg", ".import", ".jepg", ".aseprite", ".glb" },
				},
			})
		end,
		after = {
			"nvim-lspconfig",
			"nvim-treesitter",
		},
		keys = {
			{ "<leader>ff", ":Telescope find_files find_command=rg,--ignore,--files prompt_prefix=🔍<CR>" },
			{ "<leader>fg", ":Telescope live_grep find_command=rg,--ignore,--files prompt_prefix=🔍<CR>" },
			{
				"<leader>fs",
				function()
					require("telescope.builtin").grep_string({
						additional_args = function(args)
							return vim.list_extend(args, { "--hidden", "--no-ignore" })
						end,
					})
				end,
				mode = "n",
			},
			{ "<leader>fb", "<CMD>Telescope buffers<CR>" },
			{ "<leader>fh", "<CMD>Telescope help_tags<CR>" },
			{ "<leader>fc", "<CMD>Telescope colorscheme<CR>" },
			{
				"<leader>fd",
				function()
					require("telescope.builtin").find_files({
						hidden = true,
						no_ignore = true,
						search_dirs = { "~/.config/nvim" },
					})
				end,
			},
			{
				"<leader>FF",
				function()
					require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
				end,
			},
			{
				"<leader>fG",
				function()
					require("telescope.builtin").live_grep({
						additional_args = function(args)
							return vim.list_extend(args, { "--hidden", "--no-ignore" })
						end,
					})
				end,
			},
			{
				"<leader>FG",
				function()
					local filetype = vim.fn.input("Filetype: ")
					require("telescope.builtin").live_grep({
						type_filter = filetype,
						additional_args = function(args)
							return vim.list_extend(args, { "--hidden", "--no-ignore" })
						end,
					})
				end,
			},
			{
				mode = "v",
				"<leader>fs",
				function()
					require("telescope.builtin").grep_string({
						additional_args = function(args)
							return vim.list_extend(args, { "--hidden", "--no-ignore" })
						end,
					})
				end,
			},
		},
	},
}
