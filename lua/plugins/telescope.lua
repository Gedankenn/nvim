return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		--tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim", "BurntSushi/ripgrep" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>fG", builtin.grep_string, {})
			vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
			vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
			vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, {})
			vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, {})
			vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, {})
			vim.keymap.set("n", "<leader>ft", builtin.lsp_type_definitions, {})
			require("telescope").load_extension("ui-select")
		end,
	},
}
