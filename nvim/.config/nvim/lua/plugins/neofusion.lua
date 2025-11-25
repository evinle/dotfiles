return {
    {
        "diegoulloao/neofusion.nvim",
        priority = 1000,
        config = true,
        opts = {
            -- transparent_mode = true
            terminal_colors = true, -- add neovim terminal colors
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = false,
                emphasis = true,
                comments = true,
                operators = true,
                folds = false,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            palette_overrides = {
            },
            overrides = {
                -- typescriptReserved = { fg = "#ffffff" },
                -- typescriptLabel = { fg = "#ffffff" },
                -- typescriptIdentifier = { fg = "#ffffff" },
                -- typescriptFuncKeyword = { fg = "#ffffff" },
                -- javaScriptMember = { fg = "#ffffff" }
                -- typescriptObjectLiteral = { fg = "#ffffff"},
                --     typescriptObjectLabel = { fg = "#ffffff"}
                ["@lsp.type.property.typescript"] = { link = "NeofusionWhite" },
                ["@keyword"] = { link = "NeofusionWhite"}
            },
            dim_inactive = true,
            transparent_mode = true,
        }
    }
}
