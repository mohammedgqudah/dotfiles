_G.Util = {}

function noremap(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.noremap = true

	vim.keymap.set(mode, lhs, rhs, opts)
end

Util.noremap = noremap

return Util
