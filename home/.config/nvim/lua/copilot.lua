-- ------------------
-- CopilotChat.nvim
-- ------------------
-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
-- https://jsuarez.dev/blog/copilot_chat_neovim/
local chat = require("CopilotChat")
local select = require("CopilotChat.select")
local utils = require("utils")
chat.setup({
  -- model = "claude-3.5-sonnet",

  highlight_headers = false,
  separator = "---",
  error_header = "> [!ERROR] Error",

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
    -- Code related prompts
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
    FixError = "Please explain the error in the following text and provide a solution.",
    BetterNamings = "Please provide better names for the following variables and functions.",
    Documentation = "Please provide documentation for the following code.",
    SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
    SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
    Commit = {
      mapping = "<leader>ccc",
    },
    Refactor = {
      prompt = "> /COPILOT_REFACTOR\n\nYou are now an expert in code maintainability. You recommend refactoring steps for the provided code without changing the functionality. Do not break the code. Make suggestions to improve the code. Pay particular attention to improving the following code qualities: readability, maintainability, modularity, extensibility, performance optimization, bug fixes, names and documentation.",
      mapping = "<leader>ccR",
      description = "Refactor code",
    },

    -- Text related prompts
    Summarize = "Please summarize the following text.",
    Spelling = "Please correct any grammar and spelling errors in the following text.",
    Wording = "Please improve the grammar and wording of the following text.",
    Concise = "Please rewrite the following text to make it more concise.",
  },

  mappings = {
    -- Reset the chat buffer
    reset = {
      normal = "<C-x>",
      insert = "<C-x>",
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
utils.nmap("<leader>ccx", ":CopilotChatReset<CR>")
