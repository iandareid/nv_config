local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger"
    }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function ()
        require("dap").continue()
      end
    }
  }
}

M.undotree = {
  plugin = true,
  n = {
    ["<leader>u"] = {
      "<cmd> UndotreeToggle <CR>",
      "Toggle undotree"
    }
  }
}

require "core.utils".load_mappings("undotree")

return M
