nmap <leader>cc <cmd>tabnew ~/.config/nvim/init.vim<CR>
command! Todo :tabnew ~/.todo.md

call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'nvim-lua/plenary.nvim'
  " Plug 'wadackel/vim-dogrun'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
  Plug 'andweeb/presence.nvim'
  Plug 'folke/tokyonight.nvim'
call plug#end()

" setup NERDTree
nmap <C-t> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

" setup Telescope
nmap <leader>ff <cmd>Telescope find_files<CR>

" Setup themes
colorscheme tokyonight 

" Setup tabbing and windows
nmap <Tab> <cmd>tabnext<CR>
nmap <C-H> <C-w>h
nmap <C-J> <C-w>j
nmap <C-K> <C-w>k
nmap <C-L> <C-w>l


set number
set encoding=utf8
set autoindent
set smartindent
