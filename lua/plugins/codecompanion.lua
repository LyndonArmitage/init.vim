return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim"
  },
  opts = {
    strategies = {
      chat = {
        adapter = {
          name = "openai",
          model = "gpt-4.1",
        }
      },
      inline = {
        adapter = {
          name = "openai",
          model = "gpt-4.1",
        }
      },
      cmd = {
        adapter = {
          name = "openai",
          model = "gpt-4.1",
        }
      },
    },
    adapters = {
      openai = function()
        local config_dir = vim.fn.stdpath('config')
        return require("codecompanion.adapters").extend("openai", {
          env = {
            api_key = "cmd:bash " .. config_dir .. "/get-openai-api.sh",
          },
        })
      end,
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          -- MCP Tools
          make_tools = true,                  -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
          show_server_tools_in_chat = true,   -- Show individual tools in chat completion (when make_tools=true)
          add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
          show_result_in_chat = true,         -- Show tool results directly in chat buffer
          format_tool = nil,                  -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
          -- MCP Resources
          make_vars = true,                   -- Convert MCP resources to #variables for prompts
          -- MCP Prompts
          make_slash_commands = true,         -- Add MCP prompts as /slash commands
        }
      }
    }
  },
}
