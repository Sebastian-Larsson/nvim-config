vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Global variable to track diagnostics state
_G.diagnostics_active = true

-- Global function to toggle diagnostics
_G.toggle_diagnostics = function()
  _G.diagnostics_active = not _G.diagnostics_active
  if _G.diagnostics_active then
    vim.diagnostic.enable()
    print("Diagnostics enabled")
  else
    vim.diagnostic.disable()
    print("Diagnostics disabled")
  end
end

-- Map <Leader>dh to toggle diagnostics
vim.api.nvim_set_keymap(
  "n",
  "<Leader>dh",
  "<cmd>lua toggle_diagnostics()<CR>",
  { noremap = true, silent = true }
)

