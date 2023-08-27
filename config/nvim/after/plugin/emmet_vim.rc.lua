local ok, emmet = pcall(require, "emmmet-vim")
if not ok then
	return
end

emmet.setup({})
