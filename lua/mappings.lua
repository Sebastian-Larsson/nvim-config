local fn = vim.fn
local map = vim.api.nvim_set_keymap
vim.g.mapleader = " "

map('n', '<Leader>j', '<C-w><Down>', {noremap=true, silent=true})
map('n', '<Leader>k', '<C-w><Up>', {noremap=true, silent=true})
map('n', '<Leader>h', '<C-w><Left>', {noremap=true, silent=true})
map('n', '<Leader>l', '<C-w><Right>', {noremap=true, silent=true})

map('n', '<Leader>ff', ':Telescope find_files<Cr>', {noremap=true, silent=true})
map('n', '<Leader>gr', ':Telescope live_grep<Cr>', {noremap=true, silent=true})
map('n', '<Leader>man', ':Telescope man_pages<Cr>', {noremap=true, silent=true})
