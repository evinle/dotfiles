return { {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "c_sharp" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
        })
    end
},
    {
        "nvim-treesitter/playground",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
        config = function()
            require "nvim-treesitter.configs".setup {
                playground = {
                    enable = "true"
                }
            }
        end
    }
}
