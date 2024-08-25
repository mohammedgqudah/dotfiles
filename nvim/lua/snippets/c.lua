return {
	s({
		trig = "printf",
		desc = "printf"
	}, fmt(
		[[
			printf("{}", {});
		]],
		{ i(1), i(2) }
	)),
	s({
		trig = "for",
		desc = "for loop"
	}, fmt(
		[[
			for ({type} {name} = {init}; i < {cond}; {inc}) {{
				{last}
			}}
		]],
		{
			type = i(1, "int"),
			name = i(2, "i"),
			init = i(3, "0"),
			cond = i(4, "10"),
			inc = i(5, "i++"),
			last = i(6),
		}
	)),
	s({
		trig = "ifns",
		desc = "if function call was not succcessful"
	}, fmt(
		[[
			if ({func}({arg}) != 0) {{
				{inner}
			}}
		]],
		{
			func = i(1),
			arg = i(2),
			inner = i(3),
		}
	))
}
