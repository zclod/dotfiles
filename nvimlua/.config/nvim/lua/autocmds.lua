local function augroup(name)
  return vim.api.nvim_create_augroup("myAutoCmd_" .. name, { clear = true })
end

-- "Fugitive
-- "delete older fugitive created buffers
vim.api.nvim_create_autocmd({"BufReadPost"}, {
  group = augroup("fugitive"),
  pattern = {"fugitive://*"},
  command = "set bufhidden=delete",
})


vim.api.nvim_create_autocmd({'BufEnter'}, {
  group = augroup("firenvim"),
  pattern = {"*overleaf.com_*"},
  command = "set filetype=tex",
})
