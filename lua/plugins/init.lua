return {
  -----
  -- UI
  {
    'Biscuit-Colorscheme/nvim',
    branch = 'main',
  },

  ----------
  -- UTILITY
  {
    'windwp/nvim-autopairs',
    config = true,
  },
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup({
        default_file_explorer = false,
      })

      vim.keymap.set(
        'n',
        '-',
        '<CMD>Oil<CR>',
        { desc = 'Open parent directory' }
      )
    end,
  },
  {
    'jbyuki/venn.nvim',
  },

  ------
  -- LSP
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip',

  ------
  -- Deps
  'nvim-lua/plenary.nvim',
  {
    'vhyrro/luarocks.nvim',
    lazy = false,
    priority = 1000,
    config = true,
    opts = {
      rocks = { 'magick' },
    },
  },
} -- [[ end init.lua ]]
