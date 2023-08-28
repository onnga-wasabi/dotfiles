vim.cmd[[
let g:user_emmet_leader_key='<c-h>'
]]

local ok, emmet = pcall(require, "emmmet-vim")
if not ok then
	return
end

emmet.setup({})
