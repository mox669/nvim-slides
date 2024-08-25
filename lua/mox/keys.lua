---------------
-- Key mappings
---------------
local function map(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Leader (unmap space and remap it to vim leader key
map('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- save and quit
map('n', '<Leader>w', ':w<CR>', { silent = true, noremap = true })
map('n', '<Leader>Q', ':q!<CR>', { silent = true, noremap = true })
map('n', '<Leader>q', ':BufDel<CR>', { silent = true, noremap = true })
map('n', '<Leader>s', '<cmd>so%<CR>', { silent = true, noremap = true })

-- basic window movement
map('n', '<C-h>', '<C-w>h', { silent = true })
map('n', '<C-j>', '<C-w>j', { silent = true })
map('n', '<C-k>', '<C-w>k', { silent = true })
map('n', '<C-l>', '<C-w>l', { silent = true })

-- indenting in visual mode
map('v', '<', '<gv', { noremap = true, silent = true })
map('v', '>', '>gv', { noremap = true, silent = true })

-- <ESC> alternative
map('i', 'jk', '<ESC>', { noremap = true, silent = true })
map('i', 'kj', '<ESC>', { noremap = true, silent = true })
map('i', 'KJ', '<ESC>', { noremap = true, silent = true })
map('i', 'JK', '<ESC>', { noremap = true, silent = true })

-- Tabs: go prev and next
map('n', '<Left>', ':bp<CR> :redraw!<CR>', { noremap = true, silent = true })
map('n', '<Right>', ':bn<CR> :redraw!<CR>', { noremap = true, silent = true })

-- ASCII generator

-- title
map(
  'n',
  '<Leader>t',
  ':.!toilet -f future<CR>',
  { noremap = true, silent = true }
)

-- subtitle
map(
  'n',
  '<Leader>s',
  ':.!toilet -f term<CR>',
  { noremap = true, silent = true }
)

-- venn.nvim: enable or disable keymappings
function _G.Toggle_venn()
  local venn_enabled = vim.inspect(vim.b.venn_enabled)
  if venn_enabled == 'nil' then
    vim.b.venn_enabled = true
    vim.notify('Venn enabled')
    vim.cmd([[setlocal ve=all]])
    -- draw a line on HJKL keystokes
    vim.api.nvim_buf_set_keymap(
      0,
      'n',
      'J',
      '<C-v>j:VBox<CR>',
      { noremap = true }
    )
    vim.api.nvim_buf_set_keymap(
      0,
      'n',
      'K',
      '<C-v>k:VBox<CR>',
      { noremap = true }
    )
    vim.api.nvim_buf_set_keymap(
      0,
      'n',
      'L',
      '<C-v>l:VBox<CR>',
      { noremap = true }
    )
    vim.api.nvim_buf_set_keymap(
      0,
      'n',
      'H',
      '<C-v>h:VBox<CR>',
      { noremap = true }
    )
    -- draw a box by pressing "f" with visual selection
    vim.api.nvim_buf_set_keymap(0, 'v', 'f', ':VBox<CR>', { noremap = true })
  else
    vim.cmd([[setlocal ve=]])
    vim.api.nvim_buf_del_keymap(0, 'n', 'J')
    vim.api.nvim_buf_del_keymap(0, 'n', 'K')
    vim.api.nvim_buf_del_keymap(0, 'n', 'L')
    vim.api.nvim_buf_del_keymap(0, 'n', 'H')
    vim.api.nvim_buf_del_keymap(0, 'v', 'f')
    vim.b.venn_enabled = nil
  end
end
-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap(
  'n',
  '<leader>b',
  ':lua Toggle_venn()<CR>',
  { noremap = true }
)

-- zen-mode.nvim -> go into presentation mode
map('n', '<Leader>z', ':ZenMode<CR>', { noremap = true, silent = true })
