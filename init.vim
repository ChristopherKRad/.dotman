" curl -fLO $HOME/.config/nvim/autoload/plug.vim --create dirs \ oi" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

set number relativenumber
set nocompatible	" be iMproved, required
filetype off		" required
set clipboard+=unnamedplus " unclear clipboard setting

call plug#begin('~/.config/nvim/plugged')

Plug 'EdenEast/nightfox.nvim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kana/vim-textobj-user'
Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3' }
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

" Specific formatting for vim-deep-space
"syntax on
"set background=dark
"set termguicolors
"let g:deepspace_italics=1

" Specfic formatting for Nightfox
colorscheme nightfox

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
map <silent> <C-n> :NERDTreeFocus<CR>

" Hotkey for resizing with mouse
map <silent> <C-m> :set mouse=n<CR>

let g:deoplete#enable_at_startup = 1

" Config for telescope-file-browser


" LanguageServerProtocol
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
