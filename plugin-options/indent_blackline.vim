let g:indent_blankline_space_char_blankline = ' '

:lua << EOF " Enable lua till end of file
-- indent_blankline config below
vim.opt.list = true
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}


