
return {
    "stevearc/conform.nvim",
    event = { "BufWritePre", "BufNewFile" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                rust = { "rustfmt" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        })

        -- Put the clang-format autocmd here
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.c", "*.h", "*.cpp", "*.hpp" },
            callback = function()
                vim.cmd("%!clang-format")
            end
        })
    end,
}
