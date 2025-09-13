    return {
      "stevearc/conform.nvim",
      event = { "BufWritePre", "BufNewFile" },
      config = function()
        require("conform").setup({
          formatters_by_ft = {
            rust = { "rustfmt" },
          },
          -- Optional: Set up automatic formatting on save
          format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
          },
        })
      end,
    }
