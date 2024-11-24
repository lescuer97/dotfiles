
local dap, dapui = require("dap"), require("dapui")
local nnoremap = require("keymap").nnoremap

require("dap-go").setup()
dapui.setup()

-- vim.key
nnoremap( "<Leader>b", dap.toggle_breakpoint)
nnoremap( "<Leader>dc", dap.toggle_breakpoint)

nnoremap( "<F1>", dap.continue)
nnoremap( "<F2>", dap.step_into)
nnoremap( "<F3>", dap.step_over)
nnoremap( "<F4>", dap.step_out)
nnoremap( "<F5>", dap.step_back)
nnoremap( "<F13>", dap.restart)


dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
