vim9script noclear
# Darcula color scheme for Vim
# Based on Android Studio's Darcula theme


set background=dark
# highlight clear

if exists("syntax_on")
syntax reset
endif

g:colors_name = "darcula"
 highlight Normal       ctermfg=250 ctermbg=235  guifg=#A9B7C6 guibg=#2B2B2B
highlight Comment      ctermfg=242 ctermbg=NONE guifg=#808080 guibg=NONE
 highlight Constant     ctermfg=210 ctermbg=NONE guifg=#A8C023 guibg=NONE
 highlight Identifier   ctermfg=117 ctermbg=NONE guifg=#FFC66D guibg=NONE
 highlight Statement    ctermfg=110 ctermbg=NONE guifg=#CC7832 guibg=NONE
 highlight PreProc      ctermfg=150 ctermbg=NONE guifg=#CC7832 guibg=NONE
 highlight Type         ctermfg=117 ctermbg=NONE guifg=#A9B7C6 guibg=NONE
 highlight Special      ctermfg=174 ctermbg=NONE guifg=#FFC66D guibg=NONE
 highlight String       ctermfg=144 ctermbg=NONE guifg=#6A8759 guibg=NONE
 highlight Number       ctermfg=210 ctermbg=NONE guifg=#6897BB guibg=NONE
 highlight Function     ctermfg=117 ctermbg=NONE guifg=#FFC66D guibg=NONE
 highlight Operator     ctermfg=110 ctermbg=NONE guifg=#A9B7C6 guibg=NONE

# UI elements
 highlight Cursor       ctermfg=235 ctermbg=250 guifg=#2B2B2B guibg=#A9B7C6
 highlight CursorLine   ctermbg=236 guibg=#323232
 highlight LineNr       ctermfg=242 ctermbg=235 guifg=#808080 guibg=#2B2B2B
 highlight CursorLineNr ctermfg=250 ctermbg=236 guifg=#A9B7C6 guibg=#323232
 highlight Visual       ctermbg=238 guibg=#4B4B4B
 highlight Search       ctermfg=235 ctermbg=144 guifg=#2B2B2B guibg=#6A8759
 highlight MatchParen   ctermfg=235 ctermbg=117 guifg=#2B2B2B guibg=#A9B7C6

# Status line
 highlight StatusLine   ctermfg=250 ctermbg=238 guifg=#A9B7C6 guibg=#4B4B4B
 highlight StatusLineNC ctermfg=242 ctermbg=235 guifg=#808080 guibg=#2B2B2B

# Other
 highlight Folded       ctermfg=242 ctermbg=235 guifg=#808080 guibg=#2B2B2B
 highlight Todo         ctermfg=210 ctermbg=NONE guifg=#CC7832 guibg=NONE
 highlight Error        ctermfg=210 ctermbg=NONE guifg=#FF6B68 guibg=NONE
 highlight Underlined   ctermfg=117 ctermbg=NONE guifg=#A9B7C6 guibg=NONE
 highlight Ignore       ctermfg=242 ctermbg=NONE guifg=#808080 guibg=NONE
 highlight SpecialKey   ctermfg=242 ctermbg=NONE guifg=#808080 guibg=NONE
