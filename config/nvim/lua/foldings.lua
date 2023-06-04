-- local fold_options = {
-- 	foldcolumn = "6",
-- 	foldlevel = 6,
-- 	foldmethod = "expr",
-- }
-- for k, v in pairs(fold_options) do
-- 	vim.opt[k] = v
-- end

local persistence_foldings = function(autocmd_event)
	if vim.fn.expand("%") ~= "" and vim.bo.buftype ~= "nofile" then
		-- Save Foldings
		if autocmd_event.event == "BufWritePost" or autocmd_event.event == "BufWinLeave" then
			vim.cmd("mkview")
		end
		-- Load Foldings
		if autocmd_event.event == "BufEnter" or autocmd_event.event == "BufRead" then
			vim.cmd("silent! loadview")
		end
	end
end

vim.api.nvim_create_autocmd({
	"BufWritePost",
	"BufWinLeave",
	"BufEnter",
	"BufRead",
}, {
	pattern = "*",
	callback = persistence_foldings,
})
