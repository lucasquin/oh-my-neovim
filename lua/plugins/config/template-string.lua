local _, template_string = pcall(require, "template-string")
if not _ then
    return
end

template_string.setup({
    filetypes = { 'html', 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'python' },
    jsx_brackets = true,
    remove_template_string = false,
    restore_quotes = {
        normal = [[']],
        jsx = [["]],
    },
})

