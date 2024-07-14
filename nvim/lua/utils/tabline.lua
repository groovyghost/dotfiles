local M = {}
local fn = vim.fn

-- Returns the Lua list of listed buffers
local function get_listed_bufs()
  local listed_buf = {}
  for buf = 1, fn.bufnr("$") do
    if fn.buflisted(buf) ~= 0 then
      table.insert(listed_buf, buf)
    end
  end
  return listed_buf
end

-- Format a string for Vim tabline based on tabs and current buffer information
M.build = function()
  local s = "  "
  local curr_tabnum = fn.tabpagenr()

  for i = 1, fn.tabpagenr("$") do
    local winnum = fn.tabpagewinnr(i)
    local buflist = fn.tabpagebuflist(i)
    local curr_bufnum = buflist[winnum]
    local curr_bufname = fn.bufname(curr_bufnum)
    local is_curr_buff_modified = fn.getbufvar(curr_bufnum, "&modified")

    s = s .. (i == curr_tabnum and "%#TabLineSel#" or "%#TabLine#")
    s = s .. " %" .. i .. "T" .. i .. " "

    if M.has_devicons then
      local ext = fn.fnamemodify(curr_bufname, ":e")
      local icon = M.devicons.get_icon(curr_bufname, ext, { default = true }) .. " "
      s = s .. icon
    end

    local display_curr_bufname = fn.fnamemodify(curr_bufname, ":t")
    if i ~= curr_tabnum and #display_curr_bufname > 27 then
      display_curr_bufname = display_curr_bufname:sub(1, 10) .. "..."
    end

    s = s .. display_curr_bufname .. "%" .. i .. " "
    s = s .. (is_curr_buff_modified == 1 and " " or " ")
    s = s .. "%T "
    s = s .. " %#TabLineFill# "
  end

  s = s .. "%=" .. "  #Tab: " .. fn.tabpagenr("$") .. " |"
  s = s .. "  #Buf: " .. #get_listed_bufs() .. " "
  return s
end

M.has_devicons, M.devicons = pcall(require, "nvim-web-devicons")

_G.nvim_tabline = function()
  return M.build()
end

vim.opt.tabline = "%!v:lua.nvim_tabline()"

return M
