--Basic options
local opt = vim.opt
opt.laststatus = 3
opt.backup = false -- creates a backup file
opt.clipboard = "unnamedplus" -- keep in sync with the system clipboard
opt.completeopt = "menu,menuone,noselect" -- A comma separated list of options for Insert mode completion
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.confirm = true -- confirm to save changes before exiting modified buffer
opt.cursorline = true -- highlight the current line
opt.dir = vim.fn.stdpath("data") .. "/swp" -- swap file directory
opt.expandtab = true -- use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.hidden = true -- Enable modified buffers in background
opt.history = 500 -- Use the 'history' option to set the number of lines from command mode that are remembered.
opt.ignorecase = true -- ignore case in search patterns
opt.inccommand = "nosplit" -- preview incremental substitute
opt.list = false
opt.mouse = "nv" -- Mouse in normal and visual
opt.number = true -- Numbered lines
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Set relative numbers
opt.scrolloff = 20 -- Minimal number of screen lines to keep above and below the cursor
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.shortmess = opt.shortmess + "c" -- prevent "pattern not found" messages
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 1 -- always show tabs; 0 never, 1 only if at least two tab pages, 2 always
opt.sidescrolloff = 5 -- The minimal number of columns to scroll horizontally
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = true -- enable/disable swap file creation
opt.tabstop = 2 -- how many columns a tab counts for
opt.termguicolors = true -- set term gui true colors (most terminals support this)
opt.timeoutlen = 400 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.ttimeoutlen = 0 -- Time in milliseconds to wait for a key code sequence to complete
opt.undodir = vim.fn.stdpath("data") .. "/undodir" -- set undo directory
opt.undofile = true -- enable/disable undo file creation
opt.undolevels = 1000
opt.updatetime = 300 -- faster completion
opt.wildignorecase = true -- When set case is ignored when completing file names and directories
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- minimum window width
opt.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
]]
