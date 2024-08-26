-----------------------
-- Neovim/Lua utilities
-----------------------

local M = {}
local api = vim.api
local zen = false
local opts = {
  'number',
  'cursorline',
  'cursorcolumn',
}

-- @brief print content of a table
--
-- @param tbl  table to print content of
-- @param indent  indent level for print
function M.table_print(tbl, indent)
  if not indent then
    indent = 0
  end
  local toprint = string.rep(' ', indent) .. '{\r\n'
  indent = indent + 2
  for k, v in pairs(tbl) do
    toprint = toprint .. string.rep(' ', indent)
    if type(k) == 'number' then
      toprint = toprint .. '[' .. k .. '] = '
    elseif type(k) == 'string' then
      toprint = toprint .. k .. '= '
    end
    if type(v) == 'number' then
      toprint = toprint .. v .. ',\r\n'
    elseif type(v) == 'string' then
      toprint = toprint .. '"' .. v .. '",\r\n'
    elseif type(v) == 'table' then
      toprint = toprint .. M.table_print(v, indent + 2) .. ',\r\n'
    else
      toprint = toprint .. '"' .. tostring(v) .. '",\r\n'
    end
  end
  toprint = toprint .. string.rep(' ', indent - 2) .. '}'
  return toprint
end

-- @brief glue cursor to pos(1,1) in zen mode
-- TODO  08/25/24-23:44 mox669: why the ef does TabEnter not work?
local function handle_augr(zen_active)
  if zen_active then
    api.nvim_del_augroup_by_name('nvim-slides')
  else
    local augr = api.nvim_create_augroup('nvim-slides', { clear = true })
    api.nvim_create_autocmd('CursorMoved', {
      group = augr,
      pattern = '*.norg',
      callback = function()
        vim.api.nvim_win_set_cursor(0, { 1, 1 })
      end,
    })
  end
end

-- @brief handle highlights
local function handle_hl(zen_active)
  if zen_active then
    api.nvim_set_hl(0, 'Cursor', { bg = '#ff631c' })
  else
    api.nvim_set_hl(0, 'Cursor', { bg = '#030303' })
  end
end

-- @brief handle boolean options
local function handle_bool_opts(zen_active, opt_name)
  api.nvim_set_option_value(opt_name, zen_active, {})
end

-- @brief handle non boolean options
local function handle_non_bool_opts(zen_active)
  if zen_active then
    api.nvim_set_option_value('colorcolumn', '60', {})
    api.nvim_set_option_value('showtabline', 3, {})
  else
    api.nvim_set_option_value('colorcolumn', '', {})
    api.nvim_set_option_value('showtabline', 0, {})
  end
end

-- do the handling of editor features yourself. zen-mode does disable them
-- when entering zen-mode, but on leave does not reenable them
function M.handle_nvim_zen()
  -- run all over all boolean opts
  for _, opt in ipairs(opts) do
    handle_bool_opts(zen, opt)
  end

  handle_augr(zen)
  handle_non_bool_opts(zen)
  handle_hl(zen)

  -- flip zen
  zen = not zen
end

return M
