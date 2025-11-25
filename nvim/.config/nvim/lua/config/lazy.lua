-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Enable line numbers
vim.opt.number = true

-- Enable relative line numbers (optional)
vim.opt.relativenumber = true
vim.opt.wrap = false

vim.cmd('syntax on')

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.clipboard:append("unnamedplus")

if vim.fn.executable("pwsh.exe") == 1 then
    vim.opt.shell = "pwsh.exe"
else
    if vim.fn.executable("powershell.exe") == 1 then
        vim.opt.shell = "powershell.exe"
    end
end

vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command'
vim.opt.shellquote   = '\"'
vim.opt.shellxquote  = ''
vim.opt.shellpipe    = '| Out-File -Encoding UTF8 %s'
vim.opt.shellredir   = '| Out-File -Encoding UTF8 %s'

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "poimandres" } },
    -- automatically check for plugin updates
    checker = { enabled = false },
})
