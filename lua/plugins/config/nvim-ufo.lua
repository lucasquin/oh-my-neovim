local _, ufo = pcall(require, "ufo")
if not _ then
    return
end

vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

ufo.setup({
    close_fold_kinds = { 'imports' },
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (' ↙ %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
                table.insert(newVirtText, chunk)
            else
                chunkText = truncate(chunkText, targetWidth - curWidth)
                local hlGroup = chunk[2]
                table.insert(newVirtText, { chunkText, hlGroup })
                chunkWidth = vim.fn.strdisplaywidth(chunkText)
                -- str width returned from truncate() may less than 2nd argument, need padding
                if curWidth + chunkWidth < targetWidth then
                    suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                end
                break
            end
            curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, 'UfoFoldedEllipsis' })
        return newVirtText
    end,
})

local _, statuscol = pcall(require, "statuscol")
if not _ then
    return
end

local builtin = require("statuscol.builtin")
statuscol.setup(
    {
        relculright = true,
        segments = {
            { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
            { text = { "%s" },                  click = "v:lua.ScSa" },
            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" }
        }
    })
