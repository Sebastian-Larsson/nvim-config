local fn = vim.fn
local map = vim.api.nvim_set_keymap
vim.g.mapleader = " "

map('n', '<Leader>ff', ':Telescope find_files<Cr>', {noremap=true, silent=true})
map('n', '<Leader>gr', ':Telescope live_grep<Cr>', {noremap=true, silent=true})
map('n', '<Leader>man', ':Telescope man_pages<Cr>', {noremap=true, silent=true})
