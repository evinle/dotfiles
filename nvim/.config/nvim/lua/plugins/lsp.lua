return
{
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {
                automatic_enable = true
            }
        },
        "neovim/nvim-lspconfig",
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
        require("mason-lspconfig").setup({
            automatic_enable = true,
            ensure_installed = { 'angularls', 'html', 'ts_ls', 'lua_ls' }
        })

        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = {
                            'vim',
                            'require',
                        },
                    },
                },
            },
        })

        vim.keymap.set("n", "<leader>q", function() vim.lsp.buf.format() end)

        -- crazy hack to trigger lsp to start servers again
        vim.api.nvim_exec_autocmds("FileType", {})
    end
}
