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

