local u = require('modules.util')


-- CONFIG --
u.noremap('n', '<leader>cc', '<cmd>tabnew $MYVIMRC<CR>')

-- TERMINAL --
u.noremap('t', '<esc>', '<C-\\><C-n>') -- map <esc> to normal mode
u.noremap('n', '<leader>t', '<cmd>tabnew +term<CR>') -- open a new terminal tab

-- TABS
u.noremap('n', '<C-H>', '<C-w>h')
u.noremap('n', '<C-J>', '<C-w>j')
u.noremap('n', '<C-K>', '<C-w>k')
u.noremap('n', '<C-L>', '<C-w>l')
u.noremap('n', '<Tab>', '<cmd>tabnext<CR>')
u.noremap('n', '<S-Tab>', '<cmd>tabprevious<CR>')

-- Telescope
u.noremap('n', '<leader>ff', '<cmd>Telescope find_files<CR>')

-- NERDTree
u.noremap('n', '<C-t>', '<cmd>NERDTreeToggle<CR>')

-- INSERT
u.noremap('i', 'ii', '<esc>')
u.noremap('i', '\'', '\'\'<left>')
u.noremap('i', '"', '""<left>')
u.noremap('i', '(', '()<left>')
u.noremap('i', '{', '{}<left>')

-- VISUAL
f = string.format
enclose = 'c%s%s<left><esc>p'

u.noremap('v', '"', f(enclose, '"', '"'))
u.noremap('v', '[', f(enclose, '[', ']'))

-- SEARCH
u.noremap('n', '<esc><esc>', '<cmd>noh<CR>')