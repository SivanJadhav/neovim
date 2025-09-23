local cpp = require("sivanthechad.code_snippets.cpp")
local java = require("sivanthechad.code_snippets.java")

return {
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			local ls = require("luasnip")
			local s = ls.snippet
			local t = ls.text_node
			local i = ls.insert_node

			require("sivanthechad.code_snippets.cpp")(ls, s, t, i)
			require("sivanthechad.code_snippets.java")(ls, s, t, i)

			vim.keymap.set({ "i", "s" }, "<C-k>", function()
				if ls.expand_or_jumpable() then ls.expand_or_jump() end
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-j>", function()
				if ls.jumpable(-1) then ls.jump(-1) end
			end, { silent = true })
		end
	}
}
