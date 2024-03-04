require('lualine').setup({
	options = {
		disabled_filetypes = {
			statusline = {'nerdtree'}
		},
		--component_separators = { left = '', right = ''},
		--section_separators = { left = '', right = ''},
		component_separators = { left = '|', right = '|'},
		section_separators = { left = '', right = ''},
	},
	--inactive_sections = {
	--	lualine_a = {function() return vim.fn.winnr() end},
	--	lualine_b = {'filename'},
	--	lualine_c = {},
	--	rualine_c = {},
	--}
})


