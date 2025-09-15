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
local telescope = require('telescope.builtin') u.noremap('n', '<leader>git', telescope.git_status)
u.noremap('n', '<leader>ff', telescope.find_files)
u.noremap('n', '<leader>fb', function()
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
u.noremap('n', '<leader>t', function()
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

-- remap <leader>fg inside NERDTree to search inside the directory currently selected.
local function live_grep_from_nerdtree()
  if vim.bo.filetype ~= "nerdtree" then
    print("Not in a NERDTree buffer")
    return
  end

  -- Ask NERDTree for the selected directory (if a file is selected, this returns its parent dir)
  local ok, dir = pcall(vim.api.nvim_eval, "g:NERDTreeDirNode.GetSelected().path.str()")
  if not ok or not dir or dir == "" then
    print("NERDTree: couldn't get selected path")
    return
  end

  telescope.live_grep({ search_dirs = { dir } })
end
vim.api.nvim_create_autocmd("FileType", {
  pattern = "nerdtree",
  callback = function()
    vim.keymap.set("n", "<leader>fg", live_grep_from_nerdtree, {
      buffer = true, silent = true, desc = "Telescope live_grep in selected dir",
    })
  end,
})
--
--
-- Drop this in your init.lua (or a lua module you source)

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf     = require("telescope.config").values
local actions  = require("telescope.actions")
local action_state = require("telescope.actions.state")
local tbuiltin = require("telescope.builtin")

-- Use git root if available; otherwise cwd
local function project_root()
  local cwd = vim.loop.cwd()
  local git = vim.fn.systemlist("git -C " .. vim.fn.shellescape(cwd) .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error == 0 and git and git ~= "" then return git end
  return cwd
end

local function pick_dir_then_live_grep()
  local root = project_root()

  -- Build a job that lists directories (absolute paths) under root
  local cmd
  if vim.fn.executable("fd") == 1 then
    -- fd: absolute paths (-a), type dir (-t d), include hidden (-H), follow symlinks (-L), exclude .git
    cmd = { "fd", "-a", "-t", "d", "-H", "-L", "-E", ".git", ".", root }
  else
    -- find fallback (absolute paths from root), ignore .git
    cmd = { "find", root, "-type", "d", "-not", "-path", "*/.git/*" }
  end

  pickers.new({}, {
    prompt_title = "Select directory for live_grep",
    finder = finders.new_oneshot_job(cmd, { cwd = root }),
    sorter = conf.generic_sorter({}),
    previewer = false,
    attach_mappings = function(prompt_bufnr, map)
      local function run_live_grep()
        local entry = action_state.get_selected_entry()
        if not entry or not entry.value then return end
        actions.close(prompt_bufnr)
        tbuiltin.live_grep({ search_dirs = { entry.value } })
      end
      map("i", "<CR>", run_live_grep)
      map("n", "<CR>", run_live_grep)
      return true
    end,
  }):find()
end

-- Keymap: <leader>dfg
vim.keymap.set("n", "<leader>dfg", pick_dir_then_live_grep,
  { desc = "Pick a directory -> Telescope live_grep", silent = true })
