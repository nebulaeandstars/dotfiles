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
function! s:hi(group, foreground, background, fontStyle)
    exec  "highlight"
                \ . " " . a:group
                \ . " " . a:foreground
                \ . " " . a:background
                \ . " " . a:fontStyle
endfunction

" define foreground colors
let s:fg0 = "guifg=#2d2d2d ctermfg=0"
let s:fg8 = "guifg=#616161 ctermfg=8"
let s:fg1 = "guifg=#cc3d48 ctermfg=1"
let s:fg9 = "guifg=#e9618b ctermfg=9"
let s:fg2 = "guifg=#3cce85 ctermfg=2"
let s:fg10 = "guifg=#60eca6 ctermfg=10"
let s:fg3 = "guifg=#d4085e ctermfg=3"
let s:fg11 = "guifg=#ebe86f ctermfg=11"
let s:fg4 = "guifg=#5daedb ctermfg=4"
let s:fg12 = "guifg=#8ccbf3 ctermfg=12"
let s:fg5 = "guifg=#be83ea ctermfg=5"
let s:fg13 = "guifg=#f09eee ctermfg=13"
let s:fg6 = "guifg=#86e0e3 ctermfg=6"
let s:fg14 = "guifg=#b4ecee ctermfg=14"
let s:fg7 = "guifg=#eeeed7 ctermfg=7"
let s:fg15 = "guifg=#ffffff ctermfg=15"

" define background colors (could probably be combined with the above)
let s:bg0 = "guibg=#2d2d2d ctermbg=0"
let s:bg8 = "guibg=#616161 ctermbg=8"
let s:bg1 = "guibg=#cc3d48 ctermbg=1"
let s:bg9 = "guibg=#e9618b ctermbg=9"
let s:bg2 = "guibg=#3cce85 ctermbg=2"
let s:bg10 = "guibg=#60eca6 ctermbg=10"
let s:bg3 = "guibg=#d4085e ctermbg=3"
let s:bg11 = "guibg=#ebe86f ctermbg=11"
let s:bg4 = "guibg=#5daedb ctermbg=4"
let s:bg12 = "guibg=#8ccbf3 ctermbg=12"
let s:bg5 = "guibg=#be83ea ctermbg=5"
let s:bg13 = "guibg=#f09eee ctermbg=13"
let s:bg6 = "guibg=#86e0e3 ctermbg=6"
let s:bg14 = "guibg=#b4ecee ctermbg=14"
let s:bg7 = "guibg=#eeeed7 ctermbg=7"
let s:bg15 = "guibg=#ffffff ctermbg=15"

" define styles
let s:bold = "gui=bold cterm=bold"
let s:italic = "gui=bold cterm=italic"
let s:bolditalic = "gui=bold,italic cterm=bold,italic"
let s:underline = "gui=underline cterm=underline"
let s:inverse = "gui=inverse cterm=inverse"
let s:none = "gui=none cterm=none"


" ############################################################################ "
" # GENERAL # GENERAL # GENERAL # GENERAL # GENERAL # GENERAL # GENERAL ###### "
" ############################################################################ "

" basic
call s:hi('Normal', s:fg15, s:none, s:none)
call s:hi('Comment', s:fg14, s:none, s:none)

" linting
call s:hi('Error', s:fg15, s:bg1, s:none)
call s:hi('Todo', s:fg11, s:bg8, s:bold)
call s:hi('SpellBad', s:fg0, s:bg9, s:none)
call s:hi('SpellCap', s:fg0, s:bg12, s:none)

" delimiters
call s:hi('Delimiter', s:fg14, s:none, s:bold)
call s:hi('MatchParen', s:fg14, s:bg8, s:bold)


" ############################################################################ "
" # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # "
" ############################################################################ "

" line numbers
call s:hi('LineNr', s:fg8, s:none, s:none)
if has('nvim')
    call s:hi('CursorLineNr', s:fg14, s:none, s:none)
else
    call s:hi('CursorLineNr', s:fg8, s:none, s:none)
endif

" error messages
call s:hi('ErrorMsg', s:fg9, s:none, s:none)

" pmenu (for autocomplete, etc)
call s:hi('Pmenu', s:fg0, s:bg6, s:none)

" color column
call s:hi('ColorColumn', s:fg15, s:bg8, s:none)

" folds
call s:hi('Folded', s:fg6, s:bg8, s:none)
call s:hi('FoldColumn', s:fg6, s:none, s:none)

" GitGutter and Diffs
call s:hi('DiffAdd', s:fg15, s:bg8, s:none)
call s:hi('DiffChange', s:fg6, s:bg8, s:none)
call s:hi('DiffDelete', s:fg9, s:bg8, s:none)
call s:hi('SignColumn', s:fg15, s:bg8, s:none)

" lightline
let g:lightline = { 'colorscheme': 'wombat' }

" vim-rainbow (for nested brackets)
let g:rainbow_ctermfgs = [
            \'cyan',
            \'blue',
            \'green',
            \'lightgreen',
            \'lightyellow',
            \'lightred',
            \'red',
            \'magenta',
            \'lightmagenta']


" ############################################################################ "
" # SYNTAX # SYNTAX # SYNTAX # SYNTAX # SYNTAX # SYNTAX # SYNTAX # SYNTAX #### "
" ############################################################################ "

" basic syntax
call s:hi('Constant', s:fg6, s:none, s:none)
call s:hi('String', s:fg10, s:none, s:none)
call s:hi('Number', s:fg6, s:none, s:none)
hi link Character String
hi link Float Number
hi link Boolean Number
hi link Double Number

" identifiers
call s:hi('Identifier', s:fg7, s:none, s:none)
call s:hi('Function', s:fg12, s:none, s:bold)

" statements
call s:hi('Statement', s:fg10, s:none, s:bold)
call s:hi('Conditional', s:fg10, s:none, s:bolditalic)
call s:hi('Label', s:fg5, s:none, s:none)
call s:hi('Exception', s:fg9, s:none, s:italic)
hi link Repeat Conditional

call s:hi('PreProc', s:fg13, s:none, s:bolditalic)
hi link Include PreProc
hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc

" types
call s:hi('Type', s:fg13, s:none, s:none)
call s:hi('StorageClass', s:fg13, s:none, s:italic)
call s:hi('Structure', s:fg5, s:none, s:bold)
call s:hi('Typedef', s:fg13, s:none, s:none)

" special
call s:hi('Special', s:fg11, s:none, s:bold)
call s:hi('SpecialChar', s:fg11, s:none, s:bold)
call s:hi('Tag', s:fg11, s:none, s:bold)
call s:hi('SpecialComment', s:fg13, s:none, s:bold)
call s:hi('Debug', s:fg1, s:none, s:bold)


" ############################################################################ "
" # OVERRIDES # OVERRIDES # OVERRIDES # OVERRIDES # OVERRIDES # OVERRIDES #### "
" ############################################################################ "

" python
syntax keyword pythonSelf self
call s:hi('pythonStatement', s:fg10, s:none, s:bold)
call s:hi('pythonOperator', s:fg14, s:none, s:bold)
call s:hi('pythonSpaceError', s:fg8, s:none, s:inverse)
call s:hi('pythonAttribute', s:fg14, s:none, s:inverse)
call s:hi('pythonSelf', s:fg5, s:none, s:italic)

" javascript/typescript
call s:hi('xmlAttrib', s:fg5, s:none, s:none)
hi link javaScriptIdentifier TypeDef
hi link xmlTagName Tag
hi link jsReturn Function

" latex/lilypond
call s:hi('lilyKeyword', s:fg11, s:none, s:none)
call s:hi('texSection', s:fg12, s:none, s:none)
call s:hi('texInputFile', s:fg10, s:none, s:none)

" vimscript
call s:hi('vimCommand', s:fg11, s:none, s:bold)
