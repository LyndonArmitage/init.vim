local config_dir = vim.fn.stdpath('config')
local conf = {
  openai_api_key = { "bash", config_dir .. "/get-openai-api.sh" }
}

require("gp").setup(conf)

-- ChatGPT Bindings
-- https://github.com/robitx/gp.nvim?tab=readme-ov-file#native

local function keymapOptions(desc)
  return {
    noremap = true,
    silent = true,
    nowait = true,
    desc = "GPT prompt " .. desc,
  }
end

vim.keymap.set({ "n", "i" }, "<C-g>f", "<cmd>GpChatFinder<cr>", keymapOptions("Chat Finder"))
vim.keymap.set({ "n", "i" }, "<C-g>c", "<cmd>GpChatNew<cr>", keymapOptions("New Chat"))
vim.keymap.set({ "n", "i" }, "<C-g>t", "<cmd>GpChatToggle<cr>", keymapOptions("Toggle Chat"))
