return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		wk.register({
			l = {
				name = "LSP", -- Category name
				a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
				r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
			},
			m = {
				name = "Mini-Pairs",
				t = { "<cmd>lua vim.g.minipairs_disable = not vim.g.minipairs_disable<CR>", "Toggle Mini-Pairs" }, --*--
			},
		}, { prefix = "<leader>" }) -- Set leader key prefix
		wk.register({
			d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "LSP Definition" },
			i = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show Info About Syntax" },
			l = { "<cmd>Neotree toggle left<CR>", "Neotree Toggle" },
			f = { "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", "None-ls Format" },
			t = {
				name = "Telescope",
				f = { "<cmd>Telescope find_files<CR>", "File Fuzzy Finder" },
				l = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
			},
		}, { prefix = "<M-" }) -- Set Control key prefix
	end,
}
