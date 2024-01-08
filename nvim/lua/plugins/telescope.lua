return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
            vim.keymap.set("n", "<C-tf>", "<cmd>Telescope find_files<CR>", { noremap = true })
            vim.keymap.set("n", "<C-tl>", "<cmd>Telescope live_grep<CR>", { noremap = true })
			require("telescope").load_extension("ui-select")
		end,
	},
}
