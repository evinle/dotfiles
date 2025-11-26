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
        require("mason").setup({
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            }
        })
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

        vim.lsp.enable("roslyn_ls")
        vim.lsp.config("roslyn_ls", {
            cmd = {
                "dotnet",
                "/home/imevinle/.local/share/nvim/mason/packages/Microsoft.CodeAnalysis.LanguageServer.linux-x64.5.3.0-2.25575.7/content/LanguageServer/linux-x64/Microsoft.CodeAnalysis.LanguageServer.dll",
                "--logLevel", "Information", "--extensionLogDirectory", "/tmp/roslyn_ls/logs", "--stdio"
            }
        }
        )
        -- vim.lsp.config("roslyn", {
        --     filetypes = { "cs" },
        --     on_attach = function()
        --         print("This will run when the server attaches!")
        --     end,
        --     settings = {
        --         ["csharp|inlay_hints"] = {
        --             csharp_enable_inlay_hints_for_implicit_object_creation = true,
        --             csharp_enable_inlay_hints_for_implicit_variable_types = true,
        --         },
        --         ["csharp|code_lens"] = {
        --             dotnet_enable_references_code_lens = true,
        --         },
        --     },
        -- })


        vim.keymap.set("n", "<leader>q", function() vim.lsp.buf.format() end)

        -- crazy hack to trigger lsp to start servers again
        vim.api.nvim_exec_autocmds("FileType", {})
    end
}
