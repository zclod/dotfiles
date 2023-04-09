local function augroup(name)
  return vim.api.nvim_create_augroup("myAutoCmd_" .. name, { clear = true })
end

-- "Fugitive
-- "delete older fugitive created buffers
-- autocmd BufReadPost fugitive://* set bufhidden=delete
vim.api.nvim_create_autocmd({"BufReadPost"}, {
  group = augroup("fugitive"),
  pattern = {"fugitive://*"},
  command = "set bufhidden=delete",
})
