require("mason").setup()
require("mason-lspconfig").setup()

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = {noremap = true, silent = true, buffer = bufnr}
    vim.keymap.set('n', '<Leader>gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<Leader>gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<Leader>K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<Leader>gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder,
                   bufopts)
    vim.keymap.set('n', '<Leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<Leader>rl', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<Leader>fo', function()
        vim.lsp.buf.format {async = true}
    end, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150
}
require('lspconfig')['pyright'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
}
require('lspconfig')['clangd'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
}
require('lspconfig')['lua_ls'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {Lua = {diagnostics = {globals = {'vim'}}}}
}
