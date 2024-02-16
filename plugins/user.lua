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
  -- add xiyaowong/transparent.nvim without lazy loading
  {
    "rktjmp/lush.nvim",
    lazy = false,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
  },
  {
    "kartikp10/noctis.nvim",
    lazy = false,
  },
  {
    "clinstid/eink.vim",
    lazy = false,
  },
  {
    "yorickpeterse/vim-paper",
    lazy = false,
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },
  {
    "ThePrimeagen/harpoon",
    lazy = false,
  }
}
