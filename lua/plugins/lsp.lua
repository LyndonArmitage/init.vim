return {
  { "neovim/nvim-lspconfig" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip"
    },
  },
  { "hrsh7th/cmp-nvim-lsp" },
  {
    "saadparwaiz1/cmp_luasnip",
    dependencies = {
      "L3MON4D3/LuaSnip"
    }
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local ls = require('luasnip')

      vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
    end
  },
  { "rafamadriz/friendly-snippets" },

  -- Autoformatter on save
  {
    "stevearc/conform.nvim",
    opts = {
      --      format_on_save = {
      --        -- These options will be passed to conform.format()
      --        timeout_ms = 1500,
      --        lsp_format = "fallback",
      --      },
      default_format_opts = {
        timeout_ms = 1500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        ["python"] = { "isort", "black" },
        ["terraform"] = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
        ["go"] = { "gofmt" },
        ["rust"] = { "rustfmt", lsp_format = "fallback" },
      },
    },
    lazy = true,
    --    event = { "BufWritePre" }, -- uncomment when enabling format on save
    cmd = { "ConformInfo" },
    keys = {
      -- Reformat buffer
      {
        "<F3>",
        function()
          require("conform").format({ timeout_ms = 3000 })
        end,
        desc = "Reformat Buffer",
      },
      {
        "<leader>f",
        function()
          require("conform").format({ timeout_ms = 3000 })
        end,
        desc = "Reformat Buffer",
      },
    },
  },

  -- LSP For Scala
  {
    "scalameta/nvim-metals",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap"
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
      metals_config.settings.testUserInterface = "Test Explorer"
      metals_config.settings.serverVersion = "latest.snapshot" -- Maybe remove?
      metals_config.init_options.statusBarProvider = "on"
      metals_config.init_options.testExplorerProvider = true
      metals_config.on_attach = function(client, bufnr)
        require("metals").setup_dap()
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { desc = "Go to next diagnostic" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { desc = "Go to previous diagnostic" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
        vim.keymap.set("n", "<leader>t", function() require("telescope").extensions.metals.commands() end,
          { desc = "Toggle Metals Telescope" })
        vim.keymap.set("n", "<leader>Tr", function() require("metals.tvp").toggle_tree_view() end,
          { desc = "Toggle Metals Tree View" })
        vim.keymap.set("n", "<leader>TR", function() require("metals.tvp").reveal_in_tree() end,
          { desc = "Reveal in Metals Tree View" })
      end
      return metals_config
    end,
    config = function(metals, metals_config)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "java" },
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end
      })
    end
  },

  -- Debugging support
  { "mfussenegger/nvim-dap" },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
    main = "dap-python",
    ft = "python",
    config = function()
      require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
    opts = {}
  },
  -- DAP Support for cmp
  {
    "rcarriga/cmp-dap",
    dependencies = {
      "mfussenegger/nvim-dap"
    }
  },
}
