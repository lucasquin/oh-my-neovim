local ok, lsp = pcall(require, "lsp-zero")
if not ok then
    return
end

local sources = lsp.defaults.cmp_sources()
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp = require("cmp")
local lspsaga = require("lspsaga")

local border_opts = {
    border = "single",
    winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
}

lsp.preset("recommended")

lsp.set_preferences({
    sign_icons = { error = " ", warn = " ", hint = "ﴞ ", info = " " }
})

table.insert(sources, { name = "nvim_lsp_signature_help" })

lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

lsp.setup()

require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    completion = {
        keyword_length = 1,
    },
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
    },
    sources = sources,
    window = {
        completion = cmp.config.window.bordered(border_opts),
        documentation = cmp.config.window.bordered(border_opts),
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    },
})

lspsaga.setup({
    scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
    definition = {
        keys = {
            edit = "<CR>",
            quit = { "q", "<ESC>" },
        },
    },
    finder = {
        keys = {
            edit = "<CR>",
            quit = { "q", "<ESC>" },
        },
    },
    ui = {
        colors = {
            normal_bg = "#022746",
        },
    },
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<F12>", "<cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "<C-F12>", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.keymap.set("n", "<S-F12>", "<cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "<C-S-F12>", "<cmd>Lspsaga finder<CR>", opts)
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
vim.keymap.set("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", {})

