-- ------------------
-- CopilotChat.nvim
-- ------------------
-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
-- https://jsuarez.dev/blog/copilot_chat_neovim/
local chat = require("CopilotChat")
local select = require("CopilotChat.select")
chat.setup({
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

  mappings = {
    reset = {
      normal = "<C-r>",
      insert = "<C-r>",
    },
  },

  prompts = {
    Commit = {
      prompt = '> #git:staged\n\nWrite a commit message following the template at the top of the diff comments for the change and use the commitizen convention where appropriate. Make sure the title has a maximum of 50 characters and the message is wrapped at 72 characters. Replace everything before the colon in the title with the code area and subarea derived from the most changed file paths in the staged git diff. The code and subarea should be in the format "code/subarea" Explain the change in detail and why it is necessary. Ask me questions if you need more information to explain the why. Add this message at the top and leave everything else below untouched.',
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
vim.api.nvim_create_user_command("CopilotChatInline", function(args)
  chat.ask(args.args, {
    selection = select.visual,
    window = {
      layout = "float",
      relative = "cursor",
      width = 1,
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

-- Chat with Copilot in visual mode
vmap("<leader>ccv", ":CopilotChatVisual<CR>")
vmap("<leader>cci", ":CopilotChatInline<CR>")
-- Quick chat with Copilot
nmap("<leader>ccq", ":CopilotChatQuick<CR>")
vmap("<leader>ccq", ":CopilotChatQuick<CR>")
-- Code related commands
nmap("<leader>cco", ":CopilotChatOpen<CR>")
nmap("<leader>ccb", ":CopilotChatBuffer<CR>")
nmap("<leader>cce", ":CopilotChatExplain<CR>")
vmap("<leader>cce", ":CopilotChatExplain<CR>")
nmap("<leader>cct", ":CopilotChatTests<CR>")
nmap("<leader>ccr", ":CopilotChatReview<CR>")
-- TODO Add a prompt name called BatterNamings
-- Keymap("<leader>ccn", ":CopilotChatBetterNamings<CR>", "n")
-- Debug
nmap("<leader>ccd", ":CopilotChatDebugInfo<CR>")
-- Fix the issue with diagnostic
nmap("<leader>ccf", ":CopilotChatFixDiagnostic<CR>")
-- Clear buffer and chat history
nmap("<leader>ccl", ":CopilotChatReset<CR>")
-- Toggle Copilot Chat Toggle
nmap("<leader>ccv", ":CopilotChatToggle<CR>")
