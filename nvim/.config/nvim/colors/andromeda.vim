" -------------------------------------------------------- "
"                  _                              _        "
"   __ _ _ __   __| |_ __ ___  _ __ ___   ___  __| | __ _  "
"  / _` | '_ \ / _` | '__/ _ \| '_ ` _ \ / _ \/ _` |/ _` | "
" | (_| | | | | (_| | | | (_) | | | | | |  __/ (_| | (_| | "
"  \__,_|_| |_|\__,_|_|  \___/|_| |_| |_|\___|\__,_|\__,_| "
"                                                          "
" -------------------------------------------------------- "
" by nebulaeandstars@gmail.com


" ############################################################################ "
" # SETUP # SETUP # SETUP # SETUP # SETUP # SETUP # SETUP # SETUP # SETUP #### "
" ############################################################################ "
set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "andromeda"

" a function to wrap around highlight
" allows you to set both gui and cterm colors concisely
function! s:hi(color_group, foreground, background, fontStyle)
    exec  "highlight"
                \ . " " . a:color_group
                \ . " " . a:foreground
                \ . " " . a:background
                \ . " " . a:fontStyle
endfunction

" define colors
let s:fg0 = "guifg=#2d2d2d ctermfg=0"
let s:bg0 = "guibg=#2d2d2d ctermbg=0"
let s:fg1 = "guifg=#ee6666 ctermfg=1"
let s:bg1 = "guibg=#ee6666 ctermbg=1"
let s:fg2 = "guifg=#66eeaa ctermfg=2"
let s:bg2 = "guibg=#66eeaa ctermbg=2"
let s:fg3 = "guifg=#eeee55 ctermfg=3"
let s:bg3 = "guibg=#eeee55 ctermbg=3"
let s:fg4 = "guifg=#66bbee ctermfg=4"
let s:bg4 = "guibg=#66bbee ctermbg=4"
let s:fg5 = "guifg=#af79d8 ctermfg=5"
let s:bg5 = "guibg=#af79d8 ctermbg=5"
let s:fg6 = "guifg=#66eedd ctermfg=6"
let s:bg6 = "guibg=#66eedd ctermbg=6"
let s:fg7 = "guifg=#a5a5a5 ctermfg=7"
let s:bg7 = "guibg=#a5a5a5 ctermbg=7"
let s:fg8 = "guifg=#4f4f4f ctermfg=8"
let s:bg8 = "guibg=#4f4f4f ctermbg=8"
let s:fg9 = "guifg=#ff9999 ctermfg=9"
let s:bg9 = "guibg=#ff9999 ctermbg=9"
let s:fg10 = "guifg=#aaffcc ctermfg=10"
let s:bg10 = "guibg=#aaffcc ctermbg=10"
let s:fg11 = "guifg=#eeeeaa ctermfg=11"
let s:bg11 = "guibg=#eeeeaa ctermbg=11"
let s:fg12 = "guifg=#99ccff ctermfg=12"
let s:bg12 = "guibg=#99ccff ctermbg=12"
let s:fg13 = "guifg=#ffb4ff ctermfg=13"
let s:bg13 = "guibg=#ffb4ff ctermbg=13"
let s:fg14 = "guifg=#aaeeee ctermfg=14"
let s:bg14 = "guibg=#aaeeee ctermbg=14"
let s:fg15 = "guifg=#ffffff ctermfg=15"
let s:bg15 = "guibg=#ffffff ctermbg=15"

" define styles
let s:bold = "gui=bold cterm=bold"
let s:italic = "gui=bold cterm=italic"
let s:bolditalic = "gui=bold,italic cterm=bold,italic"
let s:underline = "gui=underline cterm=underline"
let s:boldunderline = "gui=bold,italic cterm=bold,underline"
let s:inverse = "gui=inverse cterm=inverse"
let s:none = "gui=none cterm=none"
let s:nofg = "guifg=none ctermfg=none"
let s:nobg = "guibg=none ctermbg=none"


" ############################################################################ "
" # GENERAL # GENERAL # GENERAL # GENERAL # GENERAL # GENERAL # GENERAL ###### "
" ############################################################################ "

" basic
call s:hi('Normal', s:fg15, s:none, s:none)
call s:hi('Comment', s:fg7, s:none, s:italic)
call s:hi('SpecialComment', s:fg7, s:none, s:none)

" linting
call s:hi('Error', s:fg9, s:none, s:none)
call s:hi('Todo', s:fg11, s:bg8, s:bold)
call s:hi('SpellBad', s:fg0, s:bg9, s:none)
call s:hi('SpellCap', s:fg0, s:bg12, s:none)


" ############################################################################ "
" # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # "
" ############################################################################ "

" line numbers
call s:hi('LineNr', s:fg7, s:none, s:none)
call s:hi('CursorLineNr', s:fg14, s:none, s:none)

" error messages
call s:hi('ErrorMsg', s:fg9, s:none, s:none)
call s:hi('WarningMsg', s:fg12, s:none, s:none)

" searching
call s:hi('Search', s:fg0, s:bg12, s:none)
call s:hi('IncSearch', s:fg0, s:bg12, s:none)
call s:hi('Sneak', s:fg0, s:bg12, s:none)

call s:hi('Visual', s:nofg, s:bg8, s:none)

" pmenu (for autocomplete, etc)
call s:hi('Pmenu', s:fg0, s:bg6, s:none)
call s:hi('PmenuSel', s:fg6, s:bg7, s:none)
call s:hi('PmenuSbar', s:fg7, s:bg8, s:none)
call s:hi('PmenuThumb', s:fg7, s:bg8, s:none)

" coc.nvim
call s:hi('CocFloating', s:fg15, s:bg8, s:none)
" call s:hi('CocFadeOut', s:fg15, s:none, s:none)

call s:hi('CocErrorSign', s:fg9, s:bg8, s:none)
call s:hi('CocErrorVirtualText', s:fg9, s:none, s:none)
call s:hi('CocErrorFloat', s:fg9, s:none, s:none)
call s:hi('CocErrorHighlight', s:fg9, s:none, s:underline)

call s:hi('CocWarningSign', s:fg12, s:bg8, s:none)
call s:hi('CocWarningVirtualText', s:fg12, s:none, s:none)
call s:hi('CocWarningFloat', s:fg12, s:none, s:none)
call s:hi('CocWarningHighlight', s:fg12, s:none, s:underline)
call s:hi('CocDeprecatedHighlight', s:fg13, s:none, s:underline)
call s:hi('CocUnusedHighlight', s:fg7, s:none, s:underline)

call s:hi('CocInfoSign', s:fg11, s:bg8, s:none)
call s:hi('CocInfoVirtualText', s:fg11, s:none, s:none)
call s:hi('CocInfoFloat', s:fg11, s:none, s:none)
call s:hi('CocInfoHighlight', s:fg11, s:none, s:underline)

call s:hi('CocHintSign', s:fg7, s:bg8, s:none)
call s:hi('CocHintVirtualText', s:fg7, s:none, s:none)
call s:hi('CocHintFloat', s:fg10, s:none, s:none)
call s:hi('CocHintVirtualText', s:fg7, s:none, s:none)


" color column
call s:hi('ColorColumn', s:fg15, s:bg8, s:none)

" split divider
call s:hi('VertSplit', s:fg8, s:bg0, s:none)
set fillchars+=vert:\ " do not remove this comment

" cursor line
call s:hi('CursorLine', s:none, s:bg8, s:none)
call s:hi('CursorColumn', s:none, s:bg8, s:none)

" folds
call s:hi('Folded', s:fg6, s:bg8, s:none)
call s:hi('FoldColumn', s:fg6, s:bg8, s:none)

" GitGutter and Diffs
call s:hi('DiffAdd', s:fg15, s:none, s:none)
call s:hi('DiffChange', s:fg6, s:none, s:none)
call s:hi('DiffDelete', s:fg9, s:none, s:none)
call s:hi('SignColumn', s:fg15, s:bg8, s:none)

" ALE
call s:hi('ALEErrorSign', s:fg9, s:bg8, s:bold)
call s:hi('ALEWarningSign', s:fg11, s:bg8, s:bold)


" ############################################################################ "
" # SYNTAX # SYNTAX # SYNTAX # SYNTAX # SYNTAX # SYNTAX # SYNTAX # SYNTAX #### "
" ############################################################################ "

" basic syntax
call s:hi('Keyword', s:fg6, s:none, s:none)
call s:hi('String', s:fg2, s:none, s:none)
call s:hi('Constant', s:fg6, s:none, s:none)
call s:hi('Operator', s:fg14, s:none, s:none)
hi link Number Constant
hi link Character Constant
hi link Float Constant
hi link Boolean Constant
hi link Double Constant

" statements
call s:hi('Statement', s:fg6, s:none, s:none)
call s:hi('Conditional', s:fg6, s:none, s:italic)
call s:hi('Label', s:fg5, s:none, s:underline)
call s:hi('Exception', s:fg1, s:none, s:none)
hi link Repeat Conditional

" types
call s:hi('Type', s:fg13, s:none, s:none)
hi link StorageClass Type
hi link Structure Type
hi link TypeDef Keyword

" delimiters
call s:hi('Delimiter', s:fg15, s:none, s:none)
call s:hi('MatchParen', s:fg15, s:bg8, s:boldunderline)

" identifiers
call s:hi('Identifier', s:fg7, s:none, s:none)
call s:hi('Function', s:fg12, s:none, s:none)
call s:hi('Macro', s:fg5, s:none, s:none)

call s:hi('PreProc', s:fg4, s:none, s:none)
hi link Include PreProc
hi link Define PreProc
hi link PreCondit PreProc

" special
call s:hi('Special', s:fg11, s:none, s:none)
call s:hi('SpecialChar', s:fg11, s:none, s:none)
call s:hi('Tag', s:fg11, s:none, s:none)

call s:hi('Debug', s:fg11, s:none, s:none)
call s:hi('Error', s:fg1, s:none, s:none)

" other
call s:hi('Directory', s:fg6, s:none, s:none)

call s:hi('Url', s:fg14, s:none, s:underline)
