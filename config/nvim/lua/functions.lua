-- vim.api.nvim_create_user_command("PreviewUML", function()
-- 	if vim.fn.expand("%") ~= "" and vim.bo.buftype ~= "nofile" then
-- 		vim.cmd("!plantuml " .. vim.fn.expand("%"))
-- 	end
-- end, {})
