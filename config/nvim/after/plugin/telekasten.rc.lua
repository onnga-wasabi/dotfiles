local ok, telekasten = pcall(require, "telekasten")
if not ok then
	-- not loaded
	return
end

telekasten.setup({
	home = vim.fn.expand("~/zettelkasten"),
})
