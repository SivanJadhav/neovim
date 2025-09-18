return {
  -- Core LSP configs
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      -- Mason setup
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "rust_analyzer" },
        automatic_installation = true,
      })

      -- Capabilities (for autocompletion)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local mymaps = require("sivanthechad.keymaps")

      -- LSP servers
      local servers = { "clangd", "rust_analyzer", "cmake" }
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          on_attach = mymaps.on_attach,
          capabilities = capabilities,
        })
      end

      -- Completion setup
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),            -- trigger completion
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- confirm
          ["<C-n>"] = cmp.mapping.select_next_item(),        -- next item
          ["<C-p>"] = cmp.mapping.select_prev_item(),        -- prev item
          ["<C-e>"] = cmp.mapping.abort(),                   -- close menu
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
