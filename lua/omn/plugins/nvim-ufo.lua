return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
		vim.opt.foldcolumn = "1"
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
		vim.opt.foldenable = true

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "neo-tree" },
			callback = function()
				require("ufo").detach()
				vim.opt_local.foldenable = false
			end,
		})

		require("ufo").setup()
	end,
}
