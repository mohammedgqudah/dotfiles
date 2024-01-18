local ls = require('luasnip')

ls.setup({
	update_events = {"TextChanged", "TextChangedI"}
})

require('luasnip.loaders.from_lua').load({
	paths = {"~/.config/nvim/lua/snippets/"}
})

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = false})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

-- snippet - s(<trigger>, <nodes>)
local s = ls.s
-- format - f(<fmt_string>, {...nodes})
local fmt = require('luasnip.extras.fmt').fmt
-- insert node - i(<position>, <default>)
local i = ls.insert_node
-- repeat node
local rep = require('luasnip.extras').rep
local t = ls.text_node


