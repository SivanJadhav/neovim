-- ~/.config/nvim/lua/plugins/autopairs.lua
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",  -- Load only when entering insert mode
    config = function()
        local npairs = require("nvim-autopairs")
        npairs.setup({
            check_ts = true,       -- Use treesitter to check for pairs (smart pairing)
            enable_check_bracket_line = false,
            fast_wrap = {
                map = "<M-e>",     -- Alt+e to wrap
                chars = { "{", "[", "(", '"', "'" },
                pattern = string.gsub("[%'\"%)%>%]%)%}]", "%p", "%%%0"),
                offset = 0,  -- Offset from cursor
                end_key = "$",
                keys = "qwertyuiopzxcvbnmasdfghjkl",
                check_comma = true,
                highlight = "Search",
                highlight_grey = "Comment",
            },
        })

        -- Optional: integrate with nvim-cmp for autopairing on completion
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
}
