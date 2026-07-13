return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			{
				-- Additional text objects for treesitter
				"nvim-treesitter/nvim-treesitter-textobjects",
				branch = "main",
			},
		},
		config = function()
			---@diagnostic disable: missing-fields

			--- List of parsers to enable
			local ensure_installed = {
				"c",
				"cpp",
				"rust",
				"python",
				"bash",
				"lua",
				"markdown",
				-- "yaml", This is currently borked see: https://github.com/ikatyang/tree-sitter-yaml/issues/53
			}

			require("nvim-treesitter").setup()
			require("nvim-treesitter").install(ensure_installed)

			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})

			require("nvim-treesitter-textobjects").setup({
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
			})
		end,
	},
}
