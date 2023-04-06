return {
   -- You can also add new plugins here as well:
   -- Add plugins, the lazy syntax
   -- "andweeb/presence.nvim",
   -- {
   --   "ray-x/lsp_signature.nvim",
   --   event = "BufRead",
   --   config = function()
   --     require("lsp_signature").setup()
   --   end,
   -- },
   {
      "zbirenbaum/copilot.lua",
      enabled = true,
      cmd = "Copilot",
      event = "InsertEnter",
      opts = {
         suggestion = { enabled = true },
         panel = { enabled = true },
      },
   },

   {
      "simrat39/symbols-outline.nvim",
      keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
      config = true,
   },

   {
      "nvim-cmp",
      dependencies = {
         "hrsh7th/cmp-emoji",
         {
            "zbirenbaum/copilot-cmp",
            opts = {},
         },
      },
      ---@param opts cmp.ConfigSchema
      opts = function(_, opts)
         local cmp = require("cmp")
         opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "copilot" }, { name = "emoji" } }))
      end,
   },
}
