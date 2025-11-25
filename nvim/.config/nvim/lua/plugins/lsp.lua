return {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            }
        },
        config = function()
            require("mason").setup()
            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup {
                automatic_installation = true,
                ensure_installed = { 'angularls', 'html', 'ts_ls', 'lua_ls' }
            }

            local lspconfig = require("lspconfig")

            -- mason_lspconfig.setup_handlers {
            --     function(server)
            --         lspconfig[server].setup {}
            --     end
            -- }

            -- lspconfig.lua_ls.setup {}
            -- lspconfig.angularls.setup {}
            -- lspconfig.ts_ls.setup {}
            -- lspconfig.html.setup {}
            -- lspconfig.tailwindcss.setup {}

            vim.keymap.set("n", "<leader>q", function() vim.lsp.buf.format() end)
        end,
    }
}
