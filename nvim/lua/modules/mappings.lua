local u = require('modules.util')


-- CONFIG --
u.noremap('n', '<leader>cc', '<cmd>tabnew $MYVIMRC<CR>')

-- TERMINAL --
u.noremap('t', '<esc>', '<C-\\><C-n>') -- map <esc> to normal mode
--u.noremap('n', '<leader>t', '<cmd>tabnew +term<CR>') -- open a new terminal tab

-- TABS
u.noremap('n', '<C-H>', '<C-w>h')
u.noremap('n', '<C-J>', '<C-w>j')
u.noremap('n', '<C-K>', '<C-w>k')
u.noremap('n', '<C-L>', '<C-w>l')
u.noremap('n', '<Tab>', '<cmd>tabnext<CR>')
u.noremap('n', '<S-Tab>', '<cmd>tabprevious<CR>')

-- Telescope
local telescope = require('telescope.builtin')
u.noremap('n', '<leader>git', telescope.git_status)
u.noremap('n', '<leader>ff', telescope.find_files)
u.noremap('n', '<leader>fb', function ()
	-- show buffers for the current directory only - usefull to have buffers per tab.
	require('telescope.builtin').buffers({ only_cwd = vim.fn.haslocaldir() == 1 })
end)
u.noremap('n', '<leader>fg', telescope.live_grep)

-- NERDTree
u.noremap('n', '<C-t>', '<cmd>NERDTreeToggle<CR>')

-- INSERT
u.noremap('i', 'ii', '<esc>')
--u.noremap('i', '\'', '\'\'<left>')
--u.noremap('i', '"', '""<left>')
--u.noremap('i', '(', '()<left>')
--u.noremap('i', '{', '{}<left>')

-- VISUAL
--f = string.format
--enclose = 'c%s%s<left><esc>p'
--
--u.noremap('v', '"', f(enclose, '"', '"'))
--u.noremap('v', '[', f(enclose, '[', ']'))

-- SEARCH
-- u.noremap('n', '<esc><esc>', '<cmd>noh<CR>')


-- Laravel
u.noremap('n', '<leader>t', function ()
	local testName = u.getFunctionName()
	if testName == nil then
		print("nil testName")
		return nil
	end

	vim.cmd('below 12new')
	vim.cmd('terminal php artisan test --filter ' .. testName)
end)

-- MISC
u.noremap('n', 'o', 'o<esc>')
u.noremap('n', 'O', 'O<esc>')
u.noremap('n', '<leader>lp', '<cmd>:lua vim.diagnostic.open_float()<CR>')
