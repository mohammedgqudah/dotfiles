local util = require('modules.util')

function resolveNameSpace(_, _, _)
	local path = util.relative_path()
	path = vim.fn.fnamemodify(path, ':r')

	return string.gsub(path, '/', '\\')
end

return {
	s('fun', fmt("function {}() {{\n\t{}\n}}", { i(1), i(2) })),
	s('tmeth', fmt('/** @test */\npublic function {}() {{\n\t{}\n}}', { i(1), i(2) })),
	s('query', fmt('{}::query()\n\t->where({}, {})\n{}', { i(1), i(2), i(3), i(4) })),
	s({
		trig = "laravelTest",
		desc = "build a [laravel] [test] file"
	}, {
		t("<?php"),
		f(resolveNameSpace, {}, {})
	}),
}
