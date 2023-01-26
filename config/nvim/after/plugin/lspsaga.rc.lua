local ok, lspsaga = pcall(require, "lspsaga")
if not ok then
  return
end

local options = {
  ui = {
    -- currently only round theme
    theme = "round",
    -- this option only work in neovim 0.9
    title = true,
    -- border type can be single,double,rounded,solid,shadow.
    border = "rounded",
    winblend = 10,
    expand = "",
    collapse = "",
    preview = " ",
    code_action = "💡",
    diagnostic = "🐞",
    incoming = " ",
    outgoing = " ",
    colors = {
      --float window normal background color
      normal_bg = "#1d1536",
      --title background color
      title_bg = "#afd700",
      red = "#e95678",
      magenta = "#b33076",
      orange = "#FF8700",
      yellow = "#f7bb3b",
      green = "#afd700",
      cyan = "#36d0e0",
      blue = "#61afef",
      purple = "#CBA6F7",
      white = "#d1d4cf",
      black = "#1c1c19",
    },
    kind = {},
  },
}
lspsaga.setup(options)

-- Mappings {{{
local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "gh", "<cmd>Lspsaga lsp_finder<cr>", opts)
set_keymap("n", "ga", "<cmd>Lspsaga code_action<cr>", opts)
set_keymap("n", "gR", "<cmd>Lspsaga rename<cr>", opts)
set_keymap("n", "gxl", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
set_keymap("n", "gxc", "<cmd>Lspsaga show_cursor_diagnosticscr>", opts)
set_keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
-- set_keymap('n', 'gd', '<cmd>Lspsaga peek_definition<cr>', opts) -- 使いにくい
-- }}} end of Mappings
