-- Treesitter setup for enhanced syntax highlighting, indentation, and selection
return {
  "nvim-treesitter/nvim-treesitter",  -- Use nvim-treesitter for syntax highlighting
  build = ":TSUpdate",  -- Build command to update Treesitter parsers
  config = function()
    -- Set up Treesitter configurations
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "bash", "c", "lua", "python" },  -- Install these parsers
      auto_install = false,  -- Disable auto installation of parsers
      highlight = { enable = true, },  -- Enable syntax highlighting
      indent = { enable = true },  -- Enable indentation
      incremental_selection = {
        enable = true,  -- Enable incremental selection
        keymaps = {
          init_selection = "<C-space>",  -- Initialize selection
          node_incremental = "<C-space>",  -- Incremental selection
          scope_incremental = "<C-s>",  -- Incremental selection of scope
          node_decremental = "<M-space>",  -- Decremental selection
        },
      },
    }
  end
}

