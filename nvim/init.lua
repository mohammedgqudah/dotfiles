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
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
	Plug 'tjdevries/colorbuddy.nvim'
	Plug 'jesseleite/nvim-noirbuddy'
	Plug 'marko-cerovac/material.nvim'
	Plug 'AlexvZyl/nordic.nvim'
	Plug 'rebelot/kanagawa.nvim'
  call plug#end()
]]

--require('noirbuddy').setup {
--  colors = {
--    primary = '#eceff4', -- is this good?
--  },
--}

require('core.plugin_config')
require('modules.mappings')
require('modules.commands')
require('modules.luasnip')

--vim.cmd.colorscheme('nord')
--vim.cmd.colorscheme('habamax')
--vim.cmd.colorscheme('nordic')
vim.cmd.colorscheme('nordic')
-- in nord the WinSeparator color is white (not on all terminals anyway)
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3b4252" })


vim.cmd.set('number')
vim.cmd.set('relativenumber')
vim.cmd.set('cursorline')
vim.cmd.set('autoindent')
vim.cmd.set('smartindent')
vim.api.nvim_set_option('tabstop', 4)
vim.api.nvim_set_option('shiftwidth', 4)

vim.opt.termguicolors = true
--vim.wo.foldmethod = 'expr'
--vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'


-- white cursor for insert mode, blue for normal.
vim.api.nvim_set_hl(0, 'NormalCursor', { fg = '#5E81AC', bg = '#FFFFFF' })
vim.api.nvim_set_hl(0, 'InsertCursor', { fg = '#FFFFFF', bg = '#FFFFFF' })
vim.opt.guicursor = {
	'n:block-NormalCursor/lNormalCursor',
	'i:block-InsertCursor/lInsertCursor'
}


vim.g.NERDTreeIgnore = { '\\.pyc$', '__pycache__', '\\.o$' }
--vim.cmd [[
--	hi Normal guibg=NONE ctermbg=NONE
--	hi Visual guibg=#182333
--]]

vim.cmd [[
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
	autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]]
