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
