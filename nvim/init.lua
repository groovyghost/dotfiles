-- Safely require a Lua module and handle errors
local function safe_require(module)
  local status, loaded_module = pcall(require, module)
  if status then
    return loaded_module
  end
  -- Display an error message using vim.notify if module loading fails
  vim.notify("Error loading the module: " .. module)
  return nil
end

-- Core config modules
safe_require("base")         -- Load the 'base' configuration module
safe_require("plugin_specs") -- Load the 'plugins' configuration module
safe_require("utils")        -- Load the 'utils' configuration module
