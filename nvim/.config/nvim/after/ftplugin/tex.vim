set tabstop=2
set softtabstop=2
set shiftwidth=2

set wrap
set linebreak
set spell

let g:section_heading = '\\section'
let g:section_heading_top_gap = 0
let g:section_heading_bottom_gap = 0
let g:subsection_heading = '\\subsection'

" use markdown syntax for macros
inoremap "" ``''<Left><Left>
inoremap __ \emph{}<Left>
inoremap ** \textbf{}<Left>
inoremap $$ $$<Left>
