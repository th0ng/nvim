vim.opt.termguicolors = true

require("bufferline").setup{
    options = {
        hover = {
            enable = true,
            delay = 150,
            reveal = {'close'}
        },
        offsets = {
            {
                filetype = "neo-tree",
                text = "File Explorer",
                text_align = "center",
                separator = true
            }
        }
    }
}
