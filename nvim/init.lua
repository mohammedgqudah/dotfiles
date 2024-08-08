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
	Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.2.0', 'do': 'make install_jsregexp'}
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'lewis6991/gitsigns.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'rebelot/kanagawa.nvim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'navarasu/onedark.nvim'
	Plug 'Yoolayn/nvim-intro'
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
	Plug 'marko-cerovac/material.nvim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'neanias/everforest-nvim', { 'branch': 'main' }
	Plug 'williamboman/mason.nvim'
	Plug 'arcticicestudio/nord-vim'
  call plug#end()
]]

require('core.plugin_config')

vim.cmd [[
   runtime lua/modules/mappings.lua
   runtime lua/modules/commands.lua
   runtime lua/modules/luasnip.lua
]]

--require('everforest').load()
--vim.cmd.colorscheme('material-oceanic')
--vim.cmd.colorscheme('kanagawa-dragon')
--vim.cmd.colorscheme('tokyonight-night')
--vim.cmd.colorscheme('onedark')
vim.cmd.colorscheme('nord')


vim.cmd.set('number')
vim.cmd.set('relativenumber')
vim.cmd.set('cursorline')
vim.cmd.set('autoindent')
vim.cmd.set('smartindent')
vim.api.nvim_set_option('tabstop', 4)
vim.api.nvim_set_option('shiftwidth', 4)

--vim.cmd [[
--	hi Normal guibg=NONE ctermbg=NONE
--	hi Visual guibg=#182333
--]]

-- TODO: convert to lua
vim.cmd [[
   " autocmd VimEnter * NERDTree
   autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
   autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
   " autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
   let NERDTreeIgnore = ['\.pyc$', '__pycache__']
]]
