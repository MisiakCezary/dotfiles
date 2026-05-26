-- Autocomplete when typing
vim.api.nvim_create_autocmd("InsertCharPre", {
  pattern = "*",
  callback = function()
    -- No flickering
    if vim.fn.pumvisible() == 1 then return end
    -- No autocomplete after whitespace
    if string.match(vim.v.char, "%a") == nil then return end
    -- No autocomplete if no lsp connected
    local lsp_completion = vim.bo.omnifunc == 'v:lua.vim.lsp.omnifunc'
    if lsp_completion then
      -- Insert lsp completions on type
      local keys = vim.api.nvim_replace_termcodes("<C-x><C-o>", true, false, true)
      vim.api.nvim_feedkeys(keys, "normal", false)
    else
      local key = vim.api.nvim_replace_termcodes("<C-n>", true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end
  end,
})

-- Enter accepts autocomplete in command mode
vim.keymap.set("c", "<CR>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-y>"
  end
  return "<CR>"
end, { expr = true })

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

-- cd into git root dir on vim launch
vim.cmd('silent cd `git rev-parse --show-toplevel`')
