" ############################################################################ "
" # FUNCTIONS # FUNCTIONS # FUNCTIONS # FUNCTIONS # FUNCTIONS # FUNCTIONS #### "
" ############################################################################ "

" a function to wrap around highlight
" allows you to set both gui and cterm colors concisely
function! s:hi(color_group, foreground, background, fontStyle)
    exec  'highlight'
                \ . ' ' . a:color_group
                \ . ' ' . a:foreground
                \ . ' ' . a:background
                \ . ' ' . a:fontStyle
endfunction

function! LinterStatus() abort
    " let l:counts = ale#statusline#Count(bufnr(''))

    " let l:all_errors = l:counts.error + l:counts.style_error
    " let l:all_non_errors = l:counts.total - l:all_errors

    " return l:counts.total == 0 ? 'OK' : printf(
    " \   '%dE, %dW',
    " \   all_errors,
    " \   all_non_errors
    " \)
endfunction


" ############################################################################ "
" # COLORS # COLORS # COLORS # COLORS # COLORS # COLORS # COLORS # COLORS #### "
" ############################################################################ "

" --- colors --- "
let s:fg0 = 'guifg=#2d2d2d ctermfg=0'
let s:bg0 = 'guibg=#2d2d2d ctermbg=0'
let s:fg1 = 'guifg=#ee6666 ctermfg=1'
let s:bg1 = 'guibg=#ee6666 ctermbg=1'
let s:fg2 = 'guifg=#66eeaa ctermfg=2'
let s:bg2 = 'guibg=#66eeaa ctermbg=2'
let s:fg3 = 'guifg=#eeee55 ctermfg=3'
let s:bg3 = 'guibg=#eeee55 ctermbg=3'
let s:fg4 = 'guifg=#66bbee ctermfg=4'
let s:bg4 = 'guibg=#66bbee ctermbg=4'
let s:fg5 = 'guifg=#af79d8 ctermfg=5'
let s:bg5 = 'guibg=#af79d8 ctermbg=5'
let s:fg6 = 'guifg=#66eedd ctermfg=6'
let s:bg6 = 'guibg=#66eedd ctermbg=6'
let s:fg7 = 'guifg=#a5a5a5 ctermfg=7'
let s:bg7 = 'guibg=#a5a5a5 ctermbg=7'
let s:fg8 = 'guifg=#4f4f4f ctermfg=8'
let s:bg8 = 'guibg=#4f4f4f ctermbg=8'
let s:fg9 = 'guifg=#ff9999 ctermfg=9'
let s:bg9 = 'guibg=#ff9999 ctermbg=9'
let s:fg10 = 'guifg=#aaffcc ctermfg=10'
let s:bg10 = 'guibg=#aaffcc ctermbg=10'
let s:fg11 = 'guifg=#eeeeaa ctermfg=11'
let s:bg11 = 'guibg=#eeeeaa ctermbg=11'
let s:fg12 = 'guifg=#99ccff ctermfg=12'
let s:bg12 = 'guibg=#99ccff ctermbg=12'
let s:fg13 = 'guifg=#ffb4ff ctermfg=13'
let s:bg13 = 'guibg=#ffb4ff ctermbg=13'
let s:fg14 = 'guifg=#aaeeee ctermfg=14'
let s:bg14 = 'guibg=#aaeeee ctermbg=14'
let s:fg15 = 'guifg=#ffffff ctermfg=15'
let s:bg15 = 'guibg=#ffffff ctermbg=15'

" --- styles --- "
let s:bold = 'gui=bold cterm=bold'
let s:italic = 'gui=bold cterm=italic'
let s:bolditalic = 'gui=bold,italic cterm=bold,italic'
let s:underline = 'gui=underline cterm=underline'
let s:inverse = 'gui=inverse cterm=inverse'
let s:none = 'gui=none cterm=none'

" --- color groups --- "
call s:hi('StatusNormal', s:fg0, s:bg12, s:none)
call s:hi('StatusInsert', s:fg0, s:bg10, s:none)
call s:hi('StatusReplace', s:fg0, s:bg9, s:none)
call s:hi('StatusVisual', s:fg0, s:bg13, s:none)
call s:hi('StatusSelect', s:fg0, s:bg13, s:none)
call s:hi('StatusCommand', s:fg0, s:bg5, s:none)
call s:hi('StatusTerminal', s:fg0, s:bg5, s:none)
call s:hi('StatusShell', s:fg0, s:bg5, s:none)

call s:hi('StatusEmpty', s:fg15, s:bg8, s:none)
call s:hi('StatusFilename', s:fg15, s:bg8, s:none)
call s:hi('StatusFiletype', s:fg15, s:bg8, s:none)
call s:hi('StatusInfo', s:fg15, s:bg8, s:none)

call s:hi('StatusEmpty', s:fg15, s:bg8, s:none)
call s:hi('StatusFilename', s:fg15, s:bg8, s:none)
call s:hi('StatusFiletype', s:fg15, s:bg8, s:none)
call s:hi('StatusInfo', s:fg15, s:bg8, s:none)

call s:hi('TabLineSel', s:fg14, s:bg0, s:underline)
call s:hi('TabLine', s:fg7, s:bg0, s:underline)
call s:hi('TabLineFill', s:fg15, s:bg0, s:none)


" ############################################################################ "
" # STATUSLINE # STATUSLINE # STATUSLINE # STATUSLINE # STATUSLINE ########### "
" ############################################################################ "

" statusline
" format markers:
"   %t File name (tail) of file in the buffer
"   %f Relative path to file
"   %F Full path to file
"   %m Modified flag
"   %r Readonly flag
"   %y Filetype of file in the buffer
"   %= Separation point between left and right aligned items.
"   %l Line number.
"   %L Number of lines in buffer.
"   %c Column number.
"   %p percentage through buffer
" define the statusline

set statusline=

set statusline+=%#StatusNormal#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#StatusInsert#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#StatusReplace#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=%#StatusVisual#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#StatusSelect#%{(mode()=='s')?'\ \ SELECT\ ':''}
set statusline+=%#StatusCommand#%{(mode()=='c')?'\ \ COMMAND\ ':''}
set statusline+=%#StatusTerminal#%{(mode()=='t')?'\ \ TERMINAL\ ':''}
set statusline+=%#StatusShell#%{(mode()=='!')?'\ \ SHELL\ ':''}

set statusline+=%#StatusFilename#\ %r%m%f%<\ %<

set statusline+=%#StatusEmpty#
set statusline+=%=

set statusline+=%#StatusFiletype#%y
set statusline+=%<\ \|\ %{LinterStatus()}
set statusline+=%<\ \|\ %#StatusInfo#%p%%\ \|\ %l/%L:%c\ %<


" ############################################################################ "
" # TABLINE # TABLINE # TABLINE # TABLINE # TABLINE # TABLINE # TABLINE ###### "
" ############################################################################ "

set tabline=%!MyTabLine()

function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let path = bufname(buflist[winnr - 1])
    let label = ''

    let path = fnamemodify(path, ':t')

    return a:n . ':' . path . label
endfunction

function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'

        " the label is made by MyTabLabel()
        let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    return s
endfunction
