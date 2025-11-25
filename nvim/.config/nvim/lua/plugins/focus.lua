return {
    {
        'nvim-focus/focus.nvim',
        version = '*',
        config = function()
            require('focus').setup {
                enable = true,
                autoresize = {
                    enable = true,
                },
            }
        end
    },
}
