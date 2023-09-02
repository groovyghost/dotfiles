# Neovim Config

## Overview
I've been using some form of Vi/Vim/Neovim since 2020. Around 2021  As i started learning DevOps, i likely found myself working with configuration files, scripts, and various text-based tasks. Vim's efficiency became even more valuable in this context. As a beginner it was hard to customize vim using vim script.

Eventually stumbled upon Neovim, a modernized and extensible fork of Vim. One of Neovim's standout features is its support for Lua scripting, making it more approachable and powerful for customization. Beginning in late 2021 I began converting my Neovim configuration to use Lua.

I don't advise using this repository as your personal config because it contains some opinionated features, and you can learn much about (neo)vim when you configure it yourself.

## Dependencies
- Neovim 0.9
- "Hacked" Font (Mine is [ Comic Shanns Mono ]( https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/ComicShannsMono ))
- `npm` for LSP servers


## Plug Ins
These are some of the plugins that I have installed.

* [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin management
* [catppuccin](https://github.com/catppuccin/nvim) - Colorscheme
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Lsp config
* [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP Server installer
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Code completion
* [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - Visual Git activity markers
* [lualine](https://github.com/nvim-lualine/lualine.nvim) - Status bar
* [telescope](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
* [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Abstract symbol tree tool used for code syntax operations
* [which-key](https://github.com/folke/which-key.nvim) - Popup command Completion
* [Comment.nvim]( https://github.com/numToStr/Comment.nvim) - For code commenting
* [Navigator.nvim](https://github.com/numToStr/Navigator.nvim) - Intergrate with tmux
* [harpoon](https://github.com/ThePrimeagen/harpoon) - Quick file navigation
* [barbecue](https://github.com/utilyre/barbecue.nvim) - Winbar
* [vim-surround](https://github.com/tpope/vim-surround) - Manage parentheses, brackets, quotes

## Appendix
These are some of the sources I used while converting from a vimscript based configuration to a Lua
based configuration.

* [https://github.com/rockerBOO/awesome-neovim](https://github.com/rockerBOO/awesome-neovim)
* [https://microsoft.github.io/language-server-protocol/implementors/servers/](https://microsoft.github.io/language-server-protocol/implementors/servers/)
* [https://blog.inkdrop.app/my-neovim-setup-for-react-typescript-tailwind-css-etc-in-2022-a7405862c9a4](https://blog.inkdrop.app/my-neovim-setup-for-react-typescript-tailwind-css-etc-in-2022-a7405862c9a4)
* [https://github.com/nanotee/nvim-lua-guide/](https://github.com/nanotee/nvim-lua-guide/)
* [https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)
* [https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)
