return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
      opts = {
         ensure_installed = {
           "lua-language-server",
           "html-lsp",
           "prettier",
           "json-lsp",
           "stylua",
           "terraform-ls"
         },
      },
   }
}
