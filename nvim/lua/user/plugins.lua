-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- List of plugins
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use 'arcticicestudio/nord-vim' --Nord theme
  --use 'sainnhe/gruvbox-material' --Gruvbox-materal theme
  use "kyazdani42/nvim-web-devicons" --Icons to be used by other plugins
  use "nvim-lualine/lualine.nvim" --A statusline
  use "lewis6991/gitsigns.nvim" --For Git integration
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "goolord/alpha-nvim" --Startup page
  use 'nvim-tree/nvim-tree.lua'
  
  --use "hrsh7th/nvim-cmp"
  --use "hrsh7th/cmp-buffer"
  --use "hrsh7th/cmp-path"
  
  --use "L3MON4D3/LuaSnip"
  --use "rafamadriz/friendly-snippets"

  --use "neovim/nvim-lspconfig"
  --use "williamboman/nvim-lsp-installer"
 
  
  if packer_bootstrap then
		require("packer").sync()
	end
end)
