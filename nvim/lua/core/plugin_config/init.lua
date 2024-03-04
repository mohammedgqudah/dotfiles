require('core.plugin_config.cmp')
require('core.plugin_config.lsp')
require('core.plugin_config.kanagawa')
require('core.plugin_config.nvim_treesitter')
require('core.plugin_config.lualine')
require('core.plugin_config.ibl')
require('core.plugin_config.presence')
require('core.plugin_config.gitsigns')

require('nvim-intro').setup({
	intro = {
		"███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
		"████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
		"██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
		"██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
		"██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
		"╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
		"                                                      ",
		"  type  :GoTest 			  ->   to open the test file ",
		"                                                      ",
		"                                                      ",
		"  press <leader>ff         ->   to find files         ",
		"  press <leader>fb         ->   to find buffers       ",
		"  press <leader>git        ->   to show modified files",
		"                                                      ",
		"                   Have a nice day :)                 ",
	},
	color = "#f7f3f2",
	scratch = true,
	highlights = {
		["<leader>"] = "#187df0",
	}
})
