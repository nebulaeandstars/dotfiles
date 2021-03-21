set tabstop=2
set softtabstop=2
set shiftwidth=2

set wrap
set linebreak
set textwidth=0
set nolist
set spell

set formatoptions+=t

let g:section_heading = '\\section'
let g:section_heading_top_gap = 0
let g:section_heading_bottom_gap = 0
let g:subsection_heading = '\\subsection'

inoremap "" ``''<Left><Left>
inoremap __ \emph{}<Left>
inoremap ** \textbf{}<Left>
