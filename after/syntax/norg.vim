hi OSFCColor guifg=#8f44e5
hi 9elementsColor gui=bold
hi LightGrey guifg=#bbbbbb
hi ConcealImagePath guifg=#ffffff
hi LightBlue guifg=#2c88dd


" works in regex editor but does not so in nvim
" syn match MoxImagePath "^(\/[\w-]+)+(.[a-zA-Z]+?)$"

syn match Osfc "OSFC"
syn match CurrentYear "2024"
syn match 9elements "9Elements"
syn match OpenBMC "Open"
syn match ImageKey ".image"
syn match OpenBmcLogo "../assets/openbmc.png"
syn match 9esecLogo "../assets/9esec-logo.svg"

hi def link ImageKey ConcealImagePath
hi def link OpenBmcLogo ConcealImagePath
hi def link 9esecLogo ConcealImagePath
hi def link Osfc OSFCColor
hi def link OpenBMC LightBlue
hi def link CurrentYear LightGrey
hi def link 9elements 9elementsColor
