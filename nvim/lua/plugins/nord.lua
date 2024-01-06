return {
	"shaunsingh/nord.nvim",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("nord")
		vim.cmd(":hi Normal guibg=NONE ctermbg=NONE")
	end,
}
