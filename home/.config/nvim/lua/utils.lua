local group = vim.api.nvim_create_augroup('NeoVimRc', { clear = true })

-- ------------------------
-- Common Utility Functions
-- ------------------------

local M = {}

M.map = function(shortcut, command, mode, opts)
  local options = { noremap = true, silent = true }
  mode = mode or "n"

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.keymap.set(mode, shortcut, command, options)
end

M.nmap = function(shortcut, command)
  M.map(shortcut, command, "n")
end

M.imap = function(shortcut, command)
  M.map(shortcut, command, "i")
end

M.vmap = function(shortcut, command)
  M.map(shortcut, command, "v")
end

-- ------------------------
-- Closes all floating windows, useful for cleaning up messed up pop-ups
-- relates to vimpspector debug timeout
-- ------------------------
M.CloseAllFloatingWindows = function()
  local closed_windows = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then -- is_floating_window?
      vim.api.nvim_win_close(win, false) -- do not force
      table.insert(closed_windows, win)
    end
  end
  print(string.format("Closed %d windows: %s", #closed_windows, vim.inspect(closed_windows)))
end
-- :help command-attributes
vim.api.nvim_create_user_command("CloseAllFloatingWindows", M.CloseAllFloatingWindows, { bang = true, nargs = 0 })

M.au = function(event, opts)
  opts['group'] = group
  return vim.api.nvim_create_autocmd(event, opts)
end

return M
