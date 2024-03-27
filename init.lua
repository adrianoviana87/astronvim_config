return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  -- colorscheme = "github_light",
  -- colorscheme = "github_dark_high_contrast",
  -- colorscheme = "github_light_high_contrast",
  -- colorscheme = "eink",
  colorscheme = "catppuccin",

  plugins = {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      config = function()
        require("catppuccin").setup {}
      end,
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    require('transparent').clear_prefix('NeoTree')
    require('transparent').clear_prefix('BufferLine')
    require("telescope").load_extension('harpoon')

    if vim.g.neovide then
      vim.o.guifont = "CaskaydiaCove Nerd Font:h12"
      vim.g.neovide_cursor_animate_in_insert_mode = true
      vim.g.neovide_remember_window_size = true
      vim.g.neovide_floating_blur_amount_x = 2.0
      vim.g.neovide_floating_blur_amount_y = 2.0
      vim.g.neovide_scroll_animation_length = 0.3
      vim.g.neovide_scroll_animation_far_lines = 2
      vim.g.neovide_cursor_animation_length = 0.13
      vim.g.neovide_cursor_antialiasing = true
      vim.g.neovide_cursor_animate_in_insert_mode = true
      vim.g.neovide_cursor_vfx_mode = "railgun"
      vim.g.neovide_cursor_vfx_particle_lifetime = 3
      vim.g.neovide_cursor_vfx_particle_density = 20
    end
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    -- changes to the colorscheme

    -- Use bold and italics for syntax highlighting
    vim.cmd[[
      highlight link Comment       SpecialComment
      highlight link Constant      Type
      highlight link Function      Type
      highlight link Keyword       Type
      highlight link String        Type
      highlight link Statement     Type
      highlight link Type          Type
      highlight link Operator      Type
      highlight link Exception     Type
      highlight link PreProc       Type
      highlight link Identifier    Type
      highlight link Special       Type
      highlight link SpecialChar   Type
      highlight link Underlined    Type
      highlight link Ignore        Type
      highlight link Error         Type
    ]]

    -- Enable bold and italics
    vim.cmd[[highlight Comment       gui=italic]]
    vim.cmd[[highlight Constant      gui=italic]]
    vim.cmd[[highlight Function      gui=bold]]
    vim.cmd[[highlight Keyword       gui=italic]]
    vim.cmd[[highlight String        gui=italic]]
    vim.cmd[[highlight Statement     gui=italic]]
    vim.cmd[[highlight Type          gui=bold]]
    vim.cmd[[highlight Operator      gui=bold]]
    vim.cmd[[highlight Exception     gui=bold]]
    vim.cmd[[highlight PreProc       gui=italic]]
    vim.cmd[[highlight Identifier    gui=bold]]
    vim.cmd[[highlight Special       gui=italic]]
    vim.cmd[[highlight SpecialChar   gui=bold]]
    vim.cmd[[highlight Underlined    gui=italic]]
    vim.cmd[[highlight Ignore        gui=bold]]
    vim.cmd[[highlight Error         gui=bold]]

  end,
}
