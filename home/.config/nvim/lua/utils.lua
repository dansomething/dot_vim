-- ------------------------
-- Common Utility Functions
-- ------------------------

_G.map = function(shortcut, command, mode, opts)
  local options = { noremap = true, silent = true }
  mode = mode or "n"

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.keymap.set(mode, shortcut, command, options)
end

_G.nmap = function(shortcut, command)
  map(shortcut, command, "n")
end

_G.imap = function(shortcut, command)
  map(shortcut, command, "i")
end

_G.vmap = function(shortcut, command)
  map(shortcut, command, "v")
end

-- ------------------------
-- Closes all floating windows, useful for cleaning up messed up pop-ups
-- relates to vimpspector debug timeout
-- ------------------------
_G.CloseAllFloatingWindows = function()
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
vim.api.nvim_create_user_command("CloseAllFloatingWindows", _G.CloseAllFloatingWindows, { nargs = 0 })
