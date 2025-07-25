vim.opt.termguicolors = true

require("bufferline").setup{
    options = {
        hover = {
            enable = true,
            delay = 150,
            reveal = {'close'}
        }
    }
}
