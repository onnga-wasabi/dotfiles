local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local cspell_config_path = "cspell.yaml"
if not file_exists(cspell_config_path) then
  cspell_config_path = "cspell.config.yaml"
elseif not file_exists(cspell_config_path) then
  cspell_config_path = os.getenv("HOME") .. "/.config/cspell/cspell.yaml"
end

local sources = {
  -- scala
  formatting.scalafmt,

  -- python
  formatting.isort,
  formatting.black.with({
    extra_args = { "--line-length=119" },
  }),
  -- diagnostics.pyproject_flake8,
  -- diagnostics.mypy,

  -- yaml
  formatting.yamlfmt,
  -- grpc
  formatting.buf,
  diagnostics.buf,

  -- golang
  formatting.goimports,

  -- javascript
  formatting.prettier.with({
    extra_args = {
      "--no-semi",
      "--double-quote",
      "--jsx-double-quote",
    },
  }),
  formatting.eslint_d,
  diagnostics.eslint_d,

  -- lua
  formatting.stylua,
  diagnostics.luacheck.with({
    extra_args = {
      "--formatter",
      "plain",
      "--codes",
      "--ranges",
      "--globals",
      "vim",
      "--ignore",
      "411",
      "--ignore-pattern",
      "!.eslintrc.js",
      "--filename",
      "$FILENAME",
      "-",
    },
  }),

  -- miss spell
  diagnostics.cspell.with({
    extra_args = { "--config", cspell_config_path },
  }),
  code_actions.cspell,
}

if vim.fn.executable("djlint") == 1 then
  sources[#sources + 1] = formatting.djlint.with({
    command = "djlint",
    args = { "--reformat", "-" },
  })
end

local options = {
  sources = sources,
}

null_ls.setup(options)

-- Iterm2 を使う場合はprofiles -> keys -> Ecs+
local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

-- Normal: n
set_keymap("n", "<a-F>", "<cmd>:lua vim.lsp.buf.format({ async = true })<cr>", opts)
