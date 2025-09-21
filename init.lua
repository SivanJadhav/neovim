-- Load settings and keymaps
require("sivanthechad.settings")
require("sivanthechad.keymaps")
require("config.lazy")

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
