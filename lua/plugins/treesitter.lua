-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        event = "BufRead", -- lazy-load on buffer read
		opts = {
      		ensure_installed = { "rust" },
      		highlight = { enable = true },
    	}
    }
}

