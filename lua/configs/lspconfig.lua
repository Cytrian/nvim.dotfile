local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "jsonls"}

local util = require 'lspconfig.util'

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- https://www.reddit.com/r/neovim/comments/166s3ni/help_with_nvchad_terraformls/
lspconfig.terraformls.setup({
  filetypes = {"terraform", "terraform-vars", "tf"},
  root_dir = function(dirpath)
     return util.root_pattern(".terraform", ".git")(dirpath) or util.path.dirname(dirpath)
  end,
})
