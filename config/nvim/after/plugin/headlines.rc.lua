local ok, headlines = pcall(require, "headlines")
if not ok then
	return
end

vim.cmd([[highlight Headline1 guibg=#1e2718]])
vim.cmd([[highlight Headline2 guibg=#21262d]])
vim.cmd([[highlight CodeBlock guibg=#1c1c1c]])
vim.cmd([[highlight Dash guibg=#D19A66 gui=bold]])

local config = {
	markdown = {
		headline_highlights = false,
		codeblock_highlight = "CodeBlock",
	},
}

headlines.setup(config)
