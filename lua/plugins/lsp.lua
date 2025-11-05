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
  { 'kosayoda/nvim-lightbulb' },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local ls = require('luasnip')

      require("luasnip.loaders.from_vscode").lazy_load()

      vim.keymap.set({ "i" }, "<C-K>", function() ls.expand({}) end, { silent = true })
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
        ["toml"] = { "tombi" },
        ["terraform"] = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
        ["go"] = { "gofmt" },
        ["rust"] = { "rustfmt", lsp_format = "fallback" },
        -- https://github.com/mvdan/sh
        ["bash"] = { "shfmt", lsp_format = "fallback" },
        ["sh"] = { "shfmt", lsp_format = "fallback" },
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
      metals_config.init_options.statusBarProvider = "off"
      metals_config.init_options.testExplorerProvider = true
      metals_config.on_attach = function(client, bufnr)
        require("metals").setup_dap()
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

  -- Basic info for LSP messages etc
  {
    "j-hui/fidget.nvim",
    opts = {},
  },

  -- Debugging support
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "stevearc/overseer.nvim",
      { "igorlfs/nvim-dap-view", opts = {} }
    },
    keys = {
      -- DAP keybinds based on: https://github.com/scalameta/nvim-metals/discussions/39
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        mode = "n",
        desc = "Continue debugging"
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        mode = "n",
        desc = "Toggle Debug REPL"
      },
      {
        "<leader>dK",
        function()
          require("dap.ui.widgets").hover()
        end,
        mode = "n",
        desc = "Show Debug hover widgets"
      },
      {
        "<leader>dt",
        function()
          require("dap").toggle_breakpoint()
        end,
        mode = "n",
        desc = "Toggle Breakpoint"
      },
      {
        "<leader>dT",
        function()
          require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end,
        desc = "Toggle Breakpoint Condition"
      },
      {
        "<leader>dso",
        function()
          require("dap").step_over()
        end,
        mode = "n",
        desc = "Step Over"
      },
      {
        "<leader>dsi",
        function()
          require("dap").step_into()
        end,
        mode = "n",
        desc = "Step Into"
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        mode = "n",
        desc = "Run Last Debug Run"
      },
      {
        "<leader>dq",
        function()
          require("dap").terminate()
        end,
        mode = "n",
        desc = "Terminate Debug Run"
      },
    },
    config = function()
      local dap = require("dap")

      require("overseer").enable_dap()

      dap.configurations.scala = {
        {
          type = "scala",
          request = "launch",
          name = "Run or Test Target",
          metals = {
            runType = "runOrTestFile",
          },
        },
        {
          type = "scala",
          request = "launch",
          name = "Run or Test Target With arguments",
          metals = {
            runType = "runOrTestFile",
            args = function()
              local input = vim.fn.input("Program arguments (space-separated): ")
              return vim.fn.split(input, " ", true)
            end
          },
        },
        {
          type = "scala",
          request = "launch",
          name = "Test Target",
          metals = {
            runType = "testTarget",
          },
        },
      }

      -- dap.configurations.c = {
      --   {
      --     name = "Launch",
      --     type = "gdb",
      --     request = "launch",
      --     program = function()
      --       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      --     end,
      --     cwd = "${workspaceFolder}",
      --   },
      -- }

      dap.adapters.codelldb = {
        type = 'server',
        port = "1300",
        executable = {
          command = '/usr/bin/codelldb',
          args = { "--port", "1300" },
          -- On windows you may have to uncomment this:
          -- detached = false,
        }
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }

      dap.configurations.rust = dap.configurations.cpp
      dap.configurations.c = dap.configurations.cpp
    end
  },
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
    lazy = true,
    opts = {}
  },
  -- DAP Support for cmp
  {
    "rcarriga/cmp-dap",
    lazy = true,
    dependencies = {
      "mfussenegger/nvim-dap"
    }
  },

  { -- This plugin
    "Zeioth/makeit.nvim",
    lazy = true,
    cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
    dependencies = { "stevearc/overseer.nvim" },
    opts = {},
  },
  {
    "stevearc/overseer.nvim",
    opts = {},
    lazy = true,
    cmd = {
      "MakeitOpen",
      "MakeitToggleResults",
      "MakeitRedo",
      "OverseerRun",
      "OverseerToggle"
    },
  },
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    event = "LspAttach",
    opts = {},
  }

}
