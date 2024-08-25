return {
  'nvim-neorg/neorg',
  dependencies = { 'luarocks.nvim' },
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = '*',
  config = function()
    require('neorg').setup({
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {
          config = {
            icons = {
              code_block = {
                conceal = true,
                content_only = false,
              },
            },
          },
        },
      },
    })
  end,
}
