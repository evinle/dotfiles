vim.keymap.set("n", "<leader>o", require("oil").open)
vim.keymap.set("n", "<leader>i", "<CMD>Lazy<cr>")
vim.keymap.set("n", "<leader>l", "<CMD>Mason<cr>")
vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("n", "<leader><Tab>", "gt")
vim.keymap.set("n", "<leader><S-Tab>", "gT")

-- Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
vim.keymap.set({ "n", "i", "t" }, "<A-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set({ "n", "i", "t" }, "<A-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set({ "n", "i", "t" }, "<A-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set({ "n", "i", "t" }, "<A-l>", "<C-\\><C-N><C-w>l")

-- LSP
vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
vim.keymap.set('n', 'grr', "<CMD>Telescope lsp_references<cr>")
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help)
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help)

-- Neogit
vim.keymap.set('n', '<leader>gg', "<CMD>Neogit type=split<cr>")

vim.api.nvim_create_user_command('SwitchAngularComponentViewForward', function()
    local ext = vim.fn.expand("%:e")
    local extCallbacksForward = {
        ts = function() vim.cmd("e %:r.html") end,
        html = function() vim.cmd("e %:r.scss") end,
        scss = function() vim.cmd("e %:r.ts") end
    }

    if (extCallbacksForward[ext]) then
        extCallbacksForward[ext]()
    else
        print("Unknown file extension " .. ext)
    end
end, {})

vim.api.nvim_create_user_command('SwitchAngularComponentViewBackward', function()
    local ext = vim.fn.expand("%:e")
    local extCallbacksBackwards = {
        ts = function() vim.cmd("e %:r.scss") end,
        html = function() vim.cmd("e %:r.ts") end,
        scss = function() vim.cmd("e %:r.html") end
    }

    if (extCallbacksBackwards[ext]) then
        extCallbacksBackwards[ext]()
    else
        print("Unknown file extension " .. ext)
    end
end, {})

vim.keymap.set("n", "<leader>s", "<CMD>SwitchAngularComponentViewForward<cr>")
vim.keymap.set("n", "<leader>a", "<CMD>SwitchAngularComponentViewBackward<cr>")
