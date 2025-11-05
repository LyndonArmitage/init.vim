return {
  -- ChatGPT? At this time of year? At this time of day? In this operating
  -- system? Localised within your editor?
  "robitx/gp.nvim",
  opts = function()
    -- Get Key from an invoked command
    local config_dir = vim.fn.stdpath('config')
    return {
      openai_api_key = { "bash", config_dir .. "/get-openai-api.sh" }
    }
  end,
  keys = {
    {
      "<C-g>f",
      "<cmd>GpChatFinder<cr>",
      desc = "GPT Chat Finder",
      noremap = true,
      silent = true,
      nowait = true,
    },
    {
      "<C-g>c",
      "<cmd>GpChatNew<cr>",
      desc = "GPT New Chat",
      noremap = true,
      silent = true,
      nowait = true,
    },
    {
      "<C-g>t",
      "<cmd>GpChatToggle<cr>",
      desc = "GPT Toggle Chat",
      noremap = true,
      silent = true,
      nowait = true,
    },
  },
  cmd = {
    "GpChatNew",
    "GpChatPaste",
    "GpChatToggle",
    "GpChatFinder",
    "GpChatRespond",
    "GpChatDelete",
    "GpRewrite",
    "GpAppend",
    "GpPrepend",
    "GpEnew",
    "GpNew",
    "GpVnew",
    "GpTabnew",
    "GpPopup",
    "GpImplement",
    "GpContext",
    "GpWhisper",
    "GpWhisperRewrite",
    "GpWhisperAppend",
    "GpWhisperPrepend",
    "GpWhisperEnew",
    "GpWhisperNew",
    "GpWhisperVnew",
    "GpWhisperTabnew",
    "GpWhisperPopup",
    "GpNextAgent",
    "GpAgent",
    "GpImage",
    "GpImageAgent",
    "GpStop",
    "GpInspectPlugin",
  },
}
