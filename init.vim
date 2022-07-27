" curl -fLO $HOME/.config/nvim/autoload/plug.vim --create dirs \ oi" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
set termguicolors
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
Plug 'ryanoasis/vim-devicons'
Plug 'feline-nvim/feline.nvim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'tpope/vim-surround'
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

" options
runtime options.vim
runtime! plugin-options/*.vim
" }}}
" mappings
runtime maps.vim
" }}}
" Specific for indentaion 
:set shiftwidth=4


" line counter color
hi LineNr guifg=#E8A84F

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

