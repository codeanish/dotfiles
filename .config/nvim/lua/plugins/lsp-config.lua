return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig"
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" }
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          }
        }
      })


      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
          end
          map("K",      vim.lsp.buf.hover,        "Hover")
          map("gd",     vim.lsp.buf.definition,   "Definition")
          map("<leader>rn",  vim.lsp.buf.rename, "Rename")
          map("<leader>ca",   vim.lsp.buf.code_action, "Code action")
        end
      })
    end
  }
}
