return {
	s('req', fmt(
			"local {} = require('{}')",
			{i(1), rep(1)}
	)),
	s('if', fmt(
		"if {} then\n\t{}\nend",
		{i(1), i(2)}
	)),
	s({
		trig = "resu",
		desc = "[re]quire & [s]et[u]p"
	}, fmt(
		[[
			require('{}').setup({{
				{}
			}})
		]],
		{i(1), i(2)}
	)),
	s({
		trig = "fmtsnip",
		desc = "build a [snip]pet"
	}, fmt(
		[=[
			s({{
				trig = "{}",
				desc = "{}"
			}}, fmt(
				[[
					{}
				]],
				{{{}}}
			))
		]=],
		{i(1), i(2), i(3), i(4)}
	)),
	s({
		trig = "vfn",
		desc = "[v]im.[fn].*"
	}, fmt(
		"vim.fn.{}({})",
		{i(1), i(2)}
	)),
	s({
		trig = "vcmd",
		desc = "[v]im.[cmd].*"
	}, fmt(
		"vim.cmd.{}({})",
		{i(1), i(2)}
	)),
	s({
		trig = "plug",
		desc = "add a Plug [plug]in"
	}, fmt(
		[[
			Plug '{}'
		]],
		{i(1)}
	))
}

