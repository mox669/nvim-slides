-----------------------
-- Neovim/Lua utilities
-----------------------

local M = {}
local api = vim.api

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

-- glue cursor to pos(1,1) on CursorMoved event
-- TODO  08/25/24-23:44 mox669: why the ef does TabEnter not work?
function M.setup_augr()
  local augr = api.nvim_create_augroup('nvim-slides', { clear = true })
  api.nvim_create_autocmd('CursorMoved', {
    group = augr,
    pattern = '*.norg',
    callback = function()
      vim.api.nvim_win_set_cursor(0, { 1, 1 })
    end,
  })
end

return M
