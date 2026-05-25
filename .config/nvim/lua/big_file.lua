-- Disable heavy operations in huge buffers
vim.g.huge_buffer = false
vim.api.nvim_create_autocmd( {'BufReadPost', "FileReadPre"}, {
  pattern = { '*' },
  callback = function()
    local path = vim.fn.expand('%')
    local size = vim.fn.getfsize(path)
    if size > 512 * 1024 then
      vim.g.huge_buffer = true
      vim.opt.syntax = 'off'
      vim.opt.filetype = 'off'
      vim.opt.undofile = false
      vim.opt.swapfile = false
      vim.opt.eventignore = 'all'
    end
  end,
})
