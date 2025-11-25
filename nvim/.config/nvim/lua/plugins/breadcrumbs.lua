return {
    "LunarVim/breadcrumbs.nvim",
    dependencies = {
        { "SmiteshP/nvim-navic" },
    },
    config = function()
        require("nvim-navic").setup {
            lsp = {
                auto_attach = true,
            },
            highlight = true,
            depth_limit = 6
        }
        require("breadcrumbs").setup()

        local navic_hl_groups =
        {
            "NavicIconsFile",
            "NavicIconsModule",
            "NavicIconsNamespace",
            "NavicIconsPackage",
            "NavicIconsClass",
            "NavicIconsMethod",
            "NavicIconsProperty",
            "NavicIconsField",
            "NavicIconsConstructor",
            "NavicIconsEnum",
            "NavicIconsInterface",
            "NavicIconsFunction",
            "NavicIconsVariable",
            "NavicIconsConstant",
            "NavicIconsString",
            "NavicIconsNumber",
            "NavicIconsBoolean",
            "NavicIconsArray",
            "NavicIconsObject",
            "NavicIconsKey",
            "NavicIconsNull",
            "NavicIconsEnumMember",
            "NavicIconsStruct",
            "NavicIconsEvent",
            "NavicIconsOperator",
            "NavicIconsTypeParameter",
        }

        for i, hl_group in ipairs(navic_hl_groups) do
            vim.api.nvim_set_hl(0, hl_group, { default = true, bg = "none", fg = "#83e1c8" })
        end

        vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "none", fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "none", fg = "#add7ff" })
    end

}
