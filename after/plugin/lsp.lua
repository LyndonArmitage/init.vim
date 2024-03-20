local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })

  local opts = { buffer = bufnr, remap = true }
  -- It's time to try out some keybinds, I will follow the defaults and maybe
  -- add my own similar to IntelliJ

  -- Ctrl+P shows signature help
  vim.keymap.set("n", "<C-P>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  -- <F18> is Actually Shift+<F6>
  -- So this matches IntelliJs refactor/rename
  vim.keymap.set("n", "<F18>", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<S-F6>", vim.lsp.buf.rename, opts)

  -- Reformat buffer
  vim.keymap.set("n", "<F3>", vim.lsp.buf.format, opts)
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

  -- Go to Definition
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  -- Go to Declaration (not always supported)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  -- Go to type def
  vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, opts)
  -- Go to implementation
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

  -- List references, pretty good!
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

  -- Codelens 
  vim.keymap.set("n", "gc", vim.lsp.codelens.run, opts)

  -- Diagnostics stuff
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

  -- list symbols in the document: Ctrl Shift n 
  vim.keymap.set("n", "<C-N>", require("telescope.builtin").lsp_document_symbols, opts)
end)

-- Markdown
-- Installed via package manager:
-- sudo pacman -S marksman
require 'lspconfig'.marksman.setup {}

-- Dockerfile
-- npm install -g dockerfile-language-server-nodejs
require 'lspconfig'.dockerls.setup {}

-- Bash
-- npm i -g bash-language-server
require 'lspconfig'.bashls.setup {}

-- C
-- Installed with package
require 'lspconfig'.ccls.setup {}

-- Zig
-- Installed with package
require 'lspconfig'.zls.setup {}

-- Go
-- Installed with command:
-- sudo pacman -S gopls
-- NOT:
-- go install golang.org/x/tools/gopls@latest
require 'lspconfig'.gopls.setup {}

-- Python
-- Installed with pip:
-- pip install -U jedi-language-server
-- or pacman:
-- sudo pacman -S jedi-language-server
require 'lspconfig'.jedi_language_server.setup {}

-- Setup NeoVim stuff before Lua LSP
require("neodev").setup({})
-- Lua
-- Installed with package
require 'lspconfig'.lua_ls.setup {}

-- Rust
-- Installed with rustup
require 'lspconfig'.rust_analyzer.setup {}

-- JavaScript/TypeScript
-- Installed with npm:
-- npm i -g vscode-langservers-extracted
require'lspconfig'.eslint.setup {}
-- html
-- Installed the same way
require'lspconfig'.html.setup {}

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  })
})
