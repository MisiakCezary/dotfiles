vim.opt.completeopt = {'menu', 'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess:append('c')

local function autocomplete(next_or_prev_key, key_after_whitespace)
  if vim.fn.pumvisible() == 1 then
    return next_or_prev_key
  end

  -- insert key (tab) if invoked after whitespace
  if key_after_whitespace then
    local c = vim.fn.col('.') - 1
    local is_whitespace = c == 0 or vim.fn.getline('.'):sub(c, c):match('%s')
    if is_whitespace then
      return key_after_whitespace
    end
  end

  -- use lsp autocompletion if posible
  local lsp_completion = vim.bo.omnifunc == 'v:lua.vim.lsp.omnifunc'
  if lsp_completion then
    return '<C-x><C-o>'
  end

  return next_or_prev_key
end

local function tab_next() return autocomplete('<C-n>', '<Tab>') end
local function tab_prev() return autocomplete('<C-p>', '<Tab>') end
vim.keymap.set('i', '<Tab>', tab_next, {expr = true})
vim.keymap.set('i', '<S-Tab>', tab_prev, {expr = true})


-- Open diagnostic window when hovering
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float()
  end,
})

-- Disable diagnostic signs
vim.diagnostic.config({
  signs = false,
})

-- lsp's
vim.lsp.enable({"pylsp"})
vim.lsp.enable({"rust_analyzer"})
