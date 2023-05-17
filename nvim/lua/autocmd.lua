local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = "1000" })
  end,
})

--- Remove all trailing whitespace on save
local TrimWhiteSpaceGrp = augroup("TrimWhiteSpaceGrp", { clear = true })
autocmd("BufWritePre", {
  command = [[:%s/\s\+$//e]],
  group = TrimWhiteSpaceGrp,
})

-- Don't auto commenting new lines
autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Turn off paste mode when leaving insert
autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Only highlight when searching
autocmd("CmdlineEnter", {
   callback = function ()
      local cmd = vim.v.event.cmdtype
      if cmd == "/" or cmd == "?" then
         vim.opt.hlsearch = true
      end
   end
})
autocmd("CmdlineLeave", {
   callback = function ()
      local cmd = vim.v.event.cmdtype
      if cmd == "/" or cmd == "?" then
         vim.opt.hlsearch = false
      end
   end
})

-- Detect ansible files
autocmd("BufRead,BufNewFile", {
  pattern = {
    "**/playbooks/*.yml",
    "**/ansible/*.yml",
    "**/roles/*/tasks/*.yml",
    "**/roles/*/defaults/*.yml",
    "**/roles/*/handlers/*.yml",
  },
  callback = function()
    vim.opt.ft = "yaml.ansible"
  end,
})
