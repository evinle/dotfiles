return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        preview_win = {
            -- Whether the preview window is automatically updated when the cursor is moved
            update_on_cursor_moved = true,
            -- How to open the preview window "load"|"scratch"|"fast_scratch"
            preview_method = "fast_scratch",
            -- A function that returns true to disable preview on a file e.g. to avoid lag
            disable_preview = function(filename)
                return false
            end,
            -- Window-local options to use for preview window buffers
        },
        win_options = {
            -- split = "rightbelow",  -- Opens new window to the right
        },
        view_options = {
            -- Show files and directories that start with "."
            show_hidden = true,
            -- This function defines what will never be shown, even when `show_hidden` is set
            is_always_hidden = function(name, bufnr)
                return name == '..'
            end,
        },
        skip_confirm_for_simple_edits = true,
    },
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
}
