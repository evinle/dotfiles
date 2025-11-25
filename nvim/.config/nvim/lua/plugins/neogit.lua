return { {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local neogit = require('neogit')

        neogit.setup({
            graph_style = "unicode",
        })

        vim.keymap.set('n', '<leader>gs', ":Neogit kind=vsplit<cr>", { silent = true, noremap = true })
        vim.keymap.set('n', '<leader>gc', ":Neogit commit<cr>", { silent = true, noremap = true })
        vim.keymap.set('n', '<leader>gp', ":Neogit pull<cr>", { silent = true, noremap = true })
        vim.keymap.set('n', '<leader>gP', ":Neogit push<cr>", { silent = true, noremap = true })
        vim.keymap.set('n', '<leader>gb', ":Telescope git_branches<cr>", { silent = true, noremap = true })
        vim.keymap.set('n', '<leader>gB', ":Gitsigns blame<cr>", { silent = true, noremap = true })
    end,
} }
