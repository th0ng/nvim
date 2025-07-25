require('options')
require('keymaps')
require('plugins')
require('colorscheme')
require('bufferline-config')
require('toggleterm-config')
require('whichkey')

-- Ensure Neovim does not override the terminal's background:
vim.o.background = "dark"
vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
