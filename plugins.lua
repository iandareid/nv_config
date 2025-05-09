local plugins = {
  -- {
  --   "karb94/neoscroll.nvim",
  --   config = function ()
  --     require('neoscroll').setup({})
  --   end
  -- },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  { 
    "danymat/neogen", 
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*" 
  },
  {
  "folke/todo-comments.nvim",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  },
  {
  "nvim-lua/plenary.nvim",
  lazy = false,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  { "nvim-neotest/nvim-nio" },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap"
    },
    opts = {
      handlers = {}
    }
  },
  {
    "mfussenegger/nvim-dap",
    config = function (_, _)
      -- require("core.utils").load_mappings("dap")
      vim.keymap.set('n', '<leader>do', '<cmd>lua require"dap".step_over()<CR>')
      vim.keymap.set('n', '<leader>di', '<cmd>lua require"dap".step_into()<CR>')
      vim.keymap.set('n', '<leader>dt', '<cmd>lua require"dap".step_out()<CR>')
      vim.keymap.set('n', '<leader>dr', '<cmd>lua require"dap".continue()<CR>')
      vim.keymap.set('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
      vim.keymap.set('n', '<leader>dc', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
      vim.keymap.set('n', '<leader>du', '<cmd>lua require"dapui".toggle()<CR>')
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui"
    },
    config = function (_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python" -- To use a virtual environement.
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "debugpy",
        "pyright",
        "rust-analyzer",
      }
    }
  },
  {
    "mbbill/undotree",
    lazy = false,
  },
}
return plugins
