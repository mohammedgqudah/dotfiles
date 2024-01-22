_G.Util = {}

function noremap(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.noremap = true

	vim.keymap.set(mode, lhs, rhs, opts)
end

function relative_path()
	return vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
end

-- ask user for confirmation (yes or no)
-- returns a boolean
function confirm(prompt, fmt_options)
	fmt_options = fmt_options or {}
	return vim.fn.input(string.format(prompt, unpack(fmt_options))):lower() == 'y'
end

function writeFile(content, path, recursive)
	vim.fn.mkdir(vim.fn.fnamemodify(path, ':h'), 'p')
	vim.fn.writefile(content, path)
end

function string.startsWith(str, prefix)
	return string.sub(str, 1, string.len(prefix)) == prefix
end

function table.contains(table, element)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

function getFunctionName()
	-- stolen from https://www.reddit.com/r/neovim/comments/nnru7r/comment/gzw4lnj/
	local ts_utils = require('nvim-treesitter.ts_utils')
	local current_node = ts_utils.get_node_at_cursor()
	local expr = current_node
	-- the index of the code block - for functions, it's 1
	-- however, for methods it's 2 because the first element would be the visibility modifier
	local index = 1

	while expr do
		if table.contains({ 'function_declaration', 'method_declaration' }, expr:type()) then
			if expr:type() == 'method_declaration' then index = 2 end
			break
		end
		expr = expr:parent()
	end

	if not expr then
		return nil
	end

	return (ts_utils.get_node_text(expr:child(index)))[1]
end

Util.noremap = noremap
Util.relative_path = relative_path
Util.confirm = confirm
Util.writeFile = writeFile
Util.getFunctionName = getFunctionName

return Util
