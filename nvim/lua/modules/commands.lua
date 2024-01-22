local u = require('modules.util')


-- MISC
vim.api.nvim_create_user_command('Todo', ':tabnew ~/.todo.md', {}) -- open the quick todo file
vim.api.nvim_create_user_command('ETodo', ':e ~/.todo.md', {})     -- open the quick todo file in the current window

vim.api.nvim_create_user_command('GoTest', function()
	local file_relative_path = u.relative_path()

	-- remove /app because the Tests directory doesn't include it.
	local prefixToRemove = "app/"
	if string.startsWith(file_relative_path, prefixToRemove) then
		file_relative_path = file_relative_path:sub(#prefixToRemove + 1)
	end

	local fnmod = vim.fn.fnamemodify

	-- build the test file path: {path}/{name}Test.{ext}
	local ext = fnmod(file_relative_path, ':e') -- :e extension
	local name = fnmod(file_relative_path, ':t:r') -- :r full path without extension / :t last component of the path (filename)
	local path = fnmod(file_relative_path, ':h')
	local test_file_path = vim.fn.getcwd() .. '/tests/Feature/' .. path .. '/' .. name .. 'Test.' .. ext

	if vim.fn.filereadable(test_file_path) == 0 then
		local create_test_file = u.confirm("'%s' doesn't exist, do you want to create it? (y/n): ", { test_file_path })
		if not create_test_file then
			return
		end
		u.writeFile({ "" }, test_file_path)
	end

	vim.api.nvim_command(string.format("e %s", test_file_path))
end, {})
