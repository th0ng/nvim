require('options')
require('keymaps')
require('plugins')
require('colorscheme')
require('bufferline-config')
require('toggleterm-config')
require('whichkey')

-- Filter which-key warnings
local orig_notify = vim.notify
vim.notify = function(msg, level, opts)
    if msg:match("which%-key") and level == vim.log.levels.WARN then
        return
    end
    orig_notify(msg, level, opts)
end

-- Ensure Neovim does not override the terminal's background:
vim.o.background = "dark"
vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
