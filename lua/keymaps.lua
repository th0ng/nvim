-- define common options
local opts = {
    noremap = true,
    silent = true
}

-- Set mapleader
vim.g.mapleader = " "

-- Normal mode
-- Split
vim.keymap.set('n', '<leader>/', ':vsplit<CR>', opts)

-- Better window navigation4
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Buffer
-- Close buffer, avoid closing nvim when deleting the last buffer
vim.keymap.set('n', '<leader>w', ':bp | bd #<CR>', opts)
-- Close all except current buffer
vim.keymap.set('n', '<leader>W', ':w | %bd | e# | bd#<CR>', opts)

-- Telescope
vim.keymap.set('n', 'ff', ':Telescope find_files<CR>', opts)
vim.keymap.set('n', 'fb', ':Telescope buffers<CR>', opts)
vim.keymap.set('n', 'fg', ':Telescope live_grep<CR>', opts)

-- Tree
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', opts)
vim.keymap.set('n', '<leader>b', '<cmd>Neotree focus buffers<CR>', opts)
vim.keymap.set('n', '<leader>g', '<cmd>Neotree focus git_status float<CR>', opts)
