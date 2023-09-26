local _, symbol_usage = pcall(require, "symbol-usage")
if not _ then
    return
end

local SymbolKind = vim.lsp.protocol.SymbolKind

symbol_usage.setup({
    --@type table<string, any> `nvim_set_hl`-like options for highlight virtual text
    hl = { link = 'Comment' },
    --@type lsp.SymbolKind[] Symbol kinds what need to be count (see `lsp.SymbolKind`)
    kinds = { SymbolKind.Function, SymbolKind.Method },
    --Additional filter for kinds. Recommended use in the filetypes override table.
    --fiterKind: function(data: { symbol:table, parent:table, bufnr:integer }): boolean
    --`symbol` and `parent` is an item from `textDocument/documentSymbol` request
    --See: #filter-kinds
    --@type table<lsp.SymbolKind, filterKind[]>
    kinds_filter = {},
    --@type 'above'|'end_of_line'|'textwidth' above by default
    vt_position = 'above',
    --Text to display when request is pending. If `false`, extmark will not be
    --created until the request is finished. Recommended to use with `above`
    --vt_position to avoid "jumping lines".
    --@type string|false
    request_pending_text = 'loading...',
    --@type function(symbol: Symbol): string Symbol{ definition = integer|nil, implementation = integer|nil, references = integer|nil }
    text_format = function(symbol)
        local fragments = {}

        if symbol.references then
            local usage = symbol.references <= 1 and 'usage' or 'usages'
            local num = symbol.references == 0 and 'no' or symbol.references
            table.insert(fragments, ('%s %s'):format(num, usage))
        end

        if symbol.definition then
            table.insert(fragments, symbol.definition .. ' defs')
        end

        if symbol.implementation then
            table.insert(fragments, symbol.implementation .. ' impls')
        end

        return table.concat(fragments, ', ')
    end,
    references = { enabled = true, include_declaration = false },
    definition = { enabled = false },
    implementation = { enabled = false },
    --@type UserOpts[] See default overridings in `lua/symbol-usage/langs.lua`
    -- filetypes = {},
})
