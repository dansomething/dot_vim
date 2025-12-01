require("ai-pane").setup()

local is_render_markdown_available, render_markdown = pcall(require, "render-markdown")
if is_render_markdown_available then
  render_markdown.setup({
    file_types = { "markdown", "copilot-chat" },
  })
end

local is_mcphub_available, mcphub = pcall(require, "mcphub")
if is_mcphub_available then
  mcphub.setup({
    extensions = {
      copilotchat = {
        enabled = true,
        convert_tools_to_functions = true,
        convert_resources_to_functions = true,
        add_mcp_prefix = false,
      },
    },
  })
end

local is_copilot_available, _ = pcall(require, "copilot")
local is_copilotchat_available, _ = pcall(require, "CopilotChat")
if is_copilot_available and is_copilotchat_available then
  require("copilot")
end
