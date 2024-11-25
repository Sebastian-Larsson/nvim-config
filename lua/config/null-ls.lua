local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
    return
end

local sources = {
    -- python
    null_ls.builtins.formatting.black.with({
        extra_args = { "--line-length=120" }
    }),
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.luacheck,
    null_ls.builtins.formatting.lua_format.with({
        extra_args = { "--column-limit=100", "--no-keep-simple-function-one-line" }
    }),
}

null_ls.setup({ sources = sources })
