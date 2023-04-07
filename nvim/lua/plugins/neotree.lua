return {
  {
    "nvim-neo-tree/neo-tree.nvim", -- Plugin to manage & access the file system using an explorer
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim" },
    cmd = "Neotree", -- Lazy-load the plugin only when the "Neotree" command is invoked
    keys = {
      {
        "<leader>e", -- Press "Space + f + e" to toggle open/close the file explorer
        function()
          -- Open the file explorer in the current directory.
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Open the Neotree file explorer",
      },
    },
    deactivate = function() -- Callback function to deactivate the plugin when necessary.
      vim.cmd([[ Neotree close]])
    end,
    init = function() -- Initialisation stuff before starting the plugin.
      vim.g.neo_tree_remove_legacy_commands = 1

      if vim.fn.argc() == 1 then -- Check if there's only one file opened with Neovim.
        -- Assign the first file opened with Neovim to the "stat" variable name.
        local stat = vim.loop.fs_stat(vim.fn.argv(0))

        -- Import the "Neotree" plugin module if the "stat" variable is a "directory"
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      close_if_last_window = false, -- Don't leave the plugin's window open as the last window
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
