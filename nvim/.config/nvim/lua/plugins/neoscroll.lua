return {
    "karb94/neoscroll.nvim",
    opts = {},
    config = function()
        local neoscroll = require('neoscroll')
        neoscroll.setup {
            easing = 'circular',
            duration_multiplier = 0.05,
        }
    end
}
