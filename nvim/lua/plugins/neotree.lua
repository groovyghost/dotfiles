return {
  {
    "nvim-neo-tree/neo-tree.nvim", -- Plugin to manage & access the file system using an explorer
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim" },
    cmd = "Neotree", -- Lazy-load the plugin only when the "Neotree" command is invoked
    deactivate = function() -- Callback function to deactivate the plugin when necessary.
      vim.cmd([[ Neotree close]])
    end,
    init = function() -- Initialisation stuff before starting the plugin.
      vim.g.neo_tree_remove_legacy_commands = 1

      if vim.fn.argc() == 1 then -- Check if there's only one file opened with Neovim.
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      close_if_last_window = true, -- Don't leave the plugin's window open as the last window
      enable_git_status = true, -- Enable Git VCS information for the current working directory
      enable_diagnostics = true, -- Enable diagnostic feedback for all files in the working directory
      filesystem = {
        hijack_netrw_behaviour = "open_current", -- Use the plugin instead of the default "netrw" plugin
        bind_to_cwd = false,
        follow_current_file = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
          never_show = { ".git", ".null-ls_*" },
        },
      },
      window = {
        position = "left",
        width = 30,
        mapping_options = { noremap = true, nowait = true,},
        mappings = {
          ["o"] = "open",
          ["<Tab>"] = { "toggle_preview", config = { use_float = true } },
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = { "copy", config = { show_path = "absolute" }}, --"none", "relative", "absolute"
          ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
          ["q"] = "close_window",
          ["?"] = "show_help",
          ["f"] = "fuzzy_sorter",
        },
      },
    },
  },
}
