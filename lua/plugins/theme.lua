-- ~/.config/nvim/lua/plugins/onedark.lua
return {
    {
        "navarasu/onedark.nvim",
        lazy = false,  -- load on startup
        config = function()
            require("onedark").setup {
                style = "darker"  -- valid styles: "dark", "darker", "cool", "deep", "warm"
            }
            require("onedark").load()

            -- global function to refresh theme
            _G.Color = function()
                require("onedark").load()
                print("🌌 Onedark theme applied!")
            end
        end
    }
}

