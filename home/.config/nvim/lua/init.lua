if string.find(vim.o.runtimepath, "render-markdown.nvim") then
  require("render-markdown").setup({
    file_types = { "markdown", "copilot-chat" },
  })
end

if string.find(vim.o.runtimepath, "mcphub.nvim") then
  require("mcphub").setup({
    extensions = {
      copilotchat = {
        enabled = true,
        convert_tools_to_functions = true, -- Convert MCP tools to @functions
        convert_resources_to_functions = true, -- Convert MCP resources to @functions
        add_mcp_prefix = false, -- Add "mcp_" prefix to function names
      },
    },
  })
end

if string.find(vim.o.runtimepath, "copilot.vim") and string.find(vim.o.runtimepath, "CopilotChat.nvim") then
  require("copilot")
end
