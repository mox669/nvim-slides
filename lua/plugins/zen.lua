return {
  'folke/zen-mode.nvim',
  opts = {
    window = {
      backdrop = 0.75,
      options = {
        signcolumn = 'no', -- disable signcolumn
        number = false, -- disable number column
        relativenumber = false, -- disable relative numbers
        cursorline = false, -- disable cursorline
        cursorcolumn = false, -- disable cursor column
        colorcolumn = '0', -- disable color column
        foldcolumn = '0', -- disable fold column
        list = false, -- disable whitespace characters
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false, -- disables the ruler text in the cmd line area
        showcmd = false, -- disables the command in the last line of the screen
        -- you may turn on/off statusline in zen mode by setting 'laststatus'
        -- statusline will be shown only if 'laststatus' == 3
        laststatus = 0, -- turn off the statusline in zen mode
      },
      kitty = {
        enabled = true,
        font = '+19', -- font size increment
      },
    },
    on_open = function()
      -- setup CursorMoved event
      require('mox.utils').setup_augr()
    end,
    -- callback where you can add custom code when the Zen window closes
    on_close = function()
      local api = vim.api
      api.nvim_del_augroup_by_name('nvim-slides')
    end,
  },
}
