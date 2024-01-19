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


