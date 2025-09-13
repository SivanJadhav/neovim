-- Leader Key
vim.g.mapleader = " "

-- Helper Function
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Some Remaps
map("n", "<leader>pv", vim.cmd.Ex, opts)
map("n", "<leader>sv", vim.cmd.vsplit, opts)
map("n", "<leader>sh", vim.cmd.split, opts)
map("n", "<leader>sc", vim.cmd.close, opts)
map("n", "<leader>rn", function() vim.opt.relativenumber = not vim.opt.relativenumber:get() end, opts)
map("n", "<leader>ch", vim.cmd.noh, opts)

-- Telescope: Fuzzy Finder Settings
map("n", "<leader>pe", "<cmd>Telescope find_files<cr>", opts)
map("n", "<C-p>", "<cmd>Telescope git_files<cr>", opts)
map("n", "<leader>ps", function()
  require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end, opts)

-- LSP Keymaps
-- LSP keymaps (attach these only when LSP is active)
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }

  -- Go to definition
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

  -- Hover docs
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  -- Symbol rename
  vim.keymap.set("n", "<leader>rs", vim.lsp.buf.rename, opts)

  -- Code actions (quick fixes, refactors)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  -- Diagnostics navigation
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

  -- Show diagnostics (line-level)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

  -- Format buffer (if server supports it)
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format { async = true }
  end, opts)
end

-- Export on_attach so you can use it in lspconfig
return {
  on_attach = on_attach
}

