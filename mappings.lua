-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    [";"] = { ":" },
    ["<leader>pf"] = { "<cmd>echo expand('%')<cr>", desc = "Print file path" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- nnoremap ( (zz
    ["("] = { "(zz" },
    [")"] = { ")zz" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- open harpoon
    ["<leader>h"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon" },
    -- harpoon - add file
    ["<leader>ha"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Harpoon - Add File" },
    -- harpoon next file
    ["<leader>hn"] = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Harpoon - Next File" },
    -- harpoon prev file
    ["<leader>hp"] = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Harpoon - Prev File" },
    -- telescope harpoon
    ["<leader>fh"] = { "<cmd>Telescope harpoon marks<cr>", desc = "Find harpoon marks" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
