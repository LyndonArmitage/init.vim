local function in_writing_mode()
  return vim.g.writing_mode or false
end

local function enable_writing_mode()
  vim.cmd('Goyo 120')
  vim.cmd('TwilightEnable')
  vim.cmd('PencilSoft')
  vim.g.writing_mode = true
end

local function disable_writing_mode()
  vim.cmd('Goyo!')
  vim.cmd('TwilightDisable')
  vim.cmd('PencilOff')
  vim.g.writing_mode = false
end

vim.api.nvim_create_user_command(
  'WritingMode',
  function()
    if in_writing_mode() then
      disable_writing_mode()
    else
      enable_writing_mode()
    end
  end,
  { nargs = 0 }
)

-- A writing LSP
-- https://writewithharper.com/docs/integrations/neovim
-- Can install with pacman
-- sudo pacman -S harper
require('lspconfig').harper_ls.setup {
  filetypes = { "markdown", "gitcommit", "html", "mail", "plaintext" },
  settings = {
    ["harper-ls"] = {
      userDictPath = "",
      fileDictPath = "",
      linters = {
        SpellCheck = false,
        SpelledNumbers = false,
        AnA = true,
        SentenceCapitalization = true,
        UnclosedQuotes = true,
        WrongQuotes = false,
        LongSentences = true,
        RepeatedWords = true,
        Spaces = true,
        Matcher = true,
        CorrectNumberSuffix = true
      },
      codeActions = {
        ForceStable = false
      },
      markdown = {
        IgnoreLinkTitle = false
      },
      diagnosticSeverity = "hint",
      isolateEnglish = false
    }
  }
}
