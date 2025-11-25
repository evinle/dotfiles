return {
    "f-person/git-blame.nvim",
    -- load the plugin at startup
    event = "VeryLazy",
    opts = {
        enabled = true,
        message_template = " <summary> • <date> • <author> • <<sha>>",
        date_format = "%m-%d-%Y %H:%M:%S",
        display_virtual_text = false
    },
}
