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


" ############################################################################ "
" # GENERAL # GENERAL # GENERAL # GENERAL # GENERAL # GENERAL # GENERAL ###### "
" ############################################################################ "

" basic
call s:hi('Normal', s:fg15, s:none, s:none)
call s:hi('Comment', s:fg14, s:none, s:none)

" linting
call s:hi('Error', s:fg9, s:none, s:none)
call s:hi('Todo', s:fg11, s:bg8, s:bold)
call s:hi('SpellBad', s:fg0, s:bg9, s:none)
call s:hi('SpellCap', s:fg0, s:bg12, s:none)

" delimiters
call s:hi('Delimiter', s:fg14, s:none, s:bold)
call s:hi('MatchParen', s:fg14, s:bg8, s:boldunderline)


" ############################################################################ "
" # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # UI # "
" ############################################################################ "

" line numbers
call s:hi('LineNr', s:fg7, s:none, s:none)
call s:hi('CursorLineNr', s:fg14, s:none, s:none)

" error messages
call s:hi('ErrorMsg', s:fg9, s:none, s:none)
call s:hi('WarningMsg', s:fg12, s:none, s:none)

" pmenu (for autocomplete, etc)
call s:hi('Pmenu', s:fg0, s:bg6, s:none)
call s:hi('PmenuSel', s:fg6, s:bg8, s:none)
call s:hi('PmenuSbar', s:fg7, s:bg8, s:none)
call s:hi('PmenuThumb', s:fg7, s:bg8, s:none)

" coc.nvim
call s:hi('CocFloating', s:fg15, s:bg8, s:none)
" call s:hi('CocFadeOut', s:fg15, s:none, s:none)

call s:hi('CocErrorSign', s:fg9, s:none, s:none)
call s:hi('CocErrorVirtualText', s:fg9, s:none, s:none)
call s:hi('CocErrorFloat', s:fg9, s:none, s:none)
call s:hi('CocErrorHighlight', s:fg9, s:none, s:underline)

call s:hi('CocWarningSign', s:fg12, s:none, s:none)
call s:hi('CocWarningVirtualText', s:fg12, s:none, s:none)
call s:hi('CocWarningFloat', s:fg12, s:none, s:none)
call s:hi('CocWarningHighlight', s:fg12, s:none, s:underline)
call s:hi('CocDeprecatedHighlight', s:fg13, s:none, s:underline)
call s:hi('CocUnusedHighlight', s:fg7, s:none, s:underline)

call s:hi('CocInfoSign', s:fg11, s:none, s:none)
call s:hi('CocInfoVirtualText', s:fg11, s:none, s:none)
call s:hi('CocInfoFloat', s:fg11, s:none, s:none)
call s:hi('CocInfoHighlight', s:fg11, s:none, s:underline)

call s:hi('CocHintSign', s:fg7, s:none, s:none)
call s:hi('CocHintVirtualText', s:fg7, s:none, s:none)
call s:hi('CocHintFloat', s:fg10, s:none, s:none)
call s:hi('CocHintVirtualText', s:fg7, s:none, s:underline)


" color column
call s:hi('ColorColumn', s:fg15, s:bg8, s:none)

" split divider
call s:hi('VertSplit', s:fg8, s:bg0, s:none)
set fillchars+=vert:\ " do not remove this comment

" cursor line
call s:hi('cursorline', s:none, s:bg8, s:none)
call s:hi('cursorcolumn', s:none, s:bg8, s:none)

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
call s:hi('Constant', s:fg6, s:none, s:none)
call s:hi('String', s:fg2, s:none, s:none)
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
call s:hi('Conditional', s:fg10, s:none, s:italic)
call s:hi('Label', s:fg5, s:none, s:none)
call s:hi('Exception', s:fg1, s:none, s:none)
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
call s:hi('Special', s:fg3, s:none, s:bold)
call s:hi('SpecialChar', s:fg3, s:none, s:bold)
call s:hi('Tag', s:fg3, s:none, s:bold)
call s:hi('SpecialComment', s:fg3, s:none, s:bold)
call s:hi('Debug', s:fg1, s:none, s:bold)


" ############################################################################ "
" # OVERRIDES # OVERRIDES # OVERRIDES # OVERRIDES # OVERRIDES # OVERRIDES #### "
" ############################################################################ "

" python
call s:hi('pythonKeyword', s:fg10, s:none, s:bold)
call s:hi('pythonConditional', s:fg2, s:none, s:italic)
call s:hi('pythonString', s:fg4, s:none, s:none)
call s:hi('pythonSpaceError', s:fg8, s:none, s:inverse)
call s:hi('pythonAttribute', s:fg14, s:none, s:inverse)
call s:hi('pythonBuiltin', s:fg6, s:none, s:none)
hi link pythonSelf pythonBuiltin
hi link pythonStatement pythonKeyword
hi link pythonInclude pythonKeyword
hi link pythonQuotes pythonString
hi link pythonException pythonConditional
hi link pythonExceptions Exception

" javascript
call s:hi('jsKeyword', s:fg10, s:none, s:bold)
call s:hi('jsOperator', s:fg14, s:none, s:bold)
call s:hi('jsThis', s:fg6, s:none, s:none)
call s:hi('jsString', s:fg12, s:none, s:none)
call s:hi('jsParens', s:fg15, s:none, s:none)
call s:hi('xmlAttrib', s:fg5, s:none, s:none)
call s:hi('jsStorageClass', s:fg13, s:none, s:none)
hi link jsFunction jsKeyword
hi link jsFuncParens jsParens
hi link jsReturn jsKeyword
hi link jsImport jsKeyword
hi link jsFrom jsImport
hi link javaScriptIdentifier TypeDef
hi link xmlTagName Tag
hi link jsReturn Function

" typescript
call s:hi('typescriptEndColons', s:fg15, s:none, s:none)
call s:hi('typescriptBraces', s:fg15, s:none, s:bold)
hi link tsKeyword jsKeyword
hi link typescriptReserved tsKeyword
hi link typescriptStorageClass jsStorageClass
hi link typescriptOpSymbols jsOperator
hi link typescriptStatement tsKeyword
hi link typescriptThis jsThis
hi link typescriptString jsString
hi link typescriptStringS jsString
hi link typescriptParens jsParens
hi link typescriptFuncKeyword jsFunction

" jsx/tsx
call s:hi('jsxBraces', s:fg14, s:none, s:none)
call s:hi('jsxDot', s:fg14, s:none, s:none)
call s:hi('jsxComponentName', s:fg7, s:none, s:none)

" c
call s:hi('cComment', s:fg7, s:none, s:none)
call s:hi('cKeyword', s:fg12, s:none, s:bold)
hi link cTypedef cKeyword
hi link cStatement cKeyword
hi link cRepeat cKeyword
hi link cConditional cKeyword
hi link cUserFunction cKeyword
call s:hi('cType', s:fg13, s:none, s:none)
hi link cStructure cType
hi link cInclude cKeyword
call s:hi('cIncluded', s:fg2, s:none, s:none)
call s:hi('cOperator', s:fg14, s:none, s:bold)
call s:hi('cDelimiter', s:fg15, s:none, s:none)
call s:hi('cLabel', s:fg5, s:none, s:underline)

" rust
call s:hi('rustOperator', s:fg14, s:none, s:bold)
call s:hi('rustSigil', s:fg13, s:none, s:none)
call s:hi('rustKeyword', s:fg9, s:none, s:bold)
call s:hi('rustString', s:fg9, s:none, s:none)
call s:hi('rustCommentLineDoc', s:fg14, s:none, s:bold)
call s:hi('rustConditional', s:fg9, s:none, s:italic)
call s:hi('rustLifetime', s:fg2, s:none, s:none)
call s:hi('rustAttribute', s:fg7, s:none, s:none)
call s:hi('rustTypedef', s:fg9, s:none, s:bold)
call s:hi('rustTrait', s:fg5, s:none, s:none)
call s:hi('rustModPath', s:fg4, s:none, s:none)
call s:hi('rustMacro', s:fg13, s:none, s:bold)
call s:hi('rustMacroVariable', s:fg6, s:none, s:italic)
hi link rustRepeat rustConditional
hi link rustDerive rustAttribute
hi link rustAssert rustMacro
hi link rustQuestionMark rustOperator
hi link rustStructure rustTypedef
hi link rustAttributeParameter rustTrait
hi link rustMacroRepeatDelimiters rustMacro
hi link rustMacroRepeatCount rustMacroRepeatDelimiters

" elixir
call s:hi('elixirKeyword', s:fg13, s:none, s:bold)
call s:hi('elixirString', s:fg5, s:none, s:none)
call s:hi('elixirDocString', s:fg14, s:none, s:bold)
call s:hi('elixirOperator', s:fg10, s:none, s:bold)
hi link elixirStringDelimiter elixirString
hi link elixirStringDelimiter elixirString
hi link elixirDefine elixirKeyword
hi link elixirModuleDefine elixirKeyword
hi link elixirBlockDefinition elixirKeyword
hi link elixirModuleDeclaration elixirFunctionDeclaration
hi link elixirId elixirFunctionDeclaration

" haskell
call s:hi('hsOperator', s:fg14, s:none, s:bold)
call s:hi('hsLineComment', s:fg7, s:none, s:none)
call s:hi('hsDelimiter', s:fg14, s:none, s:bold)
call s:hi('ConId', s:fg5, s:none, s:none)
hi link hsConSym hsOperator
hi link hsVarSym hsOperator

" asm
call s:hi('nasmLabel', s:fg12, s:none, s:bold)
call s:hi('nasmDirective', s:fg13, s:none, s:bold)
call s:hi('nasmString', s:fg4, s:none, s:none)

" go
call s:hi('goKeyword', s:fg10, s:none, s:bold)
call s:hi('goString', s:fg4, s:none, s:none)

" ada
call s:hi('adaBegin', s:fg12, s:none, s:bold)
call s:hi('adaSpecial', s:fg14, s:none, s:bold)
call s:hi('adaTypedef', s:fg13, s:none, s:bold)
call s:hi('adaOperator', s:fg14, s:none, s:bold)
call s:hi('adaString', s:fg12, s:none, s:none)
hi link adaAssignment adaOperator
hi link adaStructure adaStorageClass
hi link adaEnd adaBegin

" latex/lilypond
call s:hi('lilyKeyword', s:fg10, s:none, s:bold)
call s:hi('texSection', s:fg12, s:none, s:bold)
call s:hi('texDocType', s:fg13, s:none, s:bold)
call s:hi('texStatement', s:fg10, s:none, s:bold)
call s:hi('texInputFile', s:fg11, s:none, s:bold)

" html
call s:hi('htmlTag', s:fg7, s:none, s:none)
call s:hi('htmlEndTag', s:fg7, s:none, s:none)
call s:hi('htmlTagName', s:fg12, s:none, s:bold)

" vimscript
call s:hi('vimCommand', s:fg3, s:none, s:bold)

" man
call s:hi('manHeader', s:fg13, s:none, s:bold)
call s:hi('manSectionHeading', s:fg11, s:none, s:bold)
call s:hi('manOptionDesc', s:fg13, s:none, s:bold)

" markdown/vimwiki
call s:hi('markdownRule', s:fg13, s:none, s:bold)
hi link VimwikiListTodo markdownListMarker
hi link VimwikiHeaderChar markdownHeadingDelimiter
hi link VimwikiHR markdownRule
