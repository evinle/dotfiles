require("config.lazy")
require("config.remap")

vim.o.background = "dark"
vim.cmd([[ colorscheme poimandres ]])

vim.cmd('hi NormalNC guibg=NONE ctermbg=NONE')
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
vim.cmd('hi TabLineFill guibg=NONE ctermbg=NONE')
vim.cmd('hi TabLine guibg=NONE ctermbg=NONE')

vim.api.nvim_set_hl(0, "WinBar", { bg = "none" })
vim.api.nvim_set_hl(0, "WinBarNC", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
