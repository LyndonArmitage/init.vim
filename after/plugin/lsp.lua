--[[
  Make sure you have these plugins installed:
  * neovim/nvim-lspconfig
  * hrsh7th/nvim-cmp
  * hrsh7th/cmp-nvim-lsp
  * L3MON4D3/LuaSnip
]]

local cmp = require('cmp')

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = "luasnip" },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  enabled = function()
    return vim.api.nvim_get_option_value("buftype", {}) ~= "prompt"
        or require("cmp_dap").is_dap_buffer()
  end
})

cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = {
    { name = "dap" },
  },
})

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add borders to floating windows
vim.lsp.handlers['textDocument/hover'] =
  vim.lsp.buf.hover({ border = 'rounded' })

vim.lsp.handlers['textDocument/signatureHelp'] =
  vim.lsp.buf.signature_help({ border = 'rounded' })


-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    local function keymapOpts(desc)
      return {
        --buffer = bufnr,
        remap = true,
        desc = "LSP " .. desc,
      }
    end

    require("nvim-lightbulb").setup({
      autocmd = { enabled = true }
    })
    -- It's time to try out some keybinds, I will follow the defaults and maybe
    -- add my own similar to IntelliJ

    -- Ctrl+P shows signature help
    vim.keymap.set("n", "<C-P>", vim.lsp.buf.signature_help, keymapOpts("Signature Help"))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, keymapOpts("Hover"))

    -- <F18> is Actually Shift+<F6>
    -- So this matches IntelliJs refactor/rename
    vim.keymap.set("n", "<F18>", vim.lsp.buf.rename, keymapOpts("Rename"))
    vim.keymap.set("n", "<S-F6>", vim.lsp.buf.rename, keymapOpts("Rename"))

    -- Formatting handled by conform.nvim now
    -- Reformat buffer
    -- vim.keymap.set("n", "<F3>", vim.lsp.buf.format, keymapOpts("Reformat Buffer"))
    -- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, keymapOpts("Reformat Buffer"))

    -- Code action
    vim.keymap.set({ "n", "x" }, "<leader>ca", function()
      require("tiny-code-action").code_action({})
    end, { noremap = true, silent = true, desc = "LSP Code Action" })
    vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, keymapOpts("Code Action"))
    vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, keymapOpts("Code Action"))
    vim.keymap.set("v", "<F4>", vim.lsp.buf.code_action, keymapOpts("Code Action"))

    -- Go to Definition
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymapOpts("Go to Definition"))
    -- Go to Declaration (not always supported)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keymapOpts("Go to Declaration"))
    -- Go to type def
    vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, keymapOpts("Go to Type Definition"))
    -- Go to implementation
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, keymapOpts("Go to implementation"))

    -- List references, pretty good!
    vim.keymap.set("n", "gr", vim.lsp.buf.references, keymapOpts("List References"))

    -- Codelens
    vim.keymap.set("n", "gc", vim.lsp.codelens.run, keymapOpts("Run Codelens"))

    -- Diagnostics stuff
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, keymapOpts("Open Diagnostics"))
    vim.keymap.set("n", "[d", function () vim.diagnostic.jump({count = -1}) end, keymapOpts("Previous diagnostic"))
    vim.keymap.set("n", "]d", function () vim.diagnostic.jump({count = 1}) end, keymapOpts("Next diagnostic"))

    -- list symbols in the document: Ctrl Shift n
    vim.keymap.set("n", "<C-N>", require("telescope.builtin").lsp_document_symbols,
      keymapOpts("List all symbols in document"))
  end,
})

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

-- Lua
-- Installed with package
require 'lspconfig'.lua_ls.setup {}

-- Rust
-- Installed with rustup
require 'lspconfig'.rust_analyzer.setup {}

-- Temp workaround for rust analyzer issue
-- https://github.com/neovim/neovim/issues/30985#issuecomment-2447329525
for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
  local default_diagnostic_handler = vim.lsp.handlers[method]
  vim.lsp.handlers[method] = function(err, result, context, config)
    if err ~= nil and err.code == -32802 then
      return
    end
    return default_diagnostic_handler(err, result, context, config)
  end
end

-- JavaScript/TypeScript
-- Installed with npm:
-- npm i -g vscode-langservers-extracted
require 'lspconfig'.eslint.setup {}
-- html
-- Installed the same way
require 'lspconfig'.html.setup {}

-- Terraform completion
-- Requires terraform-ls
-- Is in AUR:
-- pamac install terraform-ls-bin
-- Might also want terraform itself installed
require 'lspconfig'.terraformls.setup {}

-- Kotlin
-- Installed with pamac
require 'lspconfig'.kotlin_language_server.setup {}

-- DM/BYOND
-- Requires dm-langserver
-- https://github.com/SpaceManiac/SpacemanDMM

require 'lspconfig.configs'.dm_langserver = {
  default_config = {
    cmd = { "/home/lyndon/repos/byond/SpacemanDMM/target/release/dm-langserver" },
    filetypes = { "dm", "dreammaker" },
    root_dir = require("lspconfig").util.root_pattern(".git", "*.dme"),
    single_file_support = true,
  }
}

require 'lspconfig'.dm_langserver.setup({})

-- Add tombi for toml files
-- sudo pacman -S tombi
-- Or: uv tool install tombi
vim.lsp.enable('tombi')

-- Setup surround behaviour
require('mini.surround').setup()
