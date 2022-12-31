local ok, ts_autotag = pcall(require, "nvim-ts-autotag")
if not ok then
	return
end

ts_autotag.setup({})
