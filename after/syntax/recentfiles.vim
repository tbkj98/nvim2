syntax match RecentFilesLineNumber "^\[\d\]"
highlight link RecentFilesLineNumber CursorLineNr

syntax match RecentFilesArrow "->"
highlight RecentFilesArrow guifg=LightBlue ctermfg=LightBlue

syntax match RecentFilesFileName "\s.*$"
highlight RecentFilesFileName guifg=LightBlue ctermfg=LightBlue
