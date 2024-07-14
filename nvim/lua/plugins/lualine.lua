local codeium = function()
  local started = false
  for _, s in ipairs(require("cmp").core.sources) do
    if s.name == "codeium" then
      if s.source:is_available() then
        started = true
      else
        return started and "error" or "󱚢 "
      end
      if s.status == s.SourceStatus.FETCHING then
        return "󱚟 "
      end
      return "󱚣 "
    end
  end
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "auto",
      component_separators = "|",
      section_separators = "",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { "filename", codeium },
      lualine_x = { "diagnostics", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
