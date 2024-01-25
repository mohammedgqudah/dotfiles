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
	))
}
