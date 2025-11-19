return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Below are some plugins
    "ravitemer/mcphub.nvim",
    "ravitemer/codecompanion-history.nvim",
    "lalitmee/codecompanion-spinners.nvim",
    "j-hui/fidget.nvim",
    -- Some plugins depend on other plugins
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    strategies = {
      chat = {
        adapter = {
          name = "openai",
          model = "gpt-5-mini",
          stream = true,
        }
      },
      inline = {
        adapter = {
          name = "openai",
          model = "gpt-5-mini",
          stream = true,
        }
      },
      cmd = {
        adapter = {
          name = "openai",
          model = "gpt-5-mini",
          stream = true,
        }
      },
    },
    adapters = {
      http = {
        openai = function()
          local config_dir = vim.fn.stdpath('config')
          return require("codecompanion.adapters").extend("openai", {
            -- This schema code overrides the defaults that restrict streaming
            -- This will only work if the organization associated with the API
            -- key is verified (mine is)
            schema = {
              model = {
                choices = {
                  ["gpt-5-mini"] = {
                    opts = { has_vision = true, can_reason = true, stream = true },
                  },
                  ["gpt-5.1"] = {
                    opts = { has_vision = true, can_reason = true, stream = true },
                  },
                },
              },
            },
            env = {
              api_key = "cmd:bash " .. config_dir .. "/get-openai-api.sh",
            },
          })
        end,
      },
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          -- MCP Tools
          make_tools = true,                    -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
          show_server_tools_in_chat = true,     -- Show individual tools in chat completion (when make_tools=true)
          add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
          show_result_in_chat = true,           -- Show tool results directly in chat buffer
          format_tool = nil,                    -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
          -- MCP Resources
          make_vars = true,                     -- Convert MCP resources to #variables for prompts
          -- MCP Prompts
          make_slash_commands = true,           -- Add MCP prompts as /slash commands
        }
      },
      history = {
        enabled = true,
        opts = {
          expiration_days = 60,
          picker = "telescope"
        }
      },
      spinner = {
        opts = {
          style = "fidget",
        },
      }
    }
  }
}
