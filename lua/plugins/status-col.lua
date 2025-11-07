return {
  "luukvbaal/statuscol.nvim",
  opts = function()
    local builtin = require "statuscol.builtin"
    return {
      ft_ignore = { "help", "vim", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "toggleterm" },
      setopt = true,
      segments = {
        { text = { " " } },
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        { text = { "%s" }, click = "v:lua.ScSa" },
        {
          text = { builtin.lnumfunc, " " },
          condition = { true, builtin.not_empty },
          click = "v:lua.ScLa",
        },
      },
    }
  end,
  config = function(_, opts)
    ft_ignore = opts.ft_ignore
    opts.ft_ignore = nil
    require("statuscol").setup(opts)
    vim.api.nvim_create_autocmd({ "BufEnter", "BufNew" }, {
      callback = function(ev)
        if vim.tbl_contains(ft_ignore, vim.bo.filetype) then
          vim.cmd "setlocal foldcolumn=0"
        end
      end,
    })
  end,
}
