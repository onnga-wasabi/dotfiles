return {
	-- https://github.com/mfussenegger/nvim-dap
	"mfussenegger/nvim-dap",
	-- config = function() end,
	keys = {
		{ "<leader>dc", function() require("dap").continue() end, },
		{ "<leader>dr", function() require("dap").run_last() end },
		{ "<leader>db", function() require("dap").set_breakpoint() end },
	},
}
