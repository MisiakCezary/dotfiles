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

-- Added :Blame command
function Blame_line()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.api.nvim_buf_get_name(bufnr)
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local blame_info = vim.fn.systemlist('git blame -L ' .. row .. ',+1 ' .. filename .. ' --porcelain')
  if vim.v.shell_error ~= 0 then
      print('Git blame failed! Are you in git directory?')
      return
  end
  if blame_info[2] ~= nil then
    local hash = string.sub(blame_info[1], 1, 8)
    local author_name = string.sub(blame_info[2], 8)
    local author_date = os.date('%Y %b %d', tonumber(string.sub(blame_info[4], 12)))
    print(hash .. " - " .. author_name .. " - " .. author_date)
  else
    print(blame_info[1])
  end
end
vim.api.nvim_create_user_command("Blame", ":lua Blame_line()", {})
