local _, indent_blankline = pcall(require, "indent_blankline")
if not _ then
    return
end

indent_blankline.setup {
    show_end_of_line = false,
}
