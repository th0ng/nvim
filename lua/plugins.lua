local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Dashboard
    {
        "goolord/alpha-nvim",
        dependencies = {
            'echasnovski/mini.icons',
            'nvim-lua/plenary.nvim'
        },
        config = function ()
            require'alpha'.setup(require'alpha.themes.theta'.config)
        end
    },

    -- Colorscheme
    "rebelot/kanagawa.nvim",

    -- Autocompletion
    {
        'saghen/blink.cmp',

        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },

        version = '1.*',
        -- build = 'cargo build --release',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = 'enter' }
        },

        appearance = {
            nerd_font_variant = 'mono'
        },

        completion = { documentation = { auto_show = false } },

        -- Default list of enabled providers defined so that you can extend it elsewhere
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },

        completion = {
            -- The keyword should only match against the text before
            keyword = { range = "prefix" },
            menu = {
                draw = { treesitter = { "lsp" }, },
            },

            trigger = { show_on_trigger_character = true },

            documentation = {
                auto_show = true,
            },
        },
    },

    -- LSP manager
    { "mason-org/mason.nvim", opts = {} },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },

        opts = {
            ensure_installed = { "pylsp", "gopls" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.pylsp.setup({})
            lspconfig.gopls.setup({})
        end,
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },

    -- Which key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({global = fales})
                end,
                desc = "Buffer local keymaps (which-key)",
            },
        },
    },

    -- Buffers
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons"
    },

    -- nvim-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
    },

    {
        "akinsho/toggleterm.nvim",
        config = true,
    },

    "ThePrimeagen/vim-be-good",

    opts_extend = { "sources.default" }
})
