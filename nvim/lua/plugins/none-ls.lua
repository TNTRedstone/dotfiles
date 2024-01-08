return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
			},
		})

        vim.keymap.set("n", "<C-f>", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true })
	end,
}
