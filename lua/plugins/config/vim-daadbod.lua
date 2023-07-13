-- Connection string
vim.g.db = "mysql://root:masterkey@localhost:3306/gestaoescolar"

vim.cmd([[
    func! DBExe(...)
        if !a:0
            let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
            return 'g@'
        endif
        let sel_save = &selection
        let &selection = "inclusive"
        let reg_save = @@

        if a:1 == 'char'	" Invoked from Visual mode, use gv command.
            silent exe 'normal! gvy'
        elseif a:1 == 'line'
            silent exe "normal! '[V']y"
        else
            silent exe 'normal! `[v`]y'
        endif

        execute "DB " . @@

        let &selection = sel_save
        let @@ = reg_save
    endfunc

    xnoremap <expr> <Plug>(DBExe)     DBExe()
    nnoremap <expr> <Plug>(DBExe)     DBExe()
    nnoremap <expr> <Plug>(DBExeLine) DBExe() . '_'

    xmap <leader>db  <Plug>(DBExe)
    nmap <leader>db  <Plug>(DBExe)
    omap <leader>db  <Plug>(DBExe)
    nmap <leader>dbb <Plug>(DBExeLine)
]])
