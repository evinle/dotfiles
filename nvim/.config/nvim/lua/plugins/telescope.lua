return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        file_ignore_patterns = { "node_modules", ".git" },
    },
    config = function()
        local builtin = require('telescope.builtin')
        local actions = require("telescope.actions")
        local actions_state = require("telescope.actions.state")


        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', function()
            builtin.buffers {
                attach_mappings = function(prompt_bufnr, map)
                    local delete_buf = function()
                        local selection = actions_state.get_selected_entry()
                        actions.delete_buffer(prompt_bufnr)
                        -- vim.api.nvim_buf_delete(selection.bufnr, { force = true })
                    end

                    map('i', '<leader>d', delete_buf)
                    map('n', '<leader>d', delete_buf)

                    return true
                end

            }
        end, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>fe', builtin.diagnostics, { desc = 'Telescope diagnostics' })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope keys' })
        vim.keymap.set({ 'v', 'n' }, '<leader>fs', function() vim.lsp.buf.workspace_symbol() end,
            { desc = 'Telescope find files' })

        require("telescope").setup({
            defaults = {
                layout_config = {
                    vertical = {
                        width = 0.9, height = 0.7, prompt_position = 'top'
                    }
                },
                layout_strategy = 'vertical'
            },
        })
    end
}
