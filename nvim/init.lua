vim.cmd [[
  call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'nvim-lua/plenary.nvim'
    " Plug 'wadackel/vim-dogrun'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
    Plug 'andweeb/presence.nvim'
    Plug 'folke/tokyonight.nvim'
    Plug 'szw/vim-g'
    Plug 'nvim-tree/nvim-web-devicons'
  call plug#end()
]]

vim.cmd [[
   runtime lua/modules/mappings.lua
   runtime lua/modules/commands.lua
]]

vim.cmd.colorscheme('tokyonight')

vim.cmd.set('number')
vim.cmd.set('autoindent')
vim.cmd.set('smartindent')

vim.cmd [[
   autocmd VimEnter * NERDTree
   autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
   autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
   autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
]]

