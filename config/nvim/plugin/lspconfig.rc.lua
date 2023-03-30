-- mason
local ok, mason = pcall(require, "mason")
if ok then
  mason.setup()
else
  return
end

local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if ok then
  mason_lspconfig.setup()
else
  return
end

-- lspconfig
local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end
local lsp_util = require("lspconfig/util")

lspconfig.metals.setup({})

lspconfig.pyright.setup({})

lspconfig.vimls.setup({})

lspconfig.gopls.setup({
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = lsp_util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
    },
  },
})

lspconfig.terraformls.setup({
  cmd = { "terraform-ls", "serve" },
})

lspconfig.clangd.setup({})

lspconfig.sqlls.setup({})

lspconfig.yamlls.setup({})

lspconfig.opencl_ls.setup({})

lspconfig.texlab.setup({})

lspconfig.terraformls.setup({})

lspconfig.volar.setup({
  filetypes = { "javascript", "javascriptreact", "vue" },
  init_options = {
    languageFeatures = {
      diagnostics = false,
    },
  },
})

lspconfig.bufls.setup({})

lspconfig.html.setup({})

lspconfig.jdtls.setup({})

lspconfig.tsserver.setup({
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
})

lspconfig.kotlin_language_server.setup({})

lspconfig.groovyls.setup({})

lspconfig.sqls.setup({})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        enable = false,
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- refer to: https://github.com/neovim/nvim-lspconfig/issues/1700#issuecomment-1033127328
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

lspconfig.ruby_ls.setup({
  filetypes = {
    "ruby",
    "Brewfile",
  },
})

local ok, mason_tool_installer = pcall(require, "mason-tool-installer")
if not ok then
  return
end

mason_tool_installer.setup({
  -- a list of all tools you want to ensure are installed upon
  -- start; they should be the names Mason uses for each tool
  ensure_installed = {
    "yamlfmt",
    "texlab",
    "robotframework-lsp",
    "yaml-language-server",
    "vim-language-server",
    "taplo",
    "pyright",
    "lua-language-server",
    "clangd",
    "black",
    "dockerfile-language-server",
    "flake8",
    "gopls",
    "isort",
    "ltex-ls",
    "opencl-language-server",
    "prettier",
    "yamllint",
    "terraform-ls",
    "vue-language-server",
    "jdtls", -- java
    "kotlin-language-server",
    "groovy-language-server",
    "typescript-language-server",
  },
  -- if set to true this will check each tool for updates. If updates
  -- are available the tool will be updated. This setting does not
  -- affect :MasonToolsUpdate or :MasonToolsInstall.
  -- Default: false
  auto_update = false,
  -- automatically install / update on startup. If set to false nothing
  -- will happen on startup. You can use :MasonToolsInstall or
  -- :MasonToolsUpdate to install tools and check for updates.
  -- Default: true
  run_on_start = true,
  -- set a delay (in ms) before the installation starts. this is only
  -- effective if run_on_start is set to true.
  -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
  -- default: 0
  start_delay = 1000, -- 3 second delay
})
