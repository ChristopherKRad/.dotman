" curl -fLO $HOME/.config/nvim/autoload/plug.vim --create dirs \ oi" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

set number
set nocompatible	" be iMproved, required
filetype off		" required
set clipboard+=unnamedplus " unclear clipboard setting

call plug#begin('~/.config/nvim/plugged')

Plug 'EdenEast/nightfox.nvim'
Plug 'tpope/vim-fugitive'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kana/vim-textobj-user'
Plug 'kdheepak/lazygit.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'master'}
Plug 'neovim/nvim-lspconfig'
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'fannheyward/coc-xml'
Plug 'mileszs/ack.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Language Specific

" Javascript
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1

" Python
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'amiralies/vim-textobj-elixir'
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

" XML
autocmd BufNewFile, BufRead *.xml set filetype=xml

" hard writing read for elixir - first elixir plug broken atm (04/08/22)
autocmd FileType elixir let b:coc_root_patterns = ['mix.exs']
autocmd BufNewFile,BufRead *.ex set filetype=elixir
autocmd BufNewFile,BufRead *.exs set filetype=elixir
autocmd BufNewFile,BufRead *.heex set filetype=elixir

call plug#end()

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Specific for indentaion 
" Plug 'lukas-reineke/indent-blankline.nvim'
:set shiftwidth=4
let g:indent_blankline_space_char_blankline = ' '

" Specfic formatting for Nightfox
colorscheme duskfox

" highlights line counter color
hi LineNr guifg=#E8A84F

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" mapping for sourcing neovim config (init.vim)
map <silent> <C-s> :source /home/chris/.config/nvim/init.vim<CR>

" Hotkey for fzf
map <silent> <C-f> :FZF<CR>

" Hotkey for NerdTree
map <silent> <C-n> :NvimTreeToggle<CR>

" Hotkey for resizing with mouse
map <silent> <C-o> :set mouse=n<CR>

" Hotkey for using escape to go from terminal mode to normal mode
:tnoremap <Esc> <C-\><C-n>

" Hotkey for launching LazyGit
map <silent> <C-\> :LazyGit<CR>

let g:deoplete#enable_at_startup = 1

" Config for the following:
" LanguageServerProtocol
" 'lukas-reineke/indent-blankline.nvim'
" 'kyazdani42/nvim-tree.lua'
"'kyazdani42/nvim-web-devicons'
:lua << EOF " Enable lua till end of file
local nvim_lsp = require('lspconfig')

nvim_lsp.elixirls.setup{
  cmd = { '/home/chris/.elixir-ls/release/language_server.sh' },
  on_attach = on_attach,
  settings = {
    elixirLS = {
      fetchDeps = false
    }
  }
}
-- indent_blankline config below
vim.opt.list = true
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

-- nvim-web-devicons config below
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

-- nvim tree config below
require("nvim-tree").setup()

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
