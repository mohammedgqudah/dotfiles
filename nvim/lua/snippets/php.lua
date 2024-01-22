local util = require('modules.util')


function ResolveNameSpace(_, _, _)
	-- get the head of the file (parent directory of the file)
	local path = vim.fn.fnamemodify(util.relative_path(), ':h')
	-- /app isn't under the tests directory
	path = string.gsub(path, '/app', '')
	-- replace OS separator with php namespace sep.
	path = string.gsub(path, '/', '\\')
	-- capitalize the first component in the namespace.
	return string.gsub(path, '^%l', string.upper)
end

function ResolveClassName(_, _, _)
	-- get the tail of the path: /path/to/File.php -> File.php
	local className = vim.fn.fnamemodify(vim.fn.expand('%'), ':t')

	return string.gsub(className, '%.php', '')
end

return {
	s('fun', fmt("function {}() {{\n\t{}\n}}", { i(1), i(2) })),
	s('tmeth', fmt('/** @test */\npublic function {}() {{\n\t{}\n}}', { i(1), i(2) })),
	s('query', fmt('{}::query()\n\t->where({}, {})\n{}', { i(1), i(2), i(3), i(4) })),
	s({
		trig = "laravelTest",
		desc = "build a [laravel] [test] file"
	}, fmt([[
			<?php

			namespace {namespace};

			use Illuminate\Foundation\Testing\RefreshDatabase;
			use Tests\TestCase;

			class {className} extends TestCase
			{{
				use RefreshDatabase;

				{}
			}}
		]], {
			namespace = f(ResolveNameSpace),
			className = f(ResolveClassName),
			i(1)
		})
	),
}
