return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({})
			lspconfig.html.setup({})
			lspconfig.lua_ls.setup({})

            vim.keymap.set("n", "<C-d>", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
            vim.keymap.set("n", "<C-i>", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
		end,
	},
}
