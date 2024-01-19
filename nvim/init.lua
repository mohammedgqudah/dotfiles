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
  call plug#end()
]]

require('kanagawa').setup({
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none" -- remove the gutter/line-numbers background
				}
			}
		}
	}
})

require('nvim-treesitter.configs').setup({
	ensure_installed = {'lua', 'python', 'php'},
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
		  init_selection = "gnn", -- set to `false` to disable one of the mappings
		  node_incremental = "grn",
		  scope_incremental = "grc",
		  node_decremental = "grm",
		},
  },
})

require('gitsigns').setup()
require('ibl').setup({
	indent = {
		char = '┊'
	}
})
require('lualine').setup({
	options = {
		disabled_filetypes = {
			statusline = {'nerdtree'}
		},
		--component_separators = { left = '', right = ''},
		--section_separators = { left = '', right = ''},
		component_separators = { left = '|', right = '|'},
		section_separators = { left = '', right = ''},
	}
})

require("presence").setup({
	buttons = false,
	neovim_image_text = "NVIM"
})

vim.cmd [[
   runtime lua/modules/mappings.lua
   runtime lua/modules/commands.lua
   runtime lua/modules/luasnip.lua
]]

vim.cmd.colorscheme('kanagawa-wave')

vim.cmd.set('number')
vim.cmd.set('autoindent')
vim.cmd.set('smartindent')
vim.api.nvim_set_option('tabstop', 4)
vim.api.nvim_set_option('shiftwidth', 4)

-- TODO: convert to lua
vim.cmd [[
   " autocmd VimEnter * NERDTree
   autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
   autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
   " autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
]]

