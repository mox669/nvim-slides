vim.cmd([[
  function! Highlights() abort
    highlight Normal guibg=#ffffff guifg=#030303
    highlight LineNr guibg=#ffffff guifg=#030303
    highlight CursorLine guifg=#ffffff
    highlight CursorColumn guifg=#ffffff
    highlight Cursor guibg=#ff631c
  endfunction

  augroup MoxHigh
    autocmd!
    au ColorScheme * call Highlights()
  augroup END
  set background=dark
  colorscheme biscuit
]])
