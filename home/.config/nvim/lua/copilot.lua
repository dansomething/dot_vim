-- ------------------
-- CopilotChat.nvim
-- ------------------
-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
-- https://jsuarez.dev/blog/copilot_chat_neovim/
local chat = require("CopilotChat")
local select = require("CopilotChat.select")
local utils = require("utils")
chat.setup({
  model = "claude-3.5-sonnet",

  window = {
    -- layout = "float", -- 'vertical', 'horizontal', 'float', 'replace'
    -- width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
    -- height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
    -- Options below only apply to floating windows
    -- relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
    -- border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
    -- row = nil, -- row position of the window, default is centered
    -- col = nil, -- column position of the window, default is centered
    -- title = 'Copilot Chat', -- title of chat window
    -- footer = nil, -- footer of chat window
    -- zindex = 1, -- determines if window is on top or below other floating windows
  },

  prompts = {
    Explain = {
      mapping = "<leader>cce",
    },
    Review = {
      mapping = "<leader>ccr",
    },
    Tests = {
      mapping = "<leader>cct",
    },
    Fix = {
      mapping = "<leader>ccf",
    },
    Optimize = {
      mapping = "<leader>cco",
    },
    Docs = {
      mapping = "<leader>ccd",
    },
    Commit = {
      prompt = '> #git:staged\n\nWrite a commit message following the example in comments at the top of the staged diff. Use the commitizen convention where appropriate. Ensure the title has a maximum of 50 characters and the message is wrapped at 72 characters. Replace everything before the colon in the title with the code area and subarea derived from the most commonly changed file paths in the diff. The code and subarea should be in the format "code/subarea". Explain the change in detail and why it is necessary. Add this message at the top and include the original, unaltered content below it.',
      mapping = "<leader>ccc",
      description = "Git commit message",
    },
    Refactor = {
      prompt = "> /COPILOT_REFACTOR\n\nYou are now an expert in code maintainability. You recommend refactoring steps for the provided code without changing the functionality. Do not break the code. Make suggestions to improve the code. Pay particular attention to improving the following code qualities: readability, maintainability, modularity, extensibility, performance optimization, bug fixes, names and documentation.",
      mapping = "<leader>ccR",
      description = "Refactor code",
    },
  },
})

-- Chat with Copilot about visual selection
vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
  chat.ask(args.args, { selection = select.visual })
end, { nargs = "*", range = true })

-- Inline chat with Copilot
vim.api.nvim_create_user_command("CopilotChatInline", function(_)
  local input = vim.fn.input("Inline Chat: ")
  chat.ask(input, {
    selection = select.visual,
    window = {
      layout = "float",
      relative = "cursor",
      width = 0.8,
      height = 0.4,
      row = 1,
    },
  })
end, { nargs = "*", range = true })

-- Restore CopilotChatBuffer
vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
  chat.ask(args.args, { selection = select.buffer })
end, { nargs = "*", range = true })

-- Quick chat with Copilot. Context defaults to the current buffer
vim.api.nvim_create_user_command("CopilotChatQuick", function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    vim.cmd("CopilotChatBuffer " .. input)
  end
end, { nargs = "*", range = true })

utils.au("BufEnter", {
  pattern = "copilot-*",
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt.listchars:append({ tab = "  " })
  end,
})

-- Toggle Copilot Chat Toggle
utils.nmap("<leader>ccv", ":CopilotChatToggle<CR>")
utils.vmap("<leader>ccv", ":CopilotChat<CR>")
-- Inline quick chat with Copilot
utils.nmap("<leader>cci", ":CopilotChatInline<CR>")
utils.vmap("<leader>cci", ":CopilotChatInline<CR>")
-- Quick chat with Copilot
utils.nmap("<leader>ccq", ":CopilotChatQuick<CR>")
utils.vmap("<leader>ccq", ":CopilotChatQuick<CR>")
-- Clear buffer and chat history
utils.nmap("<leader>ccl", ":CopilotChatReset<CR>")
