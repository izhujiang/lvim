-- <F*> keybindings for DAP(debug)
local dap = require("dap")
lvim.keys.normal_mode["<F9>"] = { dap.toggle_breakpoint, { desc = "Toggle Breakpoint" } }
lvim.keys.normal_mode["<F5>"] = { dap.continue, { desc = "Start Debugging / Continue" } }
-- NOTE: Disable <S-F5> in iterm2 (setting -> profiles -> keys -> key mappings)
-- TODO: <S-F5> doesn't work
-- "<S-F5>",
lvim.keys.normal_mode["<F4>"] = { dap.terminate, { desc = "Terminate" } }
lvim.keys.normal_mode["<C-S-F5>"] = { dap.run_last, { desc = "Run Last" } }
lvim.keys.normal_mode["<F11>"] = { dap.step_into, { desc = "Step Into" } }
lvim.keys.normal_mode["<S-F11>"] = { dap.step_out, { desc = "Step Out" } }
lvim.keys.normal_mode["<F10>"] = { dap.step_over, { desc = "Step Over" } }

lvim.builtin.which_key.mappings["d"] = vim.tbl_extend("keep", lvim.builtin.which_key.mappings["d"], {
  -- b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
  b = { dap.toggle_breakpoint, "Toggle Breakpoint" },
  B = { "lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ;))", "Breakpoint Condition" },
  c = { dap.continue, "Continue" },
  C = { dap.run_to_cursor, "Run to Cursor" },
  d = { dap.disconnect, "Disconnect" },
  g = { dap.goto_, "Go to line (no execute)" },
  p = { dap.pause, "Pause" },
  Q = { dap.close, "Quit" },
  r = { dap.repl.toggle, "Toggle REPL" },
  s = { dap.session, "Session" },
  w = { require("dap.ui.widgets").hover, "Widgets" },
})

lvim.builtin.which_key.mappings["a"] = vim.tbl_extend("keep", lvim.builtin.which_key.mappings["a"], {
  d = {
    function()
      require("dapui").toggle({})
    end,
    "Dap UI",
  },
})