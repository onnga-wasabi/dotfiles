local ok, dap_python = pcall(require, "dap-python")
if not ok then
	return
end

local venv = os.getenv("VIRTUAL_ENV")
command = venv .. "/bin/python"
dap_python.setup(command)
dap_python.test_runner = 'pytest'

