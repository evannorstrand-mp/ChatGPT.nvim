-- main module file
local api = require("chatgpt.api")
local module = require("chatgpt.module")
local config = require("chatgpt.config")
local signs = require("chatgpt.signs")
local vim = require("vim")

local M = {}

M.setup = function(options)
  -- Set up highlighters
  vim.cmd("highlight! link ChatGPTQuestion Constant")
  vim.cmd("highlight! link ChatGPTWelcome Comment")
  vim.cmd("highlight! link ChatGPTTotalTokens PreProc")
  vim.cmd("highlight! link ChatGPTTotalTokensBorder SpecialChar")
  vim.cmd("highlight! link ChatGPTMessageAction Identifier")
  vim.cmd("highlight! link ChatGPTCompletion Statement")

  -- Set up configuration
  config.setup(options)

  -- Initialize APIs
  api.setup()

  -- Setup signs
  signs.setup()
end

-- Public methods for the plugin
M.openChat = function()
  module.open_chat()
end

M.selectAwesomePrompt = function()
  module.open_chat_with_awesome_prompt()
end

M.edit_with_instructions = function()
  module.edit_with_instructions()
end

M.run_action = function(opts)
  module.run_action(opts)
end

M.complete_code = module.complete_code

return M