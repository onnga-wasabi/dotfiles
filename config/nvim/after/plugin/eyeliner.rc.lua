local ok, eyeliner = pcall(require, "eyeliner")
if not ok then
	return
end

eyeliner.setup({
	highlight_on_key = true, -- this must be set to true for dimming to work!
	dim = true,
})
