local ok, dap = pcall(require, "dap")
if not ok then
	return
end

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      return os.getenv("PWD") .. '/.venv/bin/python'
    end;
  },
}
dap.adapters.python = {
  type = 'executable';
  command = os.getenv("PWD") .. '/.venv/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

local ok, dapui = pcall(require, "dapui")
if not ok then
	return
end

vim.fn.sign_define("DapBreakpoint", { text = "⛔", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "👉", texthl = "", linehl = "", numhl = "" })
dapui.setup()

local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "<leader><leader>", ":lua require'dapui'.toggle()<CR>", opts)
set_keymap("n", "<leader><leader>df", ":lua require'dapui'.eval()<CR>", opts)
set_keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
set_keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
set_keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
set_keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
set_keymap("n", "<leader><a-b>", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
set_keymap("n", "<leader><a-b>c", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
set_keymap(
	"n",
	"<leader>l",
	":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	opts
)
