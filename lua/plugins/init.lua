local function compose_plugin_specs()
  local plugins_root = "plugins"
  local function ends_with(str, ending)
    return ending == "" or str:sub(-#ending) == ending
  end

  local function scandir(dir)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -a "' .. dir .. '"')
    if pfile ~= nil then
      for filename in pfile:lines() do
        if ends_with(filename, ".lua") and not ends_with(filename, "init.lua") then
          i = i + 1
          t[i] = filename
        end
      end
      pfile:close()
    end
    return t
  end

  local cur_dir = debug.getinfo(1).source:match("@?(.*/)")
  local fns = scandir(cur_dir)

  local plugins = vim.defaulttable()
  for _, filename in pairs(fns) do
    local ext_start, _ = string.find(filename, ".lua")
    local plugin_name = string.sub(filename, 1, ext_start - 1)
    -- if not vim.tbl_contains(M.deactivated_plugins, plugin_name) then
    local mod = plugins_root .. "." .. plugin_name
    vim.list_extend(plugins, require(mod))
  end

  -- local plugins = {}
  -- local modules = { "core", "colorscheme", "coding", "editor", "ui", "dev", "util" }
  -- for _, m in ipairs(modules) do
  --   vim.list_extend(plugins, require("plugins." .. m))
  -- end

  return plugins
end

return compose_plugin_specs()