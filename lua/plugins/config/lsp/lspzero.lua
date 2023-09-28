local _, lspzero = pcall(require, "lsp-zero")
if not _ then
    return
end

local _, luasnip = pcall(require, "luasnip")
if not _ then
    return
end

local _, lspkind = pcall(require, "lspkind")
if not _ then
    return
end

local _, cmp = pcall(require, "cmp")
if not _ then
    return
end

local sources = lspzero.defaults.cmp_sources()

local border_opts = {
    border = "single",
    winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
}

lspzero.preset("recommended")

lspzero.set_preferences({
    sign_icons = { error = " ", warn = " ", hint = "ﴞ ", info = " " }
})

table.insert(sources, { name = "nvim_lsp_signature_help" })

lspzero.configure("lua_ls", {
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

lspzero.setup()

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
