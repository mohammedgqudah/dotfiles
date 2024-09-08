vim.cmd [[
  call plug#begin()
	Plug 'preservim/nerdtree'
	Plug 'nvim-lua/plenary.nvim'
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
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'navarasu/onedark.nvim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'williamboman/mason.nvim'
	Plug 'arcticicestudio/nord-vim'
	Plug 'christoomey/vim-tmux-navigator'
  call plug#end()
]]

require('core.plugin_config')
require('modules.mappings')
require('modules.commands')
require('modules.luasnip')

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
	set termguicolors

	hi NormalCursor guifg=#5E81AC guibg=#81A1C1
	hi InsertCursor guifg=red guibg=red
	set guicursor=n:block-NormalCursor/lNormalCursor

	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
	autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

	let NERDTreeIgnore = ['\.pyc$', '__pycache__']
]]
