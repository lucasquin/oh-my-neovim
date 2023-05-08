local lsp_lens = require('lsp-lens')

lsp_lens.setup({
  enable = true,
  include_declaration = false,      -- Reference include declaration
  sections = {                      -- Enable / Disable specific request
    definition = false,
    references = true,
    implementation = true,
  },
  ignore_filetype = {
    "prisma",
  },
})
