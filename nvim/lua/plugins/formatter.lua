return {
	"mhartington/formatter.nvim",
	config = function()
		local util = require("formatter.util")
		local formatter = require("formatter")

		formatter.setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				function()
						if util.get_current_buffer_file_name() == "special.lua" then
							return nil
						end
						return {
							exe = "stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--",
								"-",
							},
							stdin = true,
						}
					end,
				},
				ron = {
				function()
						return {
							exe = "ronfmt",
							args = {},
						}
					end,
				},
				php = {
					require("formatter.filetypes.php").php_cs_fixer,
				},
				sql = {
					require("formatter.filetypes.sql").pgformat,
				},
				markdown = {
					require("formatter.filetypes.markdown").prettier,
				},
				json = {
					require("formatter.filetypes.json").jq,
				},
				xml = {
				function()
						return {
							exe = "xmlformat",
							args = { "-i" },
						}
					end,
				},
				gdscript = {
				function()
						return {
							exe = "gdformat",
						}
					end,
				},
				python = {
					require("formatter.filetypes.python").black,
				},
				javascript = {
					require("formatter.filetypes.javascript").prettier,
				},
				typescript = {
					require("formatter.filetypes.typescript").prettier,
				},
				twig = {
					require("formatter.filetypes.html").prettier,
				},
				smarty = {
					require("formatter.filetypes.html").prettier,
				},
				html = {
					require("formatter.filetypes.html").prettier,
				},
				htmljango = {
					require("formatter.filetypes.html").prettier,
				},
				rust = {
					require("formatter.filetypes.rust").rustfmt,
				},
				go = {
					require("formatter.filetypes.go").gofumpt,
				},
			},
		})
	end
}
