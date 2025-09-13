return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",  -- load on startup
        config = function()
            require("lualine").setup()
        end,
    }
}

