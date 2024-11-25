local leap = require('leap')

vim.keymap.set('', 's', '<Nop>') -- Unmap 's' in all modes
vim.keymap.set('', 'S', '<Nop>') -- Unmap 'S' in all modes

-- Assign leap to `s` and `S`
leap.add_default_mappings()
vim.keymap.set('n', 's',
    function()
        leap.leap({ target_windows = { vim.fn.win_getid() } })
    end, { silent = true })

vim.keymap.set('n', 'S',
    function()
        leap.leap({ target_windows = { vim.fn.win_getid() } })
    end, { silent = true })
