return {
	s('fun', fmt("function {}() {{\n\t{}\n}}", {i(1), i(2)})),
	s('tmeth', fmt('/** @test */\npublic function {}() {{\n\t{}\n}}', {i(1), i(2)})),
	s('query', fmt('{}::query()\n->where({}, {})\n{}', {i(1), i(2), i(3), t(4)}))
}
