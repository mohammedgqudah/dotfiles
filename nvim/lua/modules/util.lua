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

Util.noremap = noremap
Util.relative_path = relative_path
Util.confirm = confirm
Util.writeFile = writeFile

function string.startsWith(str, prefix)
	return string.sub(str, 1, string.len(prefix)) == prefix
end

return Util
